# Build 11 guided Azure foundations workflow completed

- Date: 2026-08-22
- Status: Active
- Context: The learner completed the portal-first Azure foundations build and
  asked for CLI, PowerShell and Terraform where they supported the project.
- Evidence: The portal group, tags, budget, delete lock, failed deletion and
  Activity Log were observed. CLI and PowerShell returned the expected group,
  tags and lock. A changed Terraform variation planned two additions, applied,
  was independently verified with CLI and was destroyed. Both groups were
  confirmed absent.
- Troubleshooting: The learner encountered a stale CLI token, a macOS
  PowerShell browser-authentication limitation, slow AzureRM provider startup
  and a missing shell-scoped Terraform subscription variable. Each was corrected
  and followed by fresh verification.
- Learning: The practical workflow is complete with Full guided help. The
  learner needed correction on the tenant explanation and the misconception
  that a budget caps spending. This is guided completion, not independent
  fluency.
- Next evidence: Finish public-safe screenshot names and crops, then repeat a
  changed resource-group scenario with Hint-level support.
