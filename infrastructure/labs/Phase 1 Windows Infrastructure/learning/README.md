# Continue the PowerShell course

This course is stateful and portable through Git. The workbook contains the
exercise code, while the Markdown files record current progress, preferences,
resources, and the next action.

## On another computer

Clone the repository for the first time:

```bash
git clone https://github.com/sat-bulsara/infrastructure-engineering-portfolio.git
cd infrastructure-engineering-portfolio
```

For an existing clone:

```bash
git pull origin main
```

Open the repository, or this `learning` directory, as the Codex workspace. Start
a new chat with:

```text
Continue my stateful PowerShell course. Read the repository AGENTS.md,
the course AGENTS.md, PROGRESS.md, NOTES.md, and the current practice workbook
before giving me the next task.
```

## Portable course state

- `MISSION.md`: long-term outcome
- `CURRICULUM.md`: project-led learning path
- `NOTES.md`: durable teaching preferences
- `PROGRESS.md`: evidence and next action
- `RESOURCES.md`: official research links
- `learning-records/`: important learning decisions
- `practice/00-powershell-from-zero.ps1`: current exercise workbook

Chat history is useful context, but these checked-in files are the source of
truth between computers.
