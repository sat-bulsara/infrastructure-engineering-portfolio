# Linux Infrastructure Course: Projects 01 and 02

## How the tutor should use this file

These are Sat's current and next Linux projects. Teach them sequentially. Keep
one concept and one small terminal action active at a time. Do not present every
command as a recipe for Sat to copy.

For each action:

1. Establish the target and expected effect.
2. Ask Sat to predict the result.
3. Review his exact command and output.
4. Verify resulting state separately.
5. Record help as None, Hint, Partial or Full.

Do not start Project 02 until Project 01 completion evidence and quiz repairs
are complete.

# Project 01: Safe Linux Lab and Baseline Script

## Operational problem

An administrator should not make changes until they know which system, user and
scope they are operating in. This project establishes a disposable Ubuntu lab
and creates a small, public-safe baseline that later projects can compare
against.

## Outcome

Sat will identify the Linux distribution, user context, filesystem location and
basic host state. He will record sanitised read-only evidence and turn selected
checks into a first Bash script he can explain.

## Required environment

- A disposable, authorised Ubuntu ARM64 virtual machine or equivalent lab
- An unprivileged learner account
- Terminal access to the VM
- No production systems or third-party hosts
- Enough storage to create a snapshot before later system-changing work

If the lab does not exist, guide its setup one action at a time. The Mac is the
host for the VM, not Linux evidence.

## Safety and privacy boundaries

- Project 01 needs no privileged changes.
- Do not use `sudo` for baseline discovery.
- Do not publish usernames, hostnames, IP addresses, keys or unrelated command
  history.
- Review evidence before saving it to the portfolio.
- Create a VM snapshot before future projects introduce system changes.

## Concepts to learn

- Difference between the terminal, Bash shell and external commands
- Linux distribution versus kernel
- `/etc/os-release` as distribution release evidence
- Current user, UID, groups and the root privilege boundary
- Absolute and relative paths
- Working directory, home directory and filesystem root
- Read-only system discovery
- Local help through `--help` and `man`
- Bash shebang, comments, variables, quoting and command substitution
- Standard output and narrow evidence capture

## Progressive build

### Step 1: Confirm the platform

Explain that `/etc/os-release` is a system-maintained text file containing
distribution identification. Ask Sat to predict what this read-only action
targets and whether it changes the system.

Current action:

```bash
cat /etc/os-release
```

Review the exact output. Ask Sat to identify:

- evidence that the target is Linux rather than macOS;
- the distribution name;
- the release or version;
- why ordinary release information is safe to retain.

Help level starts as Full because the complete first command has already been
provided. A later changed verification is required before claiming fluency.

### Step 2: Confirm identity and privilege boundary

Teach the difference between a username, numeric UID, group membership and the
root account. Ask Sat to predict what identity evidence is needed before showing
the relevant command or local help source.

Required evidence:

- current username;
- current UID;
- primary and supplementary groups;
- an explanation of why an ordinary account is safer than working continuously
  as root.

Do not request identifying values for public evidence. Review and sanitise them
before portfolio use.

### Step 3: Confirm location

Teach the distinction between:

- the current working directory;
- the user's home directory;
- `/`, the filesystem root;
- a relative path;
- an absolute path.

Require Sat to identify his current location and explain which parts should be
redacted from public evidence.

### Step 4: Inspect a healthy host

Introduce one read-only discovery target at a time:

- kernel and architecture;
- CPU summary;
- memory summary;
- mounted filesystem capacity.

Before each action, ask what component it reads and what a useful healthy-state
observation would look like. Avoid collecting unnecessary identifying data.

### Step 5: Discover local help

Ask Sat to answer one focused question about a discovery command using its local
`--help` output or manual page. Require him to state both the answer and where
he found it.

### Step 6: Design the evidence report

Agree a narrow baseline containing only information needed by later projects:

- distribution and release;
- kernel and architecture;
- non-identifying user-context statement;
- current path model explanation;
- CPU count or summary;
- memory total;
- filesystem capacity summary.

Exclude hostname, username, addresses, keys and unrelated terminal history.

### Step 7: Build the first Bash script

Sat creates a small baseline script rather than copying a completed solution.
Teach one construct at a time:

1. Shebang
2. Purpose comment
3. One descriptive variable
4. Quoted variable expansion
5. One read-only command
6. Clear output label
7. Useful exit status

The tutor should ask Sat to write each fragment, inspect it exactly and use the
hint ladder when needed. The final script should not require `sudo` and should
not expose identifying data.

