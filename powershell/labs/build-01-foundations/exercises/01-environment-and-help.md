# Session 1 - Environment and Help

Timebox: 30 minutes. Work offline and type every command yourself.

## 1. Inspect the environment (5 minutes)

Run:

```powershell
$PSVersionTable
$Host
Get-ExecutionPolicy -List
```

Write down the PowerShell edition, version, operating system and execution policies.

## 2. Discover commands (10 minutes)

Find commands without using a web search:

```powershell
Get-Command -Verb Get -Noun *Process*
Get-Command -CommandType Cmdlet | Select-Object -First 10
Get-Verb
```

Answer:

1. Why do PowerShell commands use Verb-Noun names?
2. Which approved verb means to create a new resource?
3. What is the difference between a cmdlet, function and alias?

## 3. Use help (10 minutes)

Use only `Get-Help` to discover how to:

- Show examples for `Get-Process`.
- Display detailed help for `Get-ChildItem`.
- Find commands related to services.
- Identify which `Get-Process` parameters accept pipeline input.

Write the four commands you used before checking any answer.

## 4. Capture evidence (5 minutes)

From the `build-01-foundations` directory, run:

```powershell
New-Item -ItemType Directory -Path evidence -Force | Out-Null
@(
    "Date: $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
    "PowerShell: $($PSVersionTable.PSVersion)"
    "Edition: $($PSVersionTable.PSEdition)"
    "OS: $($PSVersionTable.OS)"
    "Policy: $(Get-ExecutionPolicy)"
) | Set-Content -Path evidence/session-01.txt
```

Read the file back with `Get-Content`. Add one sentence describing what you learned.
