---
name: dead_code_detector
description: >
  Finds unreachable code paths, unused imports, orphan files, zombie features, and
  abandoned modules. Distinguishes between code that is truly dead vs code reachable
  only through dynamic dispatch. Reduces codebase noise and identifies features that
  were partially removed.
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: []
feeds_into: [test_quality_analyzer]
parallel_with: [error_handling_auditor]
allowed-tools:
  - Bash
  - Read
  - Grep
  - Glob
  - Write
---

# Dead Code Detector

## Purpose
Dead code is a trust signal — it means features were started and abandoned, or removed but not cleaned up. For a pre-launch product, dead code creates confusion for developers, inflates test counts with meaningless coverage, and can leak internal concepts to customers. This skill systematically finds it.

## When to Use
- Pre-launch codebase cleanup audit
- After major feature removal or rename
- When test counts seem inflated (tests covering dead code)
- When code review reveals files that "nobody touches"

## Workflow

### Step 1: Build Import/Reference Graph
```
Scan all Python files in apps/backend/:
  - Extract all import statements (import X, from X import Y)
  - Extract all function/class definitions
  - Build a dependency graph: who imports whom

For each module:
  - Incoming edges = other modules that import this one
  - Outgoing edges = modules this one imports
  - Flag ORPHAN if incoming edges == 0 AND not an entry point
```

### Step 2: Identify Entry Points
```
Mark known entry points (NOT dead even if no imports):
  - apps/backend/main.py (FastAPI app)
  - apps/backend/websocket_handler.py (Lambda handler)
  - apps/backend/lambda/*.py (Lambda handlers)
  - apps/backend/api/*.py (route files included by main.py)
  - conftest.py, test_*.py (test infrastructure)
  - CLI entry points
  - Celery/scheduler tasks
  - Migration scripts
```

### Step 3: Detect Orphan Files
```
Files with NO incoming references and NOT entry points:
  - Service classes never imported by any API route
  - Utility modules never imported anywhere
  - Model definitions not used by any service
  - Template files not referenced by any route

Severity:
  RED: Large files (>200 lines) with zero references
  ORANGE: Medium files (50-200 lines) with zero references
  YELLOW: Small utility files with zero references
```

### Step 4: Detect Unused Functions/Classes
```
For each function/class definition:
  - Is it called/instantiated anywhere outside its own file?
  - Is it in __all__ or exported?
  - Is it a test helper (used only in tests)?
  - Is it a protocol/abstract method that might be dynamically dispatched?

Flag UNUSED if never referenced outside its definition file
Exception: Methods starting with _ (private) only flagged if unused within same file
Exception: Methods matching framework patterns (e.g., FastAPI dependency injection)
```

### Step 5: Detect Zombie Features
```
Look for patterns indicating abandoned features:
  - Route files with all endpoints commented out
  - Service classes where all methods raise NotImplementedError
  - HTML templates not referenced by any route
  - Config keys referenced nowhere in code
  - Feature flags that are always False/disabled
  - Database tables with no read/write operations

Zombie features are worse than dead code — they suggest the product is incomplete.
```

### Step 6: Detect Unused Dependencies
```
For requirements.txt / package.json:
  - Parse all declared dependencies
  - Search codebase for import/require of each package
  - Flag UNUSED_DEPENDENCY if package is declared but never imported
  - Flag SHADOW_DEPENDENCY if package is imported but not declared
```

### Step 7: Dynamic Dispatch Analysis
```
Before flagging anything as dead, check for dynamic dispatch patterns:
  - getattr(obj, method_name) — might call methods by string
  - importlib.import_module() — might import modules by string
  - Plugin/registry patterns — might discover modules at runtime
  - FastAPI dependency injection — might inject without explicit import
  - Celery task discovery — might auto-discover task modules

Mark as POSSIBLY_DYNAMIC rather than DEAD if these patterns exist.
```

## Output Format

```markdown
# Dead Code Detection Report

## Summary
- Files scanned: X
- Orphan files (zero references): X
- Unused functions/classes: X
- Zombie features: X
- Unused dependencies: X

## Orphan Files (RED — no incoming references)
| # | File | Lines | Last Modified | Category |
|---|------|-------|---------------|----------|

## Zombie Features (RED — partially abandoned)
| # | Feature | Files | Evidence | Impact |
|---|---------|-------|----------|--------|

## Unused Functions/Classes (ORANGE)
| # | Definition | File:Line | Type |
|---|-----------|-----------|------|

## Unused Dependencies
| # | Package | Declared In | Never Imported |
|---|---------|-------------|----------------|

## Possibly Dynamic (Review Manually)
| # | Item | Reason for Uncertainty |
|---|------|----------------------|
```
