# Joiner, Mover, Leaver - Operations Guide

This document describes the on-premises JML process used for Active Directory users.

The process should always follow least privilege and the organisation's approved access, retention and offboarding policies.

This guide covers the on-premises Active Directory lifecycle. Microsoft 365,
Entra ID, Exchange Online, mailbox handling, licensing, and MFA are reserved
for a later hybrid-identity phase.

---

## Joiner

### 1. Create the account

Create the employee in the correct departmental OU.

Example:

```text
Departments
└── Sales
    └── Alex Carter
```

Set the required identity information, including:

- Name
- Username
- Department
- Temporary password

Require the employee to change the temporary password at first logon.

---

### 2. Assign role-based access

Add the employee to the security group required for their department.

Example:

```text
GG_Sales_Users
```

Avoid assigning departmental permissions directly to individual users where group-based access can be used.

Verify the membership after making the change.

---

### 3. Configure the home folder

Create the employee's folder beneath the central home-folder location.

Example:

```text
C:\Shares\Home\alex.carter
```

Configure the AD home-drive mapping:

```text
H:
\\SRV01\Home$\alex.carter
```

Apply only the NTFS access required by the employee and authorised administrators.

---

### 4. Verify the Joiner

Confirm:

- Account is enabled
- Correct Department attribute
- Correct OU
- Correct departmental group
- Home-drive mapping is configured
- Home-folder permissions are correct
- Domain authentication works

Do not consider provisioning complete until the resulting access has been checked.

---

## Mover

Example:

```text
Sales to Finance
```

### 1. Update the employee record

Change:

```text
Department: Sales
```

to:

```text
Department: Finance
```

---

### 2. Move the AD account

Move the employee from the old departmental OU into the new OU.

Example:

```text
OU=Sales
```

to:

```text
OU=Finance
```

---

### 3. Remove old access

Remove:

```text
GG_Sales_Users
```

Do this as part of the transfer rather than simply adding the new department.

This prevents users accumulating access as they move through the organisation.

---

### 4. Grant new access

Add:

```text
GG_Finance_Users
```

---

### 5. Verify

Check the account and the groups from both directions.

Confirm:

```text
Department = Finance
OU = Finance
GG_Finance_Users = Present
GG_Sales_Users = Absent
```

If possible, have the user establish a new logon session before testing access because existing Windows sessions may still contain an older security token.

---

## Leaver

Offboarding should prioritise stopping access.

### 1. Disable the account

Disable the AD account first.

Do not rely on moving the account into a Leavers OU as an authentication control.

---

### 2. Remove active access

Remove departmental security groups.

Example:

```text
GG_Finance_Users
```

Add the account to the organisation's designated `GG_Leavers` group.

List any remaining non-default groups for manual entitlement review. Do not
assume that removing the departmental group removes every form of access.

---

### 3. Move to the Leavers OU

Move the disabled account to:

```text
OU=Leavers
```

This separates inactive identities from active departmental accounts.

---

### 4. Remove the home-drive mapping

Clear the employee's:

```text
HomeDrive
HomeDirectory
```

Do not automatically delete the underlying data.

---

### 5. Remove direct folder access

Remove the former employee's direct NTFS access from their preserved home folder.

Retain access for authorised administrators as required.

---

### 6. Preserve data

Do not delete the account or employee data simply because the employee has left.

Retention and deletion should follow organisational policy and any applicable HR, legal or compliance requirements.

---

### 7. Verify

Confirm:

```text
Account disabled
Department = Leaver
OU = Leavers
Department groups removed
GG_Leavers applied
Other access groups reviewed
Home-drive mapping removed
Direct home-folder access removed
Business data preserved
```

Where practical, verify that authentication is rejected.

---

## PowerShell automation

The project contains:

```text
New-JMLJoiner.ps1
Move-JMLUser.ps1
Disable-JMLLeaver.ps1
```

Before using a script, syntax can be checked with:

```powershell
$errors = $null

[System.Management.Automation.Language.Parser]::ParseFile(
    "C:\Admin\JML\SCRIPT.ps1",
    [ref]$null,
    [ref]$errors
)

$errors
```

No output indicates that PowerShell found no syntax errors.

This does not prove that the script's logic is correct.

Use a controlled test account and verify the resulting AD state before relying on automation for real users.

The scripts support `-WhatIf` so their intended targets can be reviewed before
a state-changing run. They also stop on command errors and return structured
verification results. A syntax check is not a substitute for a Windows Server
test against the disposable lab.

---

## Security checklist

Before closing a JML request, ask:

```text
Is the account in the correct OU?
Does the user have only the access required now?
Has obsolete access actually been removed?
Are passwords kept out of scripts?
Have important changes been verified?
For a leaver, has authentication been disabled?
Has business data been preserved appropriately?
```
