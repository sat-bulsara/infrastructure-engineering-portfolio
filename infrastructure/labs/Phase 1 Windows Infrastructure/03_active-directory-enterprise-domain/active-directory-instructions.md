# Active Directory Enterprise Domain - Instructions

## Goal

Build and verify a Windows Server 2025 Active Directory environment for `ad.anudia.co.uk`, using a security-first approach.

## Environment

- Server: `SRV01`
- Domain: `ad.anudia.co.uk`
- Domain Controller: `SRV01`
- Departments:
  - IT
  - HR
  - Finance
  - Sales
  - Marketing
  - Operations
- Users: ~200

## Security First

- Use a separate admin account for privileged work.
- Keep standard users non-privileged.
- Use security groups instead of assigning access directly to users.
- Do not hard-code passwords in scripts.
- Do not store passwords in CSV files or GitHub.
- Require temporary passwords to be changed at first logon.
- Review privileged group membership after bulk provisioning.
- Verify changes rather than assuming they worked.

---

## 1. Install AD DS

1. Open **Server Manager**.
2. Select **Add Roles and Features**.
3. Install **Active Directory Domain Services**.
4. Include management tools.

## 2. Promote SRV01

1. Use the post-deployment notification in Server Manager.
2. Promote SRV01 to a domain controller.
3. Create a new forest:

`ad.anudia.co.uk`

4. Complete the prerequisite checks.
5. Allow the server to restart.
6. Sign back in using a domain administrator account.

## 3. Verify AD

Open:

- Active Directory Users and Computers
- DNS Manager
- Group Policy Management
- Active Directory Administrative Center

Check the domain and forest from PowerShell:

```powershell
Get-ADDomain
Get-ADForest
```

## 4. Build the OU Structure

Create a parent OU:

`Departments`

Create departmental OUs beneath it:

- IT
- HR
- Finance
- Sales
- Marketing
- Operations

Keep admin, servers, workstations, groups and service accounts organised separately where useful.

## 5. Create Security Groups

Create department groups using the pattern:

`GG_<Department>_Users`

Examples:

- `GG_IT_Users`
- `GG_HR_Users`
- `GG_Finance_Users`
- `GG_Sales_Users`
- `GG_Marketing_Users`
- `GG_Operations_Users`

Use **Global Security Groups**.

## 6. Create Admin and Standard Users

Create a standard domain user.

Create a separate administrative account.

Add only the admin account to the required privileged group.

Verify:

```powershell
Get-ADGroupMember "Domain Admins"
Get-ADPrincipalGroupMembership sat.admin
```

## 7. PowerShell Object Management

Practise creating and querying:

- OUs
- Users
- Groups
- Group membership

Verify every change after creation.

## 8. Build the Bulk Provisioning CSV

Create:

`C:\AD-Provisioning\employees.csv`

Use fields such as:

```text
EmployeeID
FirstName
LastName
Username
Department
```

Do not include passwords.

Department target counts used in this build:

- IT: 25
- HR: 20
- Finance: 30
- Sales: 50
- Marketing: 30
- Operations: 45

Total: 200

## 9. Bulk Provision Users

Import the CSV.

Prompt for a temporary password as a `SecureString`.

For each user:

1. Verify the department OU exists.
2. Verify the username does not already exist.
3. Create the account in the correct OU.
4. Set the employee ID.
5. Set the department.
6. Enable the account.
7. Require password change at first logon.
8. Handle duplicates safely.

Use a unique AD object name where duplicate employee names exist.

## 10. Assign Department Groups

Add each employee to:

`GG_<Department>_Users`

Verify group counts afterwards.

## 11. Security Review

Review privileged groups:

- Domain Admins
- Enterprise Admins
- Schema Admins

Check for:

- Disabled accounts
- Locked accounts
- Passwords set to never expire
- Unexpected privileged membership
- Failed logons

Review the default password and account lockout policy.

## 12. Health Checks

Run:

```powershell
dcdiag
Resolve-DnsName ad.anudia.co.uk
Resolve-DnsName -Type SRV _ldap._tcp.dc._msdcs.ad.anudia.co.uk
netdom query fsmo
```

Confirm:

- Domain is healthy
- DNS resolves
- SRV records exist
- FSMO roles are held by SRV01
- SRV01 is the Global Catalog

## 13. Break/Fix

### Wrong OU

Move a user into the wrong department.

Verify the mismatch.

Move the user back to the correct OU.

### Excessive Group Membership

Add an IT user to the Finance group.

Verify the excessive access.

Remove the incorrect membership.

Verify again.

## 14. Final Verification

Confirm:

- Domain operational
- Forest operational
- SRV01 recognised as DC
- DNS working
- OUs present
- Users present
- Groups present
- Group memberships correct
- `dcdiag` passes
- FSMO roles verified
- Privileged groups reviewed
- Break/fix completed

## 15. GitHub

Keep public content free of:

- Passwords
- Tokens
- Secrets
- Sensitive exports

Include:

- README
- Selected screenshots
- Bulk provisioning script
- Example CSV
- PowerShell cheat sheet
