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
