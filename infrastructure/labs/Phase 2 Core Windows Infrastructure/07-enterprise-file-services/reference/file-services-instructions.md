# Enterprise File Services - Operations Guide

This guide documents the administration workflow used in the
`ad.anudia.co.uk` Enterprise File Services project.

It is written for the disposable learning environment. Discover and record the
current state before changing permissions, shares, DFS configuration, or VSS.
Review every identity and path before reusing these steps elsewhere.

## 1. Permission model

Use AD security groups rather than assigning departmental access
directly to individual users.

Project pattern:

``` text
GG_Finance_Users
GG_HR_Users
GG_IT_Users
GG_Marketing_Users
GG_Operations_Users
GG_Sales_Users
```

Department users receive normal working access rather than Full Control.

``` text
SMB:  Change
NTFS: Modify
```

Administrators and SYSTEM retain Full Control where required.

## 2. Create department folders

Project root:

``` text
C:\Shares
```

Department folders:

``` text
Finance
HR
IT
Marketing
Operations
Sales
```

Before changing ACLs, confirm the intended folder and matching AD group.

## 3. Configure NTFS permissions

Recommended project pattern:

``` text
BUILTIN\Administrators → Full Control
NT AUTHORITY\SYSTEM    → Full Control
GG_<Department>_Users  → Modify
```

The departmental entry should inherit to files and subfolders.

### Discover and protect the current ACL

`icacls` changes do not provide PowerShell `-WhatIf` behaviour. Inspect the
current ACL and save a restorable copy before removing inheritance or replacing
entries:

``` powershell
$Path       = "C:\Shares\Finance"
$BackupRoot = "C:\Admin\ACL-Backups"
$BackupFile = Join-Path $BackupRoot "finance-before.txt"

Get-Acl $Path | Format-List Owner,AccessToString
icacls $Path

New-Item -Path $BackupRoot -ItemType Directory -Force | Out-Null
icacls $Path /save $BackupFile /T /C

if ($LASTEXITCODE -ne 0) {
    throw "ACL backup failed. Do not change the permissions."
}
```

If a reviewed change must be rolled back, apply the saved ACL file from the
parent folder and verify the result. Do not run this during a normal successful
change:

``` powershell
icacls "C:\Shares" /restore "C:\Admin\ACL-Backups\finance-before.txt" /C
icacls "C:\Shares\Finance"
```

Removing inheritance can remove access required by administrators or SYSTEM.
Apply the change only to the confirmed departmental folder, keep an elevated
session open, and verify the resulting ACL immediately. Use `/grant:r` when
replacing an existing explicit entry so repeated commands do not create a
duplicate permission entry.

Verify with:

``` powershell
icacls "C:\Shares\Finance"
```

The earlier Finance screenshot retained in the project showed both inherited
and explicit Administrators entries. The later six-department report is treated
as final-state evidence and shows the normalised three-principal model.

## 4. Configure SMB shares

Department shares use hidden names:

``` text
Finance$
HR$
IT$
Marketing$
Operations$
Sales$
```

The `$` reduces normal browsing visibility but is not an access-control
mechanism.

Use:

``` text
Domain Admins          → Full
GG_<Department>_Users  → Change
```

Verify with:

``` powershell
Get-SmbShareAccess -Name "Finance$"
```

Record the output for both administrative and departmental principals. The
current project proves the observed authorised and denied outcomes, but it did
not retain a complete `Get-SmbShareAccess` report.

## 5. Enable Access-Based Enumeration

ABE hides files and folders that a user does not have permission to
access.

It does not replace NTFS permissions.

Confirm both the configured `AccessBased` value and the user-visible behaviour.
An access-denied test validates authorisation, while an enumeration test checks
whether ABE actually hides inaccessible content.

Example:

``` powershell
Set-SmbShare -Name "Finance$" -FolderEnumerationMode AccessBased -WhatIf
```

After reviewing the preview, apply and verify the change separately:

``` powershell
Set-SmbShare -Name "Finance$" -FolderEnumerationMode AccessBased

Get-SmbShare -Name "Finance$" |
    Select-Object Name,FolderEnumerationMode
```

## 6. Test departmental isolation

Always test access using a standard user rather than only inspecting
server configuration.

Example from an IT user's session:

``` powershell
Test-Path "\\SRV01\IT$"
Test-Path "\\SRV01\Finance$"
```

