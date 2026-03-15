# Spec Governance

This spec repository is not a one-time artifact; it is an evolving engineering asset.

## Versioning Strategy

- Use semantic versioning: `MAJOR.MINOR.PATCH`.
- `PATCH`: wording fixes, example updates, no behavior change.
- `MINOR`: additive optional rules and stronger defaults.
- `MAJOR`: default behavior changes or incompatible updates.

## Minimum Change Proposal Content

Each rule update PR should include:

- background problem (why this change)
- new rule content (what changed)
- affected scope (which prompts/tools/teams are impacted)
- migration guidance (whether calling patterns/templates/examples must change)

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
