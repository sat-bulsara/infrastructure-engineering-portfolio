# Build 01 Solutions

Only use this after recording your own symptom, cause, test and proposed fix.

## 01 - Command not found

The command contains a typo: `Get-Proces` should be `Get-Process`.

Useful diagnosis:

```powershell
Get-Command Get-Proces -ErrorAction SilentlyContinue
Get-Command -Noun Process
Get-Help Get-Process
```

One more issue may appear: access to `StartTime` can fail for protected processes. A robust inventory script should handle that possibility, but this challenge is focused on command discovery.

## 02 - Missing module

Check availability before importing:

```powershell
$moduleName = 'Contoso.TrainLab'
$module = Get-Module -ListAvailable -Name $moduleName

if ($module) {
    Import-Module -Name $moduleName
    "Module $moduleName loaded successfully."
}
else {
    Write-Warning "Module $moduleName is not installed."
}
```

This distinguishes discovery (`Get-Module -ListAvailable`) from loading (`Import-Module`) and handles an expected absence without terminating the script.

## Suggested help answers

```powershell
Get-Help Get-Process -Examples
Get-Help Get-ChildItem -Detailed
Get-Help *service*
Get-Help Get-Process -Parameter *
```
