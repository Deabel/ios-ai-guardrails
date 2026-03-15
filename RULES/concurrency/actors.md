# Actors

Use `actor` to protect shared mutable state.

Good use cases:
- in-memory caches
- coordination state
- request coalescing

Do not wrap every service in an actor without a concurrency reason.
