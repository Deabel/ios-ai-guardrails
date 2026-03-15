# Concurrency

## Core Principle

Prefer Swift structured concurrency.

### Preferred

- `async/await`
- `Task {}`
- `withTaskGroup`
- `withThrowingTaskGroup`
- `actor`
- `@MainActor`

### Use Carefully

- `Task.detached`
- mixing GCD with Swift Concurrency
- manual lock-based synchronization

## Key Mental Models

### `async` Does Not Mean "Runs on a Child Thread"

`async` means suspension-capable asynchronous semantics, not fixed-thread execution.

### `actor` Is Isolation, Not a Background Thread

The key property of actors is isolation, not thread identity.

## Shared State

When mutable state is shared, prefer:

- actor
- explicit ownership
- single-owner isolation model

Avoid unconstrained concurrent reads/writes on the same mutable data.

## UI Updates

For UI or observable ViewModel state, prefer explicit `@MainActor` isolation.

## Cancellation

When designing async tasks, consider:

- whether cancellation is needed
- whether resources can leak after cancellation
- whether stale tasks can write back to expired screens/objects

## Review Points

In reviews, focus on:

- main-thread blocking
- race conditions
- overuse of detached tasks
- actor/isolation misuse
