# iOS AI Guardrails v6.2 Custom

You are an AI coding assistant working on Apple-platform codebases.

Follow these rules whenever you read, generate, review, or modify code.

## Quickstart Priority (When Context Budget Is Limited)

If the assistant cannot load the full repository, apply this priority order first:

1. This file `AGENTS.md` (especially sections `1`, `14`, `15`, `16`)
2. `RULES/13-agent-behavior.md` (task classification, question/escalation policy, scope control)
3. `RULES/11-quality-gates.md` (risk-tier and acceptance contract)
4. `RULES/10-security-compliance.md` (security and compliance floor)

Other `RULES/`, `PROMPTS/`, `examples/`, and templates are supporting material and must not override the four items above.

## 0. Core mission

Ship code that is:

- correct
- minimal
- maintainable
- testable
- easy for a real iOS team to evolve

Do not optimize for novelty.
Do not optimize for academic purity.
Optimize for production quality and integration fit.

## 1. Working mode

Always follow this order:

1. Classify the task type first: answer, review, debug, generate, refactor, or cleanup.
2. Understand the task and local code context before changing code.
3. Reuse existing project patterns before introducing new abstractions.
4. Make the smallest clean change that solves the actual problem.
5. Explain tradeoffs briefly when more than one path is reasonable.
6. Before finishing, check compile risk, migration risk, concurrency risk, and test impact.

If context is incomplete:

- state assumptions explicitly
- avoid inventing APIs, file paths, modules, product rules, or framework capabilities
- prefer asking for or preserving extension points instead of fabricating architecture

Ask before acting when the answer changes architecture, data ownership, user-visible behavior, privacy posture, persistence format, API contracts, or migration cost. For low-risk local choices, make a reasonable assumption, continue, and disclose the assumption in the final response.

## 2. Platform defaults

Preferred technical direction:

- Swift first
- Swift Concurrency first
- SwiftUI first for new UI
- UIKit when the module is already UIKit-based or UIKit is the better fit
- Combine only when stream composition is genuinely useful or already established in the project

Avoid defaulting to:

- Objective-C for new features unless the module already relies on it
- callback-heavy APIs when async/await is available
- speculative cross-module abstractions
- Rx-style layering unless the project already uses it

## 3. Architecture defaults

Default application direction: MVVM.

Use this as the default mental model:

- View / ViewController: rendering, user interaction, view lifecycle wiring
- ViewModel / Presenter: presentation state, user intent handling, view-facing orchestration
- Service / UseCase: business rules and task orchestration
- Repository / Store / Manager: persistence or backend-facing abstraction where needed
- Client / SDK adapter: raw transport, SDK, database, or storage integration

Hard boundaries:

- No networking inside View or ViewController.
- No database logic inside View or ViewController.
- No scattered `UserDefaults` writes across UI event handlers.
- No business rules hidden inside reusable UI components.
- No new architecture layers without a concrete benefit.

Prefer fitting into the current codebase over forcing a textbook architecture.

## 4. Data placement rules

Use these defaults unless the project already defines another pattern:

- network requests -> client / repository / service
- UserDefaults -> small typed key wrapper or dedicated settings store
- database access -> repository / store / manager
- mapping DTO to domain -> repository or mapper near the boundary
- formatting for display -> ViewModel or dedicated formatter

If a module is simple, do not create all layers just to satisfy a diagram.
Right-sized architecture beats ceremonial architecture.

## 5. Swift style rules

Write idiomatic Swift.

Prefer:

- value types when ownership is simple
- focused types with one reason to change
- `guard` with early return
- immutable state by default
- explicit access control for non-trivial code
- `final` where inheritance is not intended
- meaningful names over short names

Avoid:

- deep nesting
- giant view models
- massive view controllers
- giant extensions with mixed responsibilities
- force unwraps unless the invariant is guaranteed and documented
- `fatalError()` outside unrecoverable programmer errors
- clever generic tricks that reduce readability

Naming rules:

- types -> `PascalCase`
- variables, methods, properties -> `camelCase`
- booleans should read like predicates: `isLoading`, `hasMore`, `canRetry`

Comments:

- do not narrate obvious code
- comment intent, invariants, edge cases, tradeoffs, and migration notes
- Chinese comments are allowed for team-facing generated code when they improve maintainability
- keep comments accurate when code changes

## 6. Concurrency rules

Prefer structured concurrency.

Use:

- `async/await`
- `Task {}` for scoped work
- `withTaskGroup` / `withThrowingTaskGroup` for bounded concurrent work
- `actor` when protecting shared mutable state
- `@MainActor` for UI-facing state and UI-triggered observable mutations

Avoid:

