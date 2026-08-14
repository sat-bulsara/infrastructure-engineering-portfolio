# Enterprise DNS - Operations Guide

## Inventory DNS zones

```powershell
Get-DnsServerZone |
    Select-Object ZoneName, ZoneType, IsDsIntegrated, IsReverseLookupZone
```

## Inspect the AD zone

```powershell
Get-DnsServerZone -Name "ad.anudia.co.uk" |
    Format-List ZoneName,ZoneType,IsDsIntegrated,DynamicUpdate,ReplicationScope
```

## Inspect DNS records

```powershell
Get-DnsServerResourceRecord -ZoneName "ad.anudia.co.uk" |
    Select-Object HostName,RecordType,Timestamp
```

## Create the reverse zone

```powershell
Add-DnsServerPrimaryZone `
    -NetworkId "192.168.1.0/24" `
    -ReplicationScope "Domain" `
    -DynamicUpdate "Secure"
```

## Create PTR records

Run DNS Server administration cmdlets on SRV01 or a management host with the DNS Server module.

```powershell
Add-DnsServerResourceRecordPtr `
    -ZoneName "1.168.192.in-addr.arpa" `
    -Name "150" `
    -PtrDomainName "CLIENT01.ad.anudia.co.uk"
```

Verify:

```powershell
Resolve-DnsName 192.168.1.150 -Server 192.168.1.250
```

## Create a service CNAME

```powershell
Add-DnsServerResourceRecordCName `
    -ZoneName "ad.anudia.co.uk" `
    -Name "files" `
    -HostNameAlias "srv01.ad.anudia.co.uk"
```

Verify:

```powershell
Resolve-DnsName files.ad.anudia.co.uk -Server 192.168.1.250
```

## External resolution

```powershell
Get-DnsServerForwarder
Get-DnsServerRootHint
Resolve-DnsName www.microsoft.com -Server 127.0.0.1
```

## DNS caches

Server cache:

```powershell
Show-DnsServerCache | Select-Object -First 20
```

Client cache:

```powershell
Get-DnsClientCache
Clear-DnsClientCache
```

## Dynamic registration

On CLIENT01:

```powershell
Register-DnsClient
```

## Zone aging

```powershell
Get-DnsServerZoneAging -Name "ad.anudia.co.uk" |
    Select-Object ZoneName,AgingEnabled,NoRefreshInterval,RefreshInterval
```

The final evidence for this build shows `AgingEnabled : False`.

## Server scavenging

```powershell
Get-DnsServerScavenging |
    Select-Object ScavengingState,ScavengingInterval,LastScavengeTime
```

The supplied evidence shows server scavenging enabled with a seven-day interval.

## Final audit

```powershell
$Zone = "ad.anudia.co.uk"

Get-DnsServerZone -Name $Zone
Get-DnsServerZone -Name "1.168.192.in-addr.arpa"
Get-DnsServerZoneAging -Name $Zone
Get-DnsServerScavenging
Get-DnsServerResourceRecord -ZoneName $Zone -Name "files"
Get-DnsServerResourceRecord -ZoneName "1.168.192.in-addr.arpa" -RRType PTR
```
