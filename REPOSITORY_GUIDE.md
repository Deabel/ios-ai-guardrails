# Repository Guide

This document explains what each file and directory does in this repository.

Scope:
- Repository content files only
- Excludes internal `.git/` objects and system temp files such as `.DS_Store`

## Read Order (Reduce Context Loss)

When an AI tool cannot load the full repository in one pass, read this minimum set first:

1. `AGENTS.md`
2. `RULES/13-agent-behavior.md`
3. `RULES/11-quality-gates.md`
4. `RULES/10-security-compliance.md`

Treat other `RULES/`, `PROMPTS/`, `templates/`, and `examples/` files as supporting material. They do not override the four files above.

## Root Files

- `AGENTS.md`: Primary specification (single source of truth) for AI behavior, architecture boundaries, concurrency, testing, compliance, quality gates, and governance priority.
- `CHATGPT.md`: Compact ChatGPT instruction pack derived from `AGENTS.md`.
- `CLAUDE.md`: Claude entry guide that points back to `AGENTS.md`.
- `CODEX.md`: Codex entry guide with Codex-specific workflow constraints.
- `README.md`: Repository overview and quick start.
- `REPOSITORY_GUIDE.md`: This file.
- `LICENSE`: MIT license.
- `VERSION`: Spec version anchor.

## Directory: `RULES/`

Purpose:
- Deep rule documents that expand the core policy in `AGENTS.md`

Files:
- `RULES/00-core-principles.md`: Core decision principles.
- `RULES/01-apple-platform.md`: Apple platform default direction.
- `RULES/01-ios-workflow.md`: iOS task workflow.
- `RULES/02-architecture.md`: Layer responsibilities and boundaries.
- `RULES/02-mvvm-boundaries.md`: MVVM boundary details.
- `RULES/03-swift-style.md`: Swift naming and style guidelines.
- `RULES/04-concurrency.md`: Structured concurrency baseline.
- `RULES/04-concurrency-deep-dive.md`: Concurrency review heuristics and deeper guidance.
- `RULES/05-swiftui-ui.md`: SwiftUI and UIKit UI-layer guidance.
- `RULES/06-networking-data.md`: Networking and data mapping boundaries.
- `RULES/06-persistence-networking.md`: Compact persistence and networking placement rules.
- `RULES/07-testing-debugging.md`: Testing and debugging output guidance.
- `RULES/08-review-checklist.md`: Pre-delivery review checklist.
- `RULES/09-team-output-style.md`: Team output style guidance.
- `RULES/10-security-compliance.md`: Security and compliance baseline.
- `RULES/11-quality-gates.md`: Risk tiers and acceptance gates.
- `RULES/12-spec-governance.md`: Spec versioning and governance.
- `RULES/13-agent-behavior.md`: Agent behavior protocol for classification, scope, escalation, verification, and final output contract.

## Directory: `PROMPTS/`

Purpose:
- Reusable prompts for common tasks

Files:
- `PROMPTS/generate-code.md`: General code-generation prompt.
- `PROMPTS/generate-ios-feature.md`: iOS feature-generation prompt.
- `PROMPTS/refactor-code.md`: General refactor prompt.
- `PROMPTS/refactor-ios-module.md`: iOS module refactor prompt.
- `PROMPTS/review-code.md`: Code review prompt.
- `PROMPTS/review-ios-pr.md`: iOS PR review prompt.
- `PROMPTS/debug-issue.md`: Debugging prompt.
- `PROMPTS/write-tests.md`: Test-writing prompt.
- `PROMPTS/audit-guardrails.md`: Guardrails audit prompt.

## Directory: `templates/`

Purpose:
- Copy-paste starter templates for setup and review

Files:
- `templates/chatgpt-custom-instructions.txt`: ChatGPT custom-instructions template.
- `templates/project-addendum-example.md`: Example local addendum for `AGENTS.md`.
- `templates/ai-change-review-checklist.md`: AI change review checklist template.

Subdirectory:
- `templates/.codex/`: Codex local configuration examples.
- `templates/.codex/AGENTS.md`: Global Codex rule example.
- `templates/.codex/AGENTS.override.md`: Override rule example.

## Directory: `examples/`

Purpose:
- Practical, copyable examples for common tool setups

Files:
- `examples/chatgpt-custom-instructions-example.md`: ChatGPT configuration example.
- `examples/customized-chatgpt-setup.md`: End-to-end ChatGPT setup example.
- `examples/claude-project-example.md`: Claude project setup example.
- `examples/codex-project-root-example.md`: Codex project-root setup example.
- `examples/codex-task-example.md`: Codex task input example.

## Directory: `scripts/`

Purpose:
- Installation and synchronization helper scripts

Files:
- `scripts/install-codex-global.sh`: Install `AGENTS.md` to `~/.codex/AGENTS.md`.
- `scripts/install-project-agents.sh`: Install `AGENTS.md` into a target project.
- `scripts/print-chatgpt-snippet.sh`: Print `CHATGPT.md` for easy copy/paste.
- `scripts/sync-agent-configs.sh`: Sync repository rules to Codex/Claude config targets.
- `scripts/install-post-commit-sync-hook.sh`: Install a Git `post-commit` hook to run sync automatically after a successful commit.
