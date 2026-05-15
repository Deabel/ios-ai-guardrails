# MVVM and Layer Boundaries

See also: [02-architecture.md](02-architecture.md) for layer definitions.

## View / ViewController

Allowed: rendering, user interaction wiring, lifecycle glue, forwarding user intent.

Not allowed: raw networking, persistence writes, business decisions, format-heavy domain logic.

## ViewModel

Allowed: presentation state, view-facing orchestration, async task orchestration, display formatting, invoking services/repositories.

**Split a ViewModel when:**
- it manages state for 2+ unrelated user-facing features
- it holds more than ~4 injected dependencies
- its `init` parameters span unrelated concerns
- two teams need to modify it concurrently

Preferred split: extract a child ViewModel per major concern; parent ViewModel composes them.

## Service / UseCase

Business rules, workflows spanning multiple repositories, orchestration that should not live in a ViewModel.

## Repository / Store / Manager

Backend or database boundary logic, caching, DTO ↔ domain mapping, centralized settings persistence.

## UserDefaults Placement

Use a typed key wrapper, `SettingsStore`, or feature-scoped preference manager.
No ad hoc reads/writes from multiple views or controllers.
