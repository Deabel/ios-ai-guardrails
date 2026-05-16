# Claude Code Setup Example

This example shows how to connect this guardrails repository to Claude Code, both globally and per-project.

---

## Option A: Global Symlink (Recommended)

Run the setup script once. It creates a symlink from `~/.claude/CLAUDE.md` to `AGENTS.md` in this repository.

```bash
cd /path/to/ios-ai-guardrails
bash scripts/setup-symlinks.sh
```

After this, every Claude Code session picks up the full spec automatically — no per-project setup needed.

**Verify:**

```bash
ls -la ~/.claude/CLAUDE.md
# Should show -> /path/to/ios-ai-guardrails/AGENTS.md
```

---

## Option B: Per-Project CLAUDE.md

Place `AGENTS.md` in the project root as `CLAUDE.md`, or symlink it:

```bash
cd /path/to/your-ios-project
ln -sf /path/to/ios-ai-guardrails/AGENTS.md CLAUDE.md
```

Claude Code automatically reads `CLAUDE.md` from the project root when you open a session in that directory.

---

## Adding a Local Project Addendum (§13)

After linking `AGENTS.md`, append project-specific rules at the bottom under `## 13. Local Project Addendum`. Do this in a local copy — not in `AGENTS.md` itself — so your changes survive repo updates.

**Example additions for a project called `HealthApp`:**

```markdown
## 13. Local Project Addendum

- Module prefix: `HA` (e.g., `HAFeedViewModel`, `HAUserRepository`)
- Logging: use `HALogger.shared` — never `print()` or `os_log` directly
- Analytics: use `HAAnalytics.track(_:)` — never call third-party SDK directly
- Prefer UIKit in the legacy `Devices/` module; SwiftUI only in new feature modules
- Chinese inline comments are acceptable for team-facing generated code
- Do not add new third-party dependencies without a dependency review ticket
```

---

## Auto-Syncing After Updates

If you pull changes to this repo and want Claude Code to see them immediately, run:

```bash
bash scripts/sync-agent-configs.sh
```

Or install the post-commit hook to sync automatically on every commit:

```bash
bash scripts/install-post-commit-sync-hook.sh
```

---

## Relationship: CLAUDE.md vs AGENTS.md

| File | Where it lives | Purpose |
|------|---------------|---------|
| `AGENTS.md` | This repo | Source of truth for all rules |
| `~/.claude/CLAUDE.md` | Home directory | Symlink → `AGENTS.md`; read by every Claude Code session |
| `CLAUDE.md` (project root) | Your project | Optional per-project override; append §13 addendum here |

Claude Code merges both if both exist. Project-root `CLAUDE.md` takes precedence for project-specific overrides.
