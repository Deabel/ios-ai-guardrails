#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT_DIR"

rm -f ios-ai-guardrails-v5.zip
zip -r ios-ai-guardrails-v5.zip . -x "*.DS_Store" -x "*.git*"
