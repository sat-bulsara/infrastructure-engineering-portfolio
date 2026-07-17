# Build 01 - PowerShell Foundations

## Outcome

By the end of this build, you will be able to inspect your PowerShell environment, use the built-in help system, explain execution policy, identify commands by Verb-Noun naming, and create a safe PowerShell profile.

## Before the Train

Run these once while online:

```powershell
winget install --id Microsoft.PowerShell --source winget
winget install --id Microsoft.VisualStudioCode --source winget
code --install-extension ms-vscode.PowerShell
Update-Help -Force -ErrorAction Continue
```

`Update-Help` may need an elevated PowerShell session. The labs still work if some help files cannot be downloaded.

## Sessions

Complete these in order. Each should take about 30 minutes.

### Session 1 - Environment and Discovery

- [ ] Work through [01-environment-and-help.md](exercises/01-environment-and-help.md).
- [ ] Save the requested evidence in `evidence/session-01.txt`.
- [ ] Record the session in `../../PROGRESS.md`.

### Session 2 - Profile

- [ ] Work through [02-profile.md](exercises/02-profile.md).
- [ ] Create and test your profile safely.
- [ ] Record what changed.

### Session 3 - Break and Fix

- [ ] Fix both scripts in the `broken/` folder.
- [ ] Write the symptom, cause, test and fix before reading `solutions/README.md`.
- [ ] Run the verification commands.

## Completion Test

Without searching online, explain:

1. The difference between Windows PowerShell and PowerShell 7.
2. What `Get-Command`, `Get-Help` and `Get-Member` reveal.
3. Why execution policy is not a security boundary.
4. Where `$PROFILE` points and when it loads.
5. How you would diagnose a command that cannot be found.

When you can answer all five and both broken scripts work, mark Build 01 complete in `../../PROGRESS.md`.
