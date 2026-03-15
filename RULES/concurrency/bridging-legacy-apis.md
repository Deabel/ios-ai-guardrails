# Bridging Legacy APIs

When wrapping completion-handler APIs, prefer `withCheckedThrowingContinuation`.

Rules:
- resume exactly once
- map callback errors into typed Swift errors
- avoid exposing callback-based interfaces to new code
