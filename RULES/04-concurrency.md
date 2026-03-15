# Concurrency

## 核心原则

优先使用 Swift 结构化并发。

### 优先选择

- `async/await`
- `Task {}`
- `withTaskGroup`
- `withThrowingTaskGroup`
- `actor`
- `@MainActor`

### 谨慎使用

- `Task.detached`
- GCD 与 Swift Concurrency 混搭
- 手写锁

## 重要认知

### 不要把 async 理解为“子线程函数”

`async` 表示挂起点与异步语义，不等于固定线程执行。

### 不要把 actor 理解为“后台线程对象”

actor 的核心是隔离，不是线程标签。

## 共享状态

有共享可变状态时，优先考虑：

- actor
- 明确所有权
- 单线程隔离模型

避免多个任务随意读写同一份可变数据。

## UI 更新

涉及 UI 或 ViewModel 中可观察状态时，优先明确 `@MainActor`。

## 取消

异步任务设计时要考虑：

- 是否需要取消
- 取消后资源是否会泄漏
- 结果是否可能回写到过期页面/对象

## 审查点

在 review 中重点看：

- 有没有主线程阻塞
- 有没有竞态条件
- 有没有过度 detached
- 有没有跨隔离误用
