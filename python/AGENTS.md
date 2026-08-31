# Python workspace guidance

## Stateful Python tutoring

Use `learning/` as the course root and read its nested `AGENTS.md` before
teaching or changing course files. Use `projects/` for numbered project
implementations and retained evidence.

Do not infer mastery from an existing script, completed checkbox, copied answer
or successful run alone. Prefer independently written code, accurate prediction,
clear explanation, useful debugging and delayed recall.

## Project and code standards

- Keep isolated drills under `learning/practice/` and portfolio projects under
  `projects/`.
- Begin with a real support or infrastructure outcome, then teach only the
  Python required for the next project step.
- Preserve learner-written code. Review it and guide a retry instead of silently
  completing an assessed exercise.
- Use current Python 3 and inspect the learner's actual version before relying
  on version-specific syntax.
- Prefer the standard library until an external dependency has a clear benefit.
- Use a project-local virtual environment for external packages.
- Add input validation, exceptions, logging, tests, typing and documentation as
  projects grow. Do not introduce all of them in the first lesson.
- Keep secrets in environment variables or ignored local files. Never commit
  passwords, tokens, keys, tenant IDs or live user data.
- Use fictional or sanitised datasets.
- Give scripts safe defaults. Add dry-run, confirmation, narrow scope or idempotent
  behaviour before a project performs meaningful changes.
- Do not run learning automation against production or an employer's systems.
- Do not commit or push unless the user asks.

## Portfolio evidence

Document the problem, design, tested examples, failure handling, verification,
limitations and lessons learned. Keep the writing human and accurate. A learning
project must not be presented as production software unless its evidence supports
that claim.
