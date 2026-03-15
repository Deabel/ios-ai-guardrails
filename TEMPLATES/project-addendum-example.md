# Local Project Addendum Example

Append this under the `Local Project Addendum` section in `AGENTS.md` when needed.

## Internal conventions

- UI layer: UIKit in legacy modules, SwiftUI in new modules
- default architecture: MVVM
- async work: Swift Concurrency first
- reactive streams: Combine only where already established
- persistence: UserDefaults must be centralized in feature-scoped settings stores
- networking: reuse the shared APIClient
- comments: Chinese comments are allowed for team-facing code when they clarify intent
- testing: use XCTest unless the module already uses Swift Testing

## Team preferences

- prefer Apple-style naming
- prefer smaller focused patches
- do not rename public APIs unless explicitly requested
- avoid broad formatting-only diffs
