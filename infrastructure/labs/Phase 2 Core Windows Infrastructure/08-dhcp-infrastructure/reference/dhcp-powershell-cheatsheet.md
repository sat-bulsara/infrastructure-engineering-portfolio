# DHCP PowerShell Cheat Sheet

## Role and service

```powershell
Get-WindowsFeature DHCP
Install-WindowsFeature -Name DHCP -IncludeManagementTools
Get-Service DHCPServer
```

## AD authorisation

```powershell
Add-DhcpServerInDC `
    -DnsName "SRV01.ad.anudia.co.uk" `
    -IPAddress 192.168.1.250

Get-DhcpServerInDC
```

## DHCP security groups

```powershell
netsh dhcp add securitygroups
Restart-Service DHCPServer
Get-ADGroup -Filter 'Name -like "DHCP*"'
```

## Create scope

```powershell
Add-DhcpServerv4Scope `
    -Name "Corporate-LAN" `
    -StartRange 192.168.1.100 `
    -EndRange 192.168.1.199 `
    -SubnetMask 255.255.255.0 `
    -State InActive
```

## Scope state and lease duration

```powershell
Set-DhcpServerv4Scope -ScopeId 192.168.1.0 -LeaseDuration 8.00:00:00
Set-DhcpServerv4Scope -ScopeId 192.168.1.0 -State Active
Get-DhcpServerv4Scope -ScopeId 192.168.1.0
```

## Scope options

```powershell
Set-DhcpServerv4OptionValue -ScopeId 192.168.1.0 -OptionId 3 -Value 192.168.1.254
Set-DhcpServerv4OptionValue -ScopeId 192.168.1.0 -OptionId 6 -Value 192.168.1.250
Set-DhcpServerv4OptionValue -ScopeId 192.168.1.0 -OptionId 15 -Value "ad.anudia.co.uk"

Get-DhcpServerv4OptionValue -ScopeId 192.168.1.0 |
    Sort-Object OptionId
```

## Reservation

```powershell
Add-DhcpServerv4Reservation `
    -ScopeId 192.168.1.0 `
    -IPAddress 192.168.1.150 `
    -ClientId "00-1C-42-6D-36-92" `
    -Name "CLIENT01"

Get-DhcpServerv4Reservation -ScopeId 192.168.1.0
```

## Client renewal

```powershell
ipconfig /release
ipconfig /renew
ipconfig /all
```

## Route, gateway, and DNS tests

```powershell
Get-NetRoute -AddressFamily IPv4 -DestinationPrefix "0.0.0.0/0"
Test-Connection 192.168.1.254 -Count 2
Resolve-DnsName ad.anudia.co.uk -Server 192.168.1.250
```

## Leases and statistics

```powershell
Get-DhcpServerv4Lease -ScopeId 192.168.1.0
Get-DhcpServerv4ScopeStatistics -ScopeId 192.168.1.0
```

## Backup

```powershell
New-Item -Path "C:\Infrastructure\Backups\DHCP" -ItemType Directory -Force

Backup-DhcpServer `
    -ComputerName "SRV01" `
    -Path "C:\Infrastructure\Backups\DHCP"

Get-ChildItem "C:\Infrastructure\Backups\DHCP" -Recurse
```

## Verify SRV01 static IPv4

```powershell
Get-NetIPAddress `
    -InterfaceAlias "Embedded NIC 1" `
    -IPAddress 192.168.1.250 |
    Select-Object IPAddress,PrefixLength,PrefixOrigin,SuffixOrigin,AddressState

Get-NetIPInterface `
    -InterfaceAlias "Embedded NIC 1" `
    -AddressFamily IPv4 |
    Select-Object InterfaceAlias,Dhcp
```

## Final health audit

```powershell
Get-Service DHCPServer
Get-DhcpServerInDC
Get-DhcpServerv4Scope -ScopeId 192.168.1.0
Get-DhcpServerv4OptionValue -ScopeId 192.168.1.0
Get-DhcpServerv4Reservation -ScopeId 192.168.1.0
Get-DhcpServerv4Lease -ScopeId 192.168.1.0
```
