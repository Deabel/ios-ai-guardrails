# iOS AI Guardrails v6.2 Custom

A customized, cross-tool guardrails repository for Apple-platform development.

This version is tuned for an iOS engineer workflow that prefers:

- Swift first
- Swift Concurrency first
- SwiftUI first for new UI
- UIKit compatibility for existing modules
- MVVM as the default application-layer shape
- Apple-style naming and API design
- pragmatic refactors instead of speculative rewrites
- code that can actually land in a production app

## Goals

Use one shared rule system across:

- ChatGPT
- Xcode Codex
- Claude / Claude Code
- other agent-style tools that can read `AGENTS.md`

## Recommended usage

### ChatGPT

Copy `CHATGPT.md` into your custom instructions, then paste in project-specific context when needed.

### Xcode Codex

Use either:

- project-level `AGENTS.md` at repo root, or
- global `~/.codex/AGENTS.md`

You can install the global variant with:

```bash
bash scripts/install-codex-global.sh
```

Auto-sync on commit (Codex + Claude targets):

```bash
bash scripts/install-post-commit-sync-hook.sh
```

Default sync targets:

- Codex: `~/.codex/AGENTS.md` (from repo `AGENTS.md`)
- Claude Code: `~/.claude/CLAUDE.md` (default source is repo `AGENTS.md` for full-rule fidelity)

You can override target paths:

```bash
CODEX_TARGET=/custom/AGENTS.md CLAUDE_TARGET=/custom/CLAUDE.md git commit -m "..."
```

You can override Claude sync source (for example, to use compact entry file):

```bash
CLAUDE_SOURCE=/path/to/repo/CLAUDE.md git commit -m "..."
```

By default, sync is best-effort (warnings only). To fail on sync errors:

```bash
STRICT_SYNC=1 bash scripts/sync-agent-configs.sh
```

### Claude

Use `CLAUDE.md` as the project instruction entry, or copy its contents into the tool's project instructions.

## Structure

- `AGENTS.md`: single source of truth
- `CHATGPT.md`: compact ChatGPT instruction pack
- `CODEX.md`: Codex-specific operating rules
- `CLAUDE.md`: Claude-specific operating rules
- `REPOSITORY_GUIDE.md`: full file/folder explanation map
- `RULES/`: modular deep rules
- `PROMPTS/`: reusable prompts
- `templates/`: starter snippets you can paste into tools
- `examples/`: concrete usage examples
- `scripts/`: installation helpers

## Minimal Enforcement Set (Recommended for Reliability)

If a tool cannot reliably ingest all files each turn, enforce this minimum set first:

1. `AGENTS.md`
2. `RULES/13-agent-behavior.md`
3. `RULES/11-quality-gates.md`
4. `RULES/10-security-compliance.md`

Everything else should be treated as expansion or examples, not a competing source of truth.

New in this repo hardening layer:

- `RULES/10-security-compliance.md`: security and compliance baseline
- `RULES/11-quality-gates.md`: risk-tiered delivery gates
- `RULES/12-spec-governance.md`: versioning and rule governance
- `RULES/13-agent-behavior.md`: action protocol for analysis, questions, scope control, updates, and verification
- `PROMPTS/audit-guardrails.md`: periodic spec audit prompt
- `templates/ai-change-review-checklist.md`: PR/review execution checklist

## What changed in v6.2 custom

This custom edition strengthens:

- MVVM-oriented layering
- async/await and actor guidance
- UIKit + SwiftUI coexistence rules
- repository / service / persistence boundaries
- UserDefaults placement rules
- API client reuse rules
- Chinese team-comment guidance
- copyable response format expectations for AI tools
- review checklist items for crash risk, thread-safety, migration risk, and test impact
- explicit agent behavior rules for task classification, context inspection, escalation, and final acceptance summaries

## Suggested operating pattern

1. Put `AGENTS.md` in the project root.
2. Add project-specific constraints below the "Local Project Addendum" section.
3. Keep rules short and enforceable.
4. Put long explanations in `RULES/`.
5. Reuse the prompt templates from `PROMPTS/` instead of rewriting the same ask every time.

## Industry-style adoption workflow

1. `Baseline`: enforce `AGENTS.md` as the top-level source of truth.
2. `Execution`: use `PROMPTS/` + `templates/` to standardize AI task inputs/outputs.
3. `Governance`: version rule changes and require migration notes for breaking behavior.
4. `Quality`: apply risk-tier gates before landing non-trivial patches.
5. `Audit`: run periodic spec audits using `PROMPTS/audit-guardrails.md`.
