# Core Principles

## Goal

AI-generated code must prioritize:

- readability
- maintainability
- verifiability
- consistency with the existing project
- usefulness for real product work

Do not optimize for code that only "looks advanced." It often adds ceremony without real value.

## Required Checks Before Generating Code

1. Determine whether the task is an incremental change or a new module.
2. Identify existing patterns (MVVM, Coordinator, Service, Store, Manager, etc.).
3. Reuse established patterns before introducing a new architecture.
4. If context is incomplete, state assumptions explicitly.

## Core Decision Principles

### Principle 1: Fit the Existing Project

This takes priority over "theoretically optimal" design.

### Principle 2: Small Changes

If one file can solve it, do not split it into eight.

### Principle 3: Make Important Things Explicit

Do not hide critical state, errors, or concurrency/isolation boundaries.

### Principle 4: Every Abstraction Needs a Consumer

Do not add protocols, base classes, or adapters without clear reuse demand.

### Principle 5: Do Not Invent

Do not fabricate:

- API
- framework capability
- internal module
- target name
- build command
- network schema

## Recommended Response Structure

When the AI provides a solution, prefer this structure:

1. Brief assessment
2. Recommended approach
3. Complete code/patch
4. Call-site impact summary
5. Test points
