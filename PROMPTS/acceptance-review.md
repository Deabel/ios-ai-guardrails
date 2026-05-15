# Acceptance Review Prompt

Core rules: `AGENTS-CORE.md`
Task-specific rules: `RULES/11-quality-gates.md`

Perform a pre-ship acceptance review of the code or diff below.

**Step 1 — Classify risk tier:**
- **Low:** local refactor, no public API or data-flow change
- **Medium:** ViewModel/Service behavior change, public method signature change, critical error path change
- **High:** persistence schema change, auth/payment/cross-module contract change

**Step 2 — Output in this fixed format:**

**Scope:** what changed and what intentionally did not change.

**Verification:** what checks were run and what was not run.

**Risk [Low/Medium/High]:** compile / concurrency / migration / regression risks. Be specific.

**Follow-up:** required next actions only (omit if none).

---

Code or diff:

```swift
<replace with code or diff>
```
