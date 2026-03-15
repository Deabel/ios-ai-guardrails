# Retry Policy

Retry only when the failure mode is transient.

Prefer:
- bounded retry counts
- backoff when appropriate
- no retry for validation/auth failures

Do not hide repeated failure loops inside UI code.
