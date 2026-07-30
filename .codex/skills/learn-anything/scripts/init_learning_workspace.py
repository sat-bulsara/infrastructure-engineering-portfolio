#!/usr/bin/env python3
"""Initialize a portable, stateful learning workspace without overwriting files."""

from __future__ import annotations

import argparse
import html
import shutil
from pathlib import Path


DIRECTORIES = ("assets", "learning-records", "lessons", "practice", "reference")
SHARED_ASSETS = ("course.css", "course.js", "code-lab.js")


def write_if_missing(path: Path, content: str) -> str:
    if path.exists():
        return f"kept    {path}"
    path.write_text(content, encoding="utf-8")
    return f"created {path}"


def copy_if_missing(source: Path, destination: Path) -> str:
    if destination.exists():
        return f"kept    {destination}"
    shutil.copy2(source, destination)
    return f"created {destination}"


def mission_markdown(topic: str, goal: str) -> str:
    outcome = goal or f"Use {topic} confidently in a real-world situation."
    return f"""# Learning Mission

## Topic

{topic}

## Why this matters

To be discussed with the learner.

## Real-world outcome

{outcome}

## Constraints

- To be discussed with the learner.

## Completion evidence

- [ ] Complete a realistic task without step-by-step help.
- [ ] Explain the important ideas in the learner's own words.
"""


def notes_markdown() -> str:
    return """# Teaching Notes

## Preferences

- Record useful teaching preferences here.

## Prior knowledge

- Record demonstrated prior knowledge here.

## Constraints

- Record recurring constraints here.
"""


def curriculum_markdown() -> str:
    return """# Course Curriculum

| Phase | Real-world outcome | Required knowledge and skills | Evidence | Status |
| --- | --- | --- | --- | --- |
| 1 | Define the first practical outcome. | Establish after the diagnostic. | A completed task and explanation. | Current |
"""


def progress_markdown() -> str:
    return """# Learning Progress

## Current focus

Establish the learner's starting point.

## Next action

Complete the first diagnostic task.

## Review queue

| Review on | Topic | Prompt |
| --- | --- | --- |

## Session log

| Date | Lesson | Demonstrated independently | Help used | Next |
| --- | --- | --- | --- | --- |
"""


def resources_markdown() -> str:
    return """# Learning Resources

| Resource | Type | Used for | Status |
| --- | --- | --- | --- |
"""


def index_html(topic: str, goal: str) -> str:
    safe_topic = html.escape(topic)
    safe_goal = html.escape(goal or f"Build practical capability in {topic}.")
    return f"""<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="{safe_goal}">
  <title>{safe_topic} learning workspace</title>
  <link rel="stylesheet" href="assets/course.css">
  <script src="assets/course.js" defer></script>
</head>
<body>
  <header class="site-header">
    <div class="shell">
      <p class="eyebrow">Stateful learning workspace</p>
      <h1>{safe_topic}</h1>
      <p class="lede">{safe_goal}</p>
    </div>
  </header>
  <main class="shell lesson-grid">
    <aside class="lesson-meta">
      <h2>Course state</h2>
      <p><a href="MISSION.md">Mission</a></p>
      <p><a href="CURRICULUM.md">Curriculum</a></p>
      <p><a href="PROGRESS.md">Progress</a></p>
      <p><a href="RESOURCES.md">Resources</a></p>
    </aside>
    <article class="lesson-content">
      <section>
        <p class="eyebrow">Continue</p>
        <h2>Current focus</h2>
        <p>Open <a href="PROGRESS.md">PROGRESS.md</a> to see the next learning action.</p>
      </section>
      <section>
        <p class="eyebrow">Lessons</p>
        <h2>Course lessons</h2>
        <ul class="course-list">
          <li><a href="lessons/">Your first lesson will appear here</a></li>
        </ul>
      </section>
      <section>
        <h2>How progress works</h2>
        <p>Interactive page controls can be saved in this browser. Demonstrated learning and the next action are stored in <code>PROGRESS.md</code> so the course can continue across Codex tasks and devices.</p>
      </section>
    </article>
  </main>
</body>
</html>
"""


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Create a stateful learning workspace without overwriting files."
    )
    parser.add_argument("--root", required=True, type=Path, help="Course root directory")
    parser.add_argument("--topic", required=True, help="Subject to learn")
    parser.add_argument("--goal", default="", help="Observable real-world goal")
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    root = args.root.expanduser().resolve()
    skill_assets = Path(__file__).resolve().parent.parent / "assets"
    results: list[str] = []

    root.mkdir(parents=True, exist_ok=True)
    for directory in DIRECTORIES:
        path = root / directory
        path.mkdir(exist_ok=True)
        results.append(f"ready   {path}")

    for asset_name in SHARED_ASSETS:
        results.append(
            copy_if_missing(skill_assets / asset_name, root / "assets" / asset_name)
        )

    state_files = {
        "MISSION.md": mission_markdown(args.topic, args.goal),
        "CURRICULUM.md": curriculum_markdown(),
        "NOTES.md": notes_markdown(),
        "PROGRESS.md": progress_markdown(),
        "RESOURCES.md": resources_markdown(),
        "index.html": index_html(args.topic, args.goal),
    }
    for filename, content in state_files.items():
        results.append(write_if_missing(root / filename, content))

    print("\n".join(results))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
