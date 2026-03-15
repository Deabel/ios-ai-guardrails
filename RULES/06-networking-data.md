# Networking and Data

## Networking

### Rules

- Reuse existing `APIClient` / `NetworkService` whenever possible.
- Validate HTTP status codes.
- Distinguish transport errors, business errors, and decoding errors.
- Decode into explicit models; avoid widespread `[String: Any]`.

### Avoid

- constructing `URLSession` requests directly inside screens
- scattered JSON parsing across a single request flow
- context-free error logging

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

## Database

Place database access in boundaries such as store/repository/manager.

Do not expose table schemas or low-level query details to the UI layer.

## Mapping Strategy

Prefer clear and simple layering:

- DTO: transport model
- Domain: business model (when needed)
- ViewData: presentation model for views (when needed)

Do not force a three-layer mapping setup if it does not create real boundary value.
