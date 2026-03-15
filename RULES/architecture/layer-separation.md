# Layer Separation

Keep responsibilities explicit.

- Views must not perform networking.
- Views must not persist data directly.
- ViewModels must not build raw SQL or low-level storage details.
- Services must not know about SwiftUI types.
