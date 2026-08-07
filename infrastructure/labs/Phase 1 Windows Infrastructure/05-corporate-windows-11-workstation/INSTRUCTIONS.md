# Corporate Windows 11 Workstation - Build Instructions

## Purpose

Deploy a Windows 11 Pro workstation, connect it to the existing Active Directory lab, verify domain authentication and endpoint security, and complete a controlled DNS break/fix exercise.

## Environment

- Client: Windows 11 Pro
- Client hostname: CLIENT01
- Domain controller: SRV01
- Domain: ad.anudia.co.uk
- AD DNS server: 192.168.1.250
- Client network: Bridged Ethernet
- Virtualisation: Parallels Desktop

## 1. Prepare Windows 11

1. Install Windows 11 Pro.
2. Complete Windows Update.
3. Confirm the edition supports Active Directory domain joining.
4. Rename the workstation to `CLIENT01`.
5. Restart when required.

Useful checks:

```powershell
hostname
Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion
```

## 2. Configure Networking

The VM must be able to communicate directly with SRV01.

In Parallels, configure the Windows VM network adapter to use bridged networking rather than Shared Network.

Verify the client has an address on the same LAN as SRV01:

```powershell
ipconfig /all
```

Test the domain controller by IP:

```powershell
ping 192.168.1.250
```

## 3. Configure Active Directory DNS

CLIENT01 must use the Active Directory DNS server rather than the router for internal AD name resolution.

Check the current DNS configuration:

```powershell
Get-DnsClientServerAddress -AddressFamily IPv4
```

Configure the Ethernet interface:

```powershell
Set-DnsClientServerAddress `
    -InterfaceAlias "Ethernet" `
    -ServerAddresses "192.168.1.250"
```

Verify:

```powershell
Get-DnsClientServerAddress `
    -InterfaceAlias "Ethernet" `
    -AddressFamily IPv4

Resolve-DnsName ad.anudia.co.uk
```

## 4. Prestage CLIENT01 in Active Directory

On SRV01:

1. Open Active Directory Users and Computers.
2. Open the `Workstations` OU.
3. Create a new Computer object.
4. Name it `CLIENT01`.
5. Leave domain-join permissions restricted to the appropriate privileged administrators.

Evidence:

`screenshots/01-client01-prestage.png`

## 5. Join CLIENT01 to the Domain

On CLIENT01:

1. Open System Properties.
2. Open Computer Name / Domain Changes.
3. Select Domain.
4. Enter:

`ad.anudia.co.uk`

5. Authenticate using the separate privileged domain account.
6. Confirm the welcome message.
7. Restart CLIENT01.

Evidence:

`screenshots/02-client01-domain-join-success.png`

## 6. Test Domain Authentication

At the Windows sign-in screen, sign in using a standard domain user.

Confirm the identity:

```powershell
whoami
```

The result should show an `AD\username` identity.

Do not add the standard employee account to local Administrators.

## 7. Verify Domain Health

Run from CLIENT01:

```powershell
Test-ComputerSecureChannel
nltest /dsgetdc:ad.anudia.co.uk
Get-NetConnectionProfile
```

Expected results:

- `Test-ComputerSecureChannel` returns `True`
- `nltest` locates `SRV01.ad.anudia.co.uk`
- Network category is `DomainAuthenticated`

Evidence:

`screenshots/03-client01-domain-health-verification.png`

## 8. Audit Local Administrators

Review local administrative access:

```powershell
Get-LocalGroupMember -Group "Administrators"
```

Confirm the standard domain employee account is not a local administrator.

Use a separate privileged account when administrative access is required.

## 9. Verify Endpoint Security

Check Windows Firewall:

```powershell
Get-NetFirewallProfile |
    Select-Object Name, Enabled
```

Check Microsoft Defender:

```powershell
Get-MpComputerStatus |
    Select-Object AntivirusEnabled, RealTimeProtectionEnabled
```

Review BitLocker without enabling it:

```powershell
Get-BitLockerVolume
```

Do not enable BitLocker until a recovery-key storage process has been defined.

## 10. Establish the Healthy Baseline

Run:

```powershell
hostname
Test-ComputerSecureChannel
Resolve-DnsName ad.anudia.co.uk
Get-NetConnectionProfile
Get-NetFirewallProfile | Select-Object Name, Enabled
Get-MpComputerStatus | Select-Object AntivirusEnabled, RealTimeProtectionEnabled
```

Confirm:

- Hostname is CLIENT01
- Secure channel is healthy
- AD DNS resolves
- Network is DomainAuthenticated
- Firewall is enabled
- Defender is enabled
- Real-time protection is enabled

Evidence:

`screenshots/05-client01-final-healthy-baseline.png`

## 11. Controlled Break/Fix Exercise

Only introduce a controlled fault after the healthy baseline has been verified.

Observed symptoms in this exercise:

- CLIENT01 could reach SRV01 by IP.
- Internal AD name resolution failed.
- Domain resources were unavailable.

Troubleshooting sequence:

### Test IP connectivity

```powershell
ping 192.168.1.250
```

### Test DNS resolution

```powershell
Resolve-DnsName ad.anudia.co.uk
```

### Inspect the DNS client configuration

```powershell
Get-DnsClientServerAddress -AddressFamily IPv4
```

The root cause was that the Ethernet adapter was using the router (`192.168.1.254`) instead of the AD DNS server (`192.168.1.250`).

Restore the correct DNS server:

```powershell
Set-DnsClientServerAddress `
    -InterfaceAlias "Ethernet" `
    -ServerAddresses "192.168.1.250"
```

Verify the repair:

```powershell
Resolve-DnsName ad.anudia.co.uk
nltest /dsgetdc:ad.anudia.co.uk
Test-ComputerSecureChannel
```

Evidence:

`screenshots/06-breakfix-dns-resolution-restored.png`

## Final Verification

Before considering the project complete, confirm:

- CLIENT01 is joined to ad.anudia.co.uk
- CLIENT01 is located in the Workstations OU
- Standard domain-user authentication works
- Standard user is not a local administrator
- AD DNS points to 192.168.1.250
- AD namespace resolves
- SRV01 can be discovered as a domain controller
- Secure channel returns True
- Network profile is DomainAuthenticated
- Windows Firewall is enabled
- Microsoft Defender and real-time protection are enabled
- Break/fix fault has been repaired
- Final screenshots and README are present

## Key Troubleshooting Principle

Work from the lowest useful layer upward:

`IP connectivity -> DNS resolution -> DNS client configuration -> DC discovery -> secure channel`

Do not change several settings at once. Test, form a hypothesis, make one correction, and verify the result.
