# Spec Governance

This spec repository is not a one-time artifact; it is an evolving engineering asset.

## Versioning Strategy

- Use semantic versioning: `MAJOR.MINOR.PATCH`.
- `PATCH`: wording fixes, example updates, no behavior change.
- `MINOR`: additive optional rules and stronger defaults.
- `MAJOR`: default behavior changes or incompatible updates.

## Minimum Change Proposal Content

Each rule update commit/PR should include: background problem, changed content, affected scope, migration guidance.

Use `templates/rule-change-commit-template.md` for the required format and examples.

## Compatibility Principles

- Prefer additive compatibility; avoid overturning working conventions.
- Breaking changes require a transition window and upgrade notes.
- Keep instruction semantics consistent across `AGENTS.md`, `PROMPTS/`, and `templates/`.

## Quality Maintenance

- After each upgrade, sample-validate at least three task types:
  - new feature generation
  - code review
  - bug fixing
- If frequent misuse appears, update examples/templates first, then add stricter rules if needed.
