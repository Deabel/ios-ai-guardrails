# Main Thread

Never block the main thread.

Avoid:
- `Thread.sleep`
- synchronous IO on UI paths
- heavy decoding on MainActor
