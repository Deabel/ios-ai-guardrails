# Repository Guide

本文档说明本仓库中每个目录和每个文件的作用与工作原理。  
说明范围：项目内容文件；不展开 `.git/` 内部对象与系统临时文件（如 `.DS_Store`）。

## 读取优先级（减少上下文丢失）

当 AI 工具无法在单次会话中稳定加载全仓库时，建议先读取以下“强约束最小集合”：

1. `AGENTS.md`
2. `RULES/13-agent-behavior.md`
3. `RULES/11-quality-gates.md`
4. `RULES/10-security-compliance.md`

其余 `RULES/`、`PROMPTS/`、`templates/`、`examples/` 作为扩展说明与复用素材，不应覆盖以上四项。

## 根目录文件

- `AGENTS.md`：仓库主规范（单一事实来源）。定义 AI 代码生成/评审的核心原则、分层边界、并发、测试、合规、质量门禁与治理优先级。
- `CHATGPT.md`：ChatGPT 使用的精简规则包。工作原理是把 `AGENTS.md` 的关键约束压缩成可直接粘贴的指令。
- `CLAUDE.md`：Claude 入口规则。工作原理是“轻量引导 + 指向 `AGENTS.md`”。
- `CODEX.md`：Codex 入口规则。补充 Codex 工作流约束（如最小补丁、避免无关改动）。
- `README.md`：仓库介绍与快速上手。说明目标、目录结构、接入流程与升级内容。
- `REPOSITORY_GUIDE.md`：本文件。用于降低仓库理解成本，便于团队维护和二次定制。
- `LICENSE`：MIT 许可证文件，定义使用、分发和免责边界。
- `VERSION`：规范版本号，作为规则治理和升级追踪锚点。

## 目录：`RULES/`

目录作用：规则深度文档库。  
工作原理：`AGENTS.md` 定义主规则，`RULES/` 提供可展开的专题解释与执行细则。

- `RULES/00-core-principles.md`：核心理念与决策顺序（先贴合项目、再最小改动）。
- `RULES/01-apple-platform.md`：Apple 平台默认技术选型与风格优先级。
- `RULES/01-ios-workflow.md`：iOS 任务执行节奏（理解上下文、窄改动、补测试）。
- `RULES/02-architecture.md`：分层职责与禁区（UI/ViewModel/Service/Repository）。
- `RULES/02-mvvm-boundaries.md`：MVVM 边界细化，强调各层 allowed/not allowed。
- `RULES/03-swift-style.md`：Swift 命名、可选值处理、错误处理、注释策略。
- `RULES/04-concurrency.md`：结构化并发基础规则（`async/await`、actor、`@MainActor`）。
- `RULES/04-concurrency-deep-dive.md`：并发心智模型与审查启发式（取消、状态所有权等）。
- `RULES/05-swiftui-ui.md`：SwiftUI/UIKit UI 层职责与状态管理建议。
- `RULES/06-networking-data.md`：网络、数据映射、UserDefaults 与数据库边界。
- `RULES/06-persistence-networking.md`：持久化与网络放置路径的简明版约束。
- `RULES/07-testing-debugging.md`：测试覆盖建议与问题排查输出结构。
- `RULES/08-review-checklist.md`：提交前审查清单（架构/并发/错误/测试/交付）。
- `RULES/09-team-output-style.md`：AI 输出格式与注释风格约束。
- `RULES/10-security-compliance.md`：安全与合规基线（密钥、PII、权限、依赖）。
- `RULES/11-quality-gates.md`：质量门禁与风险分级（Low/Medium/High）。
- `RULES/12-spec-governance.md`：规范治理机制（语义化版本、变更提案、兼容策略）。
- `RULES/13-agent-behavior.md`：AI agent 行为协议，定义任务分类、动手前上下文检查、何时询问、范围控制、执行反馈与最终验收输出。

## 目录：`PROMPTS/`

目录作用：可复用任务提示词模板。  
工作原理：通过标准化输入结构，减少 AI 输出波动，提升任务一致性。

- `PROMPTS/generate-code.md`：通用生成代码模板，强调最小可落地改动。
- `PROMPTS/generate-ios-feature.md`：iOS 功能开发模板，聚焦架构适配与测试影响。
- `PROMPTS/refactor-code.md`：局部重构模板，要求保行为、控范围、给迁移说明。
- `PROMPTS/refactor-ios-module.md`：模块级重构模板，强调 API 稳定与风险说明。
- `PROMPTS/review-code.md`：代码审查模板，聚焦正确性/并发/可维护性。
- `PROMPTS/review-ios-pr.md`：PR 审查模板，输出按严重级分层。
- `PROMPTS/debug-issue.md`：问题定位模板，要求根因概率和最小修复路径。
- `PROMPTS/write-tests.md`：测试生成模板，覆盖 happy/failure/edge。
- `PROMPTS/audit-guardrails.md`：规范仓库体检模板，用于发现“可读但不可执行”的规则。

## 目录：`templates/`

目录作用：可直接粘贴或复制的配置模板。  
工作原理：降低接入门槛，把常见配置变成“拿来即用”。

- `templates/chatgpt-custom-instructions.txt`：ChatGPT 自定义指令文本模板。
- `templates/project-addendum-example.md`：`AGENTS.md` 本地附录示例（团队定制规则）。
- `templates/ai-change-review-checklist.md`：AI 变更评审清单模板（可贴 PR 描述）。

### 子目录：`templates/.codex/`

子目录作用：Codex 本地配置示例模板。  
工作原理：提供默认规则与 override 规则示例，便于个人全局配置。

- `templates/.codex/AGENTS.md`：个人全局 Codex 规则示例（温和默认值）。
- `templates/.codex/AGENTS.override.md`：覆盖规则示例（更强本地约束）。

## 目录：`examples/`

目录作用：多工具使用示例。  
工作原理：用“可复制场景”演示如何把规范接入日常任务。

- `examples/chatgpt-custom-instructions-example.md`：ChatGPT 指令增强示例。
- `examples/customized-chatgpt-setup.md`：ChatGPT 从 0 到 1 配置流程示例。
- `examples/claude-project-example.md`：Claude 项目级接入示例。
- `examples/codex-project-root-example.md`：Codex 项目根目录放置规范示例。
- `examples/codex-task-example.md`：Codex 实际任务输入示例（功能开发/重构）。

## 目录：`scripts/`

目录作用：安装与输出辅助脚本。  
工作原理：通过 shell 脚本把规则快速复制到目标位置或直接输出内容。

- `scripts/install-codex-global.sh`：把 `AGENTS.md` 安装到 `~/.codex/AGENTS.md`。
- `scripts/install-project-agents.sh`：把 `AGENTS.md` 安装到指定项目目录。
- `scripts/print-chatgpt-snippet.sh`：打印 `CHATGPT.md`，便于复制到 ChatGPT 配置。
- `scripts/sync-agent-configs.sh`：同步仓库规范到 Codex/Claude 目标配置文件，支持 dry-run 与自定义目标路径。
- `scripts/install-post-commit-sync-hook.sh`：安装 Git `post-commit` 钩子，提交成功后自动触发规范同步。
