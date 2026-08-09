# Group Policy - Operations Guide

This document describes the Group Policy administration process used in
the `ad.anudia.co.uk` Active Directory learning environment.

The process should follow least privilege, group-based targeting,
controlled change, and endpoint verification rather than assuming that a
GPO is working because it exists in Group Policy Management.

This guide covers the Group Policy controls implemented in this project.
Loopback Processing, WMI Filtering, inheritance, and enforcement were
studied but were not built as separate demonstrations.

------------------------------------------------------------------------

## 1. Domain password policy

Configure domain-account password requirements at the domain level
rather than inside a departmental OU.

Review settings such as:

-   Enforce password history
-   Maximum password age
-   Minimum password age
-   Minimum password length
-   Password complexity requirements

After changing the policy, verify that the intended domain GPO contains
the settings.

------------------------------------------------------------------------

## 2. Endpoint restrictions

Create a user-side GPO for the intended departmental scope.

Example:

``` text
GPO-Endpoint-Restrictions
```

Configure the required Administrative Template setting.

The project tested:

``` text
User Configuration
└── Policies
    └── Administrative Templates
        └── Control Panel
            └── Prohibit access to Control Panel and PC settings
```

Do not treat the configured setting as proof that it is active.

On the affected endpoint, refresh and verify:

``` powershell
gpupdate /force
gpresult /scope user /r
```

Then test the restricted feature from the standard user's session.

------------------------------------------------------------------------

## 3. Departmental drive mapping

Use Group Policy Preferences to map departmental storage.

Example:

``` text
IT Department
Drive letter: I:
```

Prefer group-based or OU-based targeting rather than configuring drives
manually on individual endpoints.

After policy refresh, verify that the mapped drive appears in the user's
session and that the user has only the intended file-system access.

------------------------------------------------------------------------

## 4. Folder Redirection

Create the server-side folder and SMB share first. The `$` suffix hides the share
from casual browsing, but it does not grant or deny access. Share and NTFS
permissions remain the security boundary.

Project location:

``` text
C:\Shares\RedirectedFolders
```

Project share:

``` text
\\SRV01\RedirectedFolders$
```

The root permissions must support creation of the per-user folders required by
the selected Folder Redirection model. Verify the effective share and NTFS
permissions separately. Do not infer permission isolation from the hidden share
name.

The project used per-user folders beneath the share:

``` text
\\SRV01\RedirectedFolders$\%USERNAME%\Documents
```

Configure Documents Folder Redirection through a user-side GPO.

The final project configuration used:

``` text
Basic redirection
Create a folder for each user under the root path
Move the contents of Documents to the new location
Grant the user exclusive rights to Documents: Disabled
Leave the folder in the new location when policy is removed
```

The screenshot captured the earlier enabled state. The later exported report is
the final-state evidence and records **Grant the user exclusive rights to
Documents: Disabled**. Because the final configuration does not create automatic
exclusive isolation, verify the share and NTFS permission model and test access
with a second user before claiming per-user isolation.

### Verify Folder Redirection

On the client:

``` powershell
[Environment]::GetFolderPath("MyDocuments")
```

Expected pattern:

``` text
\\SRV01\RedirectedFolders$\username\Documents
```

If redirection does not work, check:

``` powershell
Get-WinEvent `
-LogName "Microsoft-Windows-Folder Redirection/Operational" `
-MaxEvents 15
```

Also verify that the share and user folder are reachable.

Virtualisation folder-sharing features can affect Windows known folders.
In this project, Parallels Mac-folder integration had to be separated
from the Windows profile before the Group Policy result could be
validated cleanly.

------------------------------------------------------------------------

## 5. Windows Update policy

Create a computer-side GPO and link it to the workstation OU.

Project GPO:

``` text
GPO-Workstations-Windows-Update
```

The project configured:

``` text
Computer Configuration
└── Policies
    └── Administrative Templates
        └── Windows Components
            └── Windows Update
                └── Manage end user experience
                    └── Configure Automatic Updates
```

The configured behaviour was:

``` text
4 - Auto download and schedule the install
Scheduled install day: Every day
Scheduled install time: 03:00
```

Verify computer policy from the workstation:

``` powershell
gpupdate /force
gpresult /scope computer /r
```

The Windows Update GPO should appear under Applied Group Policy Objects.

This confirms that the computer processed the named GPO. It does not prove that
updates downloaded or installed, or that the workstation reached a required
patch level. Verify those outcomes separately when they are in scope.

------------------------------------------------------------------------

## 6. Security Filtering

Security Filtering restricts which security principals can apply a GPO
after normal link scope has been evaluated.

Project GPO:

``` text
GPO-IT-Security-Filtered
```

Target group:

``` text
GG_IT_Users
```

The test policy removed access to the Windows Run command.

### Intended permission model

``` text
GG_IT_Users          Read + Apply Group Policy
Authenticated Users  Read only
```

Current Windows Group Policy processing uses the computer security context to
retrieve user-side GPO settings. If `Authenticated Users` is removed from the
Security Filtering list, restore **Read** permission without **Apply Group
Policy**, or grant Read to `Domain Computers` or another appropriate computer
group. The user target still requires both Read and Apply Group Policy.

### Current exported result

The retained report lists both `GG_IT_Users` and `Authenticated Users` under
Security Filtering. This means `Authenticated Users` still has Apply Group
Policy. The retained configuration therefore applies to eligible authenticated
users within the linked IT OU, rather than exclusively to `GG_IT_Users`.

This broader scope is the documented final state of the learning lab. The
following procedure is an optional least-privilege refinement if exclusive
group targeting is required in a future iteration.

