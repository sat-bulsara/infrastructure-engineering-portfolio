# JML PowerShell Cheat Sheet

Commands used during the Joiner, Mover and Leaver project.

---

# User Lookup

## Basic user

```powershell
Get-ADUser -Identity "alex.carter"
```

## Detailed user state

```powershell
Get-ADUser -Identity "alex.carter" `
-Properties Enabled,Department,DistinguishedName,MemberOf
```

## Select useful properties

```powershell
Get-ADUser -Identity "alex.carter" `
-Properties Enabled,Department,DistinguishedName,MemberOf |
Select-Object Name,Enabled,Department,DistinguishedName,MemberOf
```

---

# Group Membership

## Show user's groups

```powershell
Get-ADPrincipalGroupMembership "alex.carter" |
Select-Object Name
```

## Check for stale Sales or Finance access

```powershell
Get-ADPrincipalGroupMembership "alex.carter" |
Where-Object { $_.Name -match "Sales|Finance" } |
Select-Object Name
```

No output means neither group was returned.

## View group members

```powershell
Get-ADGroupMember -Identity "GG_Sales_Users"
```

---

# Add Group Membership

```powershell
Add-ADGroupMember `
-Identity "GG_Finance_Users" `
-Members "alex.carter"
```

---

# Remove Group Membership

```powershell
Remove-ADGroupMember `
-Identity "GG_Sales_Users" `
-Members "alex.carter"
```

PowerShell asks for confirmation unless `-Confirm:$false` is used.

---

# Department

## Read department

```powershell
Get-ADUser "alex.carter" -Properties Department |
Select-Object Name,Department
```

## Change department

```powershell
Set-ADUser `
-Identity "alex.carter" `
-Department "Finance"
```

---

# Move User Between OUs

```powershell
$User = Get-ADUser "alex.carter"

Move-ADObject `
-Identity $User.DistinguishedName `
-TargetPath "OU=Finance,OU=Departments,DC=ad,DC=anudia,DC=co,DC=uk"
```

---

# Disable Account

```powershell
Disable-ADAccount -Identity "alex.carter"
```

## Verify

```powershell
Get-ADUser "alex.carter" |
Select-Object Name,Enabled
```

Expected for a leaver:

```text
Enabled : False
```

---

# Home Drive

## Check mapping

```powershell
Get-ADUser -Identity "alex.carter" `
-Properties HomeDirectory,HomeDrive |
Select-Object Name,HomeDrive,HomeDirectory
```

## Remove mapping

```powershell
Set-ADUser `
-Identity "alex.carter" `
-HomeDrive $null `
-HomeDirectory $null
```

This clears the AD mapping. It does not delete the employee's files.

---

# Leavers OU

## List users

```powershell
Get-ADUser `
-SearchBase "OU=Leavers,DC=ad,DC=anudia,DC=co,DC=uk" `
-Filter * |
Select-Object Name,SamAccountName,Enabled
```

---

# Disabled Account Audit

Find disabled accounts outside the Leavers OU:

```powershell
Get-ADUser -Filter 'Enabled -eq $false' `
-Properties DistinguishedName |
Where-Object {
    $_.DistinguishedName -notlike "*OU=Leavers,*"
} |
Select-Object Name,DistinguishedName
```

Do not automatically move or delete returned accounts. Investigate why they are disabled first.

---

# Create AD User

```powershell
$Password = Read-Host "Enter temporary password" -AsSecureString

New-ADUser `
-Name "Test User" `
-GivenName "Test" `
-Surname "User" `
-SamAccountName "test.user" `
-UserPrincipalName "test.user@ad.anudia.co.uk" `
-Department "Sales" `
-Path "OU=Sales,OU=Departments,DC=ad,DC=anudia,DC=co,DC=uk" `
-AccountPassword $Password `
-Enabled $true `
-ChangePasswordAtLogon $true
```

Never place the temporary password directly in the script.

---

# Script Syntax Check

```powershell
$errors = $null

[System.Management.Automation.Language.Parser]::ParseFile(
    "C:\Admin\JML\New-JMLJoiner.ps1",
    [ref]$null,
    [ref]$errors
)

$errors
```

No output means no syntax errors were detected.

---

# Run Joiner Automation

```powershell
.\New-JMLJoiner.ps1 `
-FirstName "Test" `
-LastName "User" `
-Department "Sales" `
-WhatIf

.\New-JMLJoiner.ps1 `
-FirstName "Test" `
-LastName "User" `
-Department "Sales"
```

---

# Run Mover Automation

```powershell
.\Move-JMLUser.ps1 `
-SamAccountName "test.user" `
-NewDepartment "Finance" `
-WhatIf

.\Move-JMLUser.ps1 `
-SamAccountName "test.user" `
-NewDepartment "Finance"
```

---

# Run Leaver Automation

```powershell
.\Disable-JMLLeaver.ps1 `
-SamAccountName "test.user" `
-WhatIf

.\Disable-JMLLeaver.ps1 `
-SamAccountName "test.user"
```

---

# Verify Final Leaver State

```powershell
Get-ADUser test.user `
-Properties Enabled,Department,DistinguishedName,HomeDrive,HomeDirectory |
Select-Object Name,Enabled,Department,DistinguishedName,HomeDrive,HomeDirectory
```

Then:

```powershell
Get-ADPrincipalGroupMembership test.user |
Select-Object Name
```

Expected state:

```text
Enabled       = False
Department    = Leaver
OU            = Leavers
HomeDrive     = Blank
HomeDirectory = Blank
Departmental groups removed
GG_Leavers present
Other non-default groups reviewed
```

---

# Project Scripts

```text
New-JMLJoiner.ps1
Move-JMLUser.ps1
Disable-JMLLeaver.ps1
```
