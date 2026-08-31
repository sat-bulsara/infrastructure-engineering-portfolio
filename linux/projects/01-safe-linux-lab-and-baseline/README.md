# Project 01: Safe Linux Lab and Baseline

## Operational problem

An administrator should not make changes until they know which system, user and
scope they are operating in. This project creates a disposable Linux lab and a
small public-safe baseline that later projects can compare against.

## Outcome

Identify the Linux distribution, user context, filesystem location and basic
host state, then record a sanitised read-only baseline using commands Sat can
explain.

## Progressive build

1. Confirm the distribution and release.
2. Confirm the current user, UID, groups and privilege boundary.
3. Explain the working directory, home directory and root directory.
4. Inspect kernel, CPU, memory and storage using read-only commands.
5. Answer one command question using `--help` or a man page.
6. Save a narrow, sanitised baseline report in this project.
7. Turn selected read-only checks into a first small Bash script with variables,
   comments and understandable output.
8. Repeat the baseline on a changed lab with reduced help.
9. Complete the Project 01 no-notes quiz and repair every missed item.

## Safety and scope

- Use a disposable, authorised Linux VM or equivalent lab.
- No privileged changes are required for the baseline.
- Do not publish usernames, hostnames, public IPs, keys or unrelated history.
- A snapshot is required before later system-changing projects.

## Completion evidence

- [ ] Distribution and release explained
- [ ] User and privilege boundary explained
- [ ] Linux path model explained and demonstrated
- [ ] Sanitised baseline report reviewed
- [ ] One local documentation lookup demonstrated
- [ ] Changed-environment baseline completed with less help
- [ ] First Bash baseline script explained and verified
- [ ] Project quiz completed, missed items repaired and coding check rerun

The current learning action remains in
[`../../learning/PROGRESS.md`](../../learning/PROGRESS.md).
