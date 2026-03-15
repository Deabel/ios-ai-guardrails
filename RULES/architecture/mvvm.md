# MVVM

Use MVVM as the default application architecture.

- `View`: renders UI only
- `ViewModel`: owns view state and presentation logic
- `Service`: performs remote operations
- `Repository`: abstracts persistence or data sources

Do not collapse all responsibilities into `ViewModel`.
