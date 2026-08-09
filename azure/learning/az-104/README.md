# AZ-104 Companion

This folder is the portable source of truth for a stateful Azure and cloud
engineering tutor.

The purpose is not to rush through an exam syllabus. The companion teaches one
small prerequisite at a time inside real Azure projects, records demonstrated
progress, and gradually introduces PowerShell, Azure CLI, Bicep, Terraform, and
Python. Full Microsoft Learn paths come after the projects as consolidation.

## Continue on Any Machine

1. Clone or pull the portfolio repository.
2. Open Codex in the repository.
3. Ask: `Continue my Azure learning from the AZ-104 companion.`
4. Codex will read the repository `AGENTS.md` files and this folder's saved state.

## Source of Truth

- [Mission](MISSION.md)
- [Curriculum](CURRICULUM.md)
- [Current progress and next action](PROGRESS.md)
- [Teaching preferences](NOTES.md)
- [Learning resources](RESOURCES.md)
- [Full Azure roadmap](../../assets/azure-roadmap.md)
- [Reusable lab template](reference/lab-template.md)
- [Mini-lab bank and repetition rules](practice/README.md)
- [Reusable mini-lab template](reference/mini-lab-template.md)

`PROGRESS.md` is the authoritative place for the current focus and next action.
Browser state and chat history are conveniences, not the canonical record.

## Teaching Sequence

`just-in-time concept -> project task -> verification -> changed mini-lab -> break/fix -> automation -> explanation -> spaced review -> Microsoft Learn consolidation`

Timothy Warner's labs are used for extra guided repetitions when a relevant,
completed lab exists. Focused current Microsoft documentation remains the
authority during projects. Full Microsoft Learn paths and Applied Skills follow
the project phase.

Important skills are repeated as short, changed mini-labs. Instructions reduce
from guided steps to hints, then to an independent goal. Later repeats add a
controlled fault or reuse the skill in another project. The companion tracks
evidence and help level so repetition focuses on weak or valuable skills instead
of making the learner redo everything.
