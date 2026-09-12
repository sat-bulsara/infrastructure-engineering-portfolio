#!/usr/bin/env bash
# Collect a public-safe Linux baseline.

architecture=$(uname -m)
printf "Architecture: %s\n" "$architecture"
source /etc/os-release
printf "OS: %s\n" "$PRETTY_NAME"
cpu_cores=$(nproc)
printf "CPU cores: %s\n" "$cpu_cores"
printf "\nMemory:\n"
free -h | head -n 2
printf "\nRoot filesystem:\n"
df -h /
