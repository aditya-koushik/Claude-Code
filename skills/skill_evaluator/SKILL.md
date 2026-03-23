---
name: skill-evaluator
description: >
  Automated before/after evaluation of skill amendments using eval fixtures.
  Closes the self-improvement loop by comparing baseline vs candidate SKILL.md
  versions against standardized test inputs and scoring rubrics. Returns
  ACCEPT, ACCEPT_WITH_CAVEAT, REJECT, or SKIP decisions with evidence.
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: [skill_amender, skill_inspector]
feeds_into: [skill_amender, skill_execution_observer]
parallel_with: []
---

# Skill Evaluator

Automated evaluation of skill amendments before they are applied. Closes the Observe-Inspect-Amend-**Evaluate** loop.

## Purpose

Without evaluation, the self-improvement loop is open. An amendment could degrade a skill and nobody would know until the next inspection cycle. The evaluator runs eval fixtures against both the current and proposed SKILL.md, compares scores, and makes an evidence-based recommendation before any change is applied.

## When to Run

1. **Before amendment application:** skill_amender invokes evaluator automatically after drafting a proposal
2. **On-demand:** User requests evaluation of a specific skill against its fixtures
3. **Post-amendment verification:** 7 days after amendment, re-run to confirm improvement persists
4. **Skill audit:** Batch-evaluate all skills with eval fixtures to establish baseline scores

## Prerequisites

The target skill MUST have an `evals/` directory containing:
- `eval_criteria.md` — Scoring rubric with weighted criteria
- At least one test input (`test_01_input.md`)
- Corresponding expected output characteristics (`test_01_expected.md`)

If no eval fixtures exist, the evaluator returns SKIP with a recommendation to create fixtures.

## Workflow

### Step 1: Load Eval Fixtures

Read the target skill's `evals/` directory:
```
~/.claude/skills/[skill_name]/evals/
  eval_criteria.md      <- scoring rubric (required)
  test_01_input.md      <- standard test input (required)
  test_01_expected.md   <- expected characteristics (required)
  test_02_input.md      <- edge case input (optional)
  test_02_expected.md   <- edge case characteristics (optional)
```

Parse `eval_criteria.md` to extract:
- Criteria names and weights (must sum to 100%)
- Scoring scale (0-10 per criterion)
- Pass threshold (typically 8.0/10)
- Automatic fail conditions

### Step 2: Run Baseline Evaluation

Using the CURRENT SKILL.md:
1. For each test input, simulate skill execution following the current instructions
2. Score the simulated output against each criterion in eval_criteria.md
3. Check against expected output characteristics
4. Calculate weighted composite score
5. Check automatic fail conditions

Record:
- Per-criterion scores
- Composite score
- Any automatic fail triggers
- Notes on strengths/weaknesses

### Step 3: Run Candidate Evaluation

Using the PROPOSED amended SKILL.md:
1. Repeat the exact same process as Step 2
2. Use identical test inputs and scoring rubric
3. Score independently (do not reference baseline scores during scoring)

Record the same metrics as baseline.

### Step 4: Compare Results

For each criterion:
- Calculate delta: `candidate_score - baseline_score`
- Flag regressions (negative delta)
- Flag improvements (positive delta > 0.5)

Calculate overall:
- Baseline composite score
- Candidate composite score
- Overall delta

### Step 5: Decision Logic

| Condition | Decision | Action |
|-----------|----------|--------|
| Candidate >= baseline on ALL criteria | **ACCEPT** | Recommend applying amendment |
| Candidate >= baseline overall, but regresses on any single criterion by >1.0 | **ACCEPT_WITH_CAVEAT** | Recommend with flagged regressions |
| Candidate < baseline overall | **REJECT** | Block amendment, provide reasons |
| No eval fixtures exist | **SKIP** | Recommend manual review + fixture creation |
| Candidate triggers automatic fail that baseline didn't | **REJECT** | Block amendment, cite fail condition |

### Step 6: Generate Evaluation Report

Produce structured report (see Output Format below).

### Step 7: Return to Amender

- If ACCEPT: Amender includes eval scores in chairman approval request
- If ACCEPT_WITH_CAVEAT: Amender notes caveats, chairman decides
- If REJECT: Amender revises proposal and re-evaluates (max 2 attempts)
- If SKIP: Amender proceeds with manual review workflow

## Output Format

```markdown
# Skill Evaluation Report

## Metadata
- **Eval ID:** eval-YYYYMMDD-NNN
- **Skill:** [skill_name]
- **Amendment ID:** [amend-YYYYMMDD-NNN]
- **Date:** [ISO 8601]
- **Test Inputs Used:** [count]

## Baseline Scores (Current SKILL.md)

| Criterion | Weight | Score | Weighted |
|-----------|--------|-------|----------|
| [name]    | [%]    | [0-10]| [weighted]|
| ...       | ...    | ...   | ...      |
| **Composite** | 100% | | **[score]** |

## Candidate Scores (Proposed SKILL.md)

| Criterion | Weight | Score | Weighted |
|-----------|--------|-------|----------|
| [name]    | [%]    | [0-10]| [weighted]|
| ...       | ...    | ...   | ...      |
| **Composite** | 100% | | **[score]** |

## Delta Analysis

| Criterion | Baseline | Candidate | Delta | Status |
|-----------|----------|-----------|-------|--------|
| [name]    | [score]  | [score]   | [+/-] | [improved/stable/regressed] |
| **Overall** | [score] | [score] | [+/-] | |

## Automatic Fail Check
- Baseline triggers: [none / list]
- Candidate triggers: [none / list]

## Decision: [ACCEPT / ACCEPT_WITH_CAVEAT / REJECT / SKIP]

## Reasoning
[2-3 sentences explaining why this decision was made, referencing specific criteria and deltas]

## Caveats (if ACCEPT_WITH_CAVEAT)
- [Criterion X regressed by Y points because Z]

## Recommendation
[Next action: apply amendment / revise proposal / manual review / create eval fixtures]
```

## Multi-Test Aggregation

When multiple test inputs exist (test_01, test_02, etc.):
1. Run baseline and candidate against ALL test inputs
2. Average scores across test inputs for each criterion
3. A failure on ANY test input's automatic fail conditions blocks the amendment
4. Report includes per-test breakdown and aggregated scores

## Evaluation Log

Every evaluation is logged to `D:\Work Weaver\Content\skill-eval-log.jsonl` (see eval_log_schema.md for format).

## Safety Rules

1. **Evaluator does NOT apply amendments.** It only recommends.
2. **Scoring must be independent.** Do not let baseline scores influence candidate scoring.
3. **All test inputs must be used.** Cannot cherry-pick favorable tests.
4. **Automatic fails are absolute.** No override regardless of composite score.
5. **Max 2 re-evaluation attempts** per amendment. After 2 rejections, escalate to human review.
6. **Log every evaluation.** No silent evaluations.

## Edge Cases

- **Skill has no evals directory:** Return SKIP. Flag in report. Add to eval creation queue.
- **Eval criteria weights don't sum to 100%:** Normalize weights, log warning.
- **Test input references external data:** Evaluate based on instruction quality, not data availability.
- **Amendment only changes non-functional text (comments, formatting):** Still evaluate. Score should be stable.

## Integration

- **Called by:** skill_amender (automatic), user (on-demand), Yudhishthira (audit)
- **Reads from:** Skill evals/ directories, SKILL.md files (current + proposed)
- **Writes to:** skill-eval-log.jsonl, evaluation reports
- **Reports to:** skill_amender (decision), Krishna (orchestration), Chairman (via amender)
- **Primary Agents:** Krishna (orchestration), Nakula (quality perspective)
