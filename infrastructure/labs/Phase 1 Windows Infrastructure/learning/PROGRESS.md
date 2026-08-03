# Learning Progress

## Current phase

Project A - Joiner, Mover, Leaver Lifecycle planning and discovery

## Current focus

Establish the current Active Directory scope with one read-only query before designing or changing the JML lifecycle.

## Next action

On the separate Windows Server lab, open Windows PowerShell as the standard domain account, run the recorded `Get-ADDomain` discovery query, and return the exact output to Codex for review.

## Current evidence

- A Windows Server 2025 installation and initial configuration are documented locally.
- Basic PowerShell syntax exercises have been attempted in the portfolio.
- Project-specific server-administration PowerShell has not yet been demonstrated independently.
- Historical Build 3 screenshots show an `ad.anudia.co.uk` domain on `SRV01`, departmental OUs and groups, membership audits, AD health output, and earlier mover/removal exercises.
- The remote lab's current state has not yet been established and no Project A infrastructure or cloud change is verified.

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
| 2026-07-30 | Tutor replication | No new PowerShell mastery claim. The reusable tutor skill and cross-platform installers were packaged in the repository for the train laptop. | Skill packaging | Install the skill on the other computer, restart Codex, and resume Exercise 3. |
| 2026-08-02 | Project A planning | No infrastructure change or new mastery claim. Build 3 evidence was inspected and a phased JML plan was created with local, workstation, and cloud safety gates. | Planning and repository review | Run one read-only AD domain scope query on the Windows lab and return the exact output. |
