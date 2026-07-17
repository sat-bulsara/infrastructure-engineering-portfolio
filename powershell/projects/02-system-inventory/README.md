# Project 02 - System Inventory

## Mission

Build a useful process inventory using the object pipeline.

## Concepts

Pipeline input, `Where-Object`, `Sort-Object`, `Select-Object`, calculated properties, CSV export.

## Tasks

1. Accept `-Top` (1-100) and `-OutputPath` parameters.
2. Get processes, tolerate inaccessible properties, and sort by working-set memory.
3. Return the requested number of objects with Name, Id, CPUSeconds and MemoryMB.
4. Round numeric values to two decimal places.
5. Export the same objects to CSV while still writing them to the pipeline.

## Acceptance Checks

- `-Top 5` returns no more than five objects.
- Every output item has the four required properties.
- `MemoryMB` is numeric, not text containing `MB`.
- An invalid value such as `-Top 0` is rejected by parameter validation.
- No `Format-Table` appears inside the data-producing script.

## Stretch

Add `-Name` filtering with wildcard support.
