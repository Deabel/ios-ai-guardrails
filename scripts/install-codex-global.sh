#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET_DIR="${HOME}/.codex"
TARGET_FILE="${TARGET_DIR}/AGENTS.md"

mkdir -p "${TARGET_DIR}"
cp "${ROOT_DIR}/AGENTS.md" "${TARGET_FILE}"

echo "Installed global Codex rules to: ${TARGET_FILE}"
echo "You can now add machine-specific notes below the Local Project Addendum section if needed."
