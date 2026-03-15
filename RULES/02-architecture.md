# Architecture

## Default Layers

Recommended default layers:

- View / ViewController: rendering and event forwarding
- ViewModel / Presenter: presentation state and interaction orchestration
- Service / UseCase: business logic
- Repository / Store: data-source integration and persistence access
- Client: low-level network/database/third-party SDK calls

## Rules

### UI Layer Prohibitions

Do not do these directly in View / ViewController:

- network calls
- database reads/writes
- complex business decision logic
- scattered `UserDefaults` access

### ViewModel Responsibilities

Good fit for ViewModel:

- loading-state management
- presentation data mapping
- orchestration triggered by user actions
- calling service/repository

Not a good fit for ViewModel:

- raw networking details
- low-level persistence read/write details
- core business logic unrelated to UI presentation

### Service / UseCase Responsibilities

Good fit:

- business rules
- orchestration across multiple data sources
- permission/authorization decisions
- reusable workflow logic

### Repository / Store Responsibilities

Good fit:

- unified API + cache + DB access
- read/write encapsulation for a single data domain
- domain-oriented data queries

## Do Not Add Layers for Ceremony

You usually do not need a separate Repository when:

- a simple screen calls one clear APIClient endpoint
- the logic has no reuse value
- an extra layer only adds indirection cost

## Decision Template

Before adding a new layer, answer:

1. What real problem does this layer solve?
2. What specific pain exists without it?
3. Will it actually be reused?
4. Does it simplify testing or make it more complex?
