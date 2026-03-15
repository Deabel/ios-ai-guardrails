# Module Boundaries

Modules communicate through clear, narrow interfaces.

Prefer:
- protocol-based boundaries
- DTO / response model translation at boundaries

Avoid:
- leaking persistence entities into UI
- exposing networking details to views
