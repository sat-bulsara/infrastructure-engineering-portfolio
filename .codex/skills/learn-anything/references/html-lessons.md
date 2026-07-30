# HTML lesson authoring

Use these rules for every lesson.

## Before writing

1. Read the course mission, notes, progress, and recent learning records.
2. Choose one outcome inside the learner's current reach.
3. Decide what the learner must do, not merely read.
4. Gather high-trust sources when claims require verification.
5. Inspect existing course assets and lesson conventions.

## File and links

- Name the file `lessons/NNNN-<dash-case-title>.html`.
- Set `lang` correctly for the lesson language.
- Link `../assets/course.css` and `../assets/course.js`.
- Use relative links for lessons, practice files, reference pages, and assets.
- Set a useful `<title>`.
- Do not depend on a web server.

## Required page sequence

1. Breadcrumb and course title
2. Lesson number and title
3. Tangible outcome
4. Retrieval warm-up
5. Compact explanation
6. Worked example or demonstration
7. Learner task
8. Layered hints using `<details>`
9. Interactive checkpoint
10. Reflection
11. Sources
12. Previous/next navigation

Use the supplied `assets/lesson-template.html` as the starting structure.

## Scope and readability

- Target one useful win in roughly 10–25 minutes.
- Prefer short paragraphs and descriptive headings.
- Introduce no more than a few new terms at once.
- Define necessary jargon next to first use.
- Use diagrams or tables only when they clarify a relationship.
- Use code blocks only for code the learner should inspect.
- Put editable code in `practice/` when practical.

## Interactive elements

The shared JavaScript supports:

- persisted checkboxes and text fields marked with `data-persist`;
- quiz blocks using `data-quiz-answer`, `.quiz-input`, `.quiz-check`, and `.quiz-feedback`;
- a page-level reset button marked with `data-reset-progress`.
- offline coding labs loaded through `code-lab.js`.

Browser state is supplementary. Record demonstrated learning in `PROGRESS.md`.

For programming and command-line lessons, read `interactive-code-labs.md` and prefer an in-page lab when it materially shortens the feedback loop.

Example:

```html
<section class="card quiz" data-quiz-answer="pipeline">
  <h2>Checkpoint</h2>
  <label for="q1">What passes objects between PowerShell commands?</label>
  <input id="q1" class="quiz-input" data-persist autocomplete="off">
  <button type="button" class="quiz-check">Check answer</button>
  <p class="quiz-feedback" aria-live="polite"></p>
</section>
```

Accept a short list of equivalent answers by separating them with `|` in `data-quiz-answer`.

## Accessibility

- Use semantic landmarks: `header`, `main`, `nav`, `section`, and `footer`.
- Keep heading levels in order.
- Associate every input with a label.
- Provide meaningful image alternative text.
- Do not communicate correctness by colour alone.
- Ensure controls are usable with a keyboard.
- Keep text contrast high and line lengths comfortable.
- Preserve visible focus styles.

## Printing and offline use

- Avoid remote fonts, frameworks, analytics, and CDNs.
- Keep essential content visible without JavaScript.
- Hide interactive buttons when printing.
- Avoid splitting examples and tasks across printed pages when possible.

## Teaching integrity

- Put questions before answers.
- Use hints that become progressively more explicit.
- Avoid a complete solution in the first visible example when it would solve the learner's task unchanged.
- Require a fresh application or explanation after revealing an answer.
- Clearly label analogies as analogies.
- Cite sources close to claims and list them in the Sources section.
