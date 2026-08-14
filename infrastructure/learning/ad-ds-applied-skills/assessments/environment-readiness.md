# Final Mock Environment Readiness

Prepare this environment before the clock starts. Use invented names and an
authorised disposable lab only.

## Required baseline

- One healthy forest and domain at a deliberately lower supported functional
  level, where the planned increase is supported by every DC.
- `DC01` as the existing DNS-enabled domain controller and FSMO holder.
- `SRV02` as a domain-joined member server ready for DC promotion.
- One domain-joined workstation for Group Policy verification.
- AD Recycle Bin disabled in this disposable snapshot.
- A usable KDS root key already replicated for gMSA practice.
- A `C:\Assessment\users.csv` file containing three fictional users.
- A recovery administrator that will not be targeted by policy restrictions.
- Healthy DNS, time, replication, and secure channels.
- A powered-off clean snapshot named `APL1008-Mock-Start`.

## Preflight evidence

Record these before the mock, but do not include their collection in the 45
minutes:

- Forest and domain modes.
- Domain controllers and FSMO owners.
- Sites and subnets.
- DNS and replication health.
- Snapshot name and restoration method.
- The exact domain DN used when adapting task targets.

Do not put a password in the CSV, preparation notes, screenshots, or repository.
Generate secure passwords interactively during the mock.

