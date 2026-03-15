# Cache Boundary

Caching should have clear ownership and invalidation rules.

Prefer:
- explicit TTL or refresh policies
- actor-protected caches if shared across tasks
