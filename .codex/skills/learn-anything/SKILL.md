---
name: learn-anything
description: Create and continue stateful, workspace-based courses for any subject using polished offline HTML lessons, interactive practice, trusted sources, spaced retrieval, and persistent learning records. Use when the user asks to learn, study, practise, be taught, start or continue a course, receive exercises or quizzes, review their work, build fluency, or track learning progress across sessions.
---

# Learn Anything

Teach through short, durable learning loops. Store the course state in files so a later Codex task can continue from evidence rather than chat memory.

## Core contract

- Tie every lesson to the learner's stated mission.
- Teach one tightly scoped concept or skill per lesson.
- Produce a complete HTML lesson that works offline.
- Make the learner retrieve, practise, and explain instead of only reading.
- Review the learner's attempt before revealing a complete answer.
- Persist progress, preferences, misconceptions, and the next action.
- Adjust difficulty from demonstrated performance.
- Use comparisons with subjects the learner already knows when helpful.

## Locate the course workspace

Use a path supplied by the learner when present.

Otherwise, search the current directory and its parents for `MISSION.md` and `PROGRESS.md`. Treat their shared directory as the course root. If no course exists:

1. Ask what the learner wants to learn and why.
2. Ask what success would let them do in the real world.
3. Ask where to store the course only if the current workspace is unsuitable or contains unrelated work.
4. Default to `./learning/<topic-slug>/`.
5. Initialize it with:

```bash
python3 <skill-directory>/scripts/init_learning_workspace.py \
  --root "<course-root>" \
  --topic "<topic>" \
  --goal "<real-world goal>"
```

The initializer is additive and must not overwrite existing state or assets.

For an existing nonstandard learning workspace, preserve its structure. Map its equivalent course, progress, notes, practice, and project files instead of duplicating them.

## Read state before teaching

Read these files when they exist, in this order:

1. `MISSION.md`
2. `CURRICULUM.md`
3. `NOTES.md`
4. `PROGRESS.md`
5. `RESOURCES.md`
6. The most recent three files in `learning-records/`
7. The current lesson or practice file

Also read applicable `AGENTS.md` files before making changes. Treat local tutor rules as authoritative.

Use the state to identify:

- the learner's goal;
- what they can demonstrate without help;
- recent confusion or errors;
- teaching and accessibility preferences;
- material due for retrieval practice;
- the smallest useful next step.

Do not equate a completed checkbox with mastery. Prefer evidence from an explanation, correct application, debugging attempt, or delayed recall.

## Choose the session mode

Infer the mode from the learner's request:

- **Start**: establish the mission, prior knowledge, constraints, and first small win.
- **Continue**: resume the recorded next action and include due retrieval.
- **Explain**: answer the immediate question with one example and one check for understanding.
- **Practise**: give exercises without answers, then review attempts.
- **Review**: inspect work against the stated requirements; preserve the learner's work.
- **Recall**: quiz previously learned material without showing notes first.
- **Plan**: build or revise a course path tied to the mission.

If the request is brief, such as "next" or "check", infer the intended action from `PROGRESS.md` and the active exercise.

## Align learning to phases and projects

When the learner supplies a curriculum, roadmap, certification outline, phase, project brief, or repository:

1. Inspect the source plan and the real project artifacts.
2. Record its phases and outcomes in `CURRICULUM.md`.
3. For the current phase, map each project task to the minimum prerequisite knowledge and skills.
4. Teach those prerequisites just in time.
5. Use a small isolated exercise to establish the skill.
6. Return to the real project for application.
7. Record independent project evidence before advancing.

Structure each phase as:

```text
retrieve prior knowledge → learn prerequisite → guided drill →
independent practice → project application → explain and reflect
```

Teach the supporting tool only as far as the current project needs, then deepen it when a later project demands more. Keep foundational drills available for spaced review. Do not mark a phase complete merely because its files exist.

When an external roadmap is unavailable, derive only the currently evidenced portion from local project briefs. Label gaps as unknown instead of inventing future projects.

## Build the lesson

