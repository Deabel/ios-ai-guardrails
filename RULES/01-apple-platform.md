# Apple Platform Defaults

## 语言优先级

默认优先：

1. Swift
2. Objective-C（仅限既有模块、桥接边界、遗留代码）

新代码不要默认回退到 Objective-C，除非：

- 当前模块几乎全部是 Objective-C
- 需要与旧 SDK / 旧 runtime 约束保持一致
- 任务本身明确要求 Objective-C

## 平台框架优先级

### UI

- 新 UI 优先 SwiftUI
- 既有 UIKit 模块继续遵循 UIKit 风格
- 列表布局优先使用`UICompositionalLayout`和`UICollectionViewDiffableDataSource`
- 混合场景下优先最小侵入集成，而不是大改

### 异步

- 优先 Swift Concurrency
- Combine 仅在项目已经使用，或流式组合明显更合适时使用
- 不要为了“现代化”硬把简单回调链改成复杂流式管线

### 数据建模

- `Codable` 作为默认选择
- 只在确有必要时增加 DTO / Domain / ViewData 多层映射

## Apple 风格约束

- 命名清晰、自然、符合 Swift API Design Guidelines
- 优先值类型
- UI 更新与状态变更隔离清楚
- `@MainActor` 用于 UI 相关状态和接口
- 避免主线程阻塞型 I/O
