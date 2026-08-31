# Python Infrastructure Curriculum

| Phase | Real-world outcome | Required knowledge and skills | Evidence | Status |
| --- | --- | --- | --- | --- |
| A: Coding foundations | Build small support tools from clear rules | interpreter, values, variables, strings, input, conditions, collections, loops and functions | Projects 01-04 plus Quiz Gate A | Current |
| B: Files and structured data | Read, validate and change operational files safely | `pathlib`, text, CSV, JSON, exceptions, comprehensions and dry-run behaviour | Projects 05-08 plus Quiz Gate B | Planned |
| C: Reliability and maintainability | Turn scripts into testable command-line tools | hashing, arguments, exit codes, modules, virtual environments, pytest, typing, logging and configuration | Projects 09-12 plus Quiz Gate C | Planned |
| D: Operational automation | Work with services, APIs and Linux data | HTTP, timeouts, pagination, structured data, host information, dates and safe workflow plans | Projects 13-16 plus Quiz Gate D | Planned |
| E: Infrastructure integration | Store, schedule, secure and query operational state | SQLite, report generation, environment configuration, secrets boundaries and Azure inventory | Projects 17-20 plus Quiz Gate E | Planned |
| F: Software engineering capstone | Build a coherent, extensible infrastructure toolkit | comparison, classes, interfaces, packaging, tests, CI concepts, documentation and troubleshooting | Projects 21-24 plus final cumulative gate | Planned |

## Numbered Project Roadmap

| No. | Project | New coding focus | Required repetition | Status |
| --- | --- | --- | --- | --- |
| 01 | Service Desk Ticket Triage | values, types, variables, formatted output, input, conditions and first functions | baseline project | Current |
| 02 | Asset Inventory Reporter | lists, dictionaries, loops, filtering and sorting | variables, strings, conditions and functions | Planned |
| 03 | Fictional Password Rule Checker | string methods, Boolean composition and reusable rule functions | input, conditions, loops and summaries | Planned |
| 04 | IPv4 Address and Subnet Helper | standard-library modules, `ipaddress`, validation and exceptions | functions, collections, conditions and formatted output | Planned |
| Gate A | Foundations quiz and mini-build | cumulative prediction, debugging and coding | Projects 01-04 without notes | Planned |
| 05 | Support Log Analyser | `pathlib`, text files, counting and error handling | loops, dictionaries, functions and conditions | Planned |
| 06 | CSV Asset Data Cleaner | `csv`, row validation, normalisation and error reports | files, collections, functions and exceptions | Planned |
| 07 | JSON Configuration Validator | `json`, nested data and composed validators | files, dictionaries, conditions, exceptions and tests with `assert` | Planned |
| 08 | Safe File Organiser | paths, file metadata, planned actions and dry-run design | collections, loops, files, validation and summaries | Planned |
| Gate B | Files and data quiz and mini-build | cumulative parsing, debugging and coding | Projects 01-08 with changed files | Planned |
| 09 | Backup Integrity Verifier | hashing, checksums and comparison reports | paths, binary files, loops, functions and exceptions | Planned |
| 10 | Command-Line Report Tool | `argparse`, command-line inputs and exit codes | validators, files, functions and safe errors | Planned |
| 11 | Tested Support Utilities Package | modules, virtual environments, pytest and type hints | refactor selected logic from Projects 01-10 | Planned |
| 12 | Logging and Configuration System | `logging`, configuration, environment variables and diagnostic context | modules, arguments, exceptions, tests and typing | Planned |
| Gate C | Reliability quiz and mini-build | cumulative failing tests, tracebacks and refactoring | Projects 01-12 without copied structures | Planned |
| 13 | Service Availability Monitor | HTTP requests, timeouts, status interpretation and retry boundaries | CLI, configuration, logging, exceptions and tests | Planned |
| 14 | Paginated API Inventory Client | JSON APIs, pagination, generators or iterators and rate-limit awareness | HTTP, loops, validation, configuration and logging | Planned |
| 15 | Linux Host Health Reporter | platform and filesystem data, subprocess boundaries and exit status | CLI, structured output, exceptions, logging and tests | Planned |
| 16 | Joiner Data Workflow | dates, rule composition, task plans and dry-run output | CSV or JSON, validation, functions, tests and logging | Planned |
| Gate D | Operations quiz and mini-build | cumulative API, Linux and workflow debugging | Projects 01-16 in a changed scenario | Planned |
| 17 | SQLite Asset Inventory | relational data, SQL parameters, transactions and repository functions | validation, dataclasses or dictionaries, tests and logging | Planned |
| 18 | Scheduled Report Generator | date ranges, report composition and repeatable entry points | database or files, CLI, configuration, logging and tests | Planned |
| 19 | Secure Configuration Loader | environment variables, redaction, defaults and secret boundaries | configuration, exceptions, typing, logging and tests | Planned |
| 20 | Azure Inventory Reporter | authorised SDK or CLI integration, pagination and public-safe output | APIs, configuration, redaction, structured data and tests | Planned |
| Gate E | Integration quiz and mini-build | cumulative data, configuration and security reasoning | Projects 01-20 with sanitised lab inputs | Planned |
| 21 | Configuration Drift and Compliance Checker | sets, mappings, diff models and compliance results | files, database or API data, CLI, tests and logging | Planned |
| 22 | Extensible Operations Toolkit | classes, composition and pluggable checks where justified | modules, types, configuration, error handling and tests | Planned |
| 23 | Packaged CLI and Quality Pipeline | `pyproject.toml`, packaging, linting concepts, test automation and release checks | the complete engineering ladder | Planned |
| 24 | Infrastructure Automation Capstone | independent design, implementation, verification and troubleshooting | select and integrate skills from Projects 01-23 | Planned |
| Final | Cumulative coding assessment | unseen requirements, debugging, explanation and transfer | independent build plus repaired quiz gaps | Planned |

