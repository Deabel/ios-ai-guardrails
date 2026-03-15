# AI Change Review Checklist

用于 PR 描述或代码评审，确保 AI 产出达到可上线标准。

## 1) 变更范围

- [ ] 明确本次改动范围（功能、模块、文件）
- [ ] 明确未覆盖范围（避免误解为“全量重构”）

## 2) 架构与分层

- [ ] View / ViewController 未引入业务逻辑
- [ ] ViewModel 未直接访问 Repository/Network（遵循项目规则）
- [ ] Service / Repository 边界清晰

## 3) 并发与线程安全

- [ ] UI 状态更新在 `@MainActor` 或等价安全上下文
- [ ] 无不必要 `Task.detached`
- [ ] 共享可变状态有清晰隔离模型（actor/单线程所有权）

## 4) 错误处理与稳定性

- [ ] 无 `try!`、无生产代码强制解包
- [ ] 无吞错型 `try?` / 空 `catch`
- [ ] 错误可观测（日志或上层可展示）

## 5) 安全与合规

- [ ] 无硬编码密钥/凭证
- [ ] 无 PII 或 token 日志泄露
- [ ] 敏感数据使用正确存储（如 Keychain）

## 6) 验证与风险

- [ ] 已说明验证方式（编译/测试/手测）
- [ ] 已标注风险等级（Low / Medium / High）
- [ ] 若为中高风险，已给出迁移或回滚说明
