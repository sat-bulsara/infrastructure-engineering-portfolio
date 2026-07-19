# Azure

Azure infrastructure learning, practical labs, reusable automation and portfolio projects.

## Structure

```text
azure/
|-- assets/    # Shared diagrams and media
|-- docs/      # Azure notes and troubleshooting references
|-- practice/  # Guided labs and learning exercises
|-- projects/  # Independently designed portfolio projects
`-- scripts/   # Reusable Azure automation
```

## Practice Labs

| Lab | Topics | Tools | Status |
| --- | --- | --- | --- |
| [Group-Based RBAC](practice/01-group-based-rbac/README.md) | Microsoft Entra groups, Azure RBAC, scope and membership | Azure CLI | Complete |

## Publishing Standard

- Use placeholders instead of tenant-specific identifiers.
- Keep secrets and authentication material out of Git.
- Review screenshots before publishing and confirm that they contain no credentials, tokens, secrets or unintended personal data.
- State clearly whether work is guided practice or an independently designed project.
- Separate implementation evidence from verification evidence.
- Record cleanup and limitations when known.