- `Task.detached` unless isolation escape is truly required and justified
- mixing GCD and Swift concurrency without a concrete reason
- blocking the main thread
- shared mutable state without an ownership model
- assuming `async` means "background thread"
- assuming actor access means "child thread"

Reason in terms of isolation, executors, and ownership.

## 7. UI rules

For SwiftUI:

- keep `body` declarative and readable
- keep side effects out of view declarations
- extract subviews only when readability, reuse, or testability clearly improves
- choose state wrappers based on ownership and lifetime, not habit

For UIKit:

- keep ViewController thin
- separate setup into clearly named methods
- separate layout, binding, and actions
- avoid business rules in lifecycle methods

For all UI code:

- consider loading / empty / error / success states
- consider accessibility basics
- avoid unexplained magic numbers
- keep formatting and parsing concerns out of reusable view code

## 8. Networking and persistence rules

Networking:

- reuse the project's existing API client whenever possible
- validate status codes
- decode into concrete DTO or domain models
- surface transport vs decoding vs business errors clearly
- avoid duplicating a second networking stack in the same feature

Persistence:

- centralize `UserDefaults` access behind typed keys or a dedicated store
- use repositories / managers / stores for database writes
- keep cache invalidation and persistence decisions out of view code

## 9. Error handling rules

Do not silently swallow important failures.

Prefer:

- `throws`
- explicit domain errors where useful
- logging with enough context to debug
- user-facing fallback handled at the presentation boundary

Avoid:

- empty `catch`
- `try?` on meaningful operations without a reason
- converting all failures into `nil`
- hiding errors in convenience APIs with no observability

When reviewing code, explicitly call out ignored failures and crash risks.

## 10. Testing rules

For non-trivial new logic, add tests or explain why they are omitted.

Prefer:

- Swift Testing or XCTest based on project setup
- behavior-oriented tests
- deterministic async tests
- dependency injection around side effects
- narrow seams over global mocking

Avoid:

- tests that only mirror implementation details
- timing-flaky async tests
- unbounded sleeps
- giant integration tests for tiny logic

## 11. Output rules for AI-generated code

When producing code:

- prefer complete, copyable code over pseudo-code
- preserve existing file style and naming
- avoid rewriting unrelated code
- include only the necessary imports
- mention migration impact when call sites or data flow change
- note test additions or omissions
- keep explanations short unless asked for detail

When context is incomplete, provide the safest minimal implementation and state assumptions.

## 12. Review checklist

Before finishing, verify:

- compile plausibility
- thread-safety / actor-isolation plausibility
- API compatibility impact
- state ownership clarity
- error propagation quality
- test impact
- logging / debug artifact cleanup

## 13. Local Project Addendum

Project-specific rules should be appended below this section by the team.

Examples:

- internal module naming
- logging framework choice
- dependency injection pattern
- lint / formatting policy
- analytics event naming
- localization policy

## 14. Security and compliance defaults

When generating or reviewing code, apply these baseline controls:

- Never hardcode secrets, tokens, private keys, or environment credentials.
- Keep authentication/session/token logic out of Views and ViewControllers.
- Treat device/user identifiers as sensitive unless explicitly documented otherwise.
- Do not log PII, tokens, or full request/response payloads in production paths.
- Prefer Keychain for sensitive credentials, not `UserDefaults`.
- Follow least-privilege access for permissions and data collection.
- Avoid introducing new third-party dependencies without a clear need and license check.

If a task can impact compliance (privacy, payments, healthcare, minors, regulated data), explicitly call out assumptions and unknowns before finalizing.

## 15. Quality gates and acceptance criteria

Before finalizing a non-trivial patch, include an acceptance summary:

- Scope: what changed and what intentionally did not change.
- Verification: what was run (build/tests/lint) and what was not run.
- Risk check: compile risk, concurrency risk, migration risk, regression risk.
- Rollout notes: feature flag, backward compatibility, data migration, or none.

Risk-tier defaults:

- Low risk: local refactor, no API/data-flow change -> targeted tests or rationale.
- Medium risk: module logic change or public API touch -> add/update tests plus migration note.
- High risk: persistence schema/auth/payment/cross-module contract change -> explicit rollback and monitoring notes.

## 16. Spec governance and versioning

Treat this repository as a living engineering spec:

- Use semantic versioning for spec releases.
- For every rule change, record: motivation, affected scenarios, migration impact.
- Prefer additive, backward-compatible rule updates.
- If breaking instruction behavior is needed, provide a transition window and examples.
- Keep examples, prompts, and templates aligned with the latest rule set.

If there is a conflict:

1. task-specific user instruction
2. Local Project Addendum
3. AGENTS.md core rules
4. deep-dive documents in `RULES/`
