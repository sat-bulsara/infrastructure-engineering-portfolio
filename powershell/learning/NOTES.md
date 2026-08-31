# PowerShell Teaching Notes

## Preferences

- Teach one small action at a time.
- Explain new syntax before asking Sat to use it.
- Compare PowerShell with Python or JavaScript when useful.
- Use short editable scripts in the IDE or Codex file panel.
- Avoid long HTML lessons as the main teaching surface.
- Link one focused official web source for each new concept.
- Let Sat attempt the code before showing a complete answer.
- Use repetition, changed scenarios and short practical quizzes.
- Review exact runtime output, not just the saved file.

## Prior exposure

- Variables, strings, numbers and `Read-Host`.
- Conditions and comparison operators.
- Arrays and `foreach` loops.
- Hashtables and `PSCustomObject`.
- `Where-Object`, `Sort-Object` and `Select-Object`.
- Introductory functions, parameters and validation attributes.

These topics were completed in guided exercises. Delayed independent recall has
not yet been verified, so the syntax gym is the starting baseline.

## Known comparisons

- Python dictionaries and JavaScript objects help explain PowerShell hashtables
  and custom objects.
- Python list comprehensions and JavaScript array methods help explain pipeline
  filtering and sorting.
- Python `input()` and JavaScript prompts help explain `Read-Host`.
- PowerShell passes objects through pipelines, not merely strings.

## Constraints

- Main runtime is the spare Windows laptop.
- Some practice may be completed offline while travelling.
- Windows-only modules may require Windows PowerShell 5.1 even when general
  scripting uses PowerShell 7.
- Administrative, Active Directory and cloud work must use authorised labs.
- Use UK English and no em dashes in course documentation.
