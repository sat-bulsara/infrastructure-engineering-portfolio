# Project 03 - Health Checker

## Mission

Turn raw system information into clear health states using variables, conditions and loops.

## Concepts

Arrays, hashtables, `if`, `switch`, loops, comparison operators and exit codes.

## Tasks

1. Accept warning and critical free-space percentages as parameters.
2. Inspect every filesystem drive returned by `Get-PSDrive`.
3. Calculate capacity, free space and free percentage.
4. Assign `Healthy`, `Warning` or `Critical` using your thresholds.
5. Return one structured object per drive and a final overall status.

## Acceptance Checks

- Critical threshold must be lower than warning threshold; invalid combinations fail clearly.
- Division by zero is handled.
- Output contains Drive, CapacityGB, FreeGB, FreePercent and Status.
- The worst drive state determines overall status.
- Logic is separated from formatting.

## Stretch

Add `-AsJson` without duplicating the health-check logic.
