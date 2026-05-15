# Apple API Design Guidelines

Reference: https://www.swift.org/documentation/api-design-guidelines/

## Naming

**Clarity at the call site takes priority over brevity.**

### Types and Protocols

- Types, enums, typealiases → `UpperCamelCase`
- Protocols describing what something **is** → noun (`Collection`, `Iterator`, `Sequence`)
- Protocols describing **capability** → `-able` / `-ible` / `-ing` (`Equatable`, `Hashable`, `Formatting`)

### Methods and Properties

- Methods with side effects → imperative verb (`insert`, `remove`, `sort`)
- Non-mutating counterpart → past participle or `-ing` (`sorted`, `filtering`)
- Boolean properties → read as assertions: `isEmpty`, `isLoading`, `hasMore`, `canRetry`
- Factory methods → `static func make...() -> Self` or `static func (...) -> Self`

### Argument Labels

- Omit when the role is obvious from context: `x.insert(y)`
- Include when clarifying role: `x.insert(y, at: idx)`
- Never repeat the type name in a label: `func remove(member: Element)` ✗ → `func remove(_ member: Element)` ✓

### Abbreviations

- Use only universally established abbreviations: `URL`, `ID`, `HTTP`, `API`
- Never invent abbreviations: `mgr` ✗, `btn` ✗, `vc` ✗ → `manager`, `button`, `viewController`

## Code Formatting

- **Indentation:** 4 spaces; no tabs (Xcode default)
- **Braces:** opening brace on the same line (Kernighan style)
- **Line length:** soft limit 100 chars; hard limit 120 chars
- **Long argument lists:** one argument per line, aligned under the opening parenthesis
- **Blank lines:** one blank line between method definitions; no trailing blank lines

## Extension Organization

Group by logical concern using `// MARK: -`:

```swift
// MARK: - UITableViewDataSource
// MARK: - Private Helpers
```

Put non-trivial protocol conformances in a separate extension.

## Access Control

- Always explicit for non-trivial types and their members
- Prefer `private`; escalate only when consumed externally
- Order: `private` → `fileprivate` → `internal` → `public` → `open`

## Documentation Comments (DocC)

**Add doc comments for:** all `public` and `open` declarations; internal API with non-obvious preconditions; complex algorithms or data invariants.

**Format:**
```swift
/// Brief one-line description.
///
/// Extended explanation when needed.
///
/// - Parameters:
///   - x: What x represents.
/// - Returns: What the return value represents.
/// - Throws: When and why this throws.
```

**Do not add doc comments for:** trivial getters/setters, obvious init parameters, private helpers called in one place.

## Apple Architecture Idioms

### Delegation Pattern
- Protocol named `<Type>Delegate` or `<Type>DataSource`
- Delegate property is always `weak`: `weak var delegate: MyDelegate?`
- First parameter of every delegate method is the sender object

### Target-Action (UIKit)
- `@objc` action methods end with a colon when they take a sender:
  `@objc func didTapButton(_ sender: UIButton)`

### Async Completion Handlers
- Use `Result<T, Error>` for failable async work
- Completion must be called exactly once on all paths
- Document which queue the completion is called on

### SwiftUI Modifier Chains
- Each modifier on its own line when the chain has 3+ modifiers
- Extract repeated modifier groups to a `ViewModifier`

### Initializer Patterns
- Let Swift synthesize memberwise init when possible
- Use `static func make...()` for complex factory setup
- UIKit setup: `private func configureTableView()` pattern; call from `viewDidLoad`
