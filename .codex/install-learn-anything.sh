#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"
source_dir="$repo_root/.codex/skills/learn-anything"

if [[ ! -f "$source_dir/SKILL.md" ]]; then
  echo "The repository copy of the learn-anything skill was not found." >&2
  exit 1
fi

codex_home="${CODEX_HOME:-$HOME/.codex}"
destination="$codex_home/skills/learn-anything"

mkdir -p "$destination"
cp -R "$source_dir/." "$destination/"

echo "Installed learn-anything to:"
echo "$destination"
echo
echo "Restart Codex or start a new Codex session before continuing the course."
