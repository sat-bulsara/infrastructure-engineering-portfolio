# Project 17 Linux VM completion

- Date: 2026-09-20
- Status: Guided build, controlled failure, cleanup and documentation complete
- Outcome: A private Ubuntu VM was deployed with Terraform, configured through cloud-init, operated through Azure Run Command, given a persistent managed data disk and monitored with a Bash health script. The service recovered after a controlled stop, reboot and VM deallocation cycle.
- Security evidence: The VM had no public IP, the subnet NSG had no custom inbound or internet SSH rule, password authentication was disabled, the workload ran as a locked non-login account, the service listened only on loopback, managed identity and boot diagnostics were enabled, and no Azure role was granted to the identity.
- Storage evidence: The LUN 0 disk was identified through Azure device links, partitioned and formatted as ext4, mounted at `/srv/cedar-data` with `docworker:docworker` ownership and mode `750`, and persisted by UUID with `nofail`. The mount and write test survived reboot.
- Troubleshooting: The original Basv2-family size failed because regional family quota was zero, so quota was queried and `Standard_D2als_v6` used. Bastion Developer repeatedly disconnected before SSH authentication; guest and key checks passed, so Run Command was used without weakening the boundary. A stale destroy plan was rejected, state and live resources were reconciled, the separately created Bastion resource was removed and a fresh destroy plan completed cleanup.
- Break/fix: Stopping `cedar-docworker.service` produced an inactive state, missing listener, refused HTTP request and health-script exit code 1. Restarting it restored HTTP 200 responses and an all-PASS exit code 0.
- Help level: Partial to Full help for Terraform HCL, cloud-init, disk administration and Bash structure. Sat executed the commands, returned exact evidence and reasoned correctly through most security and lifecycle decisions.
- Assessment: Completion quiz scored 3/5 independently and 5/5 after correction. Persistent-mount options and health-check exit status remain due for delayed retrieval.
- Cleanup evidence: Terraform state was empty and the project resource group returned `false` from an Azure existence query.
- Next action: Complete the shortened ML15-03 one-sided-peering repetition, then begin Project 18.
