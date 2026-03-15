# Quality Gates

Move AI-generated code from "it runs" to "it can safely ship."

## Minimum Delivery Gates

Any non-trivial change should satisfy at least:

- compile plausibility checks (interfaces, types, visibility)
- concurrency isolation checks (`@MainActor`, actor boundaries, shared state)
- error-handling checks (no silent swallow, no bare `try?` for meaningful operations)
- architecture boundary checks (no business/network/persistence logic in Views)

## Risk Levels

### Low

Characteristics:

- small refactors
- copy/style/local logic adjustments
- no public API contract changes

Requirements:

- state impact scope
- provide at least one verification point

### Medium

Characteristics:

- behavior changes in ViewModel/Service
- public method signature changes
- changes in critical error paths

Requirements:

- add or update tests
- provide call-site migration notes

### High

Characteristics:

- persistence/schema changes
- authentication/payment/risk-control flow changes
- cross-module contract changes

Requirements:

- rollback strategy
- rollout monitoring suggestions
- compatibility notes

## AI Output Acceptance Template

Recommended fixed sections:

1. `Change Scope`: what changed and what did not
2. `Verification`: what was run and what was not run
3. `Risk`: compile/concurrency/migration/regression risks
4. `Follow-up`: mandatory next actions (if any)
