# Swift Concurrency Deep Dive

## Mental model

- `async` marks a suspension-capable function; it does not promise a background thread
- actor isolation protects access rules; it does not promise a specific thread
- `@MainActor` means main-actor isolation for UI-related state

## Good defaults

Use:

- `async throws` for async work that can fail
- `Task {}` for lifecycle-scoped asynchronous work
- task groups for bounded fan-out
- actors for shared mutable state, caches, in-memory stores, and coordination helpers

## Anti-patterns

Avoid:

- `Task.detached` for routine feature work
- hopping between GCD and Swift concurrency without reason
- sleeping to "wait" for async completion in tests
- holding mutable shared arrays or dictionaries across tasks without ownership rules

## Review heuristics

When reviewing async code, check:

- who owns the mutable state
- what must be main-actor isolated
- whether task cancellation is relevant
- whether error propagation is preserved
- whether concurrent tasks can outlive the feature unexpectedly
