# Review Checklist

Step-by-step pre-delivery checklist for AI-generated code. For structured risk tiers and the acceptance output template, see [11-quality-gates.md](11-quality-gates.md).

Before submitting AI-generated code, check the items below.

## Architecture

- Does it follow existing project patterns? → [02-architecture.md](02-architecture.md)
- Is the UI layer still thin enough? (no networking, persistence, or business logic in Views)
- Did it introduce unnecessary layers without concrete benefit?
- Are MVVM boundaries respected? → [02b-mvvm-boundaries.md](02b-mvvm-boundaries.md)

## Swift Style

- Are names clear and intention-revealing? → [03-swift-style.md](03-swift-style.md)
- Is nesting depth ≤ 3 levels? (extract or use `guard` if deeper)
- Is function length ≤ 40 lines? (justify if > 60)
- Is there force-unwrap risk without a documented invariant?

## Concurrency

- Is there main-thread blocking? → [04-concurrency.md](04-concurrency.md)
- Are there data races on shared mutable state?
- Is `Task.detached` overused?
- Is `@MainActor` isolation applied wherever UI state is mutated?

## Data and Error Handling

- Are errors handled explicitly? (no empty `catch`, no silent `try?`) → [06-networking-data.md](06-networking-data.md)
- Are there silent failures or swallowed errors?
- Are networking/persistence concerns in the correct layer?

## Security

- Are there hardcoded secrets, tokens, or credentials? → [10-security-compliance.md](10-security-compliance.md)
- Is PII or token data being logged?
- Is sensitive data going into UserDefaults instead of Keychain?
- Does any new data flow require a Tier 1 / Tier 2 privacy classification?

## UI

- Does it cover loading/empty/error/success states? → [05-swiftui-ui.md](05-swiftui-ui.md)
- Are there obvious accessibility or localization risks?

## Testing

- Are additional tests needed for non-trivial logic? → [07-testing-debugging.md](07-testing-debugging.md)
- Are regression points documented?

## Delivery

- Is debug residue removed? (print statements, TODO comments, commented-out code)
- Does it impact callers or call sites? (document migration if so)
- Are migration notes needed for data-flow or API changes?
