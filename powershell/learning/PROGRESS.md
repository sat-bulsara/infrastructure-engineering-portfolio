# PowerShell Learning Progress

## Current focus

Readiness baseline, Drill 01: retrieve variable assignment from memory before
resuming the 24-project course.

## Next action

On the Windows learning laptop, open `../practice/syntax-gym.ps1` and complete
only Drill 01 so `$serverName` stores `CLIENT01`. Before running it, predict
whether Drill 01 will show `PASS` or `RETRY`. Then run:

```powershell
pwsh -NoProfile -File ".\practice\syntax-gym.ps1"
```

Paste the exact Drill 01 result into the PowerShell tutor. Ignore the remaining
`RETRY` results for now because their TODOs have not been attempted.

## Current evidence

- The guided workbook contains completed examples for variables, conditions,
  arrays, loops, hashtables, custom objects, pipelines and functions.
- Existing starter projects cover command discovery through module design.
- The ten-item syntax gym remains unattempted, so independent delayed recall is
  not yet established.
- The Phase 1 Windows learning companion has separate project-specific state for
  the JML lab. Its current infrastructure action is not replaced by this language
  baseline.

## Review queue

| Review on | Topic | Prompt |
| --- | --- | --- |
| 2026-08-29 | Variables and values | What is the difference between `$serverName` and the value stored in it? |
| 2026-09-04 | Objects and pipelines | What moves through a normal PowerShell pipeline? |
| 2026-09-28 | Functions | Why should a reusable function return an object instead of formatted text? |

## Session log

| Date | Lesson | Demonstrated independently | Help used | Next |
| --- | --- | --- | --- | --- |
| 2026-08-28 | Tutor consolidation | No new PowerShell skill assessed. Existing practice, projects and Phase 1 course state were mapped into one 24-project language pathway. | Full course design | Complete syntax gym Drill 01 |
