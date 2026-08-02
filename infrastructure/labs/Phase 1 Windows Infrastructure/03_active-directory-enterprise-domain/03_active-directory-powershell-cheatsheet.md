# Active Directory PowerShell Cheat Sheet

## Identity

```powershell
whoami
whoami /groups
```

## Domain and Forest

```powershell
Get-ADDomain
Get-ADForest
```

## Find the Domain Controller

```powershell
nltest /dsgetdc:ad.anudia.co.uk
```

## FSMO Roles

```powershell
netdom query fsmo
```

## Users

```powershell
Get-ADUser sat.bulsara
Get-ADUser john.smith
Get-ADUser ps.user
```

### User properties

```powershell
Get-ADUser sat.admin -Properties Enabled,LockedOut,PasswordLastSet,PasswordNeverExpires
```

### Find disabled or locked users

```powershell
Get-ADUser -Filter * -Properties Enabled,LockedOut |
Where-Object { -not $_.Enabled -or $_.LockedOut } |
Select Name,SamAccountName,Enabled,LockedOut
```

### Find locked users

```powershell
Search-ADAccount -LockedOut
```

### Unlock a user

```powershell
Unlock-ADAccount -Identity "emily.wood1"
```

### Find disabled accounts

```powershell
Search-ADAccount -AccountDisabled |
Select Name,SamAccountName
```

### Find passwords that never expire

```powershell
Get-ADUser -Filter * -Properties PasswordNeverExpires |
Where-Object { $_.PasswordNeverExpires -eq $true } |
Select Name,SamAccountName
```

### Find stale enabled accounts

```powershell
Get-ADUser -Filter * -Properties LastLogonDate,Enabled |
Where-Object {
    $_.Enabled -eq $true -and
    $_.LastLogonDate -lt (Get-Date).AddDays(-90)
} |
Select Name,SamAccountName,LastLogonDate
```

## Secure Password Reset

```powershell
$newPassword = Read-Host "Enter new temporary password" -AsSecureString

Set-ADAccountPassword `
-Identity "emily.wood1" `
-Reset `
-NewPassword $newPassword

Set-ADUser `
-Identity "emily.wood1" `
-ChangePasswordAtLogon $true
```

## Groups

```powershell
Get-ADGroup "Domain Admins"
Get-ADGroup "GG_Users"
```

### Group members

```powershell
Get-ADGroupMember "Domain Admins"
Get-ADGroupMember "GG_Users"
Get-ADGroupMember "GG_IT_Users"
```

### User group membership

```powershell
Get-ADPrincipalGroupMembership "john.smith"
Get-ADPrincipalGroupMembership sat.admin
```

### Add a user to a group

```powershell
Add-ADGroupMember `
-Identity "GG_IT_Users" `
-Members "john.smith"
```

### Remove a user from a group

```powershell
Remove-ADGroupMember `
-Identity "GG_Finance_Users" `
-Members "emily.wood1" `
-Confirm:$false
```

## Create an OU

```powershell
New-ADOrganizationalUnit `
-Name "IT" `
-Path "DC=ad,DC=anudia,DC=co,DC=uk"
```

### List OUs

```powershell
Get-ADOrganizationalUnit -Filter * |
Select Name,DistinguishedName
```

### Find one OU

```powershell
Get-ADOrganizationalUnit -Filter 'Name -eq "IT"' |
Select Name,DistinguishedName
```

## Create a Security Group

```powershell
New-ADGroup `
-Name "GG_IT_Users" `
-SamAccountName "GG_IT_Users" `
-GroupScope Global `
-GroupCategory Security `
-Path "OU=IT,OU=Departments,DC=ad,DC=anudia,DC=co,DC=uk"
```

## Create a User Securely

```powershell
$password = Read-Host "Enter a temporary password" -AsSecureString