Projects 13-24 remain adjustable. Their precise integrations will be confirmed
when earlier project evidence shows Sat's pace, interests and available labs.

## Spiral Repetition Rule

From Project 03 onward, every brief must name at least two earlier skills that
will be reused. At least one repeated skill must be completed with less tutor
support than it received previously. Every fourth project ends a phase and is
followed by a cumulative quiz and mini-build.

## Project Learning Pattern

| Project task | Learn first | Practice | Project evidence |
| --- | --- | --- | --- |
| Understand the problem | Inputs, output and constraints | Predict examples and edge cases | Sat explains the required behaviour |
| Build the smallest useful version | One new Python concept | Guided gap and immediate run | Working output from fictional data |
| Make it reliable | Validation, exceptions or tests | Deliberate invalid input | Clear failure and recovery behaviour |
| Refactor it | Functions, modules or types when justified | Changed requirement | Cleaner code with unchanged verified behaviour |
| Troubleshoot it | Traceback and evidence reading | Controlled bug or failing test | Diagnosis, fix and retest |
| Transfer it | Reuse an earlier concept | Independent project task | Correct implementation with little or no help |

## Fluency Cycle

| Pass | Tutor support | Learner challenge | Move forward when |
| --- | --- | --- | --- |
| Guided | Full or Partial | Complete, run and explain one new pattern | The result works and the purpose is clear |
| Variation | Hint | Adapt different data or a changed rule | Sat changes the logic rather than copying |
| Independent | None | Work from requirements and tests | The code is correct and verified |
| Break/fix | Symptoms or failing test | Diagnose and repair | Sat explains evidence, cause, fix and retest |
| Transfer | None | Reuse the skill in a later project | Sat selects the approach without prompting |

Important skills should be revisited near the next session, after roughly one
week and after roughly one month, adjusted from demonstrated recall.

## Project 01 Learning Map

| Project step | Learn first | Practice | Evidence |
| --- | --- | --- | --- |
| Describe one ticket | Values, variables and basic types | Complete a static ticket summary | Correct output and type explanation |
| Collect ticket details | `input()` and returned strings | Ask for fictional requester and issue | Exact interactive output |
| Normalise categories | String methods | Change case and whitespace | Predict and verify normalised values |
| Assign a priority | Comparisons, booleans and `if` | Apply simple impact and urgency rules | Changed scenario without a supplied answer |
| Reuse the logic | Functions, parameters and return values | Move priority logic into a function | Multiple verified examples |
| Reject bad input | Validation and clear errors | Test unsupported values | Safe and understandable failure |
| Prove behaviour | Assertions, then introductory pytest | Test boundaries and one deliberate failure | Passing tests and explained failure output |
