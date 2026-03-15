# Apple Platform Defaults

## Language Priority

Default order:

1. Swift
2. Objective-C (only for legacy modules, bridge boundaries, or old code)

Do not default to Objective-C for new code unless:

- the current module is almost entirely Objective-C
- legacy SDK/runtime constraints require it
- the task explicitly requests Objective-C

## Framework Priority

### UI

- Prefer SwiftUI for new UI.
- Keep existing UIKit modules in UIKit style.
- For list layouts, prefer `UICompositionalLayout` and `UICollectionViewDiffableDataSource`.
- In mixed stacks, prioritize minimal-intrusion integration over broad rewrites.

### Async

- Prefer Swift Concurrency.
- Use Combine only when already established in the project or clearly better for stream composition.
- Do not "modernize" simple callback flows into complex reactive pipelines without need.

### Data Modeling

- Use `Codable` by default.
- Add DTO/Domain/ViewData layering only when it provides concrete value.

## Apple-Style Constraints

- Keep naming clear and natural, aligned with Swift API Design Guidelines.
- Prefer value types when appropriate.
- Keep UI updates and state mutation boundaries explicit.
- Use `@MainActor` for UI-facing state and APIs.
- Avoid main-thread-blocking I/O.
