# iOS Workflow Rules

## Default development posture

Prefer incremental delivery over broad rewrites.

Prefer this order:

1. understand the feature or bug
2. inspect current module boundaries
3. reuse existing abstractions
4. make a narrow patch
5. add or update tests
6. note migration or rollout risk

## Project-fit beats textbook purity

If the project already uses UIKit, Combine, managers, repositories, or a specific API client, fit into that world first.

Do not introduce a new subsystem unless the current codebase and task clearly require it.

## When to refactor

Refactor only when at least one is true:

- the change is otherwise unsafe or too hard to reason about
- duplication is already causing bugs
- ownership boundaries are broken
- threading / actor isolation is currently ambiguous
- the task explicitly asks for refactoring

## Deliverable shape

Prefer responses in this shape:

1. what changed
2. why this path
3. code
4. assumptions
5. test notes
6. migration notes
