# Group Policy Reference Artifacts

This folder contains the operational notes and exported evidence retained from
the Group Policy learning lab.

## Inventory

- [Group Policy operations guide](group-policy-instructions.md)
- [Group Policy PowerShell cheat sheet](group-policy-powershell-cheatsheet.md)
- [All-GPO HTML report](gpo-reports/all-gpos.html)
- [GPO backup manifest](gpo-backups/manifest.xml)
- [Raw GPO backup set](gpo-backups/)

The manifest records eight GPO backups created on 9 August 2026:

1. `Default Domain Policy`
2. `Default Domain Controllers Policy`
3. `GPO-Endpoint-Restrictions`
4. `GPO-IT-Drive-Mapping`
5. `GPO-IT-Folder-Redirection`
6. `GPO-IT-Security-Filtered`
7. `GPO-Workstations-Desktop-Restrictions`
8. `GPO-Workstations-Windows-Update`

## What These Artifacts Prove

- The HTML report records the exported GPO configuration, links, security
  filtering, delegation, and user or computer settings.
- The manifest maps eight backup IDs to eight GPO names.
- The backup folder contains the associated metadata, reports, and policy data.

The artifacts do not prove that a restore works. Restoration should be tested in
a disposable Active Directory environment before relying on the backup as a
recovery control.

## Public-Safety Review

The exports were reviewed locally before linking them from the main README.

- No `.DS_Store` file is retained.
- No Group Policy Preferences `cpassword` attribute was found.
- No obvious embedded credential, access token, refresh token, connection
  string, private-key file, or personal host-user path was found.
- The exports intentionally contain lab-only domain and host names, GPO and
  domain GUIDs, SIDs, UNC paths, policy settings, and EFS public-certificate
  material.

These checks reduce obvious publishing risk but are not a guarantee that every
future GPO export is safe. Repeat the review whenever the report or backup is
replaced.

## Security Filtering Scope Recorded by the Report

The report shows `Authenticated Users` under Security Filtering for
`GPO-IT-Security-Filtered`. This shows that the final GPO applies to eligible
authenticated users within the linked IT OU, rather than exclusively to
`GG_IT_Users`. The main README records this evidence boundary without claiming
group-only targeting. The operations guide retains an optional protected change
and verification sequence for a future least-privilege refinement.
