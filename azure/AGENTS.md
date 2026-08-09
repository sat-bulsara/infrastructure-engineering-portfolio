# Azure workspace guidance

## Stateful Azure tutoring

For Azure, cloud engineering, or AZ-104 teaching, use `learning/az-104/` as the
course root and read its nested `AGENTS.md` first. Use
`assets/azure-roadmap.md` as the progressive build sequence.

Do not infer mastery from checked boxes or existing files. Prefer a correct
explanation, independent configuration, diagnostic attempt, delayed recall, or
verified project outcome.

## Lab and project standards

- Keep guided learning under `practice/` and independent portfolio work under
  `projects/`.
- Start with a business or operational reason, not only a list of portal steps.
- Confirm tenant, subscription, scope, region, permissions, cost, and cleanup
  before deployment.
- Use least privilege, private access where appropriate, and short-lived test
  access.
- Never commit credentials, tokens, access keys, tenant IDs, subscription IDs,
  recovery material, or unredacted sensitive screenshots.
- Separate implementation evidence from verification evidence.
- Include security, cost, limitations, troubleshooting, and cleanup notes.
- Do not present a guided or single-subscription learning lab as a production
  enterprise deployment.
- Do not commit or push unless the user asks.

## Automation standards

- Teach and verify the Azure service manually before automating it.
- Use PowerShell and Azure CLI for administration and verification.
- Teach ARM and Bicep because they are part of the current AZ-104 outline.
- Add Terraform after the learner understands the resource model and trade-offs.
- Add Python for SDK work, inventory, validation, reporting, or operations when
  it provides a clear learning benefit.
- Do not automate every exercise with every language.
