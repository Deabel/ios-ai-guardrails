# Dependency Injection

## Goals

Dependency injection (DI) enables unit testing, substitutability, and clear ownership. Choose the lightest approach that meets these goals.

## Injection Styles

### Constructor Injection (Default)

Pass dependencies as initializer parameters. Prefer this for ViewModels, Services, and Repositories.

```swift
final class FeedViewModel {
    private let feedService: FeedServiceProtocol
    private let analyticsService: AnalyticsServiceProtocol

    init(feedService: FeedServiceProtocol, analyticsService: AnalyticsServiceProtocol) {
        self.feedService = feedService
        self.analyticsService = analyticsService
    }
}
```

### Property Injection

Use only for optional dependencies that the object can function without, or for framework types that do not support initializer injection (e.g., `UIViewController` from a storyboard).

```swift
var logger: LoggerProtocol? // optional — the object works without it
```

### SwiftUI `@Environment` / `@EnvironmentObject`

Use for app-wide shared dependencies (theme, router, user session) that many views need but should not be passed through every layer.

```swift
// In the view hierarchy
.environmentObject(sessionStore)

// In a leaf view
@EnvironmentObject var sessionStore: SessionStore
```

Do not use `@EnvironmentObject` for ViewModel-level business dependencies — inject those into the ViewModel at construction.

## Dependency Count

More than **4 dependencies** in a single type is a smell. Consider:

- Splitting the type into two smaller types with focused responsibilities
- Introducing a facade service that wraps a subset of related dependencies
- Grouping related parameters into a configuration struct

## Protocol-Based Injection for Testing

Define protocol interfaces for any dependency that has side effects (network, disk, analytics, time). The production implementation and a test double both conform to the protocol.

```swift
protocol FeedServiceProtocol {
    func fetchItems() async throws -> [FeedItem]
}

// Production
final class FeedService: FeedServiceProtocol { ... }

// Test
final class MockFeedService: FeedServiceProtocol {
    var stubbedItems: [FeedItem] = []
    func fetchItems() async throws -> [FeedItem] { stubbedItems }
}
```

Pure value-computing functions with no side effects do not need a protocol — test them directly.

## Factory / Container Pattern

Use a factory or lightweight container only when:

- Object graphs are deep enough that manual wiring is error-prone
- The project already uses a DI container; do not introduce one just for a new feature

Avoid service locators (global `resolve<T>()`) — they hide dependencies and make testing harder.

## Where DI Lives

Construction of the object graph belongs at the **composition root**: app startup, scene setup, or the Coordinator that creates a screen. Never construct dependencies inside ViewModels or Views.