### Step 8: Verify and repeat

- Run the script in the authorised lab.
- Compare its claims with separate read-only commands.
- Review the output for sensitive or identifying data.
- Change one input, label or lab state and ask Sat to adapt the script with less
  help.
- Ask Sat to explain the difference between Bash syntax and external commands
  used by the script.

### Step 9: Controlled variation

Repeat the baseline on a changed disposable VM, changed directory or supplied
sanitised dataset. This pass should use less tutor support and should prove that
Sat is not merely repeating an identical command sequence.

## Project 01 portfolio evidence

Store evidence under a Project 01 portfolio folder. Include:

- operational problem and authorised scope;
- VM architecture and non-identifying distribution information;
- sanitised starting-state evidence;
- the Bash baseline script;
- explanation of each line and privilege boundary;
- separate verification results;
- one changed variation;
- security and privacy decisions;
- limitations and lessons learned.

## Project 01 completion evidence

- [ ] Distribution and release identified and explained
- [ ] User and privilege boundary explained
- [ ] Linux path model explained and demonstrated
- [ ] Kernel, CPU, memory and storage inspected safely
- [ ] One local documentation lookup demonstrated
- [ ] Sanitised baseline report reviewed
- [ ] First Bash baseline script written, explained and verified
- [ ] Changed-environment baseline completed with less help
- [ ] Exit quiz completed
- [ ] Every missed quiz item repaired through a changed mini-lab

## Project 01 no-notes exit quiz specification

Create the questions only after the practical work is complete so they reflect
the actual lab and help used. Present one question at a time and do not include
an answer key.

The quiz must assess:

1. Distribution, kernel and shell mental models
2. Prediction of a safe discovery command or script fragment
3. Diagnosis of a baseline-script bug
4. A short Bash reporting requirement
5. A privilege or public-evidence decision
6. Transfer to a changed lab or path

# Project 02: Filesystem Operations Workbench

## Operational problem

Linux administrators routinely create, inspect, copy, move, archive and remove
files. A mistaken path, unquoted variable or broad wildcard can affect the wrong
target. This project builds a disposable filesystem workbench and a Bash helper
that performs narrow, predictable file operations.

## Outcome

Sat will navigate Linux paths, inspect targets before changing them and carry
out controlled file operations in a disposable workspace. He will build and
verify a Bash script that accepts a target path safely and refuses unsuitable
input.

## Prerequisites

- Project 01 completed, including quiz repairs
- Disposable authorised Ubuntu lab identified
- Current user and working directory confirmed
- Healthy VM snapshot available
- Sat can distinguish `/`, home and current working directory

## Required repetition from Project 01

- Confirm host, user and working directory before changes.
- Use descriptive variables and quoted expansion in Bash.
- Use local help before requesting a complete command.
- Capture only narrow, public-safe evidence.

At least one repeated skill should use less help than it did in Project 01.

## Safety boundaries

- Work only inside a clearly named disposable practice directory owned by Sat's
  unprivileged lab account.
- Confirm the resolved target before every move or removal.
- Do not use `sudo` for learner-owned practice files.
- Do not operate in `/`, `/etc`, `/usr`, `/var` or another system directory.
- Do not use broad or destructive wildcards.
- Do not paste credentials or identifying host data into test files.
- Maintain a known starting tree or rebuildable fixture as the rollback.

## Concepts to learn

- Absolute and relative paths
- `.`, `..` and home-directory expansion
- Files versus directories
- Hidden names
- Filename quoting and whitespace
- Globbing versus literal text
- Create, inspect, copy, move and remove semantics
- Recursive operations and why they expand risk
- Standard output, standard error and exit status
- Bash positional arguments
- File and directory tests
- Fail-closed input validation
- Temporary or disposable test data

## Progressive build

### Step 1: Reconfirm context

Without repeating the Project 01 recipe verbatim, require Sat to establish:

- that the target is the authorised Ubuntu lab;
- the current unprivileged user;
- the current working directory;
- the intended workbench path.

Review the exact evidence before creating anything.

### Step 2: Plan the workbench tree

Give Sat an operational requirement for a small directory tree containing:

- an input directory;
- a destination directory;
- two ordinary text files;
- one filename containing a space;
- one hidden file;
- an empty directory.

Ask him to sketch the expected tree and identify the rollback before choosing
commands.

### Step 3: Create and verify one item at a time

Teach only the next required file or directory operation. Before each command,
ask:

- Is the path absolute or relative?
- What object will the command target?
- Does the parent directory exist?
- What should a separate read-only check show afterwards?

