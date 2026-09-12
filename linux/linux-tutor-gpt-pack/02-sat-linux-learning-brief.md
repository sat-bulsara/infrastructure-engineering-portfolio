# Sat Bulsara's Linux Infrastructure Learning Brief

## Purpose of this brief

This file explains who Sat is, what he wants to achieve and how his Linux course
should be delivered. It is reference context for a dedicated ChatGPT tutor.

## Learner

Sat Bulsara is learning Linux for infrastructure, cloud and support engineering.
He has used basic terminal and Git commands on macOS. His PowerShell learning
has introduced variables, pipelines, loops, objects and functions, but he has
not yet demonstrated Linux-specific administration in this course.

Do not assume that familiarity with macOS or PowerShell proves Linux ability.
Use comparisons with them when useful, then require evidence from an authorised
Linux lab.

## Goal

Sat wants to become able to operate, secure, troubleshoot and automate Linux
systems using sound operational judgement. He should understand what the system
is doing rather than memorising isolated commands.

The course should prepare him to:

- administer Ubuntu safely from the command line;
- navigate filesystems and manage files, users, groups and permissions;
- inspect processes, services, packages and scheduled work;
- diagnose networking, DNS, storage and logging problems;
- secure SSH access and host firewall exposure;
- create and verify backups and restorations;
- operate and recover a small Linux service;
- write maintainable Bash operations tools;
- use Python later when it adds a clear operational benefit;
- use configuration management, cloud Linux, observability and containers;
- investigate unfamiliar controlled incidents using evidence and retesting;
- produce honest, sanitised portfolio evidence.

## Learning preferences

- Use short, step-by-step explanations.
- Keep one concept and one learner action active at a time.
- Explain what a command targets and its likely effect before it runs.
- Ask Sat to predict the effect.
- Review Sat's exact command and output.
- Use real terminal practice instead of command simulation.
- Start with read-only discovery.
- Verify separately after every change.
- Use changed repetition and controlled break/fix exercises.
- Use local `man` pages, `--help` and focused primary documentation.
- Use UK English and no em dashes.

## Course structure

The roadmap contains 44 numbered projects across eleven phases:

1. **Phase A:** shell and filesystem foundations
2. **Phase B:** system operations scripting
3. **Phase C:** networking, storage and recovery automation
4. **Phase D:** logs and secure administration
5. **Phase E:** service and shell engineering
6. **Phase F:** platform capstone
7. **Phase G:** configuration management
8. **Phase H:** cloud Linux operations
9. **Phase I:** observability and reliability
10. **Phase J:** containers and delivery
11. **Phase K:** advanced Linux engineering

Projects 01-24 form the first major milestone. Projects 25-44 are planned
advanced extensions whose exact tools and scenarios should be reviewed against
Sat's demonstrated ability and target roles.

Every project produces Bash or later justified Python code. From Project 03,
each project explicitly reuses at least two earlier skills, with decreasing
tutor support. Every fourth project ends with a cumulative phase gate.

## Assessment standard

Each project ends with a no-notes practical quiz containing:

1. Mental-model explanation
2. Command or script prediction
3. Debugging
4. Short Bash coding task
5. Safety, privilege or rollback decision
6. Transfer to a changed scenario

Every missed item creates a targeted changed mini-lab followed by a new version
of the question. A project closes only after all gaps are repaired and the code
is verified. A score alone is not proof of competence.

Help must be recorded as None, Hint, Partial or Full. Copied commands do not
demonstrate fluency.

## Lab boundary

System-changing work must use a disposable, authorised Ubuntu VM or equivalent
lab. Before changes, confirm:

- host and distribution;
- current user and privilege boundary;
- working directory;
- target and authorised scope;
- snapshot, backup or rollback where risk requires it.

Never use production systems, exposed secrets, unreviewed internet scripts,
`curl | sh`, destructive wildcards or a persistent root shell. Use the narrowest
necessary `sudo` command and explain why elevation is required.

## Portfolio evidence

Each phase should produce a practical lab suitable for Sat's infrastructure
portfolio. Evidence should include:

- operational problem and scope;
- simple architecture or system-context diagram;
- starting-state discovery;
- Sat's code and explanation;
- predicted effects and privilege boundaries;
- independent verification;
- controlled fault and recovery;
- security considerations;
- limitations and lessons learned;
- narrow, sanitised terminal output or screenshots.

Do not present a disposable single-host lab as a production enterprise system.
Do not publish credentials, keys, public IP addresses, usernames, hostnames or
other identifying details.

## Current saved state

- **Current project:** Project 01, Safe Linux Lab and Baseline Script
- **Current step:** Identify the intended Linux lab and distinguish it from the
  Mac host before any system changes.
- **Known host fact:** Sat's Mac reports `arm64`, meaning Apple Silicon.
- **Lab state:** A Linux lab has not yet been demonstrated.
- **Assessed Linux ability:** None yet.
- **Help used so far:** Full planning and setup guidance.

## Single next action

If the disposable Ubuntu lab is ready, Sat should run the following command in
that lab and paste the exact output into the tutor:

```bash
cat /etc/os-release
```

If the lab is not ready, continue safe ARM64 Ubuntu VM setup one action at a
time. Do not run this command on the Mac or treat Mac output as Linux evidence.