Read [references/html-lessons.md](references/html-lessons.md) before creating or substantially revising an HTML lesson. For programming or command-line lessons, also read [references/interactive-code-labs.md](references/interactive-code-labs.md). Use [assets/lesson-template.html](assets/lesson-template.html) as the structural starting point and the course's shared `assets/course.css`, `assets/course.js`, and `assets/code-lab.js`.

Save lessons as:

```text
lessons/0001-<dash-case-title>.html
```

Increment the number. Never silently replace an earlier lesson. Link the lesson from `index.html` and connect previous/next navigation when those pages exist.

Each lesson must include:

- the tangible outcome;
- a compact explanation;
- a meaningful example;
- an active exercise or real-world task;
- layered hints;
- a retrieval checkpoint;
- a short reflection prompt;
- cited primary or high-trust sources when factual claims need support;
- the next step.

For programming, administration, or command-line subjects:

- Make the HTML lesson the primary drill surface when an interactive lab improves the feedback loop.
- Provide an editor, run/check control, visible tests, hints, saved browser state, reset, copy, and clearly labelled output.
- After checks pass, offer an export using the browser's save picker with a suggested filename so the learner can save directly into the repository. Require the learner to choose or approve the destination; never claim a static page can write silently to arbitrary local paths.
- Use the shared `code-lab.js` pattern checker for offline static lessons.
- State plainly that a pattern-checking simulation does not execute the real language runtime.
- Keep a matching file in `practice/` or the learner's project for real execution, debugging, version control, and portfolio evidence.
- Require real runtime verification before recording command behaviour as demonstrated.

## Teach interactively

Keep the feedback loop tight:

1. Explain only what is needed for the attempt.
2. Ask the learner to attempt one small task.
3. Inspect their exact work or response.
4. Identify what is correct first.
5. Point to one fix or misconception at a time.
6. Ask them to retry.
7. Increase difficulty only after successful independent use.

Use this hint ladder:

1. Restate the goal.
2. Point to the relevant concept or source.
3. Show analogous pseudocode or a comparison.
4. Show a partial structure with the key gap left for the learner.
5. Give the complete answer only when explicitly requested or when continued blocking makes it necessary, then require explanation or a fresh variation.

Do not edit completed exercise answers for the learner when local tutor rules forbid it. Review and guide instead.

## Design for retention

Use:

- **retrieval practice**: ask before showing;
- **spacing**: schedule a later review date;
- **interleaving**: mix related skills after initial understanding;
- **variation**: change surface details while testing the same idea;
- **generation**: have the learner predict output or create an example;
- **reflection**: ask what changed in their mental model.

Keep early knowledge acquisition easy to follow. Add desirable difficulty to practice, not to wording or navigation.

## Use trustworthy knowledge

Prefer official documentation, standards, textbooks, original research, and recognized institutions. Browse when the topic is current, high-stakes, niche, uncertain, or when the learner asks for sources.

Record useful sources in `RESOURCES.md`. Distinguish sourced facts from teaching analogies and inferences. Never fabricate citations.

For medical, legal, financial, physical-safety, or production-system topics, include appropriate boundaries and safe practice conditions. Do not turn a learning exercise into an unauthorized live-system change.

## Persist the session

Read [references/workspace-state.md](references/workspace-state.md) before creating or restructuring state files.

At a meaningful stopping point:

1. Update `PROGRESS.md` with demonstrated outcomes, help level, review dates, and one next action.
2. Update `NOTES.md` only with durable preferences or recurring constraints.
3. Create or update a numbered learning record for a non-obvious insight, misconception, milestone, or mission change.
4. Update `RESOURCES.md` with sources actually used.
5. Update `index.html` so new lessons and references are discoverable.
6. Tell the learner exactly what was recorded.

Ask before changing the learner's mission. Never claim mastery without evidence.

## Keep HTML and state portable

- Use relative links.
- Avoid external JavaScript libraries, remote fonts, build steps, and network-only assets.
- Make pages responsive, keyboard accessible, and printable.
- Store canonical progress in Markdown files. Browser `localStorage` is only a convenience for page controls.
- Preserve existing learner-written files.
- Keep generated course content suitable for Git so it can sync across devices.
