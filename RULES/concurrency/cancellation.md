# Cancellation

Long-running work must cooperate with cancellation.

Prefer:
- `Task.checkCancellation()`
- bubbling cancellation outward
- cancelling outdated UI tasks

Avoid ignoring cancellation in search, refresh, and paged loading flows.
