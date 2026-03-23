---
name: error_handling_auditor
description: >
  Audits error handling quality across the codebase. Finds bare except blocks, swallowed
  errors, user-facing stack traces, unhelpful error messages, missing error boundaries,
  and inconsistent error response formats. Tests what happens when things break.
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: []
feeds_into: [test_quality_analyzer]
parallel_with: [dead_code_detector, data_flow_tracer]
allowed-tools:
  - Bash
  - Read
  - Grep
  - Glob
  - Write
---

# Error Handling Auditor

## Purpose
The 574 bare `except Exception:` handlers in Workweaver are a symptom, not the disease. The real question is: when things go wrong, does the system degrade gracefully or silently corrupt? Does the user get a helpful message or a stack trace? This skill audits error handling quality at every layer.

## When to Use
- Pre-launch error resilience audit
- After the audit flagged 574 bare exception handlers
- When users report "something went wrong" with no details
- When debugging reveals silently swallowed errors

## Workflow

### Step 1: Classify Exception Handlers
```
Scan all Python files for try/except blocks. Classify each:

BARE_CATCH:     except Exception: or except: (catches everything)
TYPED_CATCH:    except SpecificError: (catches specific errors)
LOGGED_CATCH:   except + logger.error/warning (at least logs)
SWALLOWED:      except + pass/continue (silently ignores)
RERAISED:       except + raise/raise from (preserves chain)
TRANSFORMED:    except + raise DifferentError (translates)

Priority scoring:
  SWALLOWED in critical path (auth, billing, agent) → RED
  BARE_CATCH in critical path → RED
  BARE_CATCH + logger only → ORANGE
  SWALLOWED in non-critical path → ORANGE
  BARE_CATCH in non-critical path → YELLOW
```

### Step 2: Audit User-Facing Error Messages
```
Find all HTTP error responses:
  - HTTPException(status_code=X, detail=Y)
  - JSONResponse with error fields
  - raise HTTP_XXX_Error patterns

For each error response:
  - Is the message helpful to the user? (not "Internal Server Error")
  - Does it leak internal details? (stack traces, file paths, SQL queries)
  - Is the status code correct? (400 vs 500, 401 vs 403)
  - Is the error format consistent? (all use same schema?)

Flag UNHELPFUL if detail is generic ("An error occurred")
Flag LEAKY if detail contains internal paths, stack traces, or DB info
Flag WRONG_CODE if 500 used for validation errors (should be 400)
Flag INCONSISTENT if error response shape varies across endpoints
```

### Step 3: Check Error Boundaries
```
Verify error boundaries exist at critical layers:

API Layer:
  - Global exception handler in FastAPI middleware
  - Per-route error handling
  - Validation error handler (Pydantic)

Service Layer:
  - Service methods catch and translate infrastructure errors
  - DB connection errors → ServiceUnavailable
  - External API errors → appropriate fallback

Background Jobs (Lambda):
  - Dead letter queue configured for failures
  - Retry logic with backoff
  - Poison message handling

WebSocket:
  - Connection error handling
  - Graceful disconnect on error

Flag MISSING_BOUNDARY if a layer has no error handling
```

### Step 4: Audit Error Propagation
```
Trace how errors flow through the system:

1. DB error → Service → API → User response
   - Does the DB error get properly translated?
   - Does the user see "Database error" or a helpful message?

2. External API error (Stripe, Twilio, Nango) → Service → API → User
   - Does a Stripe timeout show as "Payment processing, try again"?
   - Or does it show a raw HTTP error?

3. Agent execution error → Skill executor → User
   - Does a failed skill show what went wrong?
   - Or does it return success: True (fake stub)?

4. Auth error → Middleware → User
   - Is 401 vs 403 correct?
   - Is the message specific enough to act on?
```

### Step 5: Audit Retry & Fallback Patterns
```
For operations that can fail:
  - Network calls: Do they have timeouts? Retries? Circuit breakers?
  - DB operations: Transaction rollback on failure?
  - External APIs: Fallback when provider is down?
  - File operations: Cleanup on partial failure?

Flag NO_TIMEOUT if network calls have no timeout set
Flag NO_RETRY if critical operations have no retry logic
Flag NO_ROLLBACK if DB writes have no transaction safety
```

## Output Format

```markdown
# Error Handling Audit Report

## Error Resilience Score: X.X / 10.0

## Summary
- Exception handlers found: X
- Bare catches: X (Y%)
- Swallowed errors: X (Y%)
- User-facing errors audited: X
- Unhelpful messages: X
- Internal info leaks: X

## RED Findings (Silent Failures)
| # | Pattern | File:Line | Impact |
|---|---------|-----------|--------|

## ORANGE Findings (Degraded Experience)
...

## Error Response Consistency
| Status Code | Count | Format Consistent | Example |
|-------------|-------|-------------------|---------|

## Missing Error Boundaries
| Layer | Gap | Impact |
|-------|-----|--------|

## Recommended Fixes (Priority)
1. ...
```

## Scoring
```
Composite score (0-10):
  Swallowed errors:     25% weight (fewer = better)
  Bare catches:         20% weight
  User message quality: 20% weight
  Error boundaries:     15% weight
  Retry/fallback:       10% weight
  Error consistency:    10% weight
```
