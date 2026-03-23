---
name: morning_brief_generator
description: Generates daily morning briefing with signals, pipeline status, and prioritized tasks
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: [execution_logger, skill_inspector]
feeds_into: []
parallel_with: []
---

# Morning Brief Generator

## Purpose
Produces a concise, actionable daily briefing covering content pipeline status, overnight signals, pending tasks, skill health, and prioritized action items. Ensures every day starts with clarity on what needs attention. Operated by agent Yudhishthira. Runs daily at 6:00 AM IST with a weekly deep-dive on Mondays.

## When to Use
- Automatically triggered every morning at 6:00 AM IST
- Manually invoked when returning from a break or starting a work session
- Monday mornings for the weekly deep-dive version with trend analysis
- Any time the chairman needs a current status snapshot

## Workflow

### Step 1: Check Content Pipeline Status
Review the publishing queue: how many posts are drafted, scheduled, pending review, and published. Check if the daily target of 10 posts (5 LinkedIn + 5 Twitter) is on track.

### Step 2: Scan Overnight Signals
Pull signals from `signal_aggregator` and `twitter_signal_monitor`. Identify trending topics, competitor moves, industry news, and audience engagement spikes from the previous 24 hours.

### Step 3: Review Pending Tasks
Check the task queue for overdue items, blockers, and upcoming deadlines. Flag anything that has been pending for more than 48 hours.

### Step 4: Check Skill Health
Pull the latest report from `skill_inspector`. Identify any skills with declining performance, high error rates, or pending amendments from `skill_amender`.

### Step 5: Compile Brief and Set Priorities
Synthesize all inputs into a structured brief. Rank today's priorities by urgency and impact. Lead with blockers and items requiring immediate attention.

## Output Format
- **Date:** Current date and day of week
- **Pipeline Status:** Drafted / Scheduled / Published counts vs. daily target
- **Signal Digest:** Top 3-5 signals with relevance score
- **Task Queue:** Prioritized list with status (overdue, due today, upcoming)
- **Skill Health:** GREEN / YELLOW / RED status with flagged issues
- **Today's Priorities:** Numbered list of top 5 actions for the day
- **Blockers:** Any items requiring chairman intervention

## Key Principles
- The brief must be actionable, not informational; every line should prompt a decision or action
- Lead with what needs attention; good news goes last
- Flag blockers prominently; buried blockers become crises
- Keep it under 2 minutes to read; brevity is respect for the chairman's time
- Monday deep-dives can be longer but still action-oriented

## Integration
- Pulls data from `skill_inspector`, `signal_aggregator`, `twitter_signal_monitor`
- Triggers `council_dispatcher` if strategic decisions surface in the brief
- Feeds priorities into `content_factory` for the day's production plan
- Works with `execution_logger` for pipeline throughput metrics
