# Linux workspace guidance

## Stateful Linux tutoring

Use `learning/` as the course root and read its nested `AGENTS.md` before
teaching or changing course files. Use `projects/` for numbered project
implementations and retained evidence.

Do not infer mastery from copied commands, a successful prompt return or a
completed checklist. Prefer accurate prediction, independent execution,
read-only verification, troubleshooting and delayed recall.

## Lab and project standards

- Keep isolated drills under `learning/practice/` and portfolio projects under
  `projects/`.
- Use a disposable, authorised Ubuntu VM or equivalent lab for privileged,
  service, storage, firewall and networking work.
- Confirm the host, distribution, current user, working directory and target
  before changing anything.
- Begin with read-only discovery and establish a known healthy state.
- Explain every use of `sudo`; use the narrowest command and return to an
  unprivileged shell.
- Never use `curl | sh`, unreviewed internet scripts, destructive wildcards or
  live production targets.
- Plan a snapshot, backup or rollback before risky changes.
- Verify after every change and add controlled break/fix only after health is
  known.
- Keep credentials, SSH private keys, public IPs, usernames and identifying host
  details out of Git and public screenshots.
- Do not commit or push unless the user asks.

## Portfolio evidence

Document the operational reason, starting state, commands, expected effects,
read-only verification, controlled fault, recovery, security considerations,
limitations and lessons learned. Do not describe a single-host learning lab as a
production enterprise deployment.
