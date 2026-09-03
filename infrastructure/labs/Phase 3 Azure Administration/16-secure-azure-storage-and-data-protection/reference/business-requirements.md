# Northstar Design Group: Storage requirements

## Organisation

- Industry: design consultancy
- Employees: 200
- Primary office: London
- Working model: office and remote
- IT team: four people
- Azure maturity: developing

## Workload

An internal application uploads, reads and updates client project documents as
objects over HTTPS. It does not require an SMB or NFS share.

## Required outcomes

1. Survive one UK South availability-zone failure.
2. Recover overwritten and deleted documents.
3. Recover an accidentally deleted container.
4. Use Microsoft Entra ID for normal administrative access.
5. Give an approved contractor read-only access for a short period.
6. Keep application traffic on a private Azure network path.
7. Prevent anonymous Blob access.
8. Control the cost of retained versions and inactive data.
9. Produce operational evidence and a tested cleanup procedure.

## Constraints

- Cross-region disaster recovery is not currently required.
- UK South is the primary region.
- Only fictional test data is permitted.
- The design should remain understandable to a small IT team.
- Paid lab components must be short-lived.
- Credentials, keys, SAS tokens and connection strings must not enter Git or screenshots.

## Questions to defend before deployment

1. Which Azure Storage service fits the access pattern?
2. Which redundancy option meets the stated failure requirement without excess scope?
3. Which controls protect overwrites, Blob deletion and container deletion?
4. Which identity and role should be used for normal data access?
5. How should temporary contractor access be issued and revoked?
6. Which network and DNS components provide the private path?
7. What operational and cost risks remain after the controls are enabled?
