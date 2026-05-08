#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

DRY_RUN=0
SYNC_CODEX=1
SYNC_CLAUDE=1
FAILURES=0

CODEX_TARGET="${CODEX_TARGET:-$HOME/.codex/AGENTS.md}"
CLAUDE_TARGET="${CLAUDE_TARGET:-$HOME/.claude/CLAUDE.md}"
STRICT_SYNC="${STRICT_SYNC:-0}"

usage() {
  cat <<'EOF'
Usage: bash scripts/sync-agent-configs.sh [options]

Options:
  --dry-run                 Print actions without writing files.
  --no-codex                Skip Codex sync.
  --no-claude               Skip Claude sync.
  --codex-target <path>     Override Codex target file path.
  --claude-target <path>    Override Claude target file path.
  -h, --help                Show this help.

Environment variables:
  CODEX_TARGET              Same as --codex-target.
  CLAUDE_TARGET             Same as --claude-target.
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run)
      DRY_RUN=1
      shift
      ;;
    --no-codex)
      SYNC_CODEX=0
      shift
      ;;
    --no-claude)
      SYNC_CLAUDE=0
      shift
      ;;
    --codex-target)
      CODEX_TARGET="${2:-}"
      shift 2
      ;;
    --claude-target)
      CLAUDE_TARGET="${2:-}"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage
      exit 1
      ;;
  esac
done

copy_file() {
  local src="$1"
  local dst="$2"
  local label="$3"

  if [[ ! -f "$src" ]]; then
    echo "[$label] source file missing: $src" >&2
    FAILURES=$((FAILURES + 1))
    return 0
  fi

  local dst_dir
  dst_dir="$(dirname "$dst")"

  if [[ "$DRY_RUN" -eq 1 ]]; then
    echo "[dry-run][$label] mkdir -p $dst_dir"
    echo "[dry-run][$label] cp $src $dst"
    return 0
  fi

  mkdir -p "$dst_dir"
  if cp "$src" "$dst"; then
    echo "[$label] synced: $dst"
  else
    echo "[$label] sync failed: $dst" >&2
    FAILURES=$((FAILURES + 1))
  fi
}

if [[ "$SYNC_CODEX" -eq 1 ]]; then
  copy_file "$REPO_ROOT/AGENTS.md" "$CODEX_TARGET" "codex"
fi

if [[ "$SYNC_CLAUDE" -eq 1 ]]; then
  copy_file "$REPO_ROOT/CLAUDE.md" "$CLAUDE_TARGET" "claude"
fi

echo "Sync finished."

if [[ "$FAILURES" -gt 0 ]]; then
  if [[ "$STRICT_SYNC" == "1" ]]; then
    echo "Sync completed with $FAILURES failure(s)." >&2
    exit 1
  fi
  echo "Sync completed with $FAILURES warning(s). Set STRICT_SYNC=1 to fail on warning." >&2
fi
