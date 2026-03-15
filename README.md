# iOS AI Guardrails v5

一套面向 iOS / Swift / SwiftUI / Xcode 的 AI 代码生成规范仓库，适用于：

- ChatGPT
- Claude
- Xcode Codex
- Claude Agent

## 目标

让 AI 生成代码时遵守统一的工程规则，而不是每次靠 prompt 碰运气。

## 主要技术栈

- Swift
- SwiftUI
- MVVM
- Swift Structured Concurrency (`async/await`)

## 目录结构

- `AGENTS.md`：主入口
- `RULE_INDEX.md`：规则索引
- `RULES/`：规则正文
- `ANTI_PATTERNS/`：反模式
- `TEMPLATES/`：模板
- `EXAMPLES/`：示例
- `WORKFLOWS/`：AI 工作流
- `CHECKS/`：生成前后检查
- `PROMPTS/`：辅助提示

## 在 ChatGPT 中使用

把下面内容放到 Custom Instructions：

Follow iOS AI coding rules:
https://raw.githubusercontent.com/<yourname>/ios-ai-guardrails/main/AGENTS.md

## 在 Xcode Codex 中使用

创建：

~/.codex/AGENTS.md

内容：

Load global iOS AI rules:
https://raw.githubusercontent.com/<yourname>/ios-ai-guardrails/main/AGENTS.md

## 上传 GitHub

```bash
git init
git add .
git commit -m "Add iOS AI Guardrails v5"
git branch -M main
git remote add origin https://github.com/<yourname>/ios-ai-guardrails.git
git push -u origin main
```
