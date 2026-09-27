# Project 17 Code Snippets

These patterns came from the completed project. The runnable health check is in [`scripts/check-cedar-docworker.sh`](scripts/check-cedar-docworker.sh).

## Aggregate several Bash checks

```bash
overall_status=0

if systemctl is-active --quiet cedar-docworker.service; then
  echo 'PASS: service is active'
else
  echo 'FAIL: service is not active'
  overall_status=1
fi

if ss -ltnH | grep -Fq '127.0.0.1:8080'; then
  echo 'PASS: local listener exists'
else
  echo 'FAIL: local listener is missing'
  overall_status=1
fi

exit "$overall_status"
```

The script does not stop at the first failure. It records each result, then returns one final status that automation can interpret.

## Interpret Terraform's detailed exit code

```bash
terraform plan -detailed-exitcode
plan_status=$?

case "$plan_status" in
  0) echo 'PASS: no infrastructure changes' ;;
  1) echo 'FAIL: Terraform encountered an error' ;;
  2) echo 'REVIEW: Terraform detected changes' ;;
esac
```

## Run a read-only guest check through Azure

```bash
az vm run-command invoke \
  --resource-group <resource-group> \
  --name <vm-name> \
  --command-id RunShellScript \
  --scripts 'systemctl is-active cedar-docworker.service; findmnt /srv/cedar-data' \
  --query 'value[0].message' \
  --output tsv
```

Run Command is a control-plane administration mechanism. It was used when the Bastion Developer browser session proved unreliable, not as evidence that direct public SSH was enabled.

## Verify a service account

```bash
getent passwd docworker
passwd --status docworker
stat --format='Owner=%U Group=%G Mode=%a Path=%n' /opt/cedar-docworker
```

A locked password and `/usr/sbin/nologin` prevent interactive login. File ownership and permissions remain separate controls and must be checked independently.
