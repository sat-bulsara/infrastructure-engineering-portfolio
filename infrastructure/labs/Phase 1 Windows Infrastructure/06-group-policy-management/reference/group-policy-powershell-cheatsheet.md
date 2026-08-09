# Group Policy PowerShell Cheat Sheet

Commands used during the Group Policy project.

Commands that inspect state are read-only. `New-GPLink`,
`Set-GPRegistryValue`, `Set-GPPermission`, and `Backup-GPO` change state or write
new data. Confirm the target domain, GPO, OU, and backup path before using them.

------------------------------------------------------------------------

# Group Policy Module

``` powershell
Import-Module GroupPolicy
```

------------------------------------------------------------------------

# GPO Inventory

## List all GPOs

``` powershell
Get-GPO -All
```

## Useful inventory view

``` powershell
Get-GPO -All |
Select-Object DisplayName,GpoStatus,CreationTime,ModificationTime |
Sort-Object DisplayName
```

## Find one GPO

``` powershell
Get-GPO -Name "GPO-IT-Security-Filtered"
```

------------------------------------------------------------------------

# OU Links and Inheritance

## Inspect GPO links on the IT OU

``` powershell
Get-GPInheritance `
-Target "OU=IT,OU=Departments,DC=ad,DC=anudia,DC=co,DC=uk"
```

## Show link details only

``` powershell
Get-GPInheritance `
-Target "OU=IT,OU=Departments,DC=ad,DC=anudia,DC=co,DC=uk" |
Select-Object -ExpandProperty GpoLinks |
Select-Object DisplayName,Enabled,Enforced
```

## Detailed link information

``` powershell
Get-GPInheritance `
-Target "OU=IT,OU=Departments,DC=ad,DC=anudia,DC=co,DC=uk" |
Select-Object -ExpandProperty GpoLinks |
Format-List *
```

------------------------------------------------------------------------

# Create a GPO Link

``` powershell
New-GPLink `
-Name "GPO-IT-Security-Filtered" `
-Target "OU=IT,OU=Departments,DC=ad,DC=anudia,DC=co,DC=uk" `
-LinkEnabled Yes
```

Use only after confirming that the intended GPO and target OU are
correct.

------------------------------------------------------------------------

# Configure a Registry-Based Policy

The security-filtering test removed the Run command.

``` powershell
Set-GPRegistryValue `
-Name "GPO-IT-Security-Filtered" `
-Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" `
-ValueName "NoRun" `
-Type DWord `
-Value 1
```

## Read the configured value

``` powershell
Get-GPRegistryValue `
-Name "GPO-IT-Security-Filtered" `
-Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" `
-ValueName "NoRun"
```

------------------------------------------------------------------------

# GPO Permissions

## Allow IT users to apply a GPO

``` powershell
Set-GPPermission `
-Name "GPO-IT-Security-Filtered" `
-TargetName "GG_IT_Users" `
-TargetType Group `
-PermissionLevel GpoApply
```

## Retain read-only access for Authenticated Users

For a user-side GPO, the computer security context also needs Read permission to
retrieve the policy. This command grants Read without Apply Group Policy:

``` powershell
Set-GPPermission `
-Name "GPO-IT-Security-Filtered" `
-TargetName "Authenticated Users" `
-TargetType Group `
-PermissionLevel GpoRead `
-Replace
```

`-Replace` is essential when reducing an existing higher permission such as
`GpoApply`. Without it, `Set-GPPermission` leaves the higher permission in place.
Use `-WhatIf` first when correcting an existing GPO.

## View all GPO permissions

``` powershell
Get-GPPermission `
-Name "GPO-IT-Security-Filtered" `
-All
```

------------------------------------------------------------------------

# Client Policy Refresh

``` powershell
gpupdate /force
```

A successful refresh does not prove that every GPO applied.

------------------------------------------------------------------------

# Resultant Set of Policy

## User policies

``` powershell
gpresult /scope user /r
```

## Computer policies

``` powershell
gpresult /scope computer /r
```

## Verbose user result

``` powershell
gpresult /scope user /v
```

## Search verbose output for a GPO