New-ADUser `
-Name "John Smith" `
-GivenName "John" `
-Surname "Smith" `
-SamAccountName "john.smith" `
-UserPrincipalName "john.smith@ad.anudia.co.uk" `
-Path "OU=IT,OU=Departments,DC=ad,DC=anudia,DC=co,DC=uk" `
-AccountPassword $password `
-Enabled $true `
-ChangePasswordAtLogon $true
```

## Move a User Between OUs

```powershell
Move-ADObject `
-Identity (Get-ADUser "emily.wood1").DistinguishedName `
-TargetPath "OU=IT,OU=Departments,DC=ad,DC=anudia,DC=co,DC=uk"
```

## CSV Import

```powershell
$users = Import-Csv "C:\AD-Provisioning\employees.csv"
```

## Export CSV

```powershell
$users |
Export-Csv "C:\AD-Provisioning\employees.csv" -NoTypeInformation
```

## Verify CSV User Count

```powershell
Import-Csv "C:\AD-Provisioning\employees.csv" |
Measure-Object
```

## Verify Department Counts

```powershell
Import-Csv "C:\AD-Provisioning\employees.csv" |
Group-Object Department |
Select Name,Count
```

## Safe Existing-User Check

```powershell
if (Get-ADUser -Filter "SamAccountName -eq '$($user.Username)'" -ErrorAction SilentlyContinue) {
    Write-Host "SKIP: $($user.Username)"
}
```

## Duplicate Test

```powershell
$user = Import-Csv "C:\AD-Provisioning\employees.csv" |
Select-Object -First 1

if (Get-ADUser -Filter "SamAccountName -eq '$($user.Username)'" -ErrorAction SilentlyContinue) {
    Write-Host "DUPLICATE DETECTED: $($user.Username) - no user created"
}
```

## Department Group Counts

```powershell
$groups = @(
"GG_IT_Users",
"GG_HR_Users",
"GG_Finance_Users",
"GG_Sales_Users",
"GG_Marketing_Users",
"GG_Operations_Users"
)

foreach ($group in $groups) {
    $count = (Get-ADGroupMember $group).Count
    "$group : $count"
}
```

## Privileged Group Review

```powershell
$privilegedGroups = @(
"Domain Admins",
"Enterprise Admins",
"Schema Admins"
)

foreach ($group in $privilegedGroups) {
    Write-Host "`n$group"
    Get-ADGroupMember $group |
    Select Name,SamAccountName,ObjectClass
}
```

## Check Bulk Users for Privileged Access

```powershell
$users = Import-Csv "C:\AD-Provisioning\employees.csv"

$users | ForEach-Object {
    Get-ADPrincipalGroupMembership $_.Username |
    Where-Object {
        $_.Name -match "Domain Admins|Enterprise Admins|Schema Admins|Administrators"
    }
}
```

Expected: no output.

## Password and Lockout Policy

```powershell
Get-ADDefaultDomainPasswordPolicy |
Select MinPasswordLength,
       ComplexityEnabled,
       PasswordHistoryCount,
       MaxPasswordAge,
       LockoutThreshold,
       LockoutDuration
```

## Failed Logons

```powershell
Get-WinEvent -FilterHashtable @{
    LogName='Security'
    Id=4625
} -MaxEvents 20 |
Select TimeCreated,Id,Message
```

## AD Health

```powershell
dcdiag
```

## DNS

```powershell
Resolve-DnsName ad.anudia.co.uk
```

### AD LDAP SRV record

```powershell
Resolve-DnsName `
-Type SRV `
_ldap._tcp.dc._msdcs.ad.anudia.co.uk
```

## Domain Controllers

```powershell
Get-ADDomainController -Filter * |
Select HostName,IPv4Address,IsGlobalCatalog
```

## Count AD Users

```powershell
(Get-ADUser -Filter *).Count
```

---

## Security Notes

- Do not hard-code passwords.
- Use `Read-Host -AsSecureString` for temporary passwords.
- Do not store credentials in CSV files.
- Keep secrets out of GitHub.
- Use named admin accounts.
- Use least privilege.
- Prefer group-based access.
- Verify privileged memberships after bulk changes.
