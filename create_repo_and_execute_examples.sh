#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <step> [repo_name]"
  exit 1
fi

target="$1"
repo_name="${2:-mynewrepo}"
scripts_dir="scripts"

target_num=$((10#$target))

run_group() {
  local pattern="$1"

  for script in "$scripts_dir"/$pattern; do
    [[ -e "$script" ]] || continue

    name=$(basename "$script")
    prefix="${name%%_*}"
    prefix_num=$((10#$prefix))

    if (( prefix_num <= target_num )); then
      echo "Running $name"
      bash "$script" "$repo_name"
    fi
  done
}

rm -rf $repo_name

run_group 0[0-9]_*.sh

echo Entering $repo_name...
cd "$repo_name"
scripts_dir="../$scripts_dir"

run_group [1-9][0-9]_*.sh