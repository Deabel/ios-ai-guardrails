# AI Change Review Checklist

Use this checklist in PR descriptions or code reviews to ensure AI output is production-ready.

## 1) Change Scope

- [ ] Clearly define what changed (feature, module, files)
- [ ] Clearly define what is out of scope (avoid "full refactor" misunderstanding)

## 2) Architecture and Layering

- [ ] View / ViewController does not contain business logic
- [ ] ViewModel does not access Repository/Network directly (unless project rules allow it)
- [ ] Service / Repository boundaries are clear

## 3) Concurrency and Thread Safety

- [ ] UI state updates are under `@MainActor` (or equivalent safe isolation)
- [ ] No unnecessary `Task.detached`
- [ ] Shared mutable state has a clear isolation model (actor/single-owner)

## 4) Error Handling and Stability

- [ ] No `try!` and no force unwraps in production code
- [ ] No silent `try?` / empty `catch`
- [ ] Errors are observable (logging or surfaced to upper layers)

## 5) Security and Compliance

- [ ] No hardcoded secrets/credentials
- [ ] No PII or token leakage in logs
- [ ] Sensitive data is stored correctly (for example, Keychain)

## 6) Verification and Risk

- [ ] Verification approach is documented (build/tests/manual checks)
- [ ] Risk tier is labeled (Low / Medium / High)
- [ ] For Medium/High risk, migration or rollback notes are included
