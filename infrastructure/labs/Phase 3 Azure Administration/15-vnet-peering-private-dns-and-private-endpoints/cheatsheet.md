# Cheatsheet: peering, Private DNS and private endpoints

## VNet peering

- Address spaces must not overlap.
- A normal bidirectional design needs a peering object in each direction.
- Peering provides a route, not application authorisation or DNS-zone visibility.
- `allow_virtual_network_access` permits traffic across the peering.
- Forwarded traffic and gateway transit are separate choices and were disabled here.

## Private endpoints

- A private endpoint is a network interface with an IP from a selected subnet.
- It targets one service instance and one or more supported subresources.
- Storage subresources include `blob`, `file`, `queue` and `table`; Blob access does not automatically provide Azure Files access.
- An approved connection does not prove that clients resolve or reach the endpoint.
- Creating a private endpoint does not automatically disable the service's public network path.

## Private DNS

- Blob Storage uses `privatelink.blob.core.windows.net`.
- The private endpoint zone group manages the endpoint's `A` record.
- Every client VNet that should resolve the record needs a zone link.
- `registration_enabled = false` is normal for private-endpoint zones. Records are managed by the endpoint integration rather than VM auto-registration.
- Healthy peering with a missing DNS link can still cause application connectivity failure.

## Service endpoint comparison

- A service endpoint extends subnet identity to an Azure service but continues to use the service's public endpoint.
- A private endpoint places a private IP for the service inside the VNet.
- Service endpoints do not replace the private endpoint used in this design.

## Terraform operations

- Import adopts an existing object into Terraform state; it does not generate a complete trusted configuration.
- A no-change plan after import shows that configuration and observed Azure state currently match.
- Manual deletion creates drift. Refresh and review the plan before deciding whether code or Azure should win.
- Never apply a saved plan without confirming its add, change and destroy counts.

## Troubleshooting order

1. Confirm the client VNet and intended hostname.
2. Check both peering objects and their state.
3. Check the private endpoint connection and private IP.
4. Check the expected `privatelink` zone and `A` record.
5. Check that the client's VNet is linked to the zone.
6. Check the service public-network and firewall settings.
7. Test DNS and the data-plane connection from an actual workload.
