# Capture Azure evidence before cleanup

- Date: 2026-08-22
- Status: Active
- Context: The Build 11 review found that the core configuration and Terraform
  apply were evidenced, but the budget notification threshold and final Azure
  cleanup checks were not retained. One unembedded raw portal screenshot also
  contained account and subscription metadata.
- Evidence: The Terraform source formatted and validated successfully. The
  screenshot review found strong evidence for tags, lock enforcement, Activity
  Log operations, CLI and PowerShell verification, and Terraform apply. It also
  found that the final absence checks existed only in the learning record rather
  than as public-safe retained output.
- Learning: Plan implementation, independent verification, troubleshooting and
  cleanup evidence before changing Azure. Capture narrow public-safe final-state
  queries before deleting resources or local Terraform state. Inspect every
  image in the folder, not only those embedded in the README, and distinguish
  performed work from what the retained artifacts prove.
- Revisit when: Preparing every future Azure lab for publication and before the
  cleanup stage of each chargeable or Terraform-managed build.
