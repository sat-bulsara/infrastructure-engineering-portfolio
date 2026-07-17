# Project 05 - Log Analyzer

## Mission

Read unreliable input safely and produce a useful incident summary.

## Concepts

File I/O, CSV, JSON, validation, grouping, `try/catch/finally`, error records and logging.

## Input Contract

Create a CSV containing `Timestamp`, `Level`, `Source` and `Message`. Include valid rows plus at least two deliberately bad rows.

## Tasks

1. Validate the file exists and each row has required fields.
2. Parse timestamps and allow only Info, Warning and Error levels.
3. Preserve valid records while reporting rejected rows with reasons.
4. Group valid records by level and source.
5. Export a JSON summary and a rejected-rows CSV.

## Acceptance Checks

- A missing file produces a useful terminating error.
- One corrupt row does not discard valid rows.
- Output files use UTF-8 and are valid when read back.
- The summary contains counts plus the analysis timestamp.
- The script returns a result object suitable for automation.

## Stretch

Add a `-Since` parameter and make the parser accept pipeline input.
