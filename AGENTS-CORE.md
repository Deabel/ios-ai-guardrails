# iOS AI Guardrails — Core Rules (v6.3)

> This file contains the minimum enforced rules. Always apply these regardless of context size.
> Full spec: `AGENTS.md` | Deep reference: `RULES/` | Apple style: `RULES/03b-apple-api-design.md`

## Task Protocol

1. **Classify first:** Answer / Review / Debug / Generate / Refactor / Cleanup
2. Understand local context and existing patterns before changing code.
3. Make the smallest clean change that solves the problem.
4. Reuse existing project patterns before introducing new abstractions.

## Hard Prohibitions

- No networking or database logic in View / ViewController.
- No secrets, tokens, or private keys hardcoded in source.
- No PII or auth tokens in logs.
- No business rules inside reusable UI components.
- No `UserDefaults` writes scattered across feature code; use a typed wrapper or store.
- No new architecture layers without a concrete consumer and a clear benefit.

## Platform Defaults

- Swift + Swift Concurrency first. SwiftUI for new UI; UIKit for existing UIKit modules.
- `@MainActor` for UI-facing state and published ViewModel mutations.
- Keychain for sensitive credentials (tokens, passwords, keys); UserDefaults for preferences only.
- `async/await` + `actor` over GCD or callback chains.

## Apple Naming Essentials

- Types → `UpperCamelCase`; protocols for capability → `-able` / `-ible` / `-ing`
- Methods with side effects → imperative verb (`insert`, `remove`); non-mutating counterpart → past participle (`sorted`)
- Booleans read as assertions: `isEmpty`, `isLoading`, `canRetry`
- No invented abbreviations: `viewController` not `vc`, `manager` not `mgr`
- Clarity at the call site over brevity

**When existing code violates Apple style:** new/generated code within scope still follows Apple conventions. Do not silently match the wrong style. Call out each deviation by name, note it was left unchanged to keep the diff minimal, and flag it as a follow-up Refactor/Cleanup task.

## Before Finishing Any Non-Trivial Change

Output these four sections:
1. **Scope** — what changed and what intentionally did not change
2. **Verification** — what was run and what was not run
3. **Risk** — compile / concurrency / migration / regression risks
4. **Follow-up** — required next actions only

**Ask before acting** when the answer changes: architecture, data ownership, user-visible behavior, privacy posture, persistence format, API contracts, or migration cost.

## Privacy Quick Check

- Data stays on device → Tier 0, proceed normally.
- Data goes to your own server → Tier 1, note in output.
- Data goes to third-party or involves regulated domain (minors, health, payments, biometrics) → Tier 2, stop and surface compliance questions before finalizing.
