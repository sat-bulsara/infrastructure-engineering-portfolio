# APL-1008 Full Study Guide

This is an original offline companion to the Microsoft APL-1008 study guide.
Use it to learn, revise, and complete an open-guide rehearsal. Do the final local
mock without this guide so that recall and navigation are tested honestly.

For the real Microsoft assessment, follow the instructions displayed in the
lab. Microsoft says a task can normally be completed by any method or tool
unless its email says otherwise. Microsoft also prohibits AI assistance and
improper help during the assessment. Do not use Codex during the real lab.

## 1. Administration pattern

Use the same sequence for every change:

```text
discover -> confirm target -> record recovery point -> preview -> change
         -> verify intended result -> test for side effects -> record evidence
```

Useful questions:

1. What state exists now?
2. Which object, server, site, OU, or GPO is in scope?
3. Is the change reversible? If not, is this a disposable snapshot?
4. What command or console view independently proves success?
5. What negative test proves access was not granted too broadly?

## 2. Assessment map

| Area | You must be able to do |
| --- | --- |
| Domain controllers | Deploy a DC and transfer an FSMO role |
| Topology | Work with functional levels, sites, subnets, and DC placement |
| Objects | Manage users, bulk operations, disabled accounts, passwords, gMSAs, groups, OUs, and deleted objects |
| Group Policy | Create, link, configure, scope, order, and verify GPOs; manage domain and fine-grained password policy |
| Security | Delegate narrowly, configure auditing, and apply user rights through Group Policy |

## 3. Domain controllers

### Discover first

```powershell
Get-ADForest
Get-ADDomain
Get-ADDomainController -Filter * |
    Select-Object HostName, Site, IPv4Address, IsGlobalCatalog

netdom query fsmo
dcdiag /e /q
repadmin /replsummary
```

- `Get-ADForest` shows forest-wide state and forest FSMO owners.
- `Get-ADDomain` shows domain mode and domain FSMO owners.
- `dcdiag /q` is quiet when tests pass and displays failures.
- `repadmin /replsummary` gives a replication summary, not proof of DNS health.

### Deploy an additional domain controller

Prerequisites:

- Correct static addressing and AD DNS configuration.
- Reliable time and connectivity.
- Existing domain health checked first.
- Server name and site placement decided.
- A current snapshot in a disposable lab.

Command pattern:

```powershell
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

$credential = Get-Credential
$dsrmPassword = Read-Host "Enter a unique DSRM password" -AsSecureString

Install-ADDSDomainController `
    -DomainName "example.test" `
    -Credential $credential `
    -SafeModeAdministratorPassword $dsrmPassword `
    -InstallDns
```

Never place a plaintext password in a script, shell history, screenshot, or Git.
After restart, verify DC discovery, SYSVOL and NETLOGON, DNS registration,
replication, and Directory Service logs.

### FSMO roles

Forest-wide:

- Schema Master: coordinates schema changes.
- Domain Naming Master: coordinates adding and removing domains.

Domain-wide:

- RID Master: allocates RID pools used to create unique SIDs.
- PDC Emulator: important for time, password-change priority, and legacy PDC
  compatibility.
- Infrastructure Master: updates cross-domain object references.

Transfer while the current holder is available:

```powershell
Move-ADDirectoryServerOperationMasterRole `
    -Identity "DC02" `
    -OperationMasterRole RIDMaster

netdom query fsmo
```

Seizure is a recovery action for a failed holder that will not return. Do not
bring the old holder back without the appropriate recovery procedure.

## 4. AD topology

### Functional levels

```powershell
Get-ADForest | Select-Object RootDomain, ForestMode
Get-ADDomain | Select-Object DNSRoot, DomainMode
```

Raising a functional level enables a newer capability boundary only when every
relevant domain controller supports it. Treat the change as one-way for this
course. Confirm compatibility and restore from an earlier lab snapshot if you
need to repeat the exercise.

