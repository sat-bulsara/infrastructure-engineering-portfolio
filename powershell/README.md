# PowerShell Automation Portfolio

Hands-on PowerShell labs for Windows, Active Directory, Microsoft 365 and Azure administration.

Each build follows the same workflow:

**Learn -> Build -> Script -> Break -> Troubleshoot -> Document -> GitHub**

## Train Lab

The labs are designed for short, offline sessions on a spare Windows laptop. Start with:

1. Open PowerShell 7.
2. Change to this repository: `Set-Location <path-to-repository>\powershell`
3. Open [Build 01 - Foundations](labs/build-01-foundations/README.md).
4. Complete one 30-minute session at a time.
5. Record the result in [PROGRESS.md](PROGRESS.md).

Do not open the solutions until you have attempted a challenge and written down the error you observed.

## Zero-to-Hero Projects

Use [COURSE.md](COURSE.md) as the main learning path. It takes you from your first commands to a reusable enterprise administration module through eight portfolio projects. Begin with `projects/01-command-discovery` and do not skip the acceptance checks.

## Curriculum

| Build | Topic | Status |
| --- | --- | --- |
| 01 | PowerShell Foundations | Ready |
| 02 | Objects and Pipeline | Planned |
| 03 | Variables and Logic | Planned |
| 04 | Functions | Planned |
| 05 | Files and Logging | Planned |
| 06 | Windows Administration | Planned |
| 07 | Active Directory | Planned |
| 08 | Networking | Planned |
| 09 | Azure | Planned |
| 10 | Microsoft Graph | Planned |
| 11 | Exchange and Microsoft 365 | Planned |
| 12 | Production Automation | Planned |

## Repository Layout

```text
powershell/
|-- labs/       # Guided exercises and break/fix challenges
|-- scripts/    # Reusable scripts produced by the labs
|-- docs/       # Notes and supporting documentation
|-- assets/     # Screenshots and diagrams
`-- PROGRESS.md # Personal learning log
```
