#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: bash scripts/install-project-agents.sh /path/to/project"
  exit 1
fi

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJECT_DIR="$1"

mkdir -p "${PROJECT_DIR}"
cp "${ROOT_DIR}/AGENTS.md" "${PROJECT_DIR}/AGENTS.md"

echo "Installed project-level AGENTS.md to: ${PROJECT_DIR}/AGENTS.md"
echo "Append local project rules under the Local Project Addendum section."
