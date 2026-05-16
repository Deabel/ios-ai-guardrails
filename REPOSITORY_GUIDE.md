# Repository Guide

This document explains what each file and directory does in this repository.

## Read Order (When Context Is Limited)

Load in this priority order:

1. `AGENTS-CORE.md` — minimum enforcer (~60 lines), always apply
2. `AGENTS.md` — complete spec (~175 lines), standard usage
3. `RULES/13-agent-behavior.md`, `RULES/11-quality-gates.md`, `RULES/10-security-compliance.md` — depth reference

Other `RULES/`, `PROMPTS/`, `templates/`, and `examples/` are supporting material and do not override the above.

## Root Files

- `AGENTS.md`: Primary specification — single source of truth for AI behavior, architecture, concurrency, testing, compliance, quality gates, and governance.
- `AGENTS-CORE.md`: Minimum enforcer — ~60-line distilled rule set for context-limited scenarios. Always load this when full spec cannot fit.
- `CHATGPT.md`: Standalone ChatGPT instruction pack — paste into Custom Instructions. Derived from `AGENTS.md`.
- `README.md`: Repository overview and quick-start guide.
- `REPOSITORY_GUIDE.md`: This file.
- `LICENSE`: MIT license.
- `VERSION`: Spec version anchor.

## Directory: `RULES/`

Deep rule documents that expand the core policy in `AGENTS.md`. Load on demand for the relevant topic.

| File | Topic |
|------|-------|
| `00-core-principles.md` | Core decision principles and response structure |
| `01-apple-platform.md` | Apple platform language and framework defaults |
| `01b-ios-workflow.md` | iOS incremental delivery workflow |
| `02-architecture.md` | Layer responsibilities, boundaries, and navigation patterns |
| `02b-mvvm-boundaries.md` | MVVM boundary details and ViewModel splitting criteria |
| `03-swift-style.md` | Swift naming, optional handling, error handling, comments |
| `03b-apple-api-design.md` | Apple API Design Guidelines — naming, formatting, DocC, architecture idioms |
| `04-concurrency.md` | Swift Concurrency — mental models, preferred APIs, SwiftUI pitfalls, review checklist |
| `05-swiftui-ui.md` | SwiftUI and UIKit UI-layer guidance, view extraction heuristics |
| `06-networking-data.md` | Networking call path, UserDefaults placement, database and mapping strategy |
| `07-testing-debugging.md` | Testing requirements, framework selection, platform-specific patterns, debugging |
| `08-review-checklist.md` | Pre-delivery review checklist |
| `09-team-output-style.md` | Code output style and explanation format |
| `10-security-compliance.md` | Security baseline, Keychain pattern, privacy tier classification |
| `11-quality-gates.md` | Risk tiers and acceptance criteria template |
| `12-spec-governance.md` | Spec versioning and governance |
| `13-agent-behavior.md` | Agent behavior protocol — classification, scope control, verification, output contract |

## Directory: `PROMPTS/`

Reusable prompts for common task types. Each prompt references only the relevant rule subset.

| File | Task type |
|------|-----------|
| `answer-question.md` | Answer — explain without modifying code |
| `cleanup-code.md` | Cleanup — remove dead code within scope |
| `acceptance-review.md` | Pre-ship acceptance review (Scope / Verification / Risk / Follow-up) |
| `generate-code.md` | General code generation |
| `generate-ios-feature.md` | iOS feature generation |
| `refactor-code.md` | General refactoring |
| `refactor-ios-module.md` | iOS module refactoring |
| `review-code.md` | Code review |
| `review-ios-pr.md` | iOS PR review |
| `debug-issue.md` | Debugging |
| `write-tests.md` | Test writing |
| `audit-guardrails.md` | Periodic spec audit |

## Directory: `templates/`

Copy-paste starter templates for setup and review.

| File | Purpose |
|------|---------|
| `chatgpt-custom-instructions.txt` | ChatGPT Custom Instructions template |
| `project-addendum-example.md` | Example local addendum for `AGENTS.md` §13 |
| `ai-change-review-checklist.md` | AI change review checklist |
| `rule-change-commit-template.md` | Commit message format for spec rule changes |
| `.codex/AGENTS.override.md` | Codex override rule example |

## Directory: `examples/`

Practical, copyable examples for common tool setups.

| File | Purpose |
|------|---------|
| `chatgpt-custom-instructions-example.md` | ChatGPT configuration example |
| `customized-chatgpt-setup.md` | End-to-end ChatGPT setup example |
| `codex-project-root-example.md` | Codex project-root setup example |
| `codex-task-example.md` | Codex task input example |

## Directory: `scripts/`

Installation helpers. See `scripts/README.md` for full details on each script.

| File | Purpose |
|------|---------|
| `setup-symlinks.sh` | **Recommended.** Symlink `~/.claude/CLAUDE.md` and `~/.codex/AGENTS.md` to `AGENTS.md` |
| `print-chatgpt-snippet.sh` | Print `CHATGPT.md` to stdout for copy/paste |
| `install-project-agents.sh` | Copy `AGENTS.md` into a target project directory |
| `install-codex-global.sh` | Copy `AGENTS.md` to `~/.codex/AGENTS.md` (file copy, not symlink) |
| `sync-agent-configs.sh` | Bundle `AGENTS.md` + `RULES/` and sync to Codex/Claude config targets |
| `install-post-commit-sync-hook.sh` | Install a git post-commit hook to auto-run sync |
| `README.md` | Script usage, deployment modes, and failure handling |
