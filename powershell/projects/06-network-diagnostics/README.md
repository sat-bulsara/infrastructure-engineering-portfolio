# Project 06 - Network Diagnostics

## Mission

Create a non-destructive network diagnostic tool for support and infrastructure work.

## Concepts

DNS resolution, connectivity, ports, timeouts, remoting concepts and structured diagnostics.

## Tasks

1. Accept one or more computer names and ports.
2. Resolve DNS with `Resolve-DnsName` when available and provide a fallback.
3. Test ports with `Test-NetConnection` on Windows.
4. Capture duration and errors without stopping the entire batch.
5. Return one object for each computer/port combination.

## Acceptance Checks

- Pipeline input works for computer names.
- An invalid host becomes a failed result rather than a terminated batch.
- Results include ComputerName, ResolvedAddress, Port, Reachable, DurationMs and Error.
- No port scanning range is enabled by default; ports must be explicitly supplied.
- Running against `localhost` is documented as the safe first test.

## Stretch

Add `-Quiet` to return booleans while keeping one internal diagnostic engine.
