# SwiftUI and UI Rules

## SwiftUI

### 视图职责

View 负责：

- 描述 UI
- 绑定状态
- 转发用户事件

View 不负责：

- 直接访问网络
- 直接写持久化
- 承担复杂业务推导

### 状态选择

按所有权选择：

- `@State`：本地拥有且轻量
- `@Binding`：父层传入可变绑定
- `@StateObject`：本视图拥有引用类型生命周期
- `@ObservedObject`：外部注入
- `@Environment` / `@EnvironmentObject`：环境依赖

### 视图拆分

提取子视图的理由应该是：

- 复用
- 可读性
- 单元测试或预览价值

不要只因为 `body` 看起来长就机械拆分成一堆名字空洞的小 View。

## UIKit

### ViewController 要瘦

优先拆出：

- `setupUI()`
- `setupConstraints()`
- `bindViewModel()`
- `setupActions()`

### 避免 Massive ViewController

网络、数据库、复杂 mapping、业务规则都不应该直接塞在控制器里。

## UI 通用要求

任何较完整页面都应考虑：

- loading
- empty
- error
- success
- accessibility basics
- dynamic type / localization 风险
