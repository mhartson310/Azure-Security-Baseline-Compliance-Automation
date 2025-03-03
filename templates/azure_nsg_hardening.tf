# NSG Baseline Configuration
resource "azurerm_network_security_group" "secure_nsg" {
  name                = "secure-nsg-baseline"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  security_rule {
    name                       = "Deny-All-Inbound"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  # Allow internal VNET traffic only
  security_rule {
    name                       = "Allow-Internal"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "VirtualNetwork"
  }
}

# Enable NSG Flow Logs
resource "azurerm_network_watcher_flow_log" "nsg_flow_log" {
  network_watcher_name = azurerm_network_watcher.main.name
  resource_group_name  = azurerm_resource_group.main.name

  network_security_group_id = azurerm_network_security_group.secure_nsg.id
  storage_account_id        = azurerm_storage_account.flowlogs.id
  enabled                   = true

  retention_policy {
    enabled = true
    days    = 90
  }
}
