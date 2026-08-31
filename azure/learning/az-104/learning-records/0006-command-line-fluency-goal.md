# Command-line fluency becomes an explicit Azure learning goal

- Date: 2026-08-23
- Status: Active
- Context: The learner wants to become highly proficient in Azure CLI, Bash,
  Linux, PowerShell and Terraform rather than only copy commands needed for
  Azure projects. They are willing to complete extensive practice to reach
  genuine mastery.
- Decision: Keep the Azure project path as the main learning spine, but add
  frequent command construction, prediction, explanation, output processing,
  scripting and break/fix exercises. Use layered hints and reduce them as
  evidence improves.
- Technical distinction: Azure CLI is an Azure administration program. Bash and
  PowerShell are shells and scripting languages with different data models.
  Linux is an operating system and administration environment. Terraform is a
  declarative infrastructure-as-code tool using HCL and persistent state. They
  should be connected through useful project tasks without being treated as the
  same subject or forced into every action.
- Evidence rule: Running a supplied command is guided exposure. Fluency requires
  constructing commands from goals, explaining behaviour, verifying results and
  troubleshooting changed scenarios with little or no help.
- Current evidence: Azure CLI, shell variables, PowerShell object pipelines and
  one Terraform resource-group-and-lock lifecycle have been used with Full
  guidance. Linux host administration and independent scripting or Terraform
  design are not yet demonstrated.
- Next evidence: Complete a short no-notes baseline at the start of Project 13,
  then set the support level separately for each strand.
