# Testing and Debugging

## Testing

### When Tests Are Required

Non-trivial new logic must include tests, or explain why they are omitted.

**Non-trivial** means any of:
- logic with a conditional branch that affects behavior
- async code with cancellation, failure, or retry paths
- state that persists beyond the function scope (UserDefaults, database, in-memory cache)
- public API surface consumed by other modules
- computation involving dates, numbers, or currency

**Trivial (tests optional):** pure pass-through wrappers, display-only formatting with no branching, single-line computed properties.

### Framework Selection

- **Use Swift Testing** when: the target already imports Swift Testing; you are adding a new test target from scratch; the test involves complex async cancellation scenarios.
- **Use XCTest** when: the existing test file uses XCTest; you need UIKit lifecycle hooks in setUp/tearDown; you need XCUITest.
- Do not mix both frameworks in one file.

### Test Focus

Cover at minimum: happy path, failure path, one meaningful edge case.

### Approach

- Dependency injection over global mocking
- Stable, repeatable, low-coupling tests
- No sleep-based async waits; no randomized/flaky assertions

## Platform-Specific Patterns

**Swift Concurrency async tests**
- Swift Testing: `await confirmation(...)`
- XCTest: `XCTestExpectation` + `fulfillment(of:timeout:)`

**Combine publisher tests**
- `sink` + `XCTestExpectation`; cancel the subscription in `tearDown`
- Collect emitted values into an array and assert on the array

**Snapshot tests**
- Only introduce a snapshot testing library if the project already uses one
- Require a fixed simulator spec in CI to avoid false diffs

**SwiftUI view tests**
- Prefer testing ViewModel logic; Xcode Previews serve as manual rendering validation
- Add snapshot tests only when pixel-perfect fidelity is a product requirement

## Debugging

Prioritize: reproduction path → likely root causes → smallest viable fix → regression risks → suggested test points.

## Logging

Include in logs: input conditions, key state, error details, resource identifiers.
Avoid `print("here")`-style noise.
