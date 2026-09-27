#!/usr/bin/env bash

set -u
set -o pipefail

service_name="cedar-docworker.service"
expected_port="8080"
health_url="http://127.0.0.1:8080/health.txt"
mount_point="/srv/cedar-data"
disk_usage_threshold="80"
dns_target="management.azure.com"

overall_status=0

if systemctl is-active --quiet "$service_name"; then
  printf 'PASS: %s is active\n' "$service_name"
else
  printf 'FAIL: %s is not active\n' "$service_name"
  overall_status=1
fi


if ss -ltnH | grep -Fq "127.0.0.1:${expected_port}"; then
  printf 'PASS: port %s is listening locally\n' "$expected_port"
else
  printf 'FAIL: port %s is not listening locally\n' "$expected_port"
  overall_status=1
fi

if curl \
  --fail \
  --silent \
  --show-error \
  --max-time 5 \
  "$health_url" \
  >/dev/null; then
  printf 'PASS: health endpoint responded successfully\n'
else
  printf 'FAIL: health endpoint did not respond successfully\n'
  overall_status=1
fi

if mountpoint --quiet "$mount_point"; then
  printf 'PASS: %s is mounted\n' "$mount_point"
else
  printf 'FAIL: %s is not mounted\n' "$mount_point"
  overall_status=1
fi

disk_usage="$(
  df --output=pcent "$mount_point" |
    tail -n 1 |
    tr -d ' %'
)"

if (( disk_usage < disk_usage_threshold )); then
  printf \
    'PASS: %s usage is %s%%, below the %s%% threshold\n' \
    "$mount_point" \
    "$disk_usage" \
    "$disk_usage_threshold"
else
  printf \
    'FAIL: %s usage is %s%%, at or above the %s%% threshold\n' \
    "$mount_point" \
    "$disk_usage" \
    "$disk_usage_threshold"

  overall_status=1
fi

if getent hosts "$dns_target" >/dev/null; then
  printf 'PASS: DNS resolution succeeded for %s\n' "$dns_target"
else
  printf 'FAIL: DNS resolution failed for %s\n' "$dns_target"
  overall_status=1
fi

if (( overall_status == 0 )); then
  printf 'RESULT: all required health checks passed\n'
else
  printf 'RESULT: one or more required health checks failed\n'
fi

exit "$overall_status"