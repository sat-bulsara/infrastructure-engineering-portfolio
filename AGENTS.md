# Repository guidance

## Stateful PowerShell tutoring

When the user asks to learn, practise, continue, check, or receive the next
PowerShell exercise:

1. Use this course root:
   `infrastructure/labs/Phase 1 Windows Infrastructure/learning/`
2. Read the nested `AGENTS.md` in that directory before teaching or editing.
3. Read the saved course state and current workbook instead of relying on chat
   history.
4. Keep infrastructure work outside that course governed by its own project
   requirements.

The course files are the portable source of truth across computers and Codex
chats.

The portable source for the reusable tutor skill is:
`.codex/skills/learn-anything/`.

Install it on a new computer with the matching script in `.codex/`, then
restart Codex. The repository guidance remains the fallback if the skill is not
installed.

## Infrastructure lab work

When creating, teaching, reviewing, or documenting an infrastructure lab,
read and follow `infrastructure/labs/AGENTS.md`.

Treat each lab as an incremental learning project. Apply security-first
thinking and accurate evidence standards without presenting a learning lab as
a production environment.
