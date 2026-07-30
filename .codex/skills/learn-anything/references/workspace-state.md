# Course workspace state

Use this contract when creating a new course or interpreting an existing one. Preserve equivalent existing files rather than forcing a migration.

## Contents

- [Standard layout](#standard-layout)
- [`MISSION.md`](#missionmd)
- [`CURRICULUM.md`](#curriculummd)
- [`NOTES.md`](#notesmd)
- [`PROGRESS.md`](#progressmd)
- [`RESOURCES.md`](#resourcesmd)
- [Learning records](#learning-records)
- [HTML index](#html-index)

## Standard layout

```text
<course-root>/
├── index.html
├── MISSION.md
├── CURRICULUM.md
├── NOTES.md
├── PROGRESS.md
├── RESOURCES.md
├── assets/
│   ├── course.css
│   └── course.js
├── learning-records/
├── lessons/
├── practice/
└── reference/
```

## `MISSION.md`

Capture stable direction:

```markdown
# Learning Mission

## Topic

<topic>

## Why this matters

<personal motivation>

## Real-world outcome

<observable thing the learner wants to do>

## Constraints

- <time, equipment, accessibility, safety, or environment constraints>

## Completion evidence

- [ ] <demonstration or artifact>
```

Confirm with the learner before materially changing the mission.

## `CURRICULUM.md`

Connect learning to phases and real outcomes:

```markdown
# Course Curriculum

| Phase | Real-world outcome | Required knowledge and skills | Evidence | Status |
| --- | --- | --- | --- | --- |
| 1 | <project outcome> | <just-in-time prerequisites> | <artifact and explanation> | Current |
```

For a project-led course, add a mapping below each phase:

```markdown
## Phase 1: <name>

| Project task | Learn first | Practice | Project evidence |
| --- | --- | --- | --- |
| <task> | <concept or tool> | <small drill> | <observable result> |
```

Keep future phases high-level until their source plan or project brief is available.

## `NOTES.md`

Store durable teaching preferences and recurring constraints, not a transcript:

```markdown
# Teaching Notes

## Preferences

- Uses short, step-by-step explanations.
- Benefits from comparisons with <known subject>.

## Prior knowledge

- <demonstrated knowledge>

## Constraints

- <constraint>
```

## `PROGRESS.md`

Make the current state understandable at a glance:

```markdown
# Learning Progress

## Current focus

<one active concept or skill>

## Next action

<one concrete learner action>

## Review queue

| Review on | Topic | Prompt |
| --- | --- | --- |
| YYYY-MM-DD | <topic> | <retrieval prompt> |

## Session log

| Date | Lesson | Demonstrated independently | Help used | Next |
| --- | --- | --- | --- | --- |
| YYYY-MM-DD | 0001 | <evidence> | None / Hint / Partial / Full | <next action> |
```

Record observed evidence. Do not write vague claims such as "understands everything."

## `RESOURCES.md`

Record only resources actually consulted or intentionally queued:

```markdown
# Learning Resources

| Resource | Type | Used for | Status |
| --- | --- | --- | --- |
| [Title](URL) | Official docs | <lesson or claim> | Used / To read |
```

## Learning records

Create `learning-records/0001-<dash-case-title>.md` for a durable insight, misconception, milestone, or mission change:

```markdown
# <Insight or milestone>

- Date: YYYY-MM-DD
- Status: Active / Revised / Superseded
- Context: <what the learner attempted>
- Evidence: <what they did or explained>
- Learning: <the durable mental model>
- Revisit when: <trigger or date>
```

Do not create a record for every trivial interaction.

## HTML index

Keep `index.html` as the offline course dashboard. Include:

- the mission in one sentence;
- the current phase;
- current focus and next action;
- links to every lesson;
- links to reference pages;
- a reminder that canonical progress lives in `PROGRESS.md`.

Update it without embedding private credentials or sensitive notes.
