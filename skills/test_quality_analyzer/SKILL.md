---
name: test_quality_analyzer
description: >
  Analyzes test suite quality across the entire codebase. Detects no-assertion tests,
  fake-success stubs, skipped tests with stale reasons, status-code-only assertions,
  mock/production divergence, and test coverage gaps. Produces a Test Quality Score.
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: [api_contract_validator]
feeds_into: []
parallel_with: [ux_terminology_scanner]
allowed-tools:
  - Bash
  - Read
  - Grep
  - Glob
  - Write
---

# Test Quality Analyzer

## Purpose
Meta-QA: tests the tests. Most CI pipelines report pass/fail counts, but a green CI can hide massive quality problems — tests that assert nothing, tests validating fake stubs as correct behavior, and tests skipped so long their blockers no longer exist. This skill exposes those hidden risks.

## When to Use
- Pre-launch test suite audit
- After major refactoring to verify test quality didn't degrade
- When CI is green but production is broken (trust gap)
- Sprint planning: identifying which test debts to pay down

## Workflow

### Step 1: Inventory All Tests
```
Scan all test directories:
  - tests/ (root)
  - apps/backend/tests/
  - tests/playwright/
  - Any other **/test_*.py or **/*_test.py

For each test file, extract:
  - Number of test functions
  - Framework (pytest, playwright, hypothesis)
  - Fixtures used
  - Markers (skip, xfail, parametrize)
```

### Step 2: Detect No-Assertion Tests (PILLAR10-3)
```
For each test function:
  - Count assert statements (assert, assertEqual, assertTrue, etc.)
  - Count pytest.raises() blocks
  - Count mock.assert_called_* statements

Flag as NO_ASSERTION if count == 0
Severity: RED if in critical path (auth, billing, agent, skill dispatch)
Severity: ORANGE otherwise
```

### Step 3: Detect Fake-Success Stubs (PILLAR10-1/2)
```
Search for patterns:
  - return {"success": True} in non-test code that tests validate
  - Tests asserting result["success"] == True on handlers that don't execute real logic
  - Mock return values that always succeed regardless of input
  - NotImplementedError handlers that tests never exercise

For each finding:
  - Trace the call chain: test → handler → actual implementation
  - Determine if the handler does real work or returns a canned response
  - Flag FAKE_SUCCESS if handler is a stub
```

### Step 4: Audit Skipped Tests (PILLAR10-4)
```
For each pytest.skip / pytest.mark.skip / @pytest.mark.skipif:
  - Extract the skip reason
  - Check if the blocker still exists:
    - "P0 BLOCKER #15" → is this still open?
    - "requires X" → is X now available?
    - "flaky" → has the flake been fixed?
  - Calculate skip age (days since skip was added via git blame)

Flag STALE_SKIP if skip is >30 days old and reason may be resolved
Severity: RED if skipping E2E journey tests
Severity: ORANGE if skipping unit tests
```

### Step 5: Detect Mock/Production Divergence
```
For each mocked dependency (moto, unittest.mock, MagicMock):
  - Compare mock return shape vs actual service return shape
  - Check if mock was updated when production code changed
  - Flag MOCK_DRIFT if mock returns fields not in production schema

Special attention to:
  - AWS service mocks (moto) vs actual DynamoDB/S3 behavior
  - External API mocks (Stripe, Twilio, Nango) vs real responses
```

### Step 6: Coverage Gap Analysis
```
Map test coverage to product features:
  Feature → Test files → Coverage %

Priority features to check:
  1. Auth (signup, login, OAuth, password reset)
  2. Agent lifecycle (hire, execute, approve)
  3. Billing (subscribe, meter, invoice)
  4. Voice (call, record, transcribe)
  5. Evidence (ingest, query, prove)
  6. Goals (create, track, complete)
  7. Integrations (connectors, Nango)

Flag UNCOVERED if a feature has <50% test coverage
Flag SHALLOW if coverage exists but is status-code-only
```

### Step 7: Generate Test Quality Score
```
Composite score (0-10):
  - Assertion density: 25% weight (tests with real assertions / total tests)
  - Skip ratio: 20% weight (active tests / total tests including skipped)
  - Stub detection: 20% weight (real handlers tested / handlers with tests)
  - Coverage breadth: 20% weight (features with tests / total features)
  - Mock freshness: 15% weight (fresh mocks / total mocks)
```

## Output Format

```markdown
# Test Quality Report

## Test Quality Score: X.X / 10.0

## Summary
- Total test files: X
- Total test functions: X
- Active (running): X
- Skipped: X (Y%)
- No-assertion: X (Y%)
- Fake-success stubs: X
- Status-code-only: X

## RED Findings
| # | Category | Finding | File:Line | Impact |
|---|----------|---------|-----------|--------|

## Score Breakdown
| Dimension | Score | Weight | Weighted |
|-----------|-------|--------|----------|
| Assertion density | X/10 | 25% | X.X |
| Skip ratio | X/10 | 20% | X.X |
| Stub detection | X/10 | 20% | X.X |
| Coverage breadth | X/10 | 20% | X.X |
| Mock freshness | X/10 | 15% | X.X |
| **TOTAL** | | | **X.X** |

## Recommended Fixes (Priority Order)
1. ...
```
