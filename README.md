# iOS AI Guardrails v6.1 Custom

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

### Claude

Use `CLAUDE.md` as the project instruction entry, or copy its contents into the tool's project instructions.

## Structure

- `AGENTS.md`: single source of truth
- `CHATGPT.md`: compact ChatGPT instruction pack
- `CODEX.md`: Codex-specific operating rules
- `CLAUDE.md`: Claude-specific operating rules
- `RULES/`: modular deep rules
- `PROMPTS/`: reusable prompts
- `templates/`: starter snippets you can paste into tools
- `examples/`: concrete usage examples
- `scripts/`: installation helpers

## What changed in v6.1 custom

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

## Suggested operating pattern

1. Put `AGENTS.md` in the project root.
2. Add project-specific constraints below the “Local Project Addendum” section.
3. Keep rules short and enforceable.
4. Put long explanations in `RULES/`.
5. Reuse the prompt templates from `PROMPTS/` instead of rewriting the same ask every time.
