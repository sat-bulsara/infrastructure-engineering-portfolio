# Sat's APL-1008 Personal Cheat Sheet

This is a compact retrieval aid built from completed Microsoft Learn units and
companion quizzes. It is not evidence of lab mastery. Never record credentials.

## Domain controllers and topology

- DNS locates AD DS domain controllers and services; an IP ping proves only
  basic network reachability.
- Forest-wide FSMO roles: Schema Master and Domain Naming Master.
- Domain-wide FSMO roles: RID Master, PDC Emulator, Infrastructure Master.
- Transfer a role while its holder is healthy. Seize only when the failed
  holder will not return.
- An AD subnet maps an IP range to a site.
- Verify changes with independent ownership and health queries.

## Directory objects

- OU: administrative, delegation, and Group Policy scope.
- Attribute: data that describes an object.
- Security group: security-enabled membership used to assign access.
- Generic containers such as `CN=Computers` cannot have GPOs linked directly.
- Managed service accounts simplify password and SPN management.
- A gMSA extends managed service-account use to multiple authorized hosts and
  requires a KDS root key.
- Disable preserves an account while blocking sign-in; deletion removes it.
- Never record an initial or reset password in evidence.

## Group-scope weak point

Use AGDLP:

```text
Accounts -> Global group -> Domain-local group -> Permissions
```

- Global groups collect users or computers with a shared role from the same
  domain.
- Domain-local security groups receive permissions to resources in their own
  domain.
- Distribution groups are not security-enabled.

## Safe bulk administration

```text
discover -> scope -> snapshot -> validate -> preview -> change -> verify -> record
```

- Validate every row before mutation.
- Detect and report existing objects so reruns are safe.
- Produce a result for every input row, including skipped and invalid rows.
- Check the selected objects and destination OU before a bulk move or disable.

## Management tools

- AD Administrative Center: task-oriented GUI built on PowerShell; supports
  objects, OUs, fine-grained password policies, and Recycle Bin recovery.
- AD Users and Computers: common user, group, and computer administration.
- AD Sites and Services: sites, replication, and network topology.
- AD Domains and Trusts: trusts and functional levels.
- AD Schema: object-class and attribute definitions; rarely modified.
- Install Windows Admin Center on a supported management computer, not on a
  domain controller.

## Evidence boundary

- A Microsoft Learn result demonstrates completion and recognition.
- Practical capability requires the requested lab state, independent
  verification, explanation, and a known rollback boundary.
- Phase 1 lab inventory and Module 2 object-management lab evidence remain
  pending.

## Group Policy

- A GPO stores settings that target user or computer objects, not groups
  directly.
- New GPO settings default to `Not Configured`.
- Computer Configuration follows the computer regardless of the signed-in
  user; User Configuration follows the user regardless of the computer.
- Policies are enforced and normally revert when the GPO leaves scope.
- Preferences can persist or "tattoo" configuration unless removal is
  explicitly configured; they support item-level targeting.
- A target that does not meet a setting's `Supported on` requirement ignores
  that setting.
- Starter GPOs contain Administrative Template settings only.

## Official sources

- [Deploy and manage AD DS domain controllers](https://learn.microsoft.com/en-us/training/modules/deploy-manage-active-directory-domain-services-domain-controllers/)
- [Create and manage Active Directory objects](https://learn.microsoft.com/en-us/training/modules/create-manage-active-directory-objects/)
