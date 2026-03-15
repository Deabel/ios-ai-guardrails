# Lifecycle

Use `.task` or `.onAppear` intentionally.

Prefer:
- `.task(id:)` for data loads tied to identity
- idempotent loading methods

Avoid duplicate fetches caused by repeated appearance.
