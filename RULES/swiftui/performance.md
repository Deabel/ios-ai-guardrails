# SwiftUI Performance

Avoid heavy work inside `body`.

Prefer:
- memoized view state
- precomputed display models
- async image/data loading outside render paths
