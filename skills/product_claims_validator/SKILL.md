---
name: product_claims_validator
description: >
  Traces product marketing claims to actual working code paths. Verifies that
  features described on the landing page, docs, and marketing materials actually
  exist, are wired end-to-end, and are not stubs. Produces a Claims Reality Matrix.
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: []
feeds_into: []
parallel_with: [api_contract_validator]
allowed-tools:
  - Bash
  - Read
  - Grep
  - Glob
  - Write
---

# Product Claims Validator

## Purpose
The gap between "what the marketing says" and "what the code does" is the single biggest launch risk. This skill systematically extracts every product claim from customer-facing surfaces and traces each one to actual working code — not stubs, not TODOs, not commented-out implementations.

## When to Use
- Pre-launch: verify every claim on the landing page is real
- After major refactoring: ensure no advertised feature was broken
- Investor/demo prep: confirm every demo-able feature works
- Audit findings reference this for "feature interconnection" gaps

## Workflow

### Step 1: Extract Product Claims
```
Scan all customer-facing surfaces for product claims:

Source 1: Landing page
  - apps/landing/public/**/*.html
  - Extract: headlines, feature descriptions, benefit statements
  - Look for: "Workweaver does X", "with Y", capability lists

Source 2: Documentation
  - brand-facts.json
  - agent-knowledge/index.html
  - llms.txt
  - User guide
  - README.md

Source 3: Marketing
  - Blog posts (ghost-theme)
  - Changelog
  - About page

Source 4: In-App Copy
  - Dashboard empty states, tooltips, feature descriptions
  - Onboarding flow promises
  - Settings descriptions

Build Claims Inventory:
  {claim_id, source_file:line, claim_text, category}

Categories: CORE_IDENTITY, FEATURE, INTEGRATION, SECURITY, SCALE, COMPLIANCE
```

### Step 2: Trace Claims to Code
```
For each claim, trace the full execution path:

Claim → API endpoint → Service method → Data layer → External service

Classification:
  VERIFIED     → Full code path exists and does real work
  STUB         → Code exists but returns canned/fake response
  PARTIAL      → Some of the claim works, some doesn't
  ORPHAN       → Code exists but is unreachable from any user flow
  MISSING      → No code path found for this claim
  CONTRADICTED → Code does the opposite of what's claimed

For each trace, record:
  - Entry point (API route or UI action)
  - Handler function (file:line)
  - Service layer call (file:line)
  - Data persistence (DB write, if any)
  - External call (if any)
  - Evidence generation (evidence_graph.ingest call, if any)
```

### Step 3: Validate User Journeys
```
Trace the 4 flagship user journeys end-to-end:

Journey 1: Signup → Hire Agent → Execute Task → See Evidence
  - Each step must have working code
  - Evidence must be written to evidence graph
  - UI must render the result

Journey 2: Set Goal → Auto-Generate Tasks → Execute → Learn
  - Goal creation must trigger task generation
  - Tasks must dispatch to skill executor
  - Learning loop must process the outcome

Journey 3: Approval Request → Human Decision → Resume → Evidence
  - Approval must pause execution
  - Human decision must resume
  - Decision must be recorded as evidence

Journey 4: Swarm → Delegate → Merge → Evidence
  - Multi-agent coordination must work
  - Delegation must respect permissions
  - Results must merge and produce evidence

For each journey: PASS / PARTIAL / FAIL with specific break points
```

### Step 4: Check Feature Interconnection
```
Build a feature connectivity matrix:
  Features: Goals, Tasks, Evidence, Calendar, Voice, Billing, Memory, Skills, Connectors

For each pair (Feature A, Feature B):
  - Is there a code path from A → B?
  - Is that path tested?
  - Is that path documented?

Flag ISOLATED if a feature connects to <2 other features
Flag DEAD_END if a feature has inputs but no outputs
```

### Step 5: Generate Claims Reality Matrix
```
Produce the final matrix matching every claim to reality.
```

## Output Format

```markdown
# Product Claims Validation Report

## Claims Reality Score: X.X / 10.0

## Summary
- Claims extracted: X
- VERIFIED: X (Y%)
- PARTIAL: X (Y%)
- STUB: X (Y%)
- MISSING: X (Y%)
- CONTRADICTED: X (Y%)

## Claims Reality Matrix
| # | Claim | Source | Status | Code Path | Evidence |
|---|-------|--------|--------|-----------|----------|
| 1 | "Organization Operating System" | landing:12 | PARTIAL | ... | No |

## User Journey Validation
| Journey | Status | Break Point | Impact |
|---------|--------|-------------|--------|
| Signup→Hire→Execute→Evidence | PARTIAL | Evidence not written | Core flow broken |

## Feature Interconnection Matrix
| | Goals | Tasks | Evidence | Calendar | Voice | Billing | Memory |
|---|---|---|---|---|---|---|---|
| Goals | — | ⚠️ | ❌ | ❌ | ❌ | ❌ | ❌ |
| Tasks | ⚠️ | — | ❌ | ❌ | ✅ | ⚠️ | ❌ |
...

## Critical Gaps (Claims with no backing code)
1. ...

## Recommended Actions
1. ...
```

## Scoring
```
Composite score (0-10):
  Claims verified:       30% weight
  User journeys passing: 30% weight
  Feature interconnection: 25% weight
  Evidence trail coverage: 15% weight
```
