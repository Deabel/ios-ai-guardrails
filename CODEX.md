# Codex iOS Rules v6.2 Custom

Always follow `AGENTS.md` first.

Additional rules for Codex:

- classify the task before acting: answer, review, debug, generate, refactor, or cleanup
- inspect nearby files before creating new abstractions
- ask before acting on high-impact choices such as architecture, persistence, privacy, API contracts, or migration cost
- prefer editing existing files over adding new files unless a new type is clearly justified
- preserve public APIs unless the task explicitly allows changing them
- preserve existing architecture and dependency boundaries
- do not rename symbols broadly unless the task is specifically a refactor
- avoid touching unrelated formatting in the same patch
- before finishing, mentally verify build impact, concurrency impact, and likely test impact
- when making assumptions, state them in the final response
- provide code that is copyable and easy to land in Xcode projects
