# Azure

Azure infrastructure learning, practical labs, reusable automation and portfolio projects.

## Learning Path

- [Progressive Azure and AZ-104 roadmap](assets/azure-roadmap.md)
- [Stateful AZ-104 companion](learning/az-104/README.md)

The roadmap develops broad Azure and cloud-engineering capability. AZ-104 is a
readiness checkpoint inside that path rather than the sole objective.

## Structure

```text
azure/
|-- assets/    # Shared diagrams and media
|-- docs/      # Azure notes and troubleshooting references
|-- learning/  # Portable course state and the AZ-104 companion
|-- practice/  # Guided labs and learning exercises
|-- projects/  # Independently designed portfolio projects
`-- scripts/   # Reusable Azure automation
```

## Practice Labs

| Lab | Topics | Tools | Status |
| --- | --- | --- | --- |
| [Group-Based RBAC](practice/01-group-based-rbac/README.md) | Microsoft Entra groups, Azure RBAC, scope and membership | Azure CLI | Complete |

## Source Order

1. Small companion explanations and just-in-time official documentation
2. Evidence-based personal builds and numbered projects
3. Timothy Warner's supplementary labs and troubleshooting material
4. PowerShell, Azure CLI, Bicep, Terraform, and Python automation when useful
5. Full Microsoft Learn paths and Applied Skills after the projects
6. Optional AZ-104 confidence assessment when the learner feels ready

## Publishing Standard

- Use placeholders instead of tenant-specific identifiers.
- Keep secrets and authentication material out of Git.
- Review screenshots before publishing and confirm that they contain no credentials, tokens, secrets or unintended personal data.
- State clearly whether work is guided practice or an independently designed project.
- Separate implementation evidence from verification evidence.
- Record cleanup and limitations when known.
