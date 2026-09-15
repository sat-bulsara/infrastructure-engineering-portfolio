# Teaching Notes

## Preferences

- Wants short, step-by-step teaching from first principles.
- Before each command or portal change, wants a simple explanation of what it
  does, why it matters, what it changes, the main risk and how to verify it.
- Is starting the Azure path from fresh and prefers a friendly, encouraging tone.
- Wants to understand Azure and cloud engineering, not only pass an exam.
- Has no fixed exam deadline and values confidence over speed.
- Benefits from comparisons with Python, JavaScript, PowerShell, Windows,
  Active Directory, DNS, networking, and IT support troubleshooting.
- Wants one focused official web link when researching a new concept.
- Prefers quick coding or command exercises over long HTML lessons.
- Wants Terraform and Python added when they reinforce a real project need.
- Prefers to complete projects before the full Microsoft Learn paths.
- Uses Microsoft Learn after projects to consolidate knowledge and fill gaps.
- Wants the tutor to adapt from demonstrated work and saved state.
- Learns through repetition and wants short variations of lab sections until the
  syntax, service behaviour, verification, and troubleshooting become familiar.
- Wants important steps reused naturally in future projects so earlier skills
  become familiar through practical repetition.
- Finds visible numbered progress motivating. Present the current build, current
  task number, approximate total tasks and a clear completion mark after verified
  checkpoints.
- Has ADHD and benefits from frequent, visible dopamine hits during practical
  work. Begin each Azure build step with a compact label such as `Build 15 -
  Task 4`, include a simple progress bar and percentage, and mark verified
  checkpoints immediately rather than waiting until the end of the lab.
- At the start of a lab and during each step, show a brief listed objective so the
  intended outcome is clear. Keep this beside the numbered progress indicator.
- During Project 17, use a compact tracker showing only the active stage and the
  stage immediately after it. Do not repeat the complete 24-stage checklist in
  every response.
- Wants short AZ-104-style scenario questions at the end of each lab, tied
  directly to actions completed in that lab. Reuse selected questions later with
  changed wording for spaced retrieval rather than testing unrelated trivia.
- Keep projects fluid and outcome-focused. Do not turn every verified action
  into several near-identical CLI functions or queries. Normally use the portal
  to establish the resource model, one or two focused CLI checks and one
  PowerShell comparison where they add useful evidence. Spread deeper command
  fluency across short changed mini-labs in later projects.
- Repetition should use changed scenarios and progressively fewer hints instead
  of repeating the same instructions or whole large projects.
- Keep mini-labs lightweight and focused on repetitions, familiarity and recall.
  A mini-lab may include a quick controlled fault and retest, but it does not
  require the full troubleshooting narrative, evidence set or documentation
  expected from a numbered portfolio project.
- Reusing a small component from the previous build inside the next real project
  is especially effective. Continue interleaving familiar setup tasks such as
  resource groups, naming, tags, context checks and cleanup so recall develops
  through use rather than isolated review.
- Wants Azure CLI, Azure PowerShell, and Terraform integrated when they are useful:
  portal first to understand the resource model, CLI and PowerShell for inspection
  and selected administration, then Terraform after the manual workflow is clear.
- Wants strong practical fluency in Azure CLI, Bash, Linux and PowerShell, not
  only enough commands to complete each Azure lab. Build this through frequent
  short command drills, prediction, explanation, output filtering, variables,
  pipelines, scripting and break/fix work. Let the learner construct commands
  from goals and use layered hints before showing complete syntax.
- Keep the five tool strands technically distinct: Azure CLI is the
  `az` administration tool; Bash and PowerShell are shells and scripting
  languages; Linux fluency includes navigation, files, permissions, processes,
  packages, logs and networking; Terraform is a declarative infrastructure-as-
  code tool with configuration and state. Combine them when the Azure task makes
  the relationship useful, but do not force every tool into every step.
- Wants Terraform developed to genuine fluency alongside Azure CLI, Bash, Linux
  and PowerShell. Include HCL construction, provider configuration, variables,
  outputs, plan interpretation, state, imports, drift, refactoring, modules,
  security and troubleshooting after the relevant Azure service is understood.
- For each Terraform build step, explicitly state the Azure component being
  built, where it sits in the architecture, why it is needed, the required HCL
  inputs and the expected verification evidence. Start with full guidance, then
  use partial scaffolds and finally requirements-only prompts as demonstrated
  fluency increases.