Command patterns:

```powershell
Set-ADDomainMode -Identity "example.test" -DomainMode <supported-mode>
Set-ADForestMode -Identity "example.test" -ForestMode <supported-mode>
```

Do not substitute a mode name until discovery proves it is supported.

### Sites, subnets, and DC placement

```powershell
Get-ADReplicationSite -Filter *
Get-ADReplicationSubnet -Filter *
Get-ADDomainController -Filter * |
    Select-Object HostName, Site
```

```powershell
New-ADReplicationSite -Name "Branch-Site"
New-ADReplicationSubnet `
    -Name "10.20.0.0/24" `
    -Site "Branch-Site"

Move-ADDirectoryServer -Identity "DC02" -Site "Branch-Site"
```

A site models well-connected network locations. A subnet maps an IP range to a
site. Moving the DC's server object changes site membership; it does not change
the server IP address.

Verify the site and subnet objects, DC site membership, client site detection,
DNS records, and replication after the move.

## 5. AD DS objects

### Create a user securely

```powershell
$initialPassword = Read-Host "Enter a unique initial password" -AsSecureString

New-ADUser `
    -Name "Ava Patel" `
    -GivenName "Ava" `
    -Surname "Patel" `
    -SamAccountName "ava.patel" `
    -UserPrincipalName "ava.patel@example.test" `
    -Path "OU=Users,OU=Lab,DC=example,DC=test" `
    -AccountPassword $initialPassword `
    -Enabled $true `
    -ChangePasswordAtLogon $true

Get-ADUser "ava.patel" -Properties Enabled, DistinguishedName |
    Select-Object SamAccountName, Enabled, DistinguishedName
```

### Bulk user management

Separate validation from mutation. Reject missing or duplicate identifiers
before creating anything.

```powershell
$rows = Import-Csv .\users.csv

$rows | ForEach-Object {
    [PSCustomObject]@{
        SamAccountName = $_.SamAccountName
        HasName        = -not [string]::IsNullOrWhiteSpace($_.DisplayName)
        AlreadyExists  = [bool](Get-ADUser -Filter "SamAccountName -eq '$($_.SamAccountName)'" )
    }
}
```

After validation, use `-WhatIf` where the cmdlet supports it, then process the
approved rows. Record counts for created, skipped, and failed rows. A safe bulk
script can be rerun without creating duplicates.

### Disabled users and password reset

```powershell
Search-ADAccount -AccountDisabled -UsersOnly |
    Select-Object Name, SamAccountName, DistinguishedName

Disable-ADAccount -Identity "contractor01"
Enable-ADAccount -Identity "contractor01"

$newPassword = Read-Host "Enter a unique replacement password" -AsSecureString
Set-ADAccountPassword -Identity "ava.patel" -Reset -NewPassword $newPassword
Set-ADUser -Identity "ava.patel" -ChangePasswordAtLogon $true
```

Verify the intended account state. Do not reveal or record the password.

### Group Managed Service Accounts

A gMSA lets AD manage the service password. The host or host group must be
permitted to retrieve it, and the domain must have a usable KDS root key.

```powershell
Get-KdsRootKey

New-ADServiceAccount `
    -Name "svcWeb" `
    -DNSHostName "svcWeb.example.test" `
    -PrincipalsAllowedToRetrieveManagedPassword "GG_Web_Servers"

Install-ADServiceAccount -Identity "svcWeb"
Test-ADServiceAccount -Identity "svcWeb"
```

Do not create another KDS root key when a suitable one already exists. Normal
production planning allows time for KDS replication. Any accelerated lab-only
method must stay in an isolated, disposable environment.

### Groups and Protected Users

```powershell
New-ADGroup `
    -Name "GG_Finance_Read" `
    -GroupScope Global `
    -GroupCategory Security `
    -Path "OU=Groups,OU=Lab,DC=example,DC=test"

Add-ADGroupMember -Identity "GG_Finance_Read" -Members "ava.patel"
Get-ADGroupMember -Identity "GG_Finance_Read"
```

