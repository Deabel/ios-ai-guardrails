# MVVM and Layer Boundaries

## View / ViewController

Allowed:

- rendering
- user interaction wiring
- lifecycle glue
- forwarding user intent

Not allowed:

- raw networking
- persistence writes
- business decisions
- format-heavy domain logic

## ViewModel

Allowed:

- presentation state
- view-facing orchestration
- async task orchestration
- display formatting
- invoking services / repositories

Be careful with:

- becoming a dumping ground for everything
- holding too many dependencies
- mixing business rules with view-specific state

## Service / UseCase

Good place for:

- business rules
- workflows spanning multiple repositories
- orchestration that should not live in a ViewModel

## Repository / Store / Manager

Good place for:

- backend or database boundary logic
- caching
- DTO <-> domain mapping near boundaries
- centralized settings persistence

## UserDefaults placement

Prefer:

- `SettingsStore`
- `AppPreferences`
- typed key wrapper
- feature-scoped preference manager

Avoid:

- ad hoc reads and writes from multiple views or controllers
