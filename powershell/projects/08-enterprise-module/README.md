# Project 08 - Enterprise Administration Module

## Mission

Turn your best functions into a professional, tested and documented module called `InfrastructureAdmin`.

## Required Structure

```text
InfrastructureAdmin/
|-- InfrastructureAdmin.psd1
|-- InfrastructureAdmin.psm1
|-- Public/
|-- Private/
|-- Tests/
|-- docs/
`-- README.md
```

## Required Capabilities

- System and disk health reporting
- Service-state reporting and safe restart
- Network diagnostics
- Log parsing
- Identity lifecycle simulation
- Consistent logging and error handling

## Engineering Requirements

1. Public functions use approved verbs and singular nouns.
2. Destructive operations support `-WhatIf` and confirmation.
3. Private helpers are not exported.
4. Functions return consistent objects with a type name.
5. Pester tests cover success, boundary and failure cases.
6. The manifest contains version, author, description and compatible PowerShell version.
7. README examples work from a clean session.
8. No secrets, tenant-specific values or production data are included.

## Final Demonstration

Record a short walkthrough showing installation, command discovery, help, a successful workflow, a handled failure, `-WhatIf`, tests and exported reports. Document one design decision you would change before production use.

## Hero Extensions

After the offline module is reliable, add adapters one at a time in disposable environments:

- Active Directory
- Microsoft Graph
- Exchange Online
- Azure resources and cost reporting

Keep authentication and provider-specific commands behind private adapter functions so the public interface remains stable.