Choose group scope deliberately. Verify membership from the group and user
directions when privilege matters. Protected Users adds authentication
restrictions and can break older authentication workflows. Add only a
disposable test account, predict the effect, test, and remove it when finished.

### OUs and Recycle Bin

```powershell
New-ADOrganizationalUnit `
    -Name "Finance" `
    -Path "OU=Lab,DC=example,DC=test" `
    -ProtectedFromAccidentalDeletion $true
```

OUs provide administrative and Group Policy scope. They are not security
groups. Attributes describe an object; group membership is normally used to
grant access.

Discover Recycle Bin state:

```powershell
Get-ADOptionalFeature -Filter 'Name -like "Recycle Bin Feature"' |
    Select-Object Name, EnabledScopes
```

Enabling AD Recycle Bin is forest-wide and should be treated as one-way. After
deleting a disposable object, include deleted objects in the query, restore the
correct identity, and confirm its original OU and important attributes.

```powershell
Get-ADObject -Filter 'isDeleted -eq $true' -IncludeDeletedObjects
Restore-ADObject -Identity <deleted-object-guid>
```

## 6. Group Policy

### Create, link, and configure a GPO

```powershell
New-GPO -Name "Lab - Workstation Baseline"

New-GPLink `
    -Name "Lab - Workstation Baseline" `
    -Target "OU=Workstations,OU=Lab,DC=example,DC=test" `
    -LinkEnabled Yes

Get-GPO -Name "Lab - Workstation Baseline"
Get-GPInheritance -Target "OU=Workstations,OU=Lab,DC=example,DC=test"
```

A GPO can exist without applying anywhere. The link supplies scope. Settings
must be placed in the correct Computer or User half. Security filtering and WMI
filters can narrow applicability, but the target still needs Read and Apply
Group Policy permissions as appropriate.

### Processing and evidence

Remember LSDOU:

```text
Local -> Site -> Domain -> OU -> child OU
```

Later processing normally wins when settings conflict, subject to inheritance,
enforcement, loopback, filtering, and setting-specific behaviour. Link order is
evaluated within a container. Predict the result before running:

```powershell
gpupdate /force
gpresult /h C:\Temp\gpresult.html
```

The GPMC report proves configuration. `gpresult` or RSoP proves the endpoint's
effective policy and shows denied GPO reasons.

### Domain password policy

```powershell
Get-ADDefaultDomainPasswordPolicy

Set-ADDefaultDomainPasswordPolicy `
    -Identity "example.test" `
    -MinPasswordLength 14 `
    -PasswordHistoryCount 24 `
    -ComplexityEnabled $true
```

The default domain password policy is domain-wide. Query it independently after
the change. Do not infer it from what the editor displays.

### Fine-grained password policy

```powershell
New-ADFineGrainedPasswordPolicy `
    -Name "Privileged Users PSO" `
    -Precedence 10 `
    -MinPasswordLength 16 `
    -PasswordHistoryCount 24 `
    -ComplexityEnabled $true `
    -LockoutThreshold 5 `
    -LockoutDuration "00:15:00" `
    -LockoutObservationWindow "00:15:00" `
    -MaxPasswordAge "60.00:00:00" `
    -MinPasswordAge "1.00:00:00"

Add-ADFineGrainedPasswordPolicySubject `
    -Identity "Privileged Users PSO" `
    -Subjects "GG_Privileged_Users"

Get-ADUserResultantPasswordPolicy -Identity "test.admin"
```

Precedence uses the lowest number as the stronger priority when several PSOs
apply. The resultant password policy for the target user is the decisive
verification.

## 7. AD DS security

### Delegate permissions narrowly

