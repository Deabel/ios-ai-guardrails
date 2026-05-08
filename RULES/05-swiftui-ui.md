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

Prefer separating:

- `setupUI()`
- `setupConstraints()`
- `bindViewModel()`
- `setupActions()`

### Avoid Massive ViewControllers

Networking, database operations, complex mapping, and business rules should not live directly in controllers.

## Common UI Requirements

Most complete screens should consider:

- loading
- empty
- error
- success
- accessibility basics
- dynamic type and localization risks
