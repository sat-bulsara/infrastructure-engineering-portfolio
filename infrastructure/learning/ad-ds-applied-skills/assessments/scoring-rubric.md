# Final Mock 01 Scoring Rubric

Score after the timer ends. Each task is worth one point. Award the point only
when the requested state exists and the specified verification is present.
Partial configuration scores zero for that task.

## Target

- Ready: at least 13 of 15, no critical safety failure, and no full procedure
  consulted.
- Nearly ready: 10 to 12, no critical safety failure.
- Repeat required: 0 to 9 or any critical safety failure.

## Critical safety failures

Any one of these overrides the numerical score:

- A password, token, key, or DSRM credential is exposed or stored.
- A non-disposable or unauthorised environment is changed.
- A one-way or high-impact change is made without the prepared recovery point.
- Delegation or user rights affect a broader scope than requested and the issue
  is not detected before time ends.
- A recovery administrator is removed or blocked without an alternative path.
- Fabricated evidence is submitted.

## Task scoring

| Task | One point requires |
| --- | --- |
| 1 | `SRV02` is a DNS-enabled writable DC and GC; DC, SYSVOL, DNS, and replication checks are healthy. |
| 2 | `SRV02` holds RID Master and final ownership is queried. |
| 3 | Both modes equal the supported target and compatibility was checked first. |
| 4 | Site, subnet mapping, and `SRV02` placement are all correct. |
| 5 | OU structure and group delegation are correct; in-scope reset works and excluded action or scope is denied. |
| 6 | User location, identifiers, enabled state, reset, and change-at-logon state are correct with no secret exposure. |
| 7 | Only valid missing users are created, contractor is disabled, and all row outcomes are counted. |
| 8 | Group type, scope, reconciled membership, and disposable Protected Users membership are correct. |
| 9 | gMSA retrieval scope is narrow and `Test-ADServiceAccount` succeeds on the intended host. |
| 10 | Recycle Bin is enabled and the user is restored to the original OU with requested attributes. |
| 11 | GPO exists, is linked to the right OU, contains the setting, and the client result is verified. |
| 12 | Intended workstation applies the GPO, excluded workstation does not, and the reason is visible in RSoP or `gpresult`. |
| 13 | Default domain password policy matches every supplied value in an independent query. |
| 14 | PSO values and subject are correct and the target user's resultant PSO is proved. |
| 15 | Effective audit and user-right settings are shown, an event is generated, and positive and negative logon results match the scenario. |

## Remediation rule

Do not simply repeat the same failed steps. Diagnose the failure, practise a
changed variation without time pressure, wait at least one day, and then create
a fresh mock attempt from the clean snapshot.

