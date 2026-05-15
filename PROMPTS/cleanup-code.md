# Cleanup Code Prompt

Core rules: `AGENTS-CORE.md`
Task-specific rules: `RULES/13-agent-behavior.md`

This is a **Cleanup** task.

Remove dead code, unused files, or redundant abstractions from the provided code.

Constraints:
- Preserve all observable behavior.
- Do not refactor or rename beyond the cleanup scope.
- Do not introduce new abstractions.
- Flag any deletion that might seem risky or require caller updates.

Return:
1. What was removed and why
2. Deletions that require call-site updates
3. Items that look dead but were left because intent is unclear

---

Code or file list:

```swift
<replace with code or file paths>
```
