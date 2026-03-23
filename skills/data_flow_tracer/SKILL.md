---
name: data_flow_tracer
description: >
  Traces data from user input through API → service → database → response to verify
  integrity. Detects data transformation errors, missing validation, field
  truncation, type coercion bugs, and data loss at layer boundaries.
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: []
feeds_into: []
parallel_with: [state_machine_validator]
allowed-tools:
  - Bash
  - Read
  - Grep
  - Glob
  - Write
---

# Data Flow Tracer

## Purpose
Data corruption often happens at boundaries — when data crosses from API to service, service to DB, or DB to response. This skill traces critical data paths end-to-end, verifying that what goes in comes back out intact, with proper validation at each layer.

## When to Use
- Pre-launch data integrity audit
- After schema changes or model refactoring
- When users report "data looks wrong" or "fields are missing"
- When the audit flags response body validation gaps

## Workflow

### Step 1: Identify Critical Data Paths
```
Map the highest-value data flows:

1. User signup: form data → API → Cognito + DB → session token → dashboard
2. Agent creation: config → API → service → DB → agent registry → skill dispatch
3. Mission/Goal: user input → API → DB → task generation → execution → evidence
4. Billing: usage event → metering → Stripe → invoice → dashboard display
5. Voice call: incoming call → Twilio → agent routing → LLM → response → recording
6. Evidence: action → evidence_graph.ingest() → DB → query → proof card display
7. Connector: OAuth flow → Nango → token storage → API proxy → data retrieval
8. Memory: capture → WorkMemory → vector store → recall → context injection

For each path, identify:
  - Input schema (what data enters)
  - Each transformation point
  - Output schema (what data exits)
  - Storage schema (what's persisted)
```

### Step 2: Validate Input → API Layer
```
For each critical endpoint:
  - Is there a Pydantic request model? (typed input)
  - Are all fields validated? (required, types, constraints)
  - Are string lengths bounded? (prevent DB truncation)
  - Are enum values validated? (prevent invalid states)
  - Is input sanitized? (XSS, injection prevention)

Flag UNVALIDATED if endpoint accepts raw dict/JSON without model
Flag UNBOUNDED if string fields have no max length
Flag UNSANITIZED if user input reaches DB/HTML without sanitization
```

### Step 3: Validate API → Service Layer
```
At the service boundary:
  - Does the service method receive typed objects (not raw dicts)?
  - Are business rules validated? (permissions, quotas, limits)
  - Are IDs verified to belong to the current tenant? (tenant isolation)
  - Is data transformed correctly? (no field name mismatches)

Flag TENANT_LEAK if service accepts tenant_id from user input
Flag TYPE_MISMATCH if service expects different types than API provides
Flag MISSING_AUTH_CHECK if service performs action without permission verification
```

### Step 4: Validate Service → Database Layer
```
At the persistence boundary:
  - Do DB writes match the schema? (all required fields present)
  - Are transactions used for multi-table writes?
  - Is there a mismatch between Pydantic model fields and DB columns?
  - Are dates/times stored consistently? (UTC vs local)
  - Are large text fields truncated by DB constraints?
  - Are NULL vs empty string handled consistently?

Flag SCHEMA_MISMATCH if model fields don't match DB columns
Flag NO_TRANSACTION if multi-table writes lack atomicity
Flag TIMEZONE_INCONSISTENCY if dates mix UTC and local
```

### Step 5: Validate Database → Response Layer
```
On the way back out:
  - Do response models include all fields the client needs?
  - Are sensitive fields excluded? (passwords, tokens, internal IDs)
  - Are dates formatted consistently? (ISO 8601)
  - Are nested objects properly serialized?
  - Are pagination/limit defaults reasonable?

Flag SENSITIVE_LEAK if response includes password hashes, tokens, or internal IDs
Flag OVER_FETCH if response returns 50+ fields when client needs 5
Flag FORMAT_INCONSISTENCY if date/time formats vary across endpoints
```

### Step 6: Multi-Tenant Isolation Verification
```
Critical for SaaS — verify tenant data never leaks:
  - Every DB query must filter by tenant_id
  - Every API endpoint must scope to authenticated tenant
  - Cross-tenant data access must be explicitly denied
  - Admin endpoints must be properly gated

Trace each query:
  - Does the WHERE clause include tenant_id?
  - Can a user craft a request to access another tenant's data?
  - Are list endpoints properly scoped?
```

## Output Format

```markdown
# Data Flow Trace Report

## Data Integrity Score: X.X / 10.0

## Summary
- Critical data paths traced: X
- Validation gaps found: X
- Tenant isolation issues: X
- Type mismatches: X

## Data Path Status
| # | Path | Input→API | API→Service | Service→DB | DB→Response | Tenant Isolation |
|---|------|-----------|-------------|------------|-------------|-----------------|
| 1 | User Signup | ✅ | ⚠️ | ✅ | ❌ | ✅ |

## RED Findings (Data Integrity Risk)
| # | Path | Layer Boundary | Issue | File:Line |
|---|------|---------------|-------|-----------|

## Tenant Isolation Results
| Endpoint | Scoped | Evidence |
|----------|--------|----------|

## Recommendations
1. ...
```
