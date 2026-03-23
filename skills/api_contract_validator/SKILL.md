---
name: api_contract_validator
description: >
  Validates API endpoint responses against expected schemas. Detects status-code-only
  test assertions, missing response body validation, schema drift between endpoints
  and models, and undocumented response fields. Use for API QA audits.
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: []
feeds_into: [test_quality_analyzer]
parallel_with: [product_claims_validator]
allowed-tools:
  - Bash
  - Read
  - Grep
  - Glob
  - Write
---

# API Contract Validator

## Purpose
Validates that API endpoints return what they claim to return. Catches the dangerous pattern where tests assert `status_code == 200` but never verify the response body — meaning schema drift, missing fields, and broken contracts ship undetected.

## When to Use
- Auditing API test quality (finding status-code-only assertions)
- Verifying API response schemas match Pydantic models
- Detecting undocumented or inconsistent response fields
- Pre-launch API contract verification

## Workflow

### Step 1: Discover API Endpoints
```
Scan apps/backend/api/ for all router files.
Extract: route path, HTTP method, response_model (if declared), return statements.
Build endpoint inventory: {path, method, response_model, handler_function, file:line}
```

### Step 2: Map Response Models
```
For each endpoint with a response_model:
  - Locate the Pydantic model definition
  - Extract all fields, types, optionality
  - Record the expected contract

For endpoints WITHOUT response_model:
  - Flag as UNTYPED_RESPONSE (severity: ORANGE)
  - Attempt to infer schema from return statements
```

### Step 3: Audit Test Assertions
```
Scan all test files that hit API endpoints.
For each test function:
  - Does it assert response.status_code? → record
  - Does it assert response.json()? → record
  - Does it validate specific fields in the response body? → record
  - Does it validate field types or values? → record

Classify each test:
  STATUS_ONLY    → asserts status code, never checks body (severity: RED)
  BODY_PARTIAL   → checks some fields, misses others (severity: YELLOW)
  BODY_COMPLETE  → validates all declared response_model fields (severity: GREEN)
  NO_ASSERTION   → test function has zero assertions (severity: RED)
```

### Step 4: Detect Schema Drift
```
For each endpoint with both a response_model AND test coverage:
  - Compare fields asserted in tests vs fields in Pydantic model
  - Flag DRIFT if model has fields that no test ever checks
  - Flag PHANTOM if tests assert fields not in the model

For endpoints returning dict/JSON directly (no model):
  - Compare return keys across all return paths in the handler
  - Flag INCONSISTENT if different code paths return different shapes
```

### Step 5: Generate Report
```
Produce a structured report with:
  - Total endpoints discovered
  - Coverage breakdown: TYPED vs UNTYPED response models
  - Test quality breakdown: STATUS_ONLY / BODY_PARTIAL / BODY_COMPLETE / NO_ASSERTION
  - Schema drift findings
  - Top 10 highest-risk endpoints (untyped + status-only tests)
  - Specific file:line references for every finding
```

## Output Format

```markdown
# API Contract Validation Report

## Summary
- Endpoints scanned: X
- Typed responses: X/Y (Z%)
- Test coverage: X endpoints tested / Y total
- Status-code-only tests: X (RED)
- No-assertion tests: X (RED)
- Schema drift detected: X endpoints

## RED Findings (Must Fix)
| # | Endpoint | Issue | Test File:Line | Severity |
|---|----------|-------|----------------|----------|
| 1 | POST /api/v1/auth/signup | Status-only assertion | test_auth.py:45 | RED |

## ORANGE Findings (Should Fix)
...

## YELLOW Findings (Track)
...

## Highest Risk Endpoints
1. ...
```

## Scoring
- RED: Status-code-only tests on critical paths (auth, billing, agent dispatch)
- ORANGE: Untyped response models, partial body validation
- YELLOW: Minor schema drift, optional field mismatches
- GREEN: Full contract validation passing

## Integration
- Feeds test findings into `test_quality_analyzer` for consolidated test quality score
- Can be run alongside `product_claims_validator` (no dependency)
