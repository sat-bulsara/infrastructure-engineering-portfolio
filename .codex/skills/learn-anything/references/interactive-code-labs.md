# Interactive code labs

Use an offline code lab for short syntax, prediction, correction, or object-shaping drills.

## Required experience

- Put the task beside the editor.
- Start with incomplete learner-editable code.
- Provide one primary **Run checks** button.
- Show each acceptance check as pass or retry.
- Show clearly labelled simulated output only after all checks pass.
- Save editor content in browser storage.
- Include **Copy code** and **Reset** controls.
- Include **Save to repo** after the checks pass.
- Support `Ctrl+Enter` and `Cmd+Enter` to run checks.
- Keep layered hints outside the editor.

## Runtime boundary

A static HTML page cannot safely execute arbitrary PowerShell, Python, shell, or infrastructure commands on the learner's machine.

- Describe pattern checking as a simulation.
- Never label simulated results as real execution.
- Never emulate destructive or security-sensitive effects.
- Keep real code in a matching `practice/` or project file.
- Require the learner to run that file in the actual runtime before recording behavioural evidence.
- Use the browser save picker with a suggested filename. The learner must explicitly approve the destination. If the browser lacks the File System Access API, download the file and explain that it must be moved into the repository.

For browser-native HTML, CSS, and JavaScript exercises, real in-page execution can be appropriate when isolated from external data and dangerous APIs. Keep the result contained within the lesson.

## Shared structure

Load `../assets/code-lab.js`, then use:

```html
<section class="code-lab" data-lab-id="unique-id">
  <div class="code-lab-toolbar">
    <strong>Exercise title</strong>
    <span class="lab-status" aria-live="polite">Not run</span>
  </div>
  <label for="editor-id">Code editor</label>
  <textarea id="editor-id" class="code-editor" spellcheck="false">STARTER CODE</textarea>
  <div class="code-lab-actions">
    <button type="button" class="code-run">Run checks</button>
    <button type="button" class="code-export" disabled>Save to repo</button>
    <button type="button" class="code-copy">Copy code</button>
    <button type="button" class="code-reset">Reset</button>
  </div>
  <ul class="code-tests" aria-live="polite"></ul>
  <pre class="code-output" aria-live="polite">Run checks to see simulated output.</pre>
  <script type="application/json" class="code-lab-config">
    {
      "tests": [
        {"label": "Use the target command", "pattern": "\\bGet-Command\\b"},
        {"label": "Remove the placeholder", "notPattern": "\\bTODO\\b"}
      ],
      "exportFileName": "01-exercise.ps1",
      "autoExport": true,
      "successOutput": "Clearly labelled simulated output"
    }
  </script>
</section>
```

Patterns are JavaScript regular-expression strings. Keep checks flexible enough to accept harmless formatting and quoting differences. Test required concepts, not one exact solution.

## Feedback

- Make check labels explain the requirement without revealing the completed code.
- On failure, direct the learner to the first unmet requirement.
- On success, require explanation or real runtime verification.
- Do not use a passing simulator check as mastery evidence.
