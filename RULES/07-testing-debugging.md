# Testing and Debugging

## Testing

### Default Requirement

Non-trivial new logic should include tests, or clearly explain why tests are omitted.

### Test Focus

At minimum, cover:

- happy path
- failure path
- edge case

### Recommended

- Swift Testing or XCTest, aligned with project conventions
- dependency injection
- stable, repeatable, low-coupling tests

### Avoid

- over-asserting implementation details
- sleep-based async tests
- randomized/flaky tests

## Debugging

When debugging, prioritize:

1. Reproduction path
2. Likely root causes
3. Smallest viable fix
4. Regression risks
5. Suggested test points

## Logging

Logs should include context:

- input conditions
- key state
- error details
- resource identifiers

Avoid noisy `print("here")`-style debugging spam.
