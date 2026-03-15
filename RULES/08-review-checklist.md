# Review Checklist

Before submitting AI-generated code, check the items below.

## Architecture

- Does it follow existing project patterns?
- Is the UI layer still thin enough?
- Did it introduce unnecessary layers?

## Swift Style

- Are names clear?
- Is nesting depth reasonable?
- Is there force-unwrap risk?

## Concurrency

- Is there main-thread blocking?
- Are there data races on shared mutable state?
- Is `Task.detached` overused?

## Data and Error Handling

- Are errors handled explicitly?
- Are there silent failures?
- Are networking/persistence concerns in the correct layer?

## UI

- Does it cover loading/empty/error states?
- Are there obvious accessibility or localization risks?

## Testing

- Are additional tests needed?
- Are regression points documented?

## Delivery

- Is debug residue removed?
- Does it impact callers?
- Are migration notes needed?