Delegate to a group, at the smallest suitable OU, for the smallest task. Avoid
broad rights at the domain root. The Delegation of Control Wizard is often the
clearest safe method for standard tasks.

Verification needs two tests:

1. A delegated test account can perform the intended action in the target OU.
2. The same account cannot perform an excluded action or act outside that OU.

Use the AD provider to inspect the ACL when needed:

```powershell
Get-Acl "AD:\OU=Finance,OU=Lab,DC=example,DC=test" |
    Select-Object -ExpandProperty Access
```

### Advanced auditing

Configure Advanced Audit Policy through a GPO linked to the correct domain
controllers or member systems. For account-management evidence, enable the
needed success or failure subcategory, update policy, perform a harmless test
action, and find the labelled event.

```powershell
auditpol /get /category:*
gpresult /scope computer /r
```

Evidence should show the effective audit setting and the resulting event. An
event alone does not prove the intended policy is consistently deployed.

### User rights assignment

User rights control who may perform operating-system activities such as local
or service logon. They differ from permissions on files or AD objects. Deny
rights generally override allow rights, so scope them cautiously through GPO.

Verify the winning GPO with RSoP or `gpresult`, then run an expected-success and
expected-denial test using disposable accounts. Keep a separate administrative
recovery path.

### NTLM and authentication controls

Do not jump directly to deny. Use this order:

```text
inventory dependencies -> enable auditing -> review events -> remediate
-> stage restriction -> negative test -> monitor -> rollback if required
```

Protected Users, Credential Guard, and NTLM restrictions solve different
problems. Understand the dependency and blast radius before applying any of
them. Never weaken unrelated controls just to make a test pass.

## 8. Troubleshooting map

| Symptom | Check first | Then verify |
| --- | --- | --- |
| Domain join or DC discovery fails | Client DNS server and SRV lookup | `nltest /dsgetdc:<domain>` and secure channel |
| Replication fails | DNS, time, connectivity, event logs | `repadmin /showrepl` and `/replsummary` |
| GPO does not apply | Object placement, link, filtering, permissions | `gpresult /h` and denied-GPO reason |
| Password policy looks wrong | Default policy versus PSO | Resultant PSO for the actual user |
| Delegated task fails | Target OU ACL and inheritance | Positive test in scope |
| Delegation is too broad | Parent ACL and inherited ACEs | Negative test outside scope |
| User cannot authenticate | Enabled/locked state, time, DNS, group restrictions | DC logs and a known-good comparison |
| gMSA test fails | KDS key, host permission, module and identity | `Test-ADServiceAccount` on intended host |

## 9. Evidence standard

For each assessed operation, record:

- The task in your own words.
- Discovery output before the change.
- The exact target and recovery point.
- The method used, without credentials.
- Independent verification output.
- One expected-failure or out-of-scope check when access is involved.
- What went wrong and how you diagnosed it.
- A one-sentence explanation of why the result is correct.

Use [the evidence log](../practice/evidence-log.md) and
[coverage checklist](../practice/coverage-checklist.md). A screenshot should
show the result, not only the command or wizard.

## 10. Assessment rehearsal

1. First rehearsal: use this guide and record every lookup.
2. Remediation: practise only the weak operations with changed names and values.
3. Final local mock: 45 minutes, no study guide, no Codex, and no copied steps.
4. Real assessment: follow Microsoft's displayed instructions and candidate
   agreement. Never use AI assistance or disclose assessment content.

## Official sources

- [APL-1008 study guide](https://learn.microsoft.com/en-us/credentials/applied-skills/resources/study-guides/apl-1008)
- [Official AD DS learning path](https://learn.microsoft.com/en-us/training/paths/administer-active-directory-domain-services/)
- [Assessment lab duration and experience](https://learn.microsoft.com/en-us/credentials/support/assessment-duration-lab-experience)
- [Applied Skills candidate agreement](https://learn.microsoft.com/en-us/credentials/support/appliedskills-candidate-agreement)

