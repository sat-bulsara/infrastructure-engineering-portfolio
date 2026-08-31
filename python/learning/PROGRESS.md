# Python Learning Progress

## Current focus

Project 01, step 7: prove the priority function with assertions.

## Next action

In `practice/0002-ticket-input/ticket_input.py`, deliberately change the final
assertion's expected value from `3` to `2`, save and say `done`. The tutor will
run it, then Sat must identify whether the function or the test expectation is
wrong from the traceback.

## Review queue

| Review on | Topic | Prompt |
| --- | --- | --- |
| 2026-08-28 | Variables and values | In your own words, what is the difference between a variable name and the value it refers to? |

## Session log

| Date | Lesson | Demonstrated independently | Help used | Next |
| --- | --- | --- | --- | --- |
| 2026-08-27 | Course design | No Python skill assessed; project path and evidence rules created | Full planning support | Complete practice 0001 |
| 2026-08-27 | Curriculum expansion | No Python skill assessed; path expanded to 24 spiral coding projects with project quizzes and four-project phase gates | Full planning support | Complete practice 0001 |
| 2026-08-27 | Project 01, step 1 | Replaced four values and produced the expected three-line ticket summary | Full explanation of Python types | Complete the changed ticket variation |
| 2026-08-27 | Project 01, step 1 variation | Changed the fictional data and independently produced the expected output | None | Practise `input()` in practice 0002 |
| 2026-08-28 | Project 01, step 2 | Collected requester and issue with `input()` and printed both values | Partial, including output-line and prompt guidance | Add `.strip()` to requester input |
| 2026-08-28 | Project 01, step 3 | Applied `.strip()` to requester input; a controlled run removed surrounding spaces | Full explanation and supplied line | Apply `.strip()` independently to issue input |
| 2026-08-28 | Project 01, step 3 variation | Reused `.strip()` independently on issue input; a controlled run cleaned both values | None | Add `.lower()` to normalise text case |
| 2026-08-28 | Project 01, step 3 normalisation | Chained `.strip()` and `.lower()`; mixed-case issue text printed in lowercase while requester case was preserved | Partial | Create and print a Boolean comparison |
| 2026-08-28 | Project 01, step 4 comparison | Created an equality comparison; controlled matching and non-matching runs returned `True` and `False` | None | Use the Boolean in an `if` block |
| 2026-08-28 | Project 01, step 4 decision | Used an `if` block to route a matching password-reset issue; non-matching input skipped the indented action | None | Add an `else` route |
| 2026-08-28 | Project 01, step 4 fallback | Added and verified both `if` and `else` routes after repairing an `IndentationError` | Hint | Assign a priority through both branches |
| 2026-08-28 | Project 01, step 4 priority | Assigned P2 and P3 through different branches and printed the selected value | Hint | Collect normalised impact and urgency inputs |
| 2026-08-28 | Project 01, step 4 inputs | Independently collected and normalised impact and urgency values | None | Combine two comparisons with `and` |
| 2026-08-28 | Project 01, step 4 Boolean composition | Combined impact and urgency using `and`; high/high returned true and high/low returned false | None | Use `if/elif/else` for P1-P3 |
| 2026-08-28 | Project 01, step 4 ordered rules | Built and verified P1-P3 selection with `if/elif/else`; repaired variable order and final output | Partial | Refactor priority selection into a function |
| 2026-08-29 | Project 01, step 5 function | Refactored priority selection into `choose_priority`; automatic P1-P3 tests passed | Full | Validate impact and urgency values |
| 2026-08-29 | Project 01, step 6 validation | Accepted low/medium/high and stopped safely on unsupported `URGENT` input | Full | Add assertions for priority boundaries |
| 2026-08-31 | Project 01, step 7 assertions | Added three supplied assertions; all passed against the priority function | Full | Diagnose one deliberately failing assertion |
