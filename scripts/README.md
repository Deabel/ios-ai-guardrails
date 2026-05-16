# Scripts

Helper scripts for installing and syncing the iOS AI Guardrails spec.

## Prerequisites

- Bash 3.2+ (macOS default)
- The repository must be cloned locally
- Run from the repository root

## Scripts

| Script | Purpose | Modifies | Reversible |
|--------|---------|---------|-----------|
| `setup-symlinks.sh` | **Recommended.** Create symlinks so Claude/Codex always use the latest AGENTS.md — no sync needed | `~/.claude/CLAUDE.md`, `~/.codex/AGENTS.md` (as symlinks) | `rm` the symlink |
| `print-chatgpt-snippet.sh` | Print ChatGPT custom instructions to stdout | Nothing | N/A |
| `install-project-agents.sh` | Copy AGENTS.md into a target project directory | Target project directory | Delete the copied file |
| `install-codex-global.sh` | Copy AGENTS.md to `~/.codex/AGENTS.md` (file copy, not symlink) | Global Codex config | Delete `~/.codex/AGENTS.md` |
| `sync-agent-configs.sh` | Bundle AGENTS.md + RULES/ into Codex and Claude targets | `~/.codex/AGENTS.md`, `~/.claude/CLAUDE.md` | Re-run with previous content |
| `install-post-commit-sync-hook.sh` | Install git post-commit hook that auto-runs sync | `.git/hooks/post-commit` | Delete the hook file |

## Deployment Modes

The spec ships in three sizes. Choose based on your AI tool's context constraints:

| Mode | File | Lines | Use when |
|------|------|-------|---------|
| Core | `AGENTS-CORE.md` | ~60 | Small context window, resource-constrained models |
| Standard | `AGENTS.md` | ~170 | Claude, ChatGPT, Codex — standard usage |
| Full | `AGENTS.md` + `RULES/` | ~1100 | Deep reference tasks, spec audits |

## Sync Script Details

`sync-agent-configs.sh` bundles `AGENTS.md` with all `RULES/*.md` files into a single file for each target.

**Environment variables:**

| Variable | Default | Effect |
|----------|---------|--------|
| `STRICT_SYNC=1` | off | Exits non-zero if any source file is missing; useful in CI |

**Failure modes:**
- If a target directory does not exist, the script creates it.
- If `STRICT_SYNC=1` and a source file is missing, the script exits with code 1 and prints the missing path.
- If the script exits unexpectedly, the target file may be partially written. Re-run to restore.

## Post-Commit Hook

`install-post-commit-sync-hook.sh` installs a hook that runs `sync-agent-configs.sh` after every commit in this repository. To uninstall:

```bash
rm .git/hooks/post-commit
```
