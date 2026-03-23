---
name: documentation_accuracy_checker
description: >
  Verifies that documentation (API docs, README, user guide, brand-facts.json,
  agent-knowledge, llms.txt, changelog) matches actual code behavior. Detects stale
  docs, incorrect examples, missing features, and documented features that no longer exist.
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: [product_claims_validator]
feeds_into: []
parallel_with: [dependency_health_scanner]
allowed-tools:
  - Bash
  - Read
  - Grep
  - Glob
  - Write
---

# Documentation Accuracy Checker

## Purpose
Documentation that contradicts the code is worse than no documentation — it actively misleads users, support teams, and AI crawlers. This skill systematically cross-references every doc against the actual codebase to find drift, stale content, and missing coverage.

## When to Use
- Pre-launch documentation audit
- After major feature changes
- When the audit flags stale docs (brand-facts.json 5 days old, user guide only 97 lines)
- When support tickets reference features that "should work according to docs"

## Workflow

### Step 1: Inventory All Documentation
```
Find and catalog all docs:

External-facing (customer/AI crawlers):
  - brand-facts.json — product facts for AI consumption
  - agent-knowledge/index.html — agent capability description
  - llms.txt — LLM-readable product description
  - User guide (apps/landing/public/user-guide or similar)
  - API documentation (if OpenAPI/Swagger exists)
  - Changelog/release notes
  - Landing page feature descriptions
  - Cookie policy, privacy policy, terms

Developer-facing:
  - README.md (root and per-app)
  - CLAUDE.md / AGENTS.md
  - .claude/rules/*.md
  - Code comments and docstrings on public APIs
  - Architecture docs (if any)
  - SKILL-INDEX.md

For each doc: record file, last modified date, line count, type.
```

### Step 2: Check Freshness
```
For each doc:
  - When was it last modified? (git blame / file timestamp)
  - Does it have a lastUpdated field? Is it accurate?
  - Has the code it describes changed since the doc was updated?

Flag STALE if doc is >14 days old and related code has changed
Flag VERY_STALE if doc is >30 days old
Flag TIMESTAMP_LIE if lastUpdated doesn't match actual modification date
```

### Step 3: Cross-Reference Claims vs Code
```
For each factual claim in documentation:

API docs:
  - Does the endpoint exist at the documented path?
  - Do the request/response schemas match?
  - Are all documented parameters accepted?
  - Are documented error codes actually returned?

Feature docs:
  - Does the described feature exist in code?
  - Does it work as described?
  - Are the described limitations still accurate?

brand-facts.json:
  - Is each fact still true?
  - Are capability claims verified in code?
  - Are pricing/plan details current?

agent-knowledge:
  - Do described agent capabilities match actual skill registry?
  - Are capability limits accurate?

Flag DOC_LIE if documented feature doesn't exist or works differently
Flag DOC_MISSING if implemented feature has no documentation
```

### Step 4: Check Example Accuracy
```
For code examples in docs:
  - Do import paths exist?
  - Do function signatures match current code?
  - Would the example actually work if run?
  - Are variable names consistent with codebase conventions?

For API examples:
  - Do request examples match the current schema?
  - Do response examples match actual responses?
  - Are headers/auth requirements documented?
```

### Step 5: Coverage Gap Analysis
```
What's documented vs what exists:

| Feature Area | Has Code | Has Docs | Gap |
|---|---|---|---|
| Auth (signup/login) | ✅ | ? | ? |
| Agent lifecycle | ✅ | ? | ? |
| Voice calls | ✅ | ? | ? |
| Billing | ✅ | ? | ? |
| Connectors | ✅ | ? | ? |
| Evidence graph | ✅ | ? | ? |

Flag UNDOCUMENTED if feature has code but no user-facing docs
Flag PHANTOM_DOC if docs describe a feature that doesn't exist in code
```

### Step 6: Completeness Assessment
```
For the user guide specifically:
  - Does it cover all user-facing features?
  - Does it have getting-started instructions?
  - Does it have troubleshooting / FAQ?
  - Is it searchable / well-structured?
  - Is it sufficient for enterprise buyers? (they need detailed docs)
  - Current: 97 lines — target: 500+ for enterprise readiness

For API docs:
  - Are all public endpoints documented?
  - Are auth requirements clear?
  - Are rate limits documented?
  - Are error codes explained?
```

## Output Format

```markdown
# Documentation Accuracy Report

## Documentation Score: X.X / 10.0

## Summary
- Documents audited: X
- Stale documents: X
- Inaccurate claims: X
- Undocumented features: X
- Phantom docs (feature removed): X

## Freshness Status
| Document | Last Modified | Days Old | Related Code Changed? | Status |
|----------|-------------|----------|----------------------|--------|

## Inaccurate Claims (RED)
| # | Document | Claim | Reality | File:Line |
|---|----------|-------|---------|-----------|

## Undocumented Features
| # | Feature | Has Code | Has Tests | No User Docs |
|---|---------|----------|-----------|-------------|

## Coverage Summary
- Features with docs: X/Y (Z%)
- API endpoints documented: X/Y (Z%)
- User guide completeness: X/10

## Recommendations
1. ...
```
