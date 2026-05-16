# Frequently Asked Questions

Common questions about applying these guardrails in real iOS projects.

---

## Rule Conflicts and Priority

### Which rule wins when instructions conflict?

Priority order (highest to lowest):

1. Task-specific instruction in the prompt
2. Local Project Addendum (`AGENTS.md` §13)
3. `AGENTS.md` (main spec)
4. `RULES/` files (depth reference)

If a task prompt says "use GCD here for compatibility," that overrides the default preference for Swift Concurrency. Always state the conflict explicitly in your output so reviewers understand the deviation.

### What if my project's architecture doesn't match MVVM?

Fit the existing project first — that is Principle 1 in `RULES/00-core-principles.md`. If your project uses VIPER or MVC, apply the intent of the rules (thin UI layer, no networking in views, testable business logic) rather than forcing MVVM terminology. Use the Local Project Addendum to document your actual pattern.

---

## Existing Technology Choices

### My project uses Combine extensively. Is that a problem?

No. `AGENTS.md` §2 says "Combine only when stream composition is genuinely useful **or already established**." If your project already uses Combine, continue using it. Do not mix Combine and Swift Concurrency without a concrete reason.

### My project uses RxSwift. What then?

Apply the same principle: if RxSwift is already established, keep using it. The architectural rules (thin views, repository pattern, no networking in UI) still apply. Add a note in §13: "Use RxSwift; do not introduce Combine or async/await in existing Rx chains."

### We use a third-party DI container (Swinject, Needle, etc.).

Document it in §13 and follow the container's conventions. `RULES/02c-dependency-injection.md` describes the intent (testable, explicit dependencies); the mechanism is project-specific.

---

## Testing

### Do I always need to write tests?

Only for non-trivial logic — see `RULES/07-testing-debugging.md` for the definition. Simple passthrough code, direct framework delegation, and view layout do not require tests. When in doubt, ask: "Would a colleague be surprised if this logic broke silently?"

### What mocking approach should we use?

The spec does not mandate a specific mocking library. Protocol-based test doubles (manual mocks) work well and have no external dependency. If your project already uses a library (Mockingbird, SwiftyMocky), keep using it. Document the choice in §13.

---

## Security and Privacy

### We upload health data to our own server. What tier is that?

Tier 1 (device → first-party server). Apply consent flags where GDPR/CCPA applies, minimize PII in logs, and note data minimization in your output. If the data is biometric or used for server-side authentication, it becomes Tier 2 — stop and get team confirmation before finalizing the implementation.

### Can we store the user's auth token in UserDefaults for simplicity?

No. Auth tokens go in Keychain — always. UserDefaults is unencrypted and accessible to backup tools. See `RULES/10-security-compliance.md` for the Keychain actor pattern.

---

## Swift Version and Platform

### Do these rules apply to Swift 6 projects?

Yes, with additions. See the "Swift 6 Strict Concurrency" section in `RULES/04-concurrency.md` for `@preconcurrency`, `nonisolated`, and `Sendable` guidance.

### Do the rules apply to macOS, tvOS, or watchOS?

The core principles apply to all Apple platforms. Platform-specific framework choices (UIKit vs AppKit, WatchKit, etc.) should be documented in §13. The rules are iOS-first by default.

---

## Updating the Spec

### How do I propose a change to a rule?

Follow `RULES/12-spec-governance.md`: describe the motivation, affected scope, and migration guidance. Use the commit template in `templates/rule-change-commit-template.md`. Semantic versioning: PATCH for wording, MINOR for additive rules, MAJOR for behavior-breaking changes.

### I disagree with a rule. What do I do?

Override it in the Local Project Addendum (§13) with a clear rationale. If the override is general enough to benefit all users of this spec, propose it as a rule change via the governance process above.
