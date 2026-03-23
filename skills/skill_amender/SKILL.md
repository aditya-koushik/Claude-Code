---
name: skill-amender
description: >
  Proposes targeted improvements to underperforming skills based on evidence from
  skill_inspector reports. Part of the Amend step in the self-improvement cycle.
  Generates amendment proposals with specific changes, rationale, and rollback plans.
  All amendments require chairman approval before application.
user-invocable: true
depends_on: [skill_inspector]
feeds_into: [skill_evaluator]
parallel_with: []
---

# Skill Amender

Proposes evidence-based improvements to underperforming skills. Part of the Amend step in the self-improvement loop.

## Purpose

When the skill_inspector identifies underperforming skills, the amender proposes targeted changes grounded in execution evidence. Skills stop behaving like static prompt files and start behaving like evolving components.

## When to Run

1. **After inspection:** When skill_inspector flags skills for amendment
2. **On-demand:** User requests skill improvement for a specific skill
3. **Post-feedback:** When user provides explicit feedback about skill quality

## Amendment Types

### 1. Trigger Refinement
**Problem:** Skill selected for wrong tasks
**Fix:** Tighten the activation conditions, add exclusion rules
```
BEFORE: "Use when content creation is needed"
AFTER:  "Use when LinkedIn post creation is needed. NOT for Twitter threads or blog posts."
```

### 2. Instruction Clarification
**Problem:** Skill output inconsistent or low quality
**Fix:** Add missing conditions, clarify ambiguous instructions
```
BEFORE: "Write a compelling hook"
AFTER:  "Write a hook that: (1) is under 15 words, (2) creates curiosity gap, (3) contains a number or specific claim"
```

### 3. Step Reordering
**Problem:** Skill steps in wrong order causing downstream issues
**Fix:** Reorder steps based on what the execution data shows works
```
BEFORE: Write -> Research -> Verify
AFTER:  Research -> Verify -> Write
```

### 4. Output Format Update
**Problem:** Output format doesn't match downstream expectations
**Fix:** Adjust output structure to match consumer needs
```
BEFORE: Free-form text output
AFTER:  Structured output with ## headers matching Vayu's expected input
```

### 5. Constraint Addition
**Problem:** Skill produces output that violates quality rules
**Fix:** Add explicit constraints
```
BEFORE: "Apply Hormozi framework"
AFTER:  "Apply Hormozi framework. MUST include: dream outcome, perceived likelihood, time delay, effort/sacrifice. Zero banned words."
```

### 6. Example Addition
**Problem:** Skill output quality varies widely
**Fix:** Add concrete good/bad examples
```
ADDED: "## Example Output (Good)" with verified high-scoring example
ADDED: "## Anti-Pattern (Bad)" with common failure pattern
```

## Amendment Proposal Format

```markdown
# Skill Amendment Proposal

## Skill: [skill_name]
## Proposed by: skill_amender
## Date: [date]
## Severity: [Critical/Warning]

## Evidence
- Inspection report: [link]
- Execution log entries: [relevant IDs]
- Success rate: [current] -> Target: [80%+]
- Quality score: [current] -> Target: [8.0+]
- Key failures: [summary of patterns]

## Root Cause
[Why the skill is underperforming, based on evidence]

## Proposed Changes

### Change 1: [type]
**Location:** [section of SKILL.md]
**Current text:**
> [exact current text]

**Proposed text:**
> [exact replacement text]

**Rationale:** [why this change addresses the root cause]

### Change 2: [type]
...

## Expected Impact
- Predicted success rate improvement: [X% -> Y%]
- Predicted quality score improvement: [X -> Y]
- Risk: [low/medium/high]

## Rollback Plan
If amendment doesn't improve metrics within 7 days:
1. Revert SKILL.md to pre-amendment version
2. Re-run inspection to identify alternative fixes
3. Escalate to human review

## Approval Required
- [ ] Chairman reviews and approves changes
- [ ] Original SKILL.md backed up
- [ ] Amendment applied
- [ ] Evaluation scheduled (7 days post-amendment)
```

