# Project 01 Ubuntu lab established

- Date: 2026-09-07
- Status: Active
- Context: Sat created a new disposable Ubuntu Server ARM64 virtual machine in
  VMware Fusion after the earlier VM files were unavailable.
- Evidence: Sat logged in with an unprivileged account, predicted that
  `cat /etc/os-release` would read the operating-system version without changing
  the system and ran it successfully. Output identified Ubuntu 26.04.1 LTS,
  version ID 26.04 and codename resolute.
- Help: Full support for VM setup and the complete discovery command. Sat's
  read-only prediction was correct.
- Later evidence: Sat identified `PRETTY_NAME` as the human-readable field and
  `ID` as the machine-friendly distribution field after full correction. This
  completes the guided checkpoint but is not independent recall.
- Not yet demonstrated: Independent command selection or delayed recall of the
  distribution fields.
- Next action: Predict what `whoami` targets, what it will report in the current
  SSH session and whether it changes system state.
- Revisit: Near the next session, 2026-09-14 and 2026-10-07.
