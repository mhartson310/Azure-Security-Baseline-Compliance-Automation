# 4.3 Enhanced Sentinel Workspace & Security Connectors (Terraform)
# sentinel.tf

# Sentinel Resource Group with Compliance Tags
resource "azurerm_resource_group" "sentinel" {
  name     = "rg-sentinel-${var.environment}-${var.location_short}"
  location = var.location
  
  tags = merge(
    var.tags,
    {
      "Compliance"   = "ISO27001, SOC2"
      "DataRetention" = "90d"
      "Sensitive"    = "SecurityLogs"
    }
  )
}

# Secure Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "security" {
  name                = "law-${var.environment}-sentinel-${var.location_short}"
  location            = azurerm_resource_group.sentinel.location
  resource_group_name = azurerm_resource_group.sentinel.name
  sku                 = "PerGB2018"
  retention_in_days   = 90
  daily_quota_gb      = 10

  # Security Features
  internet_ingestion_enabled = var.enable_public_ingestion
  internet_query_enabled     = false
  local_authentication_disabled = false

  # Enable CMK (Customer Managed Key) - Uncomment if using Azure Key Vault
  # customer_managed_key_id = azurerm_key_vault_key.log_analytics.id
  
  tags = merge(
    var.tags,
    {
      "LogType" = "SecurityEvents"
      "SIEM"    = "AzureSentinel"
    }
  )
}

# Azure Sentinel Workspace
resource "azurerm_sentinel_log_analytics_workspace" "security" {
  workspace_id = azurerm_log_analytics_workspace.security.id
}

# Critical Security Data Connectors
resource "azurerm_sentinel_data_connector_microsoft_cloud_app_security" "cloud_app" {
  name                       = "MicrosoftCloudAppSecurity"
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace.security.workspace_id
}

resource "azurerm_sentinel_data_connector_azure_active_directory" "aad" {
  name                       = "AzureActiveDirectory"
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace.security.workspace_id
  tenant_id                  = var.tenant_id
}

resource "azurerm_sentinel_data_connector_azure_security_center" "asc" {
  name                       = "AzureSecurityCenter"
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace.security.workspace_id
  subscription_id            = var.subscription_id
}

resource "azurerm_sentinel_data_connector_office_365" "o365" {
  name                       = "Office365"
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace.security.workspace_id
}

# Threat Intelligence Connector
resource "azurerm_sentinel_data_connector_threat_intelligence" "ti" {
  name                       = "ThreatIntelligence"
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace.security.workspace_id
}

# Security Center Integration
resource "azurerm_security_center_workspace" "sentinel" {
  scope        = "/subscriptions/${var.subscription_id}"
  workspace_id = azurerm_log_analytics_workspace.security.id
}

# Private Link Configuration
resource "azurerm_private_endpoint" "sentinel" {
  name                = "pe-sentinel-${var.environment}"
  resource_group_name = azurerm_resource_group.sentinel.name
  location            = azurerm_resource_group.sentinel.location
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "sentinel-connection"
    private_connection_resource_id = azurerm_log_analytics_workspace.security.id
    subresource_names              = ["azuremonitor"]
    is_manual_connection           = false
  }
}

# Security Monitoring Automation
resource "azurerm_sentinel_alert_rule_template" "baseline" {
  for_each                   = toset(["AzureFirewallNetworkRule", "AzureNetworkAnalytics", "AzureActivity"])
  display_name               = each.key
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace.security.workspace_id
}

# UEBA Configuration
resource "azurerm_sentinel_ueba" "security" {
  log_analytics_workspace_id = azurerm_sentinel_log_analytics_workspace.security.workspace_id
  name                       = "Default"
}
