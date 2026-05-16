# Networking and Data

## Networking

Preferred call path: `ViewModel → Service/Repository → APIClient`

- Reuse existing `APIClient` / `NetworkService`; do not add a parallel network stack.
- Validate HTTP status codes.
- Distinguish transport errors, business errors, and decoding errors.
- Decode into explicit models; avoid `[String: Any]`.

## UserDefaults

Good use cases for UserDefaults:

- lightweight settings
- user preferences
- simple feature toggles
- small cache markers

Not suitable for:

- complex object storage
- core business data
- scattered write calls across the codebase

Recommended:

- centralized wrapper/store
- typed key
- explicit default-value strategy

**Pattern — typed key wrapper:**

```swift
// Centralize all keys and defaults in one place
enum AppPreferences {
    @UserDefault(key: "isOnboardingComplete", defaultValue: false)
    static var isOnboardingComplete: Bool

    @UserDefault(key: "preferredTheme", defaultValue: "system")
    static var preferredTheme: String
}

// Read/write at call sites — no raw string keys in feature code
AppPreferences.isOnboardingComplete = true
```

The `@UserDefault` property wrapper can be project-specific; the key point is that raw `UserDefaults.standard.set(_:forKey:)` calls must not be scattered across ViewModels and ViewControllers.

## Database

Place database access in boundaries such as store/repository/manager.

Do not expose table schemas or low-level query details to the UI layer.

## Mapping Strategy

Prefer clear and simple layering:

- DTO: transport model
- Domain: business model (when needed)
- ViewData: presentation model for views (when needed)

Do not force a three-layer mapping setup if it does not create real boundary value.
