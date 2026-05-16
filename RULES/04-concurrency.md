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

## Swift 6 Strict Concurrency

Swift 6 makes data-race safety a compile-time error. Key guidance:

**`@preconcurrency`** — use to suppress Sendable warnings when importing legacy APIs (ObjC frameworks, C libraries) that you cannot modify. Remove once the upstream adopts Swift Concurrency.

**`nonisolated`** — use on methods or computed properties that do not access actor-isolated state and need to be callable from non-isolated contexts. Common use case: `nonisolated var description: String` on an actor.

**`Sendable`** — value types are implicitly `Sendable` when their stored properties are all `Sendable`. Classes need explicit conformance or must be actor-isolated. Do not mark a type `@unchecked Sendable` without documenting the invariant that makes it safe.

**Migration approach:**
- Enable strict checking incrementally: start with `-strict-concurrency=minimal`, then `targeted`, then `complete`.
- Treat new warnings as errors in CI only after the codebase is clean — do not enable globally on a partially-migrated codebase.
- Actor-isolate shared mutable state first; then address `Sendable` conformance on value types; finally address `nonisolated` on actor utility methods.

## Review Checklist

- Main-thread blocking
- Who owns the mutable state
- What must be `@MainActor`-isolated
- Whether concurrent tasks can outlive the feature
- Whether error propagation is preserved
- Whether task cancellation and resource cleanup are handled
- (Swift 6 projects) Whether all Sendable conformances are sound
