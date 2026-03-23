---
name: signal_aggregator
description: Detects meta-trends and cross-source patterns from multiple signals
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: [twitter_signal_monitor, ai_industry_tracker]
feeds_into: [sidebringers_explainer]
parallel_with: []
---

# Signal Aggregator

## Purpose
Collects individual signals from multiple sources and detects patterns, convergences, and emerging trends that no single source would reveal. Transforms scattered data points into actionable trend intelligence. The core principle: one source is noise, three sources pointing the same direction is a trend worth publishing about.

## When to Use
- Multiple signals on a related topic have accumulated from different sources
- twitter_signal_monitor, web_search_agent, or ai_industry_tracker have surfaced overlapping themes
- A weekly or daily trend synthesis is needed for content planning
- Content strategy needs data on which topics have momentum

## Workflow
### Step 1: Collect Signals
- Gather recent signals from all active sources (twitter_signal_monitor, web_search_agent, ai_industry_tracker)
- Include: signal content, source, date, source_matrix tier, and original relevance score
- Set collection window (default: last 48 hours for daily, last 7 days for weekly)

### Step 2: Categorize by Theme
- Group signals into thematic clusters (e.g., "LLM pricing wars," "enterprise AI adoption barriers," "open-source vs. closed")
- Allow a signal to belong to multiple themes if it spans topics
- Tag each theme with the business domain it maps to

### Step 3: Identify Patterns
- A pattern requires 3+ signals from independent sources pointing in the same direction
- Score pattern strength: number of sources x average source tier x recency weighting
- Distinguish between: emerging trend (new), accelerating trend (growing), reversing trend (changing direction)

### Step 4: Score and Rank
- **Pattern Strength (0-100):** Based on source count, source quality, and recency
- **Audience Relevance (0-100):** How much does the Bit Foundry AI audience care?
- **Content Opportunity (0-100):** Can we say something original about this?
- Rank patterns by the average of all three scores

### Step 5: Output Trend Report
- Present the top 5 patterns with supporting signals
- Include a recommended content angle for each pattern
- Flag any pattern that is time-sensitive (publish within 24-48 hours or lose relevance)

## Output Format
- **Trend Report:** Top 5 patterns ranked by composite score
- **Per Pattern:** Theme, strength score, supporting signals (with sources), recommended angle, urgency
- **Weak Signals:** Interesting items with fewer than 3 sources (watch list)
- **Report Status:** TRENDS DETECTED (actionable patterns found) or QUIET (no strong patterns, maintain normal cadence)

## Key Principles
- One source is noise, three is a pattern; never call a single signal a trend
- Weight recent signals higher; a 2-day-old signal is worth more than a 2-week-old one
- Look for convergence across unrelated sources; that is the strongest signal
- Not every pattern deserves content; filter by audience relevance ruthlessly
- Update trend assessments as new signals arrive; trends are living, not static

## Integration
- **Primary Agent:** Ashwatthama, Sukra, Arundhati
- **Input from:** twitter_signal_monitor, web_search_agent, ai_industry_tracker, source_matrix (for source weighting)
- **Output to:** Content pipeline (topic suggestions), the_strategist (positioning intelligence), daily planning
