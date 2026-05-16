#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
AGENTS_FILE="$REPO_ROOT/AGENTS.md"

CLAUDE_TARGET="${CLAUDE_TARGET:-$HOME/.claude/CLAUDE.md}"
CODEX_TARGET="${CODEX_TARGET:-$HOME/.codex/AGENTS.md}"

DRY_RUN=0

usage() {
  cat <<'EOF'
Usage: bash scripts/setup-symlinks.sh [options]

Creates symlinks so Claude Code and Codex always use the latest AGENTS.md.
Changes to AGENTS.md take effect immediately — no sync step needed.

Options:
  --dry-run             Print actions without making changes.
  --claude-only         Only set up the Claude symlink.
  --codex-only          Only set up the Codex symlink.
  -h, --help            Show this help.

Environment variables:
  CLAUDE_TARGET         Override Claude symlink target (default: ~/.claude/CLAUDE.md)
  CODEX_TARGET          Override Codex symlink target  (default: ~/.codex/AGENTS.md)
EOF
}

SETUP_CLAUDE=1
SETUP_CODEX=1

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run)    DRY_RUN=1; shift ;;
    --claude-only) SETUP_CODEX=0; shift ;;
    --codex-only)  SETUP_CLAUDE=0; shift ;;
    -h|--help)    usage; exit 0 ;;
    *) echo "Unknown option: $1" >&2; usage; exit 1 ;;
  esac
done

link() {
  local src="$1"
  local dst="$2"
  local label="$3"

  local dst_dir
  dst_dir="$(dirname "$dst")"

  if [[ "$DRY_RUN" -eq 1 ]]; then
    echo "[dry-run] ln -sf $src $dst"
    return
  fi

  mkdir -p "$dst_dir"

  if [[ -e "$dst" && ! -L "$dst" ]]; then
    echo "[$label] backing up existing file: $dst -> ${dst}.bak"
    mv "$dst" "${dst}.bak"
  fi

  ln -sf "$src" "$dst"
  echo "[$label] linked: $dst -> $src"
}

if [[ ! -f "$AGENTS_FILE" ]]; then
  echo "Error: AGENTS.md not found at $AGENTS_FILE" >&2
  exit 1
fi

[[ "$SETUP_CLAUDE" -eq 1 ]] && link "$AGENTS_FILE" "$CLAUDE_TARGET" "claude"
[[ "$SETUP_CODEX"  -eq 1 ]] && link "$AGENTS_FILE" "$CODEX_TARGET"  "codex"

echo "Done. Edit $AGENTS_FILE and changes apply immediately."
