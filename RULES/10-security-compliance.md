# Security & Compliance

## Sensitive Data Handling

- Never hardcode secrets, tokens, private keys, or production credentials in code.
- Never log PII, tokens, or full request/response payloads.
- Treat user IDs, device IDs, location, and payment data as sensitive unless explicitly exempted.
- Use explicit placeholders (`YOUR_API_KEY`), never values resembling real credentials.

## iOS Storage

**Keychain** for: auth tokens, passwords, private keys, biometric flags, payment instrument IDs.

**UserDefaults** for: UI preferences, last-viewed tab, non-sensitive feature toggles, pagination state.

**Keychain usage pattern:**
- Encapsulate in a dedicated `KeychainStore` actor; never inline raw `SecItemAdd` calls in feature code.
- Keychain calls are synchronous and blocking — call from a background actor, not on MainActor.
- Never log Keychain values, even in debug builds.

**Pattern — KeychainStore actor:**

```swift
// All Keychain access lives here; callers use async/await
actor KeychainStore {
    func save(_ value: String, for key: String) throws {
        // SecItemAdd / SecItemUpdate — synchronous, safe to block inside actor
    }

    func load(for key: String) throws -> String {
        // SecItemCopyMatching — synchronous
    }

    func delete(for key: String) throws {
        // SecItemDelete
    }
}

// Usage from a Service or ViewModel — always await, never on MainActor directly
let token = try await keychainStore.load(for: "authToken")
```

Using an `actor` ensures only one call touches Keychain at a time, avoids blocking MainActor, and keeps SecItem calls out of feature code.

## Permissions

- Document business purpose and minimum scope when adding system permissions (camera, microphone, location, contacts, etc.).
- Permission prompts must be user-intent-driven, not shown at cold start without context.

## Networking and Dependencies

- Reuse the existing networking layer; do not add a parallel network stack.
- Keep transport errors, decoding errors, and business errors clearly separated.
- Validate license compatibility before adding third-party dependencies; prefer minimal local implementations for small problems.

## Privacy Boundary Classification

Classify each data flow before finalizing implementation:

- **Tier 0 (on-device only):** data never leaves the device. Standard care applies.
- **Tier 1 (device → first-party server):** apply consent flags (GDPR/CCPA where required), no PII in logs, data minimization. Note in output.
- **Tier 2 (device → third-party or regulated domain):** do not finalize implementation; explicitly list unknown compliance requirements and block for team confirmation.

**Tier 2 triggers:**
- `HKHealthStore` or biometric data uploaded to a server → healthcare-adjacent
- Any flow involving users under 13 → COPPA
- Payment tokens, card numbers, or transaction IDs → PCI
- Biometric data used for server-side authentication

**Compliance output structure (when triggered):** Known constraints → Assumptions → Risks → Mitigations.
