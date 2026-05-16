# SwiftUI and UI Rules

## SwiftUI

### View Responsibilities

View should handle:

- UI declaration
- state binding
- forwarding user intent/events

View should not handle:

- direct networking
- direct persistence writes
- complex business reasoning

### State Wrapper Choice

Choose based on ownership:

- `@State`: lightweight local ownership
- `@Binding`: mutable binding from parent
- `@StateObject`: reference-type lifecycle owned by this view
- `@ObservedObject`: dependency injected from outside
- `@Environment` / `@EnvironmentObject`: environment-provided dependencies

### View Extraction

Extract subviews when it improves:

- reuse
- readability
- testing or preview value

Do not split views mechanically based only on `body` length.

## UIKit

### Keep ViewControllers Thin

Separate: `setupUI()`, `setupConstraints()`, `bindViewModel()`, `setupActions()`. No networking, database, complex mapping, or business rules in controllers.

**Lifecycle responsibilities:**
- `viewDidLoad`: UI setup, layout, initial ViewModel binding — runs once.
- `viewWillAppear` / `viewDidAppear`: refresh-on-return state, analytics impression events only.
- Never trigger network requests directly from lifecycle methods; delegate to the ViewModel.

### ViewModel Binding Patterns

**Closure-based (common):**

```swift
// ViewController owns the callback
viewModel.onStateChange = { [weak self] state in
    DispatchQueue.main.async { self?.render(state) }
}
```

**Delegation (when the ViewModel needs a richer contract):**

```swift
protocol FeedViewModelDelegate: AnyObject {
    func viewModel(_ vm: FeedViewModel, didLoad items: [FeedItem])
    func viewModel(_ vm: FeedViewModel, didFail error: Error)
}
// ViewController conforms; ViewModel holds `weak var delegate`
```

Prefer closure bindings for simple one-way updates. Use delegation when the ViewModel must call back on multiple distinct events.

### UICollectionView / UITableView Data Sources

Prefer `UICollectionViewDiffableDataSource` / `UITableViewDiffableDataSource` for list screens. Feed snapshots from the ViewModel; never compute diff logic inside the ViewController.

```swift
// ViewModel publishes snapshot
var snapshotPublisher: AnyPublisher<NSDiffableDataSourceSnapshot<Section, Item>, Never>

// ViewController applies it
viewModel.snapshotPublisher
    .receive(on: DispatchQueue.main)
    .sink { [weak self] snapshot in self?.dataSource.apply(snapshot) }
    .store(in: &cancellables)
```

### Custom UIView Extraction

**Extract a custom UIView subclass when:**
- the view is reused in 2+ places
- layout + configuration logic exceeds ~20 lines
- the view needs its own delegate or callback contract

**Do not extract** for single-use simple views. Prefer a private helper method first: `private func makeHeaderView() -> UIView`.

## Common UI Requirements

Most complete screens should consider:

- loading
- empty
- error
- success
- accessibility basics
- dynamic type and localization risks
