# Project 01 - Command Discovery

## Mission

Create an environment report without searching the web. Learn to discover commands and inspect the objects they return.

## Concepts

`Get-Command`, `Get-Help`, `Get-Member`, properties, `PSCustomObject`, `Export-Csv`.

## Tasks

1. Run every discovery command in `starter.ps1` one at a time.
2. Replace each TODO using PowerShell's help system.
3. Create one object containing hostname, username, PowerShell version, edition, OS and current execution policy.
4. Display the object and export it to `output/environment.csv`.
5. Add comment-based help with a synopsis and example.

## Acceptance Checks

- Running the script creates the output directory if it is missing.
- The CSV contains exactly one row and all six required fields.
- The script works in PowerShell 7 without administrator rights.
- Re-running it replaces the report without prompting.

## Stretch

Add a `-Path` parameter and validate that its parent directory is accessible.
