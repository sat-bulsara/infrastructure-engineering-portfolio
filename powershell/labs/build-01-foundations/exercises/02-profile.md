# Session 2 - Build a Safe Profile

Timebox: 30 minutes.

## 1. Inspect before changing anything

```powershell
$PROFILE | Format-List * -Force
Test-Path $PROFILE
```

If the profile already exists, back it up:

```powershell
Copy-Item $PROFILE "$PROFILE.backup-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
```

## 2. Create the profile file

```powershell
New-Item -ItemType Directory -Path (Split-Path $PROFILE) -Force | Out-Null
New-Item -ItemType File -Path $PROFILE -Force | Out-Null
code $PROFILE
```

Add this small, portable profile:

```powershell
Set-Alias -Name ll -Value Get-ChildItem

function Get-MyPowerShellInfo {
    [PSCustomObject]@{
        Version = $PSVersionTable.PSVersion
        Edition = $PSVersionTable.PSEdition
        Host    = $Host.Name
        Profile = $PROFILE
    }
}
```

## 3. Test without restarting

Dot-source the profile, then test both additions:

```powershell
. $PROFILE
Get-Alias ll
Get-MyPowerShellInfo
```

## 4. Explain it

Write answers in your progress log:

1. What does dot-sourcing do?
2. Why is a function clearer than a complex alias?
3. What would happen if the profile contained a syntax error?

Do not put passwords, tokens, machine-specific secrets or destructive commands in a profile.
