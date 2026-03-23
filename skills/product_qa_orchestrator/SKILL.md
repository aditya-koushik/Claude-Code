---
name: product_qa_orchestrator
description: >
  End-to-end Workweaver product evaluation orchestrator. Runs all 12 QA skills
  across 8 parallel agents covering Product Claims, UX, Accessibility, Code Quality,
  Error Handling, Data Flow, State Machines, Test Infrastructure, and Documentation.
  Supports two modes: "static" (code-only, no running app) and "full" (static + live browser QA).
user-invocable: true
version: 1.1.0
author: Bit Foundry AI
depends_on:
  - product_claims_validator
  - onboarding_flow_auditor
  - ux_terminology_scanner
  - accessibility_auditor
  - dead_code_detector
  - dependency_health_scanner
  - error_handling_auditor
  - data_flow_tracer
  - state_machine_validator
  - test_quality_analyzer
  - api_contract_validator
  - documentation_accuracy_checker
feeds_into: []
parallel_with: []
allowed-tools:
  - Agent
  - Bash
  - Read
  - Grep
  - Glob
  - Write
---

# Product QA Orchestrator

## Purpose
One-command end-to-end product evaluation for Workweaver. Spawns 8 parallel agents,
each executing specialized QA skills against the codebase. Produces scored reports
per phase and a consolidated final synthesis.

## Trigger Phrases
Any of these should invoke this skill:
- "Run end-to-end testing"
- "Run product QA"
- "Do end-to-end testing for Workweaver"
- "Execute full product evaluation"
- "Run all QA skills"
- "/product-qa"

## Modes

### Mode 1: Static Analysis (Default — no running app required)
```
/product-qa
/product-qa static
"Run end-to-end testing for Workweaver"
```

Executes 12 skills across 8 parallel agents:

| Agent | Phase | Skills | Focus |
|-------|-------|--------|-------|
| 1 | Phase 1: Product Validation | `product_claims_validator`, `onboarding_flow_auditor` | Claims vs code, user journeys |
| 2 | Phase 2a: UX Terminology | `ux_terminology_scanner` | Banned terms, consistency, jargon |
| 3 | Phase 2b: Accessibility | `accessibility_auditor` | WCAG 2.1 AA compliance |
| 4 | Phase 3a: Code Hygiene | `dead_code_detector`, `dependency_health_scanner` | Dead code, deps, licenses |
| 5 | Phase 3b: Error Handling | `error_handling_auditor` | Exception handlers, swallowed errors |
| 6 | Phase 3c: Data Flow + State | `data_flow_tracer`, `state_machine_validator` | Data paths, state transitions |
| 7 | Phase 4: Test Infrastructure | `test_quality_analyzer`, `api_contract_validator` | Test quality, API contracts |
| 8 | Phase 5: Documentation | `documentation_accuracy_checker` | Doc accuracy, drift |

### Mode 2: Full (Static + Live Browser QA — requires running app)
```
/product-qa full
/product-qa full http://localhost:3000
"Run full product QA with live testing"
```

Adds to static analysis:
- Live browser QA via `browse`, `qa-only`, `design-review` skills
- Real E2E journey execution
- Screenshot capture at every page
- Lighthouse audit via Chrome DevTools MCP
- Responsive layout verification
- API endpoint smoke testing (real HTTP calls)

## Configuration

### Target Codebase
Default: `D:\WorkWeaver Main Branch\`
Override: `/product-qa static D:\path\to\repo`

### Output Directory
Default: `D:\Work Weaver\Product Testing\`
All reports written here:
- `Phase-1-Product-Feature-Validation.md`
- `Phase-2a-UX-Terminology.md`
- `Phase-2b-Accessibility.md`
- `Phase-3a-Code-Hygiene.md`
- `Phase-3b-Error-Handling.md`
- `Phase-3c-Data-Flow-State-Machines.md`
- `Phase-4-Test-Infrastructure.md`
- `Phase-5-Documentation.md`
- `FINAL-Product-Evaluation-Report.md` (synthesis)
- `APPENDIX-Complete-Phase-Reports.md` (all reports combined)

### Baseline Comparison
Always loads the latest audit from: `D:\WorkWeaver Main Branch\MIP\audits\`
Reports include delta from baseline.

## Execution Steps

### Step 1: Preparation
```
1. Verify target codebase exists and is on latest main branch
2. Create output directory if not exists
3. Load baseline audit for delta comparison
4. Read all 12 SKILL.md files for agent instructions
```

### Step 2: Launch 8 Parallel Agents (Background)
```
Each agent:
1. Reads its assigned SKILL.md definition(s)
2. Reads the baseline audit for context
3. Analyzes the codebase following skill instructions
4. Writes a scored report to the output directory
5. Includes file:line references for every finding
```

### Step 3: Collect Results
```
As each agent completes:
- Record phase score
- Track completion status
- Report progress to user
```

### Step 4: Synthesize Final Report
```
1. Read all 8 phase reports
2. Calculate weighted composite score:
   - Product Claims: 25%
   - UX Terminology: 7.5%
   - Accessibility: 7.5%
   - Code Hygiene: 10%
   - Error Handling: 15%
   - Data Flow + State: 15%
   - Test Infrastructure: 15%
   - Documentation: 5%
3. Build causal chain analysis (cross-phase connections)
4. Rank Top 25 findings by priority
5. Generate 3-week sprint plan
6. Write FINAL-Product-Evaluation-Report.md
7. Concatenate all reports into APPENDIX-Complete-Phase-Reports.md
```

### Step 5 (Full mode only): Live Browser QA
```
After static analysis:
1. Navigate to app URL
2. Screenshot every major page
3. Run Lighthouse audit
4. Execute 4 flagship E2E journeys
5. Check responsive layouts (mobile, tablet, desktop)
6. Verify real API responses
7. Append live testing results to final report
```

## Output Format

### Per-Phase Report
Each phase produces a scored markdown report with:
- Phase score (X.X / 10.0) with scoring breakdown
- Detailed findings with file:line references
- Severity classification (RED/ORANGE/YELLOW/GREEN)
- Priority-ordered recommendations

### Final Synthesis
The consolidated report includes:
- Overall Product Readiness Score (weighted 0-10)
- Phase score summary table
- Cross-phase causal chain analysis
- Top 25 findings (P0/P1/P2 ranked)
- Delta from baseline audit
- Skills & agents matrix
- Strengths section
- 3-week recommended sprint plan

## Scoring Thresholds
- GREEN (8.0+): Launch-ready
- YELLOW (6.0-7.9): Acceptable with known issues
- ORANGE (4.0-5.9): Significant gaps
- RED (<4.0): Blocking, must fix

## Previous Results
- 2026-03-21: Overall 4.5/10 (NOT READY). See `D:\Work Weaver\Product Testing\FINAL-Product-Evaluation-Report.md`
