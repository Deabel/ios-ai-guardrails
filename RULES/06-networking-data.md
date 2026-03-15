# Networking and Data

## Networking

### 规则

- 优先复用现有 APIClient / NetworkService
- 检查 HTTP 状态码
- 区分传输错误、业务错误、解码错误
- decode 到明确模型，不要到处 `[String: Any]`

### 避免

- 页面里直接拼 URLSession 请求
- 一次请求链条里散落多处 JSON 解析
- 无上下文错误日志

## UserDefaults

UserDefaults 适合：

- 轻量配置
- 用户偏好
- 简单开关
- 小体积缓存标记

不适合：

- 复杂对象仓储
- 核心业务数据存储
- 到处随手写

建议：

- 集中封装
- typed key
- 明确默认值策略

## 数据库

数据库访问放在 store / repository / manager 等边界中。

不要让 UI 层知道表结构或底层 query 细节。

## 映射策略

优先简单清晰：

- DTO：网络传输模型
- Domain：业务模型（必要时）
- ViewData：视图专属展示模型（必要时）

如果三层映射并没有带来边界收益，就不要机械上齐。
