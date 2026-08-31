# PowerShell Zero-to-Hero Course

## How We Will Work

You write the code. Codex acts as your tutor and reviewer.

For every session:

1. Read only the current project brief.
2. Attempt one TODO without asking for the complete solution.
3. Run the code and copy the exact error if it fails.
4. Ask Codex for a hint or explanation.
5. Improve the code until every acceptance check passes.
6. Add a short entry to `PROGRESS.md` and commit it.

Useful tutor prompts:

- `Teach me the concept needed for Project 2, Task 1. Do not give me the final code.`
- `Here is my code and exact error. Ask me diagnostic questions first.`
- `Review my project against its acceptance criteria.`
- `Give me one extra challenge at my current level.`

## Ground Rules

- Type code yourself; do not paste a complete solution you cannot explain.
- Use `Get-Help` and `Get-Member` before searching online.
- Never test destructive commands against a work, production, AD, Microsoft 365 or Azure environment.
- Use `-WhatIf`, mock data and disposable labs first.
- Never commit credentials, tokens, tenant IDs or private data.
- Keep each session to 25-45 minutes. Stop after one useful result.

## Learning Path

The canonical [24-project curriculum](learning/CURRICULUM.md) is divided into
six four-project phases:

| Phase | Projects | Main outcome |
| --- | --- | --- |
| A | 01-04 | Language, objects, pipeline, logic and functions |
| B | 05-08 | Reliable data, diagnostics and module foundations |
| C | 09-12 | Windows client and server operations |
| D | 13-16 | Active Directory, JML, Group Policy and DNS |
| E | 17-20 | Azure, Microsoft Graph and Microsoft 365 |
| F | 21-24 | Secure, tested and production-quality automation |

Every project repeats earlier skills, includes a changed scenario and
controlled failure, and ends with a practical quiz. Every fourth project is
followed by a cumulative phase gate.

## Completion Standard

For every project, you must be able to:

- Demonstrate it from a clean PowerShell 7 session.
- Explain every command and property used.
- Show one failure and how the script handles it.
- Produce structured objects, not presentation-only strings.
- Include help, examples and a README.
- Pass the project's acceptance checks.
- Complete the no-notes exit quiz and repair every missed item.
- Reuse earlier skills with less support.

Projects 01-08 begin offline or with safe local data. Windows, AD and cloud
projects use mock adapters before an authorised disposable lab or practice
tenant.
