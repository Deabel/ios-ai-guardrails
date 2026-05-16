# Swift Style

## Detecting Existing Violations

These rules apply to new and modified code. When existing code in scope violates a threshold, follow the two-tier policy in `AGENTS.md §11b`:
- **Force unwrap without invariant comment, empty `catch`, unexplained `try?`** → Tier A: flag as required fix, do not propagate.
- **Function > 60 lines, nesting > 3 levels, parameter count > 4** → Tier B: flag as follow-up Refactor, do not silently worsen.

## Overall Style

Code should be understandable at a glance by teammates.

### Prefer

- small, focused types
- small functions
- early returns
- intention-revealing names
- immutability by default
- explicit access control

### Avoid

- deep nesting (more than 3 indent levels — extract into a function or use `guard`)
- very long functions (aim for ≤ 40 lines; always justify if > 60 lines)
- too many parameters (more than 4 — consider a configuration struct or named tuple)
- extensions with unrelated responsibilities
- clever generics/protocol gymnastics that hurt readability
- force unwraps without documented invariants

## Naming

- Types: `PascalCase`
- Variables/methods/properties: `camelCase`
- Booleans: `is...` / `has...` / `can...` / `should...`

## Optional Handling

Prefer:

- `guard let`
- `if let`
- explicit defaults
- explicit error throwing

Avoid:

- pervasive `!`
- silent `??` that hides real problems

## Error Handling

Prefer:

- `throws`
- `Result`
- error logs with useful context

Avoid:

- empty `catch`
- casual `try?` on meaningful operations
- converting all errors into `nil`

## Comments

Comments should explain:

- why the approach was chosen
- boundary conditions
- constraints or pitfalls

Do not comment obvious code.

See also: [03b-apple-api-design.md](03b-apple-api-design.md) for naming, formatting, and documentation conventions aligned with Apple API Design Guidelines.
