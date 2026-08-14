# DHCP Infrastructure - Operations Guide

## 1. Baseline the existing network

Run on a DHCP client:

```powershell
ipconfig /all
```

Record the IPv4 address, subnet mask, gateway, DHCP server, DNS server, and MAC address.

## 2. Verify SRV01 is static

```powershell
Get-NetIPAddress -InterfaceAlias "Embedded NIC 1" -AddressFamily IPv4
Get-NetIPInterface -InterfaceAlias "Embedded NIC 1" -AddressFamily IPv4 |
    Select-Object InterfaceAlias,Dhcp
```

`192.168.1.250` should be manual and DHCP should be disabled on the server NIC.

## 3. Install DHCP

```powershell
Install-WindowsFeature -Name DHCP -IncludeManagementTools
```

## 4. Authorise in Active Directory

```powershell
Add-DhcpServerInDC `
    -DnsName "SRV01.ad.anudia.co.uk" `
    -IPAddress 192.168.1.250

Get-DhcpServerInDC
```

## 5. Create DHCP security groups

```powershell
netsh dhcp add securitygroups
Restart-Service DHCPServer
```

Verify:

```powershell
Get-ADGroup -Filter 'Name -like "DHCP*"'
```

## 6. Create the scope inactive

```powershell
Add-DhcpServerv4Scope `
    -Name "Corporate-LAN" `
    -StartRange 192.168.1.100 `
    -EndRange 192.168.1.199 `
    -SubnetMask 255.255.255.0 `
    -State InActive
```

## 7. Set lease duration

```powershell
Set-DhcpServerv4Scope `
    -ScopeId 192.168.1.0 `
    -LeaseDuration 8.00:00:00
```

## 8. Configure scope options

```powershell
Set-DhcpServerv4OptionValue -ScopeId 192.168.1.0 -OptionId 3 -Value 192.168.1.254
Set-DhcpServerv4OptionValue -ScopeId 192.168.1.0 -OptionId 6 -Value 192.168.1.250
Set-DhcpServerv4OptionValue -ScopeId 192.168.1.0 -OptionId 15 -Value "ad.anudia.co.uk"
```

Verify:

```powershell
Get-DhcpServerv4OptionValue -ScopeId 192.168.1.0 |
    Sort-Object OptionId
```

## 9. Create CLIENT01 reservation

```powershell
Add-DhcpServerv4Reservation `
    -ScopeId 192.168.1.0 `
    -IPAddress 192.168.1.150 `
    -ClientId "00-1C-42-6D-36-92" `
    -Name "CLIENT01"
```

## 10. Controlled cutover

1. Verify the Windows scope is inactive and complete.
2. Disable IPv4 DHCP on the old router.
3. Activate Windows DHCP.

```powershell
Set-DhcpServerv4Scope -ScopeId 192.168.1.0 -State Active
```

## 11. Renew CLIENT01

```powershell
ipconfig /release
ipconfig /renew
ipconfig /all
```

Expected:

```text
IPv4: 192.168.1.150
DHCP: 192.168.1.250
DNS: 192.168.1.250
Gateway: 192.168.1.254
```

## 12. Verify routing and DNS

```powershell
Get-NetRoute -AddressFamily IPv4 -DestinationPrefix "0.0.0.0/0"
Test-Connection 192.168.1.254 -Count 2
Resolve-DnsName ad.anudia.co.uk -Server 192.168.1.250
```

## 13. Troubleshoot missing DHCP options

If a client receives an IP but is missing gateway/DNS/domain information:

```powershell
Get-DhcpServerv4OptionValue -ScopeId 192.168.1.0
```

Fix the server-side option, then renew the client. Avoid manually patching the endpoint unless the issue is genuinely endpoint-specific.

## 14. Lease and reservation checks

```powershell
Get-DhcpServerv4Lease -ScopeId 192.168.1.0
Get-DhcpServerv4Reservation -ScopeId 192.168.1.0
```

## 15. Scope utilisation

```powershell
Get-DhcpServerv4ScopeStatistics -ScopeId 192.168.1.0
```

## 16. Backup DHCP

```powershell
New-Item -Path "C:\Infrastructure\Backups\DHCP" -ItemType Directory -Force

Backup-DhcpServer `
    -ComputerName "SRV01" `
    -Path "C:\Infrastructure\Backups\DHCP"

Get-ChildItem "C:\Infrastructure\Backups\DHCP" -Recurse
```

## 17. GUI verification

Open:

```text
Server Manager
→ Tools
→ DHCP
→ srv01.ad.anudia.co.uk
→ IPv4
→ Scope [192.168.1.0] Corporate-LAN
```

Check Address Pool, Address Leases, Reservations, and Scope Options.

## Security checklist

- DHCP server is AD authorised.
- SRV01 uses a true static IPv4 address.
- Only the intended DHCP server is active.
- Clients use Active Directory DNS.
- Reservations match the correct MAC addresses.
- Gateway/DNS/domain options are verified.
- Current leases are checked.
- DHCP administrative groups exist.
- DHCP configuration is backed up.
