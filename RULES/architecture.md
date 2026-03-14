# Architecture

Architecture: MVVM

Layers:

View
SwiftUI UI rendering only.

ViewModel
State management and UI logic.

Service
Networking and remote access.

Repository
Data abstraction.

Rules:
ViewModel must not access URLSession directly.
Networking belongs to Service layer.