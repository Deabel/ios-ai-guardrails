# Task Groups

Use task groups for bounded parallel work.

Prefer:
- `withThrowingTaskGroup`
- result aggregation close to task creation

Avoid:
- fire-and-forget fan-out without cancellation handling
