# Project 01 SSH lab access established

- Date: 2026-09-08
- Status: Active lab-enablement evidence
- Context: Sat wanted to operate the disposable Ubuntu VM through WezTerm on
  the Mac rather than relying on the VMware console.
- Evidence: Sat used `systemctl` to establish that `ssh.service` was initially
  absent, refreshed the APT package index, installed `openssh-server`, verified
  that `ssh.socket` was active and listening on port 22, obtained the VM's
  private NAT address and completed an SSH login from WezTerm. The remote prompt
  and Ubuntu login banner confirmed the connection.
- Help: Full command support. Several command and unit-name typos required
  focused correction. This establishes usable lab access but does not
  demonstrate independent SSH administration or security fluency.
- Security boundary: The VM is disposable and authorised, and access is through
  VMware NAT. Credentials and private keys were not recorded. Public portfolio
  evidence must sanitise the username, hostname and address.
- Next action: Without rerunning the command or using notes, identify which
  saved `/etc/os-release` line gives the human-readable release name and which
  line gives the machine-friendly distribution identifier.
- Revisit: During Project 01 context checks, in Project 15 for secure SSH access,
  and through later changed-host retrieval.
