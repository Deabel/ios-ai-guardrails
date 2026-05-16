# iOS AI Guardrails v6.3 Custom

A customized, cross-tool guardrails repository for Apple-platform development.

Tuned for an iOS engineer workflow that prefers Swift + Swift Concurrency first, SwiftUI for new UI, MVVM as the default application shape, and Apple-style naming and API design.

## Goals

One shared rule system across:

- Claude / Claude Code
- Xcode Codex
- ChatGPT
- Other agent-style tools that read `AGENTS.md`

## Three-Tier Loading

Load the smallest tier that fits your context budget:

| Tier | File | Lines | When to use |
|------|------|-------|-------------|
| Core | `AGENTS-CORE.md` | ~60 | Context-limited models, smallest system prompt |
| Standard | `AGENTS.md` | ~175 | Claude, ChatGPT, Codex — normal usage |
| Full | `AGENTS.md` + `RULES/` | ~1100 | Deep reference tasks, spec audits |

## Setup by Tool

### Claude Code

**Global (applies to all projects):**

```bash
# Symlink — changes to AGENTS.md take effect immediately
ln -sf "$(pwd)/AGENTS.md" ~/.claude/CLAUDE.md
```

**Per-project:** place `AGENTS.md` in the project root, or add project-specific rules under the Local Project Addendum section (§13).

### Xcode Codex

**Global:**

```bash
ln -sf "$(pwd)/AGENTS.md" ~/.codex/AGENTS.md
```

Or install via script (copies rather than links):

```bash
bash scripts/install-codex-global.sh
```

**Per-project:** place `AGENTS.md` in the project root.

### ChatGPT

Copy `CHATGPT.md` into your ChatGPT Custom Instructions. Paste project-specific context when starting a session.

```bash
bash scripts/print-chatgpt-snippet.sh
```

### Auto-sync on commit (alternative to symlinks)

```bash
bash scripts/install-post-commit-sync-hook.sh
```

After each commit, `sync-agent-configs.sh` bundles `AGENTS.md` + `RULES/` and writes to `~/.codex/AGENTS.md` and `~/.claude/CLAUDE.md`. See `scripts/README.md` for options.

## Repository Structure

```
AGENTS-CORE.md          Minimum enforcer (~60 lines)
AGENTS.md               Primary spec — single source of truth
CHATGPT.md              Standalone ChatGPT instruction pack
CLAUDE.md               Claude-specific entry guide
README.md               This file
REPOSITORY_GUIDE.md     Full file/directory map with descriptions
RULES/                  Deep rule documents (load on demand)
PROMPTS/                Reusable task prompts
templates/              Copy-paste starters for setup and review
examples/               Concrete tool setup walkthroughs
scripts/                Installation and sync helpers
```

See `REPOSITORY_GUIDE.md` for descriptions of every file.

## Suggested Operating Pattern

1. Use `AGENTS-CORE.md` as the minimum enforced baseline.
2. Put `AGENTS.md` in the project root and add project-specific constraints in §13 Local Project Addendum.
3. Use `PROMPTS/` templates instead of rewriting the same task prompt each time.
4. Reference `RULES/` files for depth when needed — they do not need to be loaded every session.
5. Version rule changes with `templates/rule-change-commit-template.md`.

## Governance

Semantic versioning: PATCH = wording; MINOR = additive rules; MAJOR = behavior-breaking change.
Every rule change records: motivation, affected scope, migration guidance.
