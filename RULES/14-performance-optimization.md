# Performance Optimization

## When to Optimize

Do not optimize speculatively. Investigate only when:

- A user-facing frame drop or jank is observable (target: 60 fps / 16 ms per frame)
- Memory footprint grows continuously without a ceiling (instrument with Allocations)
- Battery drain is significantly above baseline for the feature's workload
- A CI benchmark regresses by more than 10%

Profile with Instruments before changing anything. Guessing wastes time and introduces bugs.

## Main Thread

- Never perform synchronous I/O, network calls, JSON decoding, or disk reads on the main thread.
- Keep `body` computation in SwiftUI and `layoutSubviews` in UIKit lightweight — no heavy computation inside these paths.
- Use `Task { }` or `DispatchQueue.global()` to move CPU-bound work off the main thread, then update UI on `@MainActor`.

## Lists and Scroll Performance

- Prefer `List` with `LazyVStack` or `UICollectionViewDiffableDataSource` — avoid `ForEach` over large static arrays in a non-lazy container.
- Keep cell `body` / `cellForItemAt` fast: no synchronous image decoding, no `DateFormatter` allocation per cell.
- Reuse `DateFormatter`, `NumberFormatter`, and `JSONDecoder` — these are expensive to allocate.
- Prefetch images asynchronously; display a placeholder until the image is ready.

## Image Handling

- Decode images at the display size, not the full resolution. Use `UIImage(data:scale:)` or a downsampling routine for large assets.
- Cache decoded `UIImage` objects at the display size — not the raw `Data`.
- Release image caches when the app receives a memory warning (`UIApplication.didReceiveMemoryWarningNotification`).

## Memory

- Avoid retaining large collections or decoded models longer than their screen lives.
- Use `weak` references in closures and delegates to prevent retain cycles.
- Profile with the Leaks and Allocations instruments before shipping any screen with continuous data ingestion (feeds, real-time updates).

## Database and Persistence

- Run all Core Data / SQLite fetch requests off the main context. Use a background context and merge changes.
- Fetch only the attributes and relationships you display — avoid over-fetching.
- Index columns that appear in `WHERE` / `SORT BY` clauses on large tables.

## Networking

- Compress request/response payloads where the API supports it (gzip, Brotli).
- Batch small requests where the API supports it.
- Cancel in-flight requests when the initiating view disappears.

## Review Checklist

Before shipping a performance-sensitive change:

- No synchronous I/O or heavy computation on the main thread
- Lists use lazy containers or diffable data sources
- Images are decoded and cached at display size
- No `DateFormatter` / `NumberFormatter` allocated per cell or per render pass
- Memory leak check run with Instruments for any screen with streaming data
