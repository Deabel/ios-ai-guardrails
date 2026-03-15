# Audit Guardrails Repository

Audit this spec repository based on `AGENTS.md` and `RULES/`.
The goal is to find rules that are readable but not actionable, then propose practical improvements.

Output format:

1. Key issues (ordered by severity)
2. Associated risks (incorrect code, architecture drift, concurrency risks, compliance risks)
3. Smallest patch-level improvements (file-level)
4. Missing templates/examples (for example, PR checklist, migration guide, risk tiers)
5. Recommended next version (with rationale)

Audit requirements:

- Do not rewrite the entire spec; prioritize incremental improvements.
- Findings must point to specific files, not abstract suggestions only.
- If conflicts exist, follow `AGENTS.md` and explicitly note the conflict points.
