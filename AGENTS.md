# iOS AI Guardrails v5

## Purpose

Provide deterministic guardrails for AI-assisted iOS development.

## Supported Assistants

- ChatGPT
- Claude
- Xcode Codex
- Claude Agent

## Primary Stack

- Swift
- SwiftUI
- MVVM
- Swift Structured Concurrency (`async/await`)

## Global Rules

Before generating code, the assistant MUST:

1. Identify the architecture layer.
2. Load relevant rules from `RULES/`.
3. Check `ANTI_PATTERNS/`.
4. Prefer implementations from `TEMPLATES/`.
5. Use `EXAMPLES/` when structure is ambiguous.
6. Follow `WORKFLOWS/`.
7. Validate with `CHECKS/`.

## Core Principles

- Prefer correctness over cleverness.
- Prefer simple, testable abstractions.
- Prefer dependency injection over hidden dependencies.
- Prefer `async/await` over callback-based APIs.
- Prefer typed errors over vague failures.
- Avoid business logic in SwiftUI `View`.
- Avoid networking outside the service layer.
- Avoid force unwraps in production code.

## Primary Rule Sources

- `RULE_INDEX.md`
- `RULES/architecture/`
- `RULES/concurrency/`
- `RULES/swiftui/`
- `RULES/networking/`
- `RULES/testing/`
