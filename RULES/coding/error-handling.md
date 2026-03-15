# Error Handling

Prefer typed domain errors.

Prefer:
- `throws`
- typed enums
- mapping lower-level failures into stable app errors

Avoid:
- `fatalError` in production paths
- swallowing errors silently