Expected:

``` text
IT      → accessible
Finance → denied
```

## 7. Check Effective Access

GUI path:

``` text
Folder Properties
→ Security
→ Advanced
→ Effective Access
```

Select a user and choose **View effective access**.

Use this when troubleshooting what a specific identity can actually do
after group membership and ACLs have been evaluated.

Do not change permissions from this screen unless the change has been
deliberately planned.

## 8. DFS Namespace

The project uses:

``` text
\\ad.anudia.co.uk\Departments
```

Backend targets remain the existing SMB shares.

Example:

``` text
\\ad.anudia.co.uk\Departments\IT
→ \\SRV01\IT$
```

DFS is a namespace layer. It does not replace SMB or NTFS security.

Verify folders with:

``` powershell
Get-DfsnFolder -Path "\\ad.anudia.co.uk\Departments\*"
```

Verify every backend target separately:

``` powershell
Get-DfsnFolder -Path "\\ad.anudia.co.uk\Departments\*" |
    ForEach-Object {
        Get-DfsnFolderTarget -Path $_.Path
    } |
    Select-Object Path,TargetPath,State
```

Test from a domain client before considering the namespace complete.

## 9. DFS Replication

DFS Replication was not deployed in this project because there was only
one meaningful file server.

Do not enable replication merely because the role is available. A
replication design requires additional servers, target paths, topology,
capacity and conflict/recovery considerations.

## 10. VSS recovery

Shadow Copies operate at volume level.

The project data is stored beneath:

``` text
C:\Shares
```

so the relevant snapshot volume is `C:`.

List VSS volumes:

``` powershell
vssadmin list volumes
```

List existing snapshots:

``` powershell
Get-CimInstance Win32_ShadowCopy |
    Select-Object InstallDate,DeviceObject,ID
```

Create a client-accessible snapshot:

``` powershell
$ShadowClass = [wmiclass]"root\cimv2:Win32_ShadowCopy"
$Result = $ShadowClass.Create("C:\","ClientAccessible")
$Result
```

A `ReturnValue` of `0` indicates that the creation request succeeded. Query the
VSS inventory afterwards and verify the new snapshot independently. Creating a
snapshot consumes space on the source system and is a state-changing operation.

### Inspect a snapshot

A raw `GLOBALROOT` path may not behave like a normal PowerShell
filesystem path.

Temporarily expose the snapshot:

``` powershell
cmd /c 'mklink /d C:\ShadowCopy \\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy2\'
```

Do not assume that `HarddiskVolumeShadowCopy2` is the required recovery point.
First use `Get-CimInstance Win32_ShadowCopy` to identify the intended snapshot,
then substitute its exact `DeviceObject` value. Confirm that `C:\ShadowCopy`
does not already exist before creating the temporary link.

Inspect the historical file before restoring it:

``` powershell
Get-Content "C:\ShadowCopy\Shares\IT\recovery-test.txt"
```

### Restore one file

``` powershell
Copy-Item `
    -Path "C:\ShadowCopy\Shares\IT\recovery-test.txt" `
    -Destination "C:\Shares\IT\recovery-test.txt" `
    -Force
```

Verify the live file after recovery.

Remove only the temporary directory link:

``` powershell
cmd /c rmdir C:\ShadowCopy
```

This does not delete the actual VSS snapshot.

Verify that the link was removed:

``` powershell
Test-Path "C:\ShadowCopy"
```

Expected result: `False`.

VSS remains on the source volume and is not an independent backup. The project
proved server-side recovery of one disposable file; it did not test client-side
Previous Versions recovery.

## 11. Permission auditing

For each department, audit both layers:

``` text
SMB ACL
+
NTFS ACL
```

A GPO-style or server-side configuration view alone is not proof of user
access. Validate from the client where practical.

## 12. Security checklist

Before closing a File Services change, confirm:

``` text
Correct AD group is used
No unnecessary direct-user permissions
Department users have Modify/Change rather than Full Control
Administrators and SYSTEM retain required access
ABE is enabled where intended
Unauthorised department access is denied
Effective Access matches the design
DFS targets point to the intended SMB shares
DFS does not weaken backend permissions
Recovery snapshots can actually be read
Restored data is verified
Temporary recovery mounts are removed
Exact SMB ACLs are recorded
ABE visibility is tested from a standard user session
Every DFS folder target is recorded
```