- When showing Terraform syntax during an active exercise, use unrelated example
  resource names and values rather than the learner's required solution. State
  the real requirements separately so Sat must adapt the pattern instead of
  copying the completed answer.
- When Sat asks for easy-to-copy Terraform fields, provide field names,
  requirements or an unrelated example scaffold, not the completed project
  answer. Reveal the full project block only after an attempt and an explicit
  request for the solution.
- Is happy to complete a very large number of labs to reach mastery. Favour
  purposeful repetitions with changed scenarios, reduced hints and clear
  evidence over artificial speed or repeating identical recipes. Lab count is
  not itself evidence of mastery.
- Wants every Azure roadmap project in one chronological numbered sequence.
  Do not separate advanced work into lettered extensions or embed substantial
  applied projects inside another project. Include extra networking depth and
  multiple capstones with increasing independence.
- Wants additional security projects and repeated hands-on coverage of every
  current AZ-104 domain before official exam practice. The official assessment
  should expose small gaps rather than introduce unfamiliar services or tasks.
- Wants an estimated completion time shown beside every roadmap project. Treat
  estimates as flexible planning ranges that include study, build, verification,
  break/fix, evidence and initial documentation, not as deadlines.
- When an AZ-104 gap is a smaller feature inside an existing project, add an
  explicit coverage checkpoint and practical variation rather than padding the
  roadmap with another large project.
- For strong portfolio projects, use a five-part depth check: cost control,
  restricted access, monitoring, explainable design decisions and an evidenced
  troubleshooting story. Put a clear architecture diagram near the top of major
  independent READMEs and consider a short public-safe walkthrough for capstones.
- Wants labs to build employable engineering judgement rather than only service
  recognition. Begin substantial work from a business problem and constraints,
  require a short defence of the chosen and rejected design, verify cost controls
  instead of assuming configured alerts work, and use a security pre-mortem before
  completion. Record monthly capability growth as problems independently solved,
  explained and verified rather than hours studied or certificates collected.
- Avoid em dashes in repository documentation.
- For Azure portfolio labs, use no more than five embedded screenshots unless a
  different limit is requested. Inspect every image in the folder, including
  unembedded raw captures, before publication.
- Prompt for public-safe final verification and cleanup evidence before resources
  or Terraform state are removed. Keep account addresses, tenant IDs,
  subscription IDs, device codes and unrelated browser content out of Git.
- Troubleshooting write-ups must separate observed evidence, hypotheses and
  confirmed causes. A successful retry after a change does not prove causation.
- Wants every Azure lab to include an explicit security focus covering identity,
  permissions, exposure, secrets, limitations and safe cleanup as applicable.
- Wants enterprise-style Azure labs to begin with a clear business-needs section
  explaining the operational problem and why the proposed design is suitable.
- Wants every numbered Azure project to use a different simulated company and
  business context. Write the brief like a genuine client engagement and treat
  the engineering process as real, while retaining one clear portfolio
  disclosure that the organisation and data are simulated. Do not repeatedly
  label resources, requirements or evidence as fictional or as a lab.
- Wants the identity learning path to include realistic joiner, mover and leaver
  lifecycle work using Microsoft Entra users, groups, licences and Azure access.
- Wants an enterprise-style Microsoft Entra environment that connects clearly to
  prior on-premises Active Directory experience, while preserving the technical
  distinction between Microsoft Entra ID, AD DS, hybrid identity and Microsoft
  Entra Domain Services.
- Is comfortable publishing clearly fictional test-account display names from
  disposable environments. Continue to exclude real administrator identities,
  account domains, tenant and subscription IDs, object IDs, passwords, tokens
  and authentication or recovery material unless there is a specific justified
  evidence need.

## Prior Knowledge and Evidence

- Has basic Python and JavaScript experience.
- Is developing PowerShell syntax and behaviour knowledge.
- Has practical Windows, Active Directory, DNS, and first-line support context.
- Completed a guided group-based Azure RBAC lab with implementation and
  troubleshooting evidence.
- Existing evidence does not yet prove independent AZ-104-wide mastery.

## Constraints

- May learn while travelling on a separate laptop.
- Some Azure actions may be performed on another Windows machine.
- Course state must remain portable through Git across Codex tasks and devices.
- Licensing, tenant permissions, regional availability, quota, and cost may limit
  exercises.
