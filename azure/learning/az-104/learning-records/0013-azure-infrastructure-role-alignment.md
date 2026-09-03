# Azure infrastructure role alignment

- Date: 2026-08-29
- Status: Incorporated
- Context: A supplied Azure Cloud and Infrastructure Engineer vacancy asked for
  Azure IaaS, networking, cloud security, Entra ID, Microsoft 365, Windows
  Server, PowerShell, backup, patching, lifecycle operations and 2nd/3rd-line
  support. Azure Firewall, Intune, ITIL and AZ-104 were useful additions.
- Finding: The numbered roadmap already covered the main technical requirements
  through Projects 12, 14-18, 23, 25, 28, 30, 31 and 33. The role did not justify
  another numbered project.
- Change: Project 18 now includes an evidenced Windows VM lifecycle and change
  workflow. Project 28 includes a vulnerability-remediation ticket. Project 31
  includes realistic 2nd/3rd-line ticket evidence and lightweight incident,
  problem, change and known-error distinctions. Project 33 now includes
  licence-dependent Microsoft 365 group licensing and an Intune device-compliance
  variation, with a design-only fallback when suitable licensing is unavailable.
- Mini-lab reinforcement: ML18-05 adds an independent patch-maintenance window;
  ML25-03 adds a least-privilege Azure Firewall change; ML28-03 adds a complete
  vulnerability-remediation ticket; and ML31-05 adds ownership of a realistic
  2nd/3rd-line Azure ticket from impact through verified closure.
- Boundary: This remains an Azure and cloud-engineering curriculum. Microsoft
  365, Intune and ITIL are included only where they strengthen identity,
  security, operations and support evidence.
- Next action: Restore the healthy Project 14 NSG state, verify it, then finish
  the controlled break/fix record.
