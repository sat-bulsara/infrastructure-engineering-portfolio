# DNS PowerShell Cheat Sheet

## Zones

```powershell
Get-DnsServerZone
Get-DnsServerZone -Name "ad.anudia.co.uk"

Add-DnsServerPrimaryZone `
    -NetworkId "192.168.1.0/24" `
    -ReplicationScope "Domain" `
    -DynamicUpdate "Secure"
```

## Records

```powershell
Get-DnsServerResourceRecord -ZoneName "ad.anudia.co.uk"

Get-DnsServerResourceRecord `
    -ZoneName "ad.anudia.co.uk" `
    -Name "CLIENT01"
```

## PTR

```powershell
Add-DnsServerResourceRecordPtr `
    -ZoneName "1.168.192.in-addr.arpa" `
    -Name "150" `
    -PtrDomainName "CLIENT01.ad.anudia.co.uk"

Resolve-DnsName 192.168.1.150 -Server 192.168.1.250
```

## CNAME

```powershell
Add-DnsServerResourceRecordCName `
    -ZoneName "ad.anudia.co.uk" `
    -Name "files" `
    -HostNameAlias "srv01.ad.anudia.co.uk"

Resolve-DnsName files.ad.anudia.co.uk -Server 192.168.1.250
```

## External resolution and cache

```powershell
Get-DnsServerForwarder
Get-DnsServerRootHint
Show-DnsServerCache | Select-Object -First 20
Get-DnsClientCache
Clear-DnsClientCache
```

## Dynamic registration

```powershell
Register-DnsClient
```

## Aging and scavenging

```powershell
Get-DnsServerZoneAging -Name "ad.anudia.co.uk"
Get-DnsServerScavenging

Set-DnsServerScavenging `
    -ScavengingState $true `
    -ScavengingInterval 7.00:00:00
```

## PowerShell syntax

```text
$Name         Variable
|             Pipeline
$_            Current pipeline object
@(...)        Array
Where-Object  Filter objects
Select-Object Select/shape properties
-eq           Equals
-like         Wildcard comparison
-in           Value exists in collection
`             Line continuation
```
