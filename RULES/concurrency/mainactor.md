# MainActor

UI-facing state must update on `MainActor`.

Prefer:
- `@MainActor` ViewModels
- small MainActor boundaries

Avoid:
- blocking work on MainActor
- CPU-heavy parsing on MainActor