`Set-GPPermission` does not replace an existing higher permission with a lower
permission unless `-Replace` is specified. Protect the current state with a GPO
backup, inspect the permission, preview the change, and then replace it:

``` powershell
# Read-only discovery
Get-GPPermission `
-Name "GPO-IT-Security-Filtered" `
-TargetName "Authenticated Users" `
-TargetType Group

# Preview only
Set-GPPermission `
-Name "GPO-IT-Security-Filtered" `
-TargetName "Authenticated Users" `
-TargetType Group `
-PermissionLevel GpoRead `
-Replace `
-WhatIf

# Change state after checking the preview
Set-GPPermission `
-Name "GPO-IT-Security-Filtered" `
-TargetName "Authenticated Users" `
-TargetType Group `
-PermissionLevel GpoRead `
-Replace
```

If the optional change is performed, verify all permissions, export a fresh GPO
report, and confirm:

``` text
Security Filtering contains GG_IT_Users only.
Delegation shows Authenticated Users with Read, not Read (from Security Filtering).
```

Create a new logon session, refresh policy, confirm the result for an IT-group
member, and perform a negative test with a non-member at the same OU scope.

### Verify group membership

From the user's session:

``` powershell
whoami /groups
```

Confirm that the expected security group is present in the current logon
token.

If the user was only recently added to the group, establish a new logon
session before relying on the token.

### Verify policy result

``` powershell
gpupdate /force
gpresult /scope user /r
```

Confirm that:

``` text
GPO-IT-Security-Filtered
```

appears under Applied Group Policy Objects.

Then test the restricted feature from the standard user's session.

------------------------------------------------------------------------

## 7. GPO link and scope checks

When a GPO does not apply, check the processing path in order:

``` text
GPO exists
→ correct configuration
→ correct link
→ link enabled
→ correct user/computer OU
→ security filtering
→ permissions
→ current group token
→ client policy refresh
→ gpresult
```

PowerShell can inspect OU links with:

``` powershell
Get-GPInheritance `
-Target "OU=IT,OU=Departments,DC=ad,DC=anudia,DC=co,DC=uk"
```

Do not delete or recreate unrelated working GPOs while investigating one
policy.

------------------------------------------------------------------------

## 8. Verification

Useful client-side commands:

``` powershell
gpupdate /force
gpresult /scope user /r
gpresult /scope computer /r
whoami /groups
```

Use user scope for user configuration and computer scope for computer
configuration.

A successful `gpupdate` only proves that policy processing completed. It
does not prove that a particular GPO applied.

Check the Applied Group Policy Objects section and then test the
intended behaviour.

------------------------------------------------------------------------

## 9. Backup

After the GPO configuration is validated, create a backup directory:

``` powershell
New-Item `
-Path "C:\Admin\GPO-Backups" `
-ItemType Directory `
-Force
```

Back up the domain GPOs:

``` powershell
Backup-GPO `
-All `
-Path "C:\Admin\GPO-Backups"
```

Verify that backup data exists before relying on it.

``` powershell
Get-ChildItem "C:\Admin\GPO-Backups"
```

Directory inventory confirms that backup data was written. It does not prove
that a restore will work. Keep a protected off-host copy and test restoration in
a disposable environment when resilience is in scope.

------------------------------------------------------------------------

## 10. Reporting

Create a documentation directory:

``` powershell
New-Item `
-Path "C:\Admin\GPO-Reports" `
-ItemType Directory `
-Force
```

Generate an HTML report:

``` powershell
Get-GPOReport `
-All `
-ReportType Html `
-Path "C:\Admin\GPO-Reports\All-GPOs.html"
```

The report provides a readable record of the domain's GPO configuration
for review and documentation.

Verify the report file before relying on it:

``` powershell
Get-Item "C:\Admin\GPO-Reports\All-GPOs.html"
```

------------------------------------------------------------------------

## Security checklist

Before closing a Group Policy change, ask:

``` text
Is the GPO linked at the correct scope?
Is this user configuration or computer configuration?
Is the policy targeted through groups where appropriate?
Does the target have only the permissions required?
Has required GPO read access been preserved?
Has the endpoint actually processed the GPO?
Does gpresult show the intended policy as applied?
Has the resulting user or computer behaviour been tested?
Has the working GPO configuration been backed up?
Is a protected off-host copy and restore test required for this environment?
```

## Official References

- [Microsoft guidance for domain password-policy application](https://learn.microsoft.com/en-us/troubleshoot/windows-server/group-policy/password-policy-changes-not-applied)
- [Group Policy security filtering and computer read permissions](https://learn.microsoft.com/en-us/troubleshoot/windows-server/group-policy/cannot-apply-user-gpo-when-computer-objects-dont-have-read-permissions)
- [Configure Folder Redirection with Group Policy](https://learn.microsoft.com/en-us/windows-server/storage/folder-redirection/folder-redirection-using-group-policy)
- [Configure Group Policy settings for Automatic Updates](https://learn.microsoft.com/en-us/windows-server/administration/windows-server-update-services/deploy/4-configure-group-policy-settings-for-automatic-updates)
- [`Backup-GPO`](https://learn.microsoft.com/en-us/powershell/module/grouppolicy/backup-gpo?view=windowsserver2025-ps)
- [`Get-GPOReport`](https://learn.microsoft.com/en-us/powershell/module/grouppolicy/get-gporeport?view=windowsserver2025-ps)
- [`Set-GPPermission`](https://learn.microsoft.com/en-us/powershell/module/grouppolicy/set-gppermission?view=windowsserver2025-ps)