## Amendment Process

### Step 1: Review Inspection Report
Read the skill_inspector's findings for the flagged skill.

### Step 2: Read Current Skill
Read the SKILL.md file to understand current instructions.

### Step 3: Analyze Execution Logs
Look at specific failed executions to understand what went wrong.

### Step 4: Identify Root Cause
Determine whether the issue is:
- Instructions (vague, wrong, missing)
- Triggers (too broad, too narrow)
- Output format (mismatched)
- Dependencies (upstream skill issues)
- Environment (tool/API changes)

### Step 5: Draft Amendment
Write specific changes with exact before/after text.

### Step 6: Evaluate Amendment (skill_evaluator integration)
Before submitting for approval, invoke `skill_evaluator` to compare current vs proposed SKILL.md:

1. **Check for eval fixtures:** Does the skill have an `evals/` directory?
   - If YES: Proceed with automated evaluation
   - If NO: Skip evaluation, flag for manual review, recommend fixture creation

2. **Run evaluation:** Pass current SKILL.md + proposed changes to skill_evaluator
   - Evaluator runs test inputs against both versions
   - Scores output against eval_criteria.md rubric
   - Returns: ACCEPT, ACCEPT_WITH_CAVEAT, REJECT, or SKIP

3. **Handle evaluation result:**
   - **ACCEPT:** Include before/after scores in chairman approval request
   - **ACCEPT_WITH_CAVEAT:** Include scores AND flagged regressions in approval request
   - **REJECT:** Revise the amendment to address evaluator's feedback, re-evaluate (max 2 attempts)
   - **SKIP:** Proceed with manual review workflow (Step 7)

4. **After 2 rejections:** Stop revising. Escalate to human review with both the amendment proposal and evaluation reports attached.

### Step 7: Estimate Impact
Based on the failure patterns and evaluation scores, predict how the changes will help. Include eval delta in the estimate.

### Step 8: Create Rollback Plan
Always preserve the original SKILL.md and define rollback criteria. Include baseline eval scores as the rollback comparison point.

### Step 9: Submit for Approval
Present amendment proposal to chairman with:
- Amendment details (before/after text)
- Evaluation results (baseline vs candidate scores, delta, decision)
- Impact estimate
- Rollback plan with baseline scores

NEVER auto-apply changes.

## Safety Rules

1. **NEVER auto-apply amendments.** All changes require chairman approval.
2. **ALWAYS backup original SKILL.md** before any modification.
3. **ONE amendment per skill per cycle.** Don't stack multiple changes.
4. **Track all amendments** in `D:\Work Weaver\Content\skill-amendments-log.jsonl`
5. **Evaluate within 7 days.** If no improvement, rollback.
6. **Never remove core functionality.** Amendments refine, not rebuild.

## Amendment Log Entry

```json
{
  "id": "amend-20260316-001",
  "timestamp": "2026-03-16T15:00:00Z",
  "skill": "triad_writer",
  "amendment_type": "instruction_clarification",
  "severity": "warning",
  "root_cause": "hook instructions too vague, leading to generic openings",
  "changes_summary": "Added specific hook criteria: under 15 words, curiosity gap, number/claim",
  "status": "proposed",
  "approved_by": null,
  "applied_at": null,
  "evaluation_due": "2026-03-23",
  "evaluation_result": null,
  "rolled_back": false
}
```

## Integration

- **Reads from:** skill_inspector reports, skill-execution-log.jsonl
- **Invokes:** skill_evaluator (automatic, before every proposal submission)
- **Writes to:** Amendment proposals, skill-amendments-log.jsonl
- **Modifies:** SKILL.md files (only after chairman approval)
- **Triggers:** Evaluation cycle 7 days after amendment application
- **Reports to:** Krishna (orchestration), Chairman (approval)
- **Evaluation log:** Results stored in `D:\Work Weaver\Content\skill-eval-log.jsonl`
