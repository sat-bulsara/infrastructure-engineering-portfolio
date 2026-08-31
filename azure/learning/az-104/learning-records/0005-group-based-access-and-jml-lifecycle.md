# Group-based Azure access and JML lifecycle completed

- Date: 2026-08-22
- Status: Active
- Context: The learner wanted enterprise-style Microsoft Entra work connected to
  prior Active Directory experience, including security reasoning and joiner,
  mover and leaver operations.
- Evidence: A fictional user and assigned-membership security group were created.
  Reader was applied to the group at a dedicated resource-group scope. The user
  could view the group and tags but received `AuthorizationFailed` when writing
  a tag. Removing group membership caused the signed-in user to lose access.
  Azure CLI verified false membership, restored it and verified true. CLI and
  PowerShell independently returned the group as Reader. Cleanup removed the
  role assignment, membership, resource group, security group and active test
  user, with narrow absence checks after each stage.
- Troubleshooting: Reader was initially assigned directly to the user and the
  user was not a member of the intended group. Effective-access evidence exposed
  the direct assignment, and the missing group relationship explained why group
  inheritance was absent. Both relationships were corrected and retested.
- Learning: The learner correctly explained that assigning permissions to a
  group simplifies management in a way comparable to on-premises Active
  Directory groups. Direct assignments bypass that lifecycle control. The full
  workflow used Full guidance, while the learner identified and corrected parts
  of the relationship with Partial help. The learner also reused the previous
  project's resource-group naming and tagging workflow without portal steps
  after target values were supplied. That changed repeat is recorded as a
  completed Variation with Hint support, not yet an unprompted independent task.
  Independent identity and RBAC performance remains due.
- Next evidence: Finish the public evidence and README, then repeat a changed
  role-and-scope scenario with Hint-level support.
