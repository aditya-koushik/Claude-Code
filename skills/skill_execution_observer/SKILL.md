---
name: skill-execution-observer
description: >
  Logs skill execution outcomes for the self-improving skills loop. After each skill
  invocation, records: task attempted, skill used, agent, success/failure, quality score,
  errors, and user feedback. Stores data in JSONL format for pattern analysis by
  skill_inspector. Part of the Observe-Inspect-Amend-Evaluate self-improvement cycle.
user-invocable: true
depends_on: []
feeds_into: [skill_inspector]
parallel_with: []
---

# Skill Execution Observer

Logs every skill execution to enable self-improving skills. Part of the Observe step in the self-improvement loop.

## Purpose

Skills are living system components, not fixed prompt files. This observer captures execution data so the system can learn from successes and failures, enabling skills to improve over time.

## When to Log

Log AFTER every skill execution in the content pipeline:
- After writing skill produces content
- After review skill scores content
- After formatting skill produces platform output
- After research skill returns findings
- After any skill that produces observable output

## Log Entry Format

Each execution produces a JSONL entry appended to the execution log:

```json
{
  "id": "exec-20260316-001",
  "timestamp": "2026-03-16T14:30:00Z",
  "skill": "triad_writer",
  "agent": "ved-vyasa",
  "task_type": "linkedin_post",
  "task_summary": "LinkedIn post about trust as moat in AI",
  "success": true,
  "quality_score": 8.5,
  "revision_count": 0,
  "errors": [],
  "warnings": ["hook could be stronger"],
  "user_feedback": null,
  "execution_time_seconds": 45,
  "output_length": 1200,
  "platform": "linkedin",
  "pipeline_stage": "writing",
  "metadata": {
    "archetype": "operator",
    "mental_models_applied": ["hormozi", "jobs"],
    "research_sources": 3
  }
}
```

## Log Storage

**File:** `D:\Work Weaver\Content\skill-execution-log.jsonl`

One JSON object per line. Append-only (never overwrite existing entries).

## Required Fields

| Field | Type | Description |
|-------|------|-------------|
| id | string | Unique ID: `exec-YYYYMMDD-NNN` |
| timestamp | string | ISO 8601 timestamp |
| skill | string | Skill name as registered |
| agent | string | Agent that invoked the skill |
| task_type | string | Category: linkedin_post, twitter_thread, blog, research, review |
| task_summary | string | Brief description of the task |
| success | boolean | Did the skill produce acceptable output? |
| quality_score | number | Nakula's quality score (0-10), null if not reviewed |
| revision_count | number | How many revisions were needed |
| errors | array | Error messages if any |
| warnings | array | Non-fatal issues noticed |
| user_feedback | string | User's feedback if provided, null otherwise |

## Optional Fields

| Field | Type | Description |
|-------|------|-------------|
| execution_time_seconds | number | How long the skill took |
| output_length | number | Character count of output |
| platform | string | Target platform |
| pipeline_stage | string | Where in pipeline: signal, research, writing, formatting, review, publishing |
| metadata | object | Skill-specific additional data |

## How to Log

### Step 1: After Skill Execution
Immediately after a skill completes, construct the log entry.

### Step 2: Determine Success
- If Nakula reviewed: success = (quality_score >= 8.0)
- If no review yet: success = (no errors AND output produced)
- If errors occurred: success = false

### Step 3: Append to Log
```bash
echo '{"id":"exec-20260316-001","timestamp":"2026-03-16T14:30:00Z",...}' >> "D:\Work Weaver\Content\skill-execution-log.jsonl"
```

### Step 4: Flag Patterns (Quick Check)
After logging, do a quick count:
- If same skill has 3+ failures in last 7 days: Flag for inspection
- If same skill's quality score dropped >1.0 point: Flag for inspection
- If same error appears 2+ times: Flag for inspection

## Integration

- **skill_inspector** reads this log to find failure patterns
- **skill_amender** uses inspection results to propose skill changes
- **execution_logger** (Krishna/Yudhishthira) calls this as part of pipeline completion
- **morning_brief_generator** includes skill health summary from this data

## Example: Logging a Writing Skill Execution

```
1. Ved Vyasa uses triad_writer to write a LinkedIn post
2. Nakula reviews it, scores 7.2 (below 8.0 threshold)
3. Ved Vyasa revises, Nakula scores 8.4 (pass)
4. Observer logs:
   - skill: triad_writer
   - success: true (eventually)
   - quality_score: 8.4 (final score)
   - revision_count: 1
   - warnings: ["initial draft scored 7.2, needed revision"]
```

## Privacy

- Never log actual content text (only summaries)
- Never log user personal information
- Never log API keys or credentials
- Log only metadata about execution, not full outputs
