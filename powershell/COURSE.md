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

| Level | Project | Main skills | Portfolio output |
| --- | --- | --- | --- |
| 0 | 01 Command Discovery | Help, commands, objects | Environment report |
| 1 | 02 System Inventory | Pipeline, filtering, export | Inventory tool |
| 2 | 03 Health Checker | Variables, logic, loops | Health report |
| 3 | 04 Function Toolkit | Functions, parameters, validation | Reusable functions |
| 4 | 05 Log Analyzer | Files, CSV/JSON, errors | Log analysis tool |
| 5 | 06 Network Diagnostics | DNS, ports, structured results | Network tester |
| 6 | 07 Identity Simulator | AD-style data and safe lifecycle logic | Joiner/leaver simulator |
| 7 | 08 Enterprise Module | Modules, logging, testing, documentation | Capstone module |

## Completion Standard

For every project, you must be able to:

- Demonstrate it from a clean PowerShell 7 session.
- Explain every command and property used.
- Show one failure and how the script handles it.
- Produce structured objects, not presentation-only strings.
- Include help, examples and a README.
- Pass the project's acceptance checks.

Projects 1-6 work offline. Project 7 uses local mock data so no domain is required. Project 8 combines the earlier work; live Azure, Graph, Exchange and AD adapters can be added later in disposable labs.
