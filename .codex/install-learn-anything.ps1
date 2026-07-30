[CmdletBinding()]
param()

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$source = Join-Path $repoRoot ".codex/skills/learn-anything"

if (-not (Test-Path (Join-Path $source "SKILL.md"))) {
    throw "The repository copy of the learn-anything skill was not found."
}

$codexHome = if ($env:CODEX_HOME) {
    $env:CODEX_HOME
}
else {
    Join-Path $HOME ".codex"
}

$destination = Join-Path $codexHome "skills/learn-anything"
New-Item -ItemType Directory -Force -Path $destination | Out-Null
Copy-Item -Path (Join-Path $source "*") -Destination $destination -Recurse -Force

Write-Host "Installed learn-anything to:"
Write-Host $destination
Write-Host ""
Write-Host "Restart Codex or start a new Codex session before continuing the course."
