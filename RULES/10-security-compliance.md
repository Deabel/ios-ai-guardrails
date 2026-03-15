# Security & Compliance

Security and compliance baseline for AI-generated code.

## Goals

- secure by default
- least privilege
- auditable changes

## Sensitive Data Handling

- Never hardcode secrets, tokens, private keys, or production credentials in code.
- Never log PII, tokens, or full request/response payloads.
- Treat user IDs, device IDs, location, and payment data as sensitive unless explicitly exempted by project policy.
- Example placeholders must be explicit (for example, `YOUR_API_KEY`) and must not resemble real credentials.

## iOS Storage and Permissions

- Store sensitive credentials in Keychain, not `UserDefaults`.
- Use `UserDefaults` only for low-sensitivity config (UI preferences, toggles, etc.).
- When adding system permissions (camera, microphone, location, contacts, etc.), document business purpose and minimum scope.
- Permission prompts should be user-intent-driven, not shown at cold start without context.

## Networking and Third-Party Dependencies

- Reuse the existing networking layer; do not add parallel network stacks.
- Keep transport errors, decoding errors, and business errors clearly separated.
- Validate license compatibility and maintenance status before adding third-party dependencies.
- Avoid heavy dependencies for small problems; prefer minimal local implementations.

## Compliance Notes in AI Tasks

When tasks involve the scenarios below, explicitly state assumptions and risks:

- privacy data collection/upload
- payments, authentication, or account systems
- regulated domains (minors, healthcare, finance, etc.)
- cross-border data transfer

Recommended output structure:

1. Known constraints
2. Assumptions
3. Risks
4. Mitigations
