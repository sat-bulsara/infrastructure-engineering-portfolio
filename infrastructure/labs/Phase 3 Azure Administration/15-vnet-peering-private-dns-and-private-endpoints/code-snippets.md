# Code snippets: Project 15

These are focused discovery and verification examples. Set the current Azure context before using them.

## Azure CLI context

```bash
az account show \
  --query "{Subscription:name, State:state, Default:isDefault, Directory:tenantDisplayName}" \
  --output table
```

## Peering inventory

```bash
az network vnet peering list \
  --resource-group rg-connectivity-hub-lab-uks-01 \
  --vnet-name vnet-connectivity-hub-uks-01 \
  --query "[].{Name:name, State:peeringState, VNetAccess:allowVirtualNetworkAccess, Forwarded:allowForwardedTraffic}" \
  --output table
```

## Private endpoint verification with PowerShell

```powershell
$privateEndpoint = Get-AzPrivateEndpoint `
    -ResourceGroupName 'rg-connectivity-hub-lab-uks-01' `
    -Name 'pep-storage-blob-uks-01'

$privateEndpoint |
    Select-Object Name, Location, ProvisioningState, @{
        Name = 'ConnectionStatus'
        Expression = {
            $_.PrivateLinkServiceConnections[0].PrivateLinkServiceConnectionState.Status
        }
    }, @{
        Name = 'Subresource'
        Expression = { $_.PrivateLinkServiceConnections[0].GroupIds -join ',' }
    } |
    Format-List
```

## Private DNS record

```powershell
Get-AzPrivateDnsRecordSet `
    -ResourceGroupName 'rg-connectivity-hub-lab-uks-01' `
    -ZoneName 'privatelink.blob.core.windows.net' `
    -RecordType A |
    Select-Object Name, RecordType, @{
        Name = 'PrivateIP'
        Expression = { $_.Records.IPv4Address -join ',' }
    } |
    Format-Table
```

## Private DNS VNet links

```powershell
Get-AzPrivateDnsVirtualNetworkLink `
    -ResourceGroupName 'rg-connectivity-hub-lab-uks-01' `
    -ZoneName 'privatelink.blob.core.windows.net' |
    Select-Object Name, VirtualNetworkLinkState, @{
        Name = 'VNet'
        Expression = { ($_.VirtualNetworkId -split '/')[-1] }
    } |
    Sort-Object Name |
    Format-Table
```

## Cleanup verification

```powershell
@(
    'rg-connectivity-hub-lab-uks-01',
    'rg-application-spoke-lab-uks-01'
) | ForEach-Object {
    [PSCustomObject]@{
        ResourceGroup = $_
        Exists        = az group exists --name $_
    }
} | Format-Table
```

Do not commit subscription IDs, tenant IDs, credentials, Terraform state or saved plan files.
