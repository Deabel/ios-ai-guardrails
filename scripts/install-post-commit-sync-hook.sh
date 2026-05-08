#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
HOOK_PATH="$REPO_ROOT/.git/hooks/post-commit"
SYNC_SCRIPT="$REPO_ROOT/scripts/sync-agent-configs.sh"

if [[ ! -d "$REPO_ROOT/.git" ]]; then
  echo "Not a git repository: $REPO_ROOT" >&2
  exit 1
fi

if [[ ! -f "$SYNC_SCRIPT" ]]; then
  echo "Missing sync script: $SYNC_SCRIPT" >&2
  exit 1
fi

cat > "$HOOK_PATH" <<EOF
#!/usr/bin/env bash
set -euo pipefail

"$SYNC_SCRIPT"
EOF

chmod +x "$HOOK_PATH"
chmod +x "$SYNC_SCRIPT"

echo "Installed git post-commit hook: $HOOK_PATH"
echo "On successful commit, rules will sync to Codex/Claude targets."
echo "Override targets with env vars when committing:"
echo "  CODEX_TARGET=/custom/path/AGENTS.md CLAUDE_TARGET=/custom/path/CLAUDE.md git commit ..."
