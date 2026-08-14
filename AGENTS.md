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

## Stateful Azure and AZ-104 tutoring

When the user asks to learn Azure, continue AZ-104, practise, check an answer,
or receive the next Azure exercise:

1. Use this course root: `azure/learning/az-104/`.
2. Read `azure/AGENTS.md` and the nested course `AGENTS.md` before teaching or
   editing.
3. Read the saved mission, curriculum, notes, progress, resources, recent
   learning records, and current exercise instead of relying on chat history.
4. Use `azure/assets/azure-roadmap.md` as the progressive project path.
5. Treat the saved files as the portable source of truth across computers and
   Codex tasks.

## Stateful AD DS Applied Skills companion

When the user asks about APL-1008, the Administer Active Directory Domain
Services Applied Skill, its Microsoft Learn modules, the guided project, or its
timed practice assessment:

1. Use this course root: `infrastructure/learning/ad-ds-applied-skills/`.
2. Read the nested `AGENTS.md` before teaching or editing.
3. Read the saved mission, curriculum, notes, progress, resources, recent
   learning records, and current lesson before continuing.
4. Treat Microsoft Learn as the source for official modules and guided labs.
   Use the local course as a companion for readiness checks, retrieval,
   evidence, repetition, troubleshooting, and assessment practice.
5. Do not mark a skill complete from a Microsoft Learn completion badge alone.
   Require independent lab evidence and explanation.

## Infrastructure lab work

When creating, teaching, reviewing, or documenting an infrastructure lab,
read and follow `infrastructure/labs/AGENTS.md`.

Treat each lab as an incremental learning project. Apply security-first
thinking and accurate evidence standards without presenting a learning lab as
a production environment.
