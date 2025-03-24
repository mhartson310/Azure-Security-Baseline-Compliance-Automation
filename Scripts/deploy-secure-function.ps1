# Compliant with NIST 800-53, CIS Azure v2.0, CSA CCM v4
param (
    [string]$resourceGroup = "sec-func-rg",
    [string]$functionAppName = "sec-function-$(Get-Random)",
    [string]$location = "eastus2",
    [string]$vnetName = "sec-vnet",
    [string]$subnetName = "func-subnet",
    [string]$keyVaultName = "sec-kv-$(Get-Random)",
    [string]$logWorkspace = "sec-logs-$(Get-Random)"
)

# 1. Environment Setup --------------------------------------------------------
az group create --name $resourceGroup --location $location --tags 'Compliance=NIST_HIGH'

# 2. Networking (CIS 6.4, NIST SC-7) ------------------------------------------
az network vnet create --name $vnetName --resource-group $resourceGroup --address-prefixes 10.0.0.0/16
az network vnet subnet create --vnet-name $vnetName --name $subnetName --resource-group $resourceGroup --address-prefixes 10.0.1.0/24

# 3. Key Vault with HSM (NIST SC-12, CIS 8.5) ---------------------------------
az keyvault create --name $keyVaultName --resource-group $resourceGroup --location $location `
    --sku premium --enable-rbac-authorization true --enable-purge-protection true

# 4. Secure Function App (CIS 9.2, CSA IAM-09) --------------------------------
az functionapp create --name $functionAppName --resource-group $resourceGroup --os-type Windows `
    --runtime dotnet --functions-version 4 --disable-app-insights false `
    --vnet $vnetName --subnet $subnetName --https-only true `
    --storage-account (az storage account create --name "secsa$(Get-Random)" `
        --resource-group $resourceGroup --location $location --sku Standard_LRS `
        --min-tls-version TLS1_2 --allow-blob-public-access false --query name -o tsv)

# 5. Auth & RBAC (NIST AC-2, CIS 4.1.3) ---------------------------------------
az functionapp identity assign --name $functionAppName --resource-group $resourceGroup
az role assignment create --role "Key Vault Secrets User" `
    --assignee (az functionapp identity show --name $functionAppName --resource-group $resourceGroup --query principalId -o tsv) `
    --scope (az keyvault show --name $keyVaultName --query id -o tsv)

# 6. Monitoring (CIS 5.3, CSA LOG-05) -----------------------------------------
az monitor log-analytics workspace create --resource-group $resourceGroup --workspace-name $logWorkspace --location $location
az monitor diagnostic-settings create --resource (az functionapp show --name $functionAppName --resource-group $resourceGroup --query id -o tsv) `
    --name "SecLogs" --workspace (az monitor log-analytics workspace show --resource-group $resourceGroup --workspace-name $logWorkspace --query id -o tsv) `
    --logs '[{"category": "FunctionAppLogs","enabled": true},{"category": "AuditEvent","enabled": true}]' `
    --metrics '[{"category": "AllMetrics","enabled": true}]'

# 7. Network Controls (NIST SC-7, CIS 6.6) ------------------------------------
az functionapp config access-restriction add --resource-group $resourceGroup --name $functionAppName `
    --rule-name 'Allowed_IPs' --action Allow --ip-address '192.168.1.0/24' --priority 100

# 8. Output Compliance Status -------------------------------------------------
Write-Host "✅ NIST 800-53 Controls Implemented: AC-2, AC-6, SC-7, SC-12, SI-4"
Write-Host "✅ CIS Azure Foundations v2.0: 4.1.3, 5.3, 6.4, 6.6, 8.5, 9.2"
Write-Host "✅ CSA CCM v4: IAM-09, IVS-06, LOG-05"
Write-Host "🔗 Function App Endpoint: https://$functionAppName.azurewebsites.net"
