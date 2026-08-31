# Project 15 private connectivity milestone

- Date: 2026-08-31
- Status: Guided core build complete
- Outcome: A non-overlapping hub and application spoke were connected with bidirectional peering. Blob Storage was exposed through an approved private endpoint, its private IP was registered in `privatelink.blob.core.windows.net`, both VNets were linked to the zone, and the storage public network path and anonymous Blob access were disabled.
- Terraform evidence: Existing hub resources were imported, a no-change plan was reached, new resources were added through reviewed plans, a manually deleted spoke DNS link was detected as one-resource drift and restored, and a reviewed 13-resource destroy removed the lab.
- Independent verification: Azure CLI and PowerShell verified the network, storage, private endpoint, DNS record, VNet links and final absence of both resource groups.
- Help level: Full guidance for the new private endpoint and DNS resources; Partial help for imports and HCL; supplied read-only verification commands.
- Assessment: Exit quiz scored 4/5 on the first attempt and 5/5 after one hint. Service endpoints versus private endpoints remains due for retrieval.
- Evidence boundary: No workload was deployed inside the spoke, so the lab proves control-plane configuration but not an end-to-end DNS query or Blob data-plane request. Public DNS, service-endpoint, overlapping-address and one-sided-peering variations were not performed.
- Next action: Begin Project 16 secure storage, transfer the private-access pattern and revisit the endpoint comparison with reduced help.
