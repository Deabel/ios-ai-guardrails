# Composition Root

Dependency wiring should happen near app startup or feature entry points.

Prefer:
- App / Scene composition
- feature builders
- explicit constructors

Avoid:
- hidden singleton graphs
- runtime service lookup
