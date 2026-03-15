# Persistence and Networking Rules

## Networking placement

Preferred path:

`ViewModel -> Service/Repository -> APIClient`

Avoid:

- `URLSession` directly inside view code
- multiple competing API clients in one feature
- DTO decoding inside UI types

## Persistence placement

Preferred path:

`ViewModel -> Repository/Store/Manager -> Database/UserDefaults`

Avoid:

- persistence writes in button handlers
- `UserDefaults.standard` scattered across the feature
- duplicated cache policies in multiple call sites

## Mapping

Prefer one clear mapping path:

- transport DTO
- domain model
- presentation model

Do not create three model layers for a tiny feature unless each layer actually carries distinct responsibilities.
