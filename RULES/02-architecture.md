# Architecture

## 默认分层

推荐默认分层：

- View / ViewController：负责显示与事件转发
- ViewModel / Presenter：负责视图状态和交互编排
- Service / UseCase：负责业务逻辑
- Repository / Store：负责数据来源整合与持久化访问
- Client：负责网络 / 数据库 / 三方 SDK 原始调用

## 规则

### UI 层禁止事项

不要在 View / ViewController 中直接：

- 发网络请求
- 读写数据库
- 写复杂业务判断
- 散落式访问 UserDefaults

### ViewModel 层职责

适合放在 ViewModel 的内容：

- 加载状态管理
- 视图可消费的数据转换
- 用户操作触发的流程编排
- 调用 service / repository

不适合放在 ViewModel 的内容：

- 原始网络细节
- 底层存储读写细节
- 与 UI 完全无关的业务核心逻辑

### Service / UseCase 层职责

适合放：

- 业务规则
- 组合多个数据源
- 权限判断
- 可复用流程逻辑

### Repository / Store 层职责

适合放：

- API + Cache + DB 的统一访问
- 单一数据域的读写封装
- 领域数据查询

## 不要为了形式主义增加层数

以下场景不必硬拆 Repository：

- 简单页面只调用一个明确的 APIClient 接口
- 该逻辑没有复用价值
- 引入中间层只会增加跳转成本

## 决策模板

新增一层前，先回答：

1. 这层解决了什么真实问题？
2. 没有它会具体痛在哪里？
3. 它会被复用吗？
4. 它会让测试更简单还是更绕？
