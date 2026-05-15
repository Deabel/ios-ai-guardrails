# Concurrency

## Core Mental Models

- `async` marks a suspension-capable function; it does not promise a background thread.
- Actor isolation protects access rules; it does not promise a specific thread.
- `@MainActor` isolates state and methods to the main actor for UI safety.

## Preferred APIs

- `async/await`, `async throws` — async work that can fail
- `Task {}` — lifecycle-scoped async work
- `withTaskGroup` / `withThrowingTaskGroup` — bounded fan-out
- `actor` — shared mutable state, caches, in-memory stores, coordination helpers
- `@MainActor` — UI-facing state and observable ViewModel mutations

## Avoid

- `Task.detached` for routine feature work
- Mixing GCD and Swift Concurrency without a concrete reason
- Sleeping to wait for async completion in tests
- Holding mutable shared arrays or dictionaries across tasks without explicit ownership rules

## Shared State

- Prefer actor, explicit ownership, or single-owner isolation model.
- No unconstrained concurrent reads/writes on the same mutable data.

## Cancellation

Consider for every async task:
- whether cancellation is needed
- whether resources can leak after cancellation
- whether stale tasks can write back to expired screens or objects

## SwiftUI Concurrency Pitfalls

- `@EnvironmentObject` is a reference type; mutate its properties only on the MainActor. Never mutate from a non-isolated async context.
- `.task {}` auto-cancels when the view disappears. Do not hold a duplicate strong Task reference in the ViewModel — this creates two competing tasks.
- Mutable class instances captured in a `Task {}` closure are a data race unless the instance is actor-isolated or you capture a value-type copy.

## Review Checklist

- Main-thread blocking
- Who owns the mutable state
- What must be `@MainActor`-isolated
- Whether concurrent tasks can outlive the feature
- Whether error propagation is preserved
- Whether task cancellation and resource cleanup are handled
