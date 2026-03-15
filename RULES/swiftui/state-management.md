# State Management

Use clear ownership rules.

- `@StateObject`: when the view owns the ViewModel
- `@ObservedObject`: when injected from outside
- `@State`: local transient UI state
- `@EnvironmentObject`: only for truly shared app-level dependencies
