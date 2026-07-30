# Learning Progress

## Current phase

Build 2 — First Windows Server

## Current focus

PowerShell from zero for Build 2 - store the static IP address and substitute variable values inside a double-quoted status message.

## Next action

Read the linked Microsoft explanation of double-quoted strings, complete only Exercise 3 in `practice/00-powershell-from-zero.ps1`, run the workbook, and tell Codex `check` with the output.

## Current evidence

- A Windows Server 2025 installation and initial configuration are documented locally.
- Basic PowerShell syntax exercises have been attempted in the portfolio.
- Project-specific server-administration PowerShell has not yet been demonstrated independently.

## Review queue

| Review on | Topic | Prompt |
| --- | --- | --- |
| Exercise 3 check | Variables | Explain what value `$serverName` currently stores. |
| Exercise 4 | String interpolation | Explain what PowerShell does with `$ipAddress` inside a double-quoted string. |
| After foundations | Pipelines | Explain what moves from the left command to the right command. |

## Session log

| Date | Lesson | Demonstrated independently | Help used | Next |
| --- | --- | --- | --- | --- |
| 2026-07-28 | Course setup | No new mastery claim; the learning path was aligned to the Phase 1 projects. | Curriculum design | Begin Build 2 diagnostic and Lesson 0001. |
| 2026-07-29 | 0001 started | Lesson and exercise created; no learner attempt recorded yet. | Lesson setup | Complete and run TODO 1. |
| 2026-07-29 | 0001 interaction update | No mastery claim; the lesson now includes an offline editor, automated pattern checks, simulated output, and a passing-code export. | Learning-format preference | Complete Exercise 1 in the HTML lab, save it into the repository, then verify it in PowerShell. |
| 2026-07-29 | Foundations reset | Warm-up answers showed that pipelines, `$_`, and structured output were introduced before their foundations were secure. | Full teaching reset requested | Start with commands and strings in the IDE workbook. |
| 2026-07-29 | Quick drill 1 | Correctly changed the quoted string passed to `Write-Output` from `TODO` to `Sat`; real runtime output was not supplied. | Full explanation and example | Store the real project server name in a variable and output its value. |
| 2026-07-29 | Quick drill 2 attempt | Correctly assigned a quoted string to `$serverName` and passed the variable to `Write-Output`; the stored value was `sv01`, which does not exactly match the project server name `SRV01`. | Full explanation and one correction | Correct the stored server name and provide the runtime output. |
| 2026-07-29 | Quick drill 2 corrected | `$serverName` now stores the exact project value `SRV01`, and a local PowerShell run produced the expected output. An independent terminal output was not pasted by the learner. | Full explanation, correction, and runtime assistance | Store the Build 2 IP address and use variable substitution in a status message. |
| 2026-07-30 | Cross-machine setup | No new PowerShell mastery claim. Repository instructions and a continuation guide were added so new Codex chats can locate the saved course state. | Portability setup | Pull the latest commit on the other computer and resume Exercise 3. |
