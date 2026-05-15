# Rule Change Commit Template

Use this format for commits that change `AGENTS.md`, `AGENTS-CORE.md`, or any `RULES/` file.

```
<type>(rules): <short description of rule change>

Background: <why this change — what problem was observed or what prompted the update>
Changed: <which file(s) and what rule content changed>
Scope: <which PROMPTS/, templates/, AI tools, or teams are affected>
Migration: <whether existing usage needs to change, or "no migration required">
```

## Examples

```
feat(rules): add Coordinator pattern navigation guidance

Background: AI agents were generating direct push navigation inside ViewControllers
  in UIKit projects that already had a Coordinator layer, bypassing the routing contract.
Changed: RULES/02-architecture.md — added "Navigation and Coordination" section.
Scope: Affects Generate and Refactor tasks for UIKit projects with Coordinator pattern.
Migration: No migration required; additive rule.
```

```
fix(rules): clarify non-trivial test requirement definition

Background: "non-trivial" was undefined; agents were inconsistently deciding
  whether to add tests for single-branch logic.
Changed: RULES/07-testing-debugging.md — added "Triviality Definition" subsection.
Scope: All Generate tasks that produce new Swift logic. AGENTS.md §10 updated with pointer.
Migration: No migration required.
```

```
feat(rules): add three-tier privacy boundary classification

Background: Compliance trigger conditions were vague; agents were not blocking
  on Tier 2 regulated-domain flows before finalizing implementation.
Changed: RULES/10-security-compliance.md — added "Privacy Boundary Classification" section.
         AGENTS.md §14 — added Tier 0/1/2 summary and pointer.
         AGENTS-CORE.md — added Privacy Quick Check section.
Scope: All tasks involving data collection, uploads, or third-party integrations.
Migration: Teams should review existing features involving HKHealthStore, payments,
  or under-13 users against the new Tier 2 trigger list.
```
