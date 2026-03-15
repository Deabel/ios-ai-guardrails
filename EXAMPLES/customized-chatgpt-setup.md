# Customized ChatGPT Setup

1. Open ChatGPT custom instructions.
2. Paste the contents of `templates/chatgpt-custom-instructions.txt`.
3. Keep project-specific rules in your current conversation or append them from `AGENTS.md`.
4. For bigger tasks, start with a prompt from `PROMPTS/`.

Example starter prompt:

```text
Follow AGENTS.md from my iOS guardrails.

Task:
Refactor this ViewModel so that networking leaves the UI layer and persistence is centralized.

Constraints:
- preserve public API
- prefer async/await
- keep patch minimal
- include tests for new logic where reasonable
```
