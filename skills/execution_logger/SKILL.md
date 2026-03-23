---
name: execution-logger
description: >
  Comprehensive execution tracking for the content pipeline. Logs agent invocations,
  skill usage, quality scores, revision cycles, and pipeline throughput. Integrates
  with skill_execution_observer for self-improvement data. Provides metrics for
  morning briefs and performance dashboards.
user-invocable: true
depends_on: [content_factory]
feeds_into: [skill_execution_observer, morning_brief_generator]
parallel_with: []
---

# Execution Logger

Tracks all pipeline execution metrics for performance monitoring and self-improvement.

## Overview

The execution logger is the backbone of pipeline observability. It captures:
1. **Agent activity** - Which agents were spawned, for what tasks
2. **Skill usage** - Which skills were invoked, by which agents
3. **Quality metrics** - Scores from Nakula's review gate
4. **Pipeline throughput** - Posts produced, approval rates, cycle times
5. **Self-improvement data** - Feeds into skill_execution_observer for the improvement loop

## Log Types

### 1. Pipeline Run Log
Tracks each content pipeline execution end-to-end.

```json
{
  "run_id": "pipeline-20260316-001",
  "timestamp": "2026-03-16T14:00:00Z",
  "mode": "topic-driven",
  "trigger": "user_request",
  "agents_used": ["agastya", "ved-vyasa", "nakula", "vayu", "sahadeva"],
  "skills_used": ["web_search_agent", "triad_writer", "content_reviewer_factchecker", "content_formatter_linkedin"],
  "content_type": "linkedin_post",
  "topic": "Trust as moat in AI",
  "quality_score": 8.5,
  "revisions": 1,
  "status": "approved",
  "duration_minutes": 12,
  "output_path": "D:\\Work Weaver\\Marketing Assets\\LinkedIn\\trust-moat-2026-03-16.md"
}
```

### 2. Agent Activity Log
Tracks individual agent spawns and completions.

```json
{
  "activity_id": "agent-20260316-001",
  "timestamp": "2026-03-16T14:00:00Z",
  "agent": "ved-vyasa",
  "task": "Write LinkedIn post about trust as moat",
  "spawned_by": "krishna",
  "skills_invoked": ["triad_writer", "hormozi_content_writer"],
  "duration_seconds": 45,
  "success": true,
  "notes": ""
}
```

### 3. Daily Summary
Aggregated daily metrics for morning brief.

```json
{
  "date": "2026-03-16",
  "total_pipeline_runs": 10,
  "linkedin_posts_produced": 5,
  "twitter_posts_produced": 5,
  "average_quality_score": 8.3,
  "first_pass_approval_rate": 0.7,
  "total_revisions": 4,
  "most_used_skill": "triad_writer",
  "lowest_scoring_skill": "twitter_post_optimizer",
  "agents_spawned": 15,
  "total_duration_minutes": 90
}
```

## Storage Locations

| Log Type | File | Format |
|----------|------|--------|
| Pipeline runs | `D:\Work Weaver\Content\pipeline-execution-log.jsonl` | JSONL |
| Agent activity | `D:\Work Weaver\Content\agent-activity-log.jsonl` | JSONL |
| Daily summaries | `D:\Work Weaver\Content\daily-summaries\YYYY-MM-DD.json` | JSON |
| Skill executions | `D:\Work Weaver\Content\skill-execution-log.jsonl` | JSONL (shared with skill_execution_observer) |

## How to Use

### After Each Pipeline Run
Krishna (or the orchestrating agent) should log:
1. The pipeline run entry (which agents, skills, scores)
2. Individual agent activity entries
3. Trigger skill_execution_observer for each skill used

### At End of Day
Yudhishthira generates daily summary from the logs.

### Weekly
Morning brief includes:
- Week-over-week throughput comparison
- Skill health summary (from skill_inspector)
- Top and bottom performing content
- Pipeline bottleneck identification

## Metrics Tracked

### Throughput
- Posts per day (target: 10)
- LinkedIn posts per day (target: 5)
- Twitter posts per day (target: 5)
- Pipeline runs per day

### Quality
- Average quality score (target: 8.0+)
- First-pass approval rate (target: 80%+)
- Average revisions per post (target: <1.5)
- Fact-check pass rate

### Efficiency
- Average pipeline duration
- Agent spawn count per pipeline run
- Skill invocations per pipeline run
- Time per pipeline stage

### Self-Improvement
- Skills flagged by inspector (weekly)
- Amendments proposed (weekly)
- Amendment success rate
- Quality score trends per skill

## Integration

- **Krishna:** Calls after orchestrating pipeline runs
- **Yudhishthira:** Reads for morning brief generation
- **skill_execution_observer:** Shared JSONL for skill-level tracking
- **skill_inspector:** Reads aggregated data for pattern analysis
- **Nakula:** Provides quality scores that get logged
