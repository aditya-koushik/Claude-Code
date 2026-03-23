---
name: Operational Protocols
description: Session startup procedures, daily content pipeline, error handling, and performance tracking
type: reference
---

# Operational Protocols

## Session Startup

1. **Hooks auto-inject context** - PostCompact and SessionStart hooks fire automatically
2. **MEMORY.md auto-loaded** - Provides quick reference to all modules
3. **Rules auto-loaded** - When working in matching paths (D:\Work Weaver\.claude\rules\)
4. No manual loading required. System is self-bootstrapping.

## Daily Content Pipeline

| Step | Agent | Action |
|------|-------|--------|
| 1 | **Yudhishthira** | Morning brief: signals, priorities, content opportunities |
| 2 | **Agastya** | Research phase: validated sources, ground truth verification |
| 3 | **Ved Vyasa** | Writing phase: draft content using 10 mental models |
| 4 | **Nakula** | Review phase: quality gate (minimum 8.0/10 score) |
| 5 | **Vishwakarma** | Asset phase: visual asset for each post |
| 6 | **Vayu** | Format phase: LinkedIn version (with hashtags) + Twitter version |
| 7 | **Sahadeva** | Publish phase: save as DRAFTS ONLY on Publer |

**Daily Target:** 10 posts (5 LinkedIn + 5 Twitter), each with visual asset.
**Review Window:** 30 minutes for user approval before any publishing.

## Error Handling

| Error Type | Response | Escalation |
|------------|----------|------------|
| Quality score < 8.0 | Return to Ved Vyasa for revision | Max 3 revision cycles, then flag for chairman |
| Skill failure | Log via `skill_execution_observer` | Inspector analyzes patterns, amender proposes fixes |
| API failure (Publer, etc.) | Retry 3x with backoff | Fallback to manual, notify user |
| Content rejection by user | Flag for chairman review | Analyze rejection reason, feed back into pipeline |
| MCP server down | Use fallback method | Log incident, continue with degraded capability |

## Performance Tracking

### Key Metrics
| Metric | Target |
|--------|--------|
| Posts produced per day | 10 (5 LinkedIn + 5 Twitter) |
| Average quality score | 8.5+ |
| Average revision cycles per post | < 2 |
| Pipeline throughput time | Track and optimize |
| User approval rate | 95%+ |
| Skill failure rate | < 5% |

### Tracking Infrastructure
- Execution logs: `D:\Work Weaver\Content\skill-execution-log.jsonl`
- Inspection reports: `D:\Work Weaver\Content\skill-inspection-reports\`
- Daily summaries: `D:\Work Weaver\Content\daily-summaries\`
- Self-improvement cycle: Observe (observer) -> Inspect (inspector) -> Amend (amender) -> Evaluate

## Signal Refinery Order
For enhancement pipeline processing:
```
razor -> source-matrix -> truth-engine -> lateral-thinker -> reality-os -> strategist -> write -> humanizer -> reviewer
```
