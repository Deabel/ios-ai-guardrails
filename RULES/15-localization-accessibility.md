# Localization and Accessibility

## Localization

### String Externalization

All user-visible strings must go through the localization system — never hardcode display text.

**iOS 16+ (preferred):**

```swift
Text("welcome_message", comment: "Shown on the home screen after login")
label.text = String(localized: "welcome_message", comment: "...")
```

**iOS 15 and earlier:**

```swift
NSLocalizedString("welcome_message", comment: "Shown on the home screen after login")
```

Do not concatenate localized strings with string interpolation. Use format strings with named arguments where word order may differ across languages:

```swift
// Wrong — word order breaks in some languages
"\(user.name) has \(count) items"

// Correct
String(localized: "user_item_count \(user.name) \(count)")
// Strings file: "user_item_count %@ %lld" = "%@ has %lld items";
```

### Pluralization

Use `.stringsdict` (classic) or `String(localized:)` with `.init(_:defaultValue:table:bundle:locale:comment:)` and `%#@variable@` substitution. Do not write `count == 1 ? "item" : "items"` in code.

### RTL Layout

- Use Auto Layout with leading/trailing constraints — never left/right.
- Flip directional assets with `imageFlippedForRightToLeftLayoutDirection()`.
- Test in the iOS Simulator with Language set to Arabic or Hebrew.

### Number and Date Formatting

- Always use `NumberFormatter` or `DateFormatter` configured with the user's current locale.
- Never format numbers or dates with string interpolation alone.

---

## Accessibility

### Required Attributes

Every interactive element must have a meaningful `accessibilityLabel`. Custom views that are not standard controls must also set `accessibilityTraits`.

| Attribute | When to set |
|-----------|-------------|
| `accessibilityLabel` | Any non-self-describing element (icon-only button, image, custom view) |
| `accessibilityHint` | When the action's outcome is not obvious from the label |
| `accessibilityTraits` | Custom interactive views (`.button`, `.link`, `.header`, `.selected`) |
| `accessibilityValue` | Stateful controls (slider value, toggle state if non-standard) |

### Dynamic Type

- Use `UIFont.preferredFont(forTextStyle:)` or SwiftUI `Font` text styles — never hardcode point sizes.
- Test with the largest Accessibility text size. All text must remain readable and not clip.
- Use `adjustsFontForContentSizeCategory = true` on `UILabel` and `UITextView`.

### Minimum Touch Targets

Interactive elements should be at least **44 × 44 pt**. Use `contentEdgeInsets` or a transparent tap area extension if the visual size is smaller.

### VoiceOver

- Verify screen reading order with VoiceOver enabled. Container views may need `accessibilityElements` to control traversal order.
- Group related labels so VoiceOver reads them as a unit: set `isAccessibilityElement = true` on the container and `isAccessibilityElement = false` on children.
- Avoid reading purely decorative images: set `isAccessibilityElement = false` or `accessibilityLabel = ""`.

### Review Checklist

- All interactive elements have `accessibilityLabel`
- No hardcoded font sizes — uses text styles
- Layout uses leading/trailing, not left/right
- User-visible strings go through localization system
- Plurals handled with `.stringsdict` or locale-aware API
- Tested with VoiceOver for primary user paths
