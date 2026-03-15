# API Client

All networking must go through an API client abstraction.

Prefer:
- `protocol APIClient`
- a single HTTP transport boundary
- request/response mapping away from UI
