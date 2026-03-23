---
name: skill-inspector
description: >
  Analyzes skill execution logs to identify failure patterns, declining performance,
  and underperforming skills. Part of the Inspect step in the self-improvement cycle.
  Reads from skill-execution-log.jsonl, identifies recurring issues, and produces
  inspection reports that feed into skill_amender for targeted improvements.
user-invocable: true
depends_on: [skill_execution_observer]
feeds_into: [skill_amender]
parallel_with: []
---

# Skill Inspector

Analyzes execution history to find patterns in skill failures and performance degradation.

## Purpose

A skill cannot improve if the system has no memory of what happened when it ran. The inspector traces recurring factors behind bad outcomes and provides evidence for targeted skill improvements.

## When to Run

1. **Scheduled:** Weekly during Yudhishthira's morning brief (Mondays)
2. **Triggered:** When skill_execution_observer flags 3+ failures for a skill
3. **On-demand:** User requests skill health check
4. **Post-amendment:** 7 days after a skill amendment to evaluate impact

## Input

Read from: `D:\Work Weaver\Content\skill-execution-log.jsonl`

## Analysis Dimensions

### 1. Failure Rate Analysis
For each skill, calculate:
- Total executions in period
- Success rate (%)
- Trend: improving, stable, or declining
- Compare to 30-day rolling average

**Flag if:** Success rate < 80% OR declining trend over 2+ weeks

### 2. Quality Score Tracking
For each skill, track:
- Average quality score
- Score trend over time
- Score variance (consistency)
- Comparison to pipeline average

**Flag if:** Average score < 8.0 OR dropped > 0.5 points from previous period

### 3. Revision Pattern Analysis
For each skill, examine:
- Average revision count
- Revision rate trend
- Common revision reasons
- Time cost of revisions

**Flag if:** Average revisions > 1.5 OR revision rate increasing

### 4. Error Classification
Categorize errors across all skills:
- **Routing errors:** Wrong skill selected for task
- **Instruction errors:** Skill instructions unclear or wrong
- **Tool errors:** External tool/API failure
- **Quality errors:** Output doesn't meet standards
- **Format errors:** Wrong output format

**Flag if:** Same error category appears 3+ times for same skill

### 5. Usage Anomalies
- Skills never invoked (may have routing issues)
- Skills invoked too often (may be over-selected)
- Skills with mismatched task types (selected for wrong tasks)

### 6. Cross-Skill Correlations
- Do failures in one skill predict failures in another?
- Which skill combinations work well together?
- Which pipeline paths have highest success rates?

## Output: Inspection Report

```markdown
# Skill Inspection Report - [Date]

## Summary
- Period: [start] to [end]
- Total executions: [N]
- Overall success rate: [%]
- Skills flagged: [count]

## Flagged Skills

### [Skill Name] - [Severity: Critical/Warning/Watch]
- **Success rate:** [%] (target: 80%+)
- **Avg quality score:** [X] (target: 8.0+)
- **Avg revisions:** [X] (target: <1.5)
- **Trend:** [improving/stable/declining]
- **Root cause hypothesis:** [based on error patterns]
- **Evidence:** [specific log entries]
- **Recommendation:** [specific amendment suggestion]

## Healthy Skills
[Skills performing above targets]

## Pipeline Health
- Best performing path: [agents/skills combination]
- Bottleneck: [stage with most failures/delays]
- Throughput: [posts per day average]
```

## Inspection Process

### Step 1: Load Execution Log
Read `skill-execution-log.jsonl` and parse all entries for the analysis period.

### Step 2: Group by Skill
Aggregate metrics per skill: success rate, avg score, revision count, errors.

### Step 3: Identify Patterns
Apply the 6 analysis dimensions. Flag skills that breach thresholds.

### Step 4: Trace Root Causes
For flagged skills, examine:
- What tasks were they given?
- What errors occurred?
- What was the user feedback?
- Did the environment change?

### Step 5: Formulate Hypotheses
For each flagged skill, propose WHY it's underperforming:
- Instructions too vague?
- Trigger too broad?
- Missing a condition?
- Output format wrong?
- Conflicting with another skill?

### Step 6: Generate Report
Produce the inspection report with evidence and recommendations.

### Step 7: Route to Amender
If amendments recommended, pass report to `skill_amender` for action.

## Severity Levels

| Level | Criteria | Action |
|-------|----------|--------|
| Critical | Success rate < 60% OR score < 7.0 | Immediate amendment needed |
| Warning | Success rate < 80% OR score < 8.0 | Schedule amendment |
| Watch | Declining trend but still above targets | Monitor next period |
| Healthy | Above all targets, stable or improving | No action |

## Eval Fixture Awareness

When inspecting skills, the inspector should also check for eval fixture coverage:

### Fixture Coverage Check
For each skill analyzed, verify:
1. Does `~/.claude/skills/[skill_name]/evals/` directory exist?
2. Does it contain `eval_criteria.md`, `test_01_input.md`, `test_01_expected.md`?
3. Are there edge case tests (`test_02_*`)?

### Fixture Coverage Report
Include in every inspection report:
```
## Eval Fixture Coverage
- Skills WITH eval fixtures: [count] / [total]
- Skills WITHOUT eval fixtures: [list]
- Priority for fixture creation: [skills flagged for amendment but missing fixtures]
```

### Fixture Quality Recommendations
When a skill's eval fixtures exist but the skill still fails:
- Check if eval criteria are too lenient (passing bad output)
- Recommend eval criteria updates based on observed failure patterns
- Flag if test inputs don't cover the failure scenarios found in execution logs

### Fixture Creation Priority
Skills should be prioritized for eval fixture creation in this order:
1. Skills flagged as Critical (success rate < 60%)
2. Skills flagged as Warning (success rate < 80%)
3. Skills with highest invocation count but no fixtures
4. All remaining skills

## Integration

- **Reads from:** skill_execution_observer logs, skill eval fixture directories
- **Writes to:** `D:\Work Weaver\Content\skill-inspection-reports\`
- **Triggers:** skill_amender when amendments recommended
- **References:** skill_evaluator eval log for post-amendment verification
- **Reports to:** Yudhishthira (morning brief), Krishna (orchestration)
- **Agents:** Primarily used by Nakula (quality analysis) and Yudhishthira (reporting)
