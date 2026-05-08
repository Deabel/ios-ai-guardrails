# Agent Behavior Protocol

Use this protocol to make AI behavior predictable, auditable, and easy for humans to steer.

## Task Classification First

Before changing code, classify the task:

- `Answer`: explain existing behavior or tradeoffs without editing files.
- `Review`: identify risks, bugs, regressions, and missing tests.
- `Debug`: reproduce or trace a problem, then propose the smallest fix.
- `Generate`: add new code that fits existing project patterns.
- `Refactor`: improve structure while preserving behavior.
- `Cleanup`: remove dead code, unused files, or redundant abstractions.

The classification does not need to be verbose, but it should guide how much context to inspect and whether code should be changed.

## Context Before Action

For non-trivial code changes, inspect local context before proposing or applying a patch:

- identify the files, modules, and call sites involved
- find existing naming, dependency injection, routing, logging, localization, and design-system patterns
- check whether the project already has an equivalent component, helper, service, repository, or extension
- avoid generating full code against assumed APIs, target names, schemas, or product behavior

If the task is a small local edit, keep the context pass small. Do not turn a simple fix into a broad audit.

## Asking Questions vs Making Assumptions

Ask before acting when the answer changes architecture, data ownership, user-visible behavior, privacy posture, persistence format, API contracts, or migration cost.

Make a reasonable assumption and continue when:

- the choice is local and low risk
- the project context strongly implies the answer
- stopping would create more friction than value

When making assumptions, state them in the final response. Do not ask placeholder questions that the codebase can answer.

## Confusion and Conflict Handling

When instructions, code, or observed behavior conflict:

- follow the instruction priority defined in `AGENTS.md`
- state the conflict in concrete terms
- prefer the smallest reversible path
- pause for confirmation if continuing could cause broad rewrites, data loss, security exposure, or API breakage

If unexpected repository changes appear while working, do not revert them automatically. Treat them as human-owned unless explicitly told otherwise.

## Scope Control

Default to narrow, shippable changes:

- do not rename broadly unless the task is a rename or refactor
- do not introduce a new architecture layer without a demonstrated consumer
- do not replace established project conventions with generic sample-code conventions
- do not fix unrelated issues discovered during the task unless they block the requested change

If a nearby issue is important but out of scope, mention it as a follow-up instead of silently expanding the patch.

## Progress Updates

For multi-step tasks, provide short progress updates when useful:

- what context was inspected
- what decision was made
- what is being changed next
- what is blocked or uncertain

Do not flood the user with implementation noise. Updates should reduce uncertainty, not narrate every command.

## Verification Discipline

Before finalizing a non-trivial change:

- run the most relevant available verification, or explain why it was not run
- distinguish compile plausibility from an actual successful build
- identify test coverage added, updated, missing, or intentionally omitted
- call out residual risks in concrete terms

If verification fails, report the failure and the likely next debugging step instead of presenting the patch as complete.

## Final Response Contract

For non-trivial code changes, include:

1. `Scope`: what changed and what intentionally did not change
2. `Verification`: commands or checks run, and anything not run
3. `Risk`: compile, concurrency, migration, regression, and compliance risks as applicable
4. `Follow-up`: only required next actions, not generic suggestions

For reviews, findings come first and are ordered by severity. For simple answers, keep the response concise.