``` powershell
gpresult /scope user /v |
Select-String "GPO-IT-Security-Filtered" -Context 3,5
```

------------------------------------------------------------------------

# Current User Security Groups

``` powershell
whoami /groups
```

## Find the IT group

``` powershell
whoami /groups |
findstr /i "GG_IT_Users"
```

This checks the current Windows logon token, not just the membership
stored in Active Directory.

------------------------------------------------------------------------

# Folder Redirection

## Show the current Documents path

``` powershell
[Environment]::GetFolderPath("MyDocuments")
```

Expected project path:

``` text
\\SRV01\RedirectedFolders$\thomas.williams23\Documents
```

## Inspect Windows known-folder registry values

``` powershell
Get-ItemProperty `
"HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders"
```

## Folder Redirection event log

``` powershell
Get-WinEvent `
-LogName "Microsoft-Windows-Folder Redirection/Operational" `
-MaxEvents 15 |
Select-Object TimeCreated,Id,LevelDisplayName,Message |
Format-List
```

------------------------------------------------------------------------

# SMB Shares

## List shares

``` powershell
Get-SmbShare |
Select-Object Name,Path
```

## Test redirected user folder

``` powershell
Test-Path "\\SRV01\RedirectedFolders$\thomas.williams23"
```

## Test redirected Documents folder

``` powershell
Test-Path "\\SRV01\RedirectedFolders$\thomas.williams23\Documents"
```

------------------------------------------------------------------------

# NTFS Permissions

## IT share permissions

``` powershell
icacls "C:\Shares\IT"
```

## Folder Redirection root permissions

``` powershell
icacls "C:\Shares\RedirectedFolders"
```

## User redirected-folder permissions

``` powershell
icacls "\\SRV01\RedirectedFolders$\thomas.williams23"
```

------------------------------------------------------------------------

# GPO Backup

## Create backup directory

``` powershell
New-Item `
-Path "C:\Admin\GPO-Backups" `
-ItemType Directory `
-Force
```

## Back up every GPO

``` powershell
$backupResult = Backup-GPO `
-All `
-Path "C:\Admin\GPO-Backups" `
-Comment "Validated learning-lab configuration"
```

## Review the backup command output

``` powershell
$backupResult |
Select-Object DisplayName,GpoId,Id,BackupDirectory,CreationTime
```

## Verify backup files

``` powershell
Get-ChildItem "C:\Admin\GPO-Backups"
```

Backup objects and directory inventory confirm that data was written. They do
not replace a restore test or a protected off-host copy.

------------------------------------------------------------------------

# GPO Reports

## Create report directory

``` powershell
New-Item `
-Path "C:\Admin\GPO-Reports" `
-ItemType Directory `
-Force
```

## Generate HTML report for all GPOs

``` powershell
Get-GPOReport `
-All `
-ReportType Html `
-Path "C:\Admin\GPO-Reports\All-GPOs.html"
```

## Verify report

``` powershell
Get-Item "C:\Admin\GPO-Reports\All-GPOs.html"
```

------------------------------------------------------------------------

# Useful Troubleshooting Sequence

``` text
1. Confirm the GPO exists.
2. Confirm the policy setting is configured.
3. Confirm the GPO is linked to the intended OU.
4. Confirm the link is enabled.
5. Confirm the user/computer is in scope.
6. Confirm Security Filtering and GPO permissions.
7. Confirm the user's current group token.
8. Run gpupdate /force.
9. Check the correct gpresult scope.
10. Test the resulting endpoint behaviour.
```

## Official References

- [`Backup-GPO`](https://learn.microsoft.com/en-us/powershell/module/grouppolicy/backup-gpo?view=windowsserver2025-ps)
- [`Get-GPOReport`](https://learn.microsoft.com/en-us/powershell/module/grouppolicy/get-gporeport?view=windowsserver2025-ps)
- [User GPO computer read-permission requirement](https://learn.microsoft.com/en-us/troubleshoot/windows-server/group-policy/cannot-apply-user-gpo-when-computer-objects-dont-have-read-permissions)
- [`Set-GPPermission`](https://learn.microsoft.com/en-us/powershell/module/grouppolicy/set-gppermission?view=windowsserver2025-ps)
