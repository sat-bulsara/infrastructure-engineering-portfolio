# Project 16 code snippets

These are public-safe patterns. Review names and scope before reusing them.

## Azure CLI: storage security summary

```bash
az storage account show \
  --resource-group rg-northstar-storage-lab-uks-01 \
  --name stnorthstardocsuks01 \
  --query "{Name:name,SKU:sku.name,HTTPSOnly:enableHttpsTrafficOnly,MinimumTLS:minimumTlsVersion,SharedKey:allowSharedKeyAccess,AnonymousBlob:allowBlobPublicAccess,PublicNetwork:publicNetworkAccess,FirewallDefault:networkRuleSet.defaultAction}" \
  --output table
```

## Azure CLI: list Blob versions

```bash
az storage blob list \
  --account-name stnorthstardocsuks01 \
  --container-name documents \
  --include v \
  --auth-mode login \
  --query "[?name=='recovery-test.txt'].{VersionId:versionId,LastModified:properties.lastModified,Current:isCurrentVersion}" \
  --output table
```

## Azure CLI: private endpoint and DNS

```bash
az network private-endpoint show \
  --resource-group rg-northstar-storage-lab-uks-01 \
  --name pep-northstar-storage-blob-uks-01 \
  --query "{Name:name,State:provisioningState,Status:privateLinkServiceConnections[0].privateLinkServiceConnectionState.status,Subresource:privateLinkServiceConnections[0].groupIds[0]}" \
  --output table

az network private-dns record-set a show \
  --resource-group rg-northstar-storage-lab-uks-01 \
  --zone-name privatelink.blob.core.windows.net \
  --name stnorthstardocsuks01 \
  --query "{Record:name,PrivateIP:aRecords[0].ipv4Address,TTL:ttl}" \
  --output table
```

## PowerShell: read-only verification

```powershell
$account = Get-AzStorageAccount `
    -ResourceGroupName 'rg-northstar-storage-lab-uks-01' `
    -Name 'stnorthstardocsuks01'

[pscustomobject]@{
    Name                = $account.StorageAccountName
    Location            = $account.Location
    Sku                 = $account.Sku.Name
    MinimumTlsVersion   = $account.MinimumTlsVersion
    PublicNetworkAccess = $account.PublicNetworkAccess
    SharedKeyAccess     = $account.AllowSharedKeyAccess
}
```

## Terraform: read resources created outside Terraform

```hcl
data "azurerm_resource_group" "northstar" {
  name = "rg-northstar-storage-lab-uks-01"
}

data "azurerm_storage_account" "northstar" {
  name                = "stnorthstardocsuks01"
  resource_group_name = data.azurerm_resource_group.northstar.name
}
```

Data sources read existing infrastructure. They do not turn it into a
Terraform-managed resource.