Review Sat's exact commands and verify the resulting tree independently.

### Step 4: Practise quoting and path changes

Use the filename containing a space to demonstrate why shell word splitting
matters. Require a changed variation using a different path or filename. Include
one intentional, harmless quoting error and ask Sat to explain the symptom
before repairing it.

### Step 5: Copy and move safely

Use narrow file targets. Sat must predict the source, destination and resulting
tree before each action. Verify both source and destination afterwards. Include
a changed case where the destination already exists and discuss the overwrite
or nesting risk before acting.

### Step 6: Search and inspect

Require Sat to locate files by controlled criteria inside the workbench and
inspect metadata or content without searching the whole system. Use local help
to answer one question about search depth, name matching or command behaviour.

### Step 7: Archive and prove contents

Create an archive of the disposable workbench or a selected subtree. Before
creation, define the intended archive members. Verify the archive's contents
without trusting only the command's exit status. Restore into a separate test
directory and compare the expected tree.

### Step 8: Remove with a rollback boundary

Begin with read-only target inspection. Remove only an explicitly named
learner-owned practice item after Sat predicts the result and states how it can
be recovered or rebuilt. Verify that the intended target is gone and unrelated
items remain.

Do not introduce broad recursive deletion as a shortcut. If recursive removal
is needed for a controlled directory exercise, require an exact validated path,
an understood disposable target and a rebuildable fixture.

### Step 9: Build the filesystem helper script

Sat writes the script progressively. It should:

- accept a target path as a positional argument;
- reject a missing argument;
- quote every path expansion;
- confirm the target is inside the authorised workbench;
- distinguish a file, directory and missing path;
- report intended actions clearly;
- default to a read-only or preview behaviour;
- return a useful non-zero exit status for invalid input;
- avoid `sudo` and broad wildcards.

Do not hand Sat the finished script before his attempt. Use the hint ladder and
review each exact fragment.

### Step 10: Controlled break/fix

Introduce one harmless fault only after the healthy script and workbench have
been verified. Suitable faults include:

- an unquoted variable containing a spaced filename;
- a source path that does not exist;
- a destination with an unexpected existing file;
- an incorrect relative path after changing directory;
- a script test that accepts a directory when a file is required.

Sat should record:

1. Observed symptom
2. Evidence
3. Hypothesis
4. Controlled correction
5. Retest result

### Step 11: Independent variation

Give Sat a changed directory tree and an operational outcome without exact
commands. Require him to plan, perform and verify the operations independently.
The changed scenario must include a path requiring correct quoting.

## Project 02 portfolio evidence

Store evidence under a Project 02 portfolio folder. Include:

- operational problem and safety boundary;
- starting and final directory-tree diagrams;
- selected commands with Sat's explanations;
- the Bash filesystem helper;
- validation and exit-status evidence;
- archive listing and proved restore;
- controlled fault, hypothesis, repair and retest;
- independent changed variation;
- security considerations, limitations and lessons learned.

Do not publish usernames, hostnames, addresses or unrelated terminal history.

## Project 02 completion evidence

- [ ] Authorised workbench boundary confirmed
- [ ] Absolute and relative paths explained
- [ ] Filenames requiring quoting handled correctly
- [ ] Files and directories created and verified
- [ ] Copy and move results predicted and verified
- [ ] Narrow search and local help demonstrated
- [ ] Archive contents inspected and restoration proved
- [ ] Explicit disposable target removed safely and verified
- [ ] Bash positional arguments, path tests and exit statuses explained
- [ ] Filesystem helper written and verified
- [ ] Controlled fault diagnosed and repaired
- [ ] Independent changed scenario completed
- [ ] Exit quiz completed
- [ ] Every missed quiz item repaired through a changed mini-lab

## Project 02 no-notes exit quiz specification

Create the questions only after the practical work is complete. Present one
question at a time and do not reveal an answer key before Sat attempts it.

The quiz must assess:

1. Linux path resolution and shell expansion
2. Prediction of a quoted file operation or script result
3. Diagnosis of a filesystem command or Bash bug
4. A short Bash fragment using an argument and path test
5. A safe-target, privilege or rollback decision
6. Transfer to a changed workbench tree and filename

## Handoff state for the GPT

Start with Project 01, Step 1. The current saved learner action is:

```bash
cat /etc/os-release
```

It must be run inside the intended disposable Ubuntu lab. If that lab is not
ready, guide setup one action at a time and do not treat macOS output as Linux
evidence.
