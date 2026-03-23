---
name: twitter_signal_monitor
description: Monitors 16 curated Twitter/X profiles for high-signal posts
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: []
feeds_into: [signal_aggregator]
parallel_with: [ai_industry_tracker]
---

# Twitter Signal Monitor

## Purpose
Monitors a curated list of 16 high-value Twitter/X profiles (AI leaders, tech founders, industry analysts) for posts that contain original insight, hard data, or significant announcements. Filters out noise using a structured scoring system and passes only high-signal posts (70+/100) into the content pipeline. This is the early-warning system for trends and takes.

## When to Use
- Scheduled signal scan cycle (recommended: 3x daily at minimum)
- Breaking news detected in AI or enterprise tech
- Content pipeline needs fresh input or trending topic data
- signal_aggregator requests current Twitter signals for pattern detection

## Workflow
### Step 1: Check Monitored Profiles
- Scan the 16 curated profiles for new posts since last check
- Include replies and quote tweets only if they contain substantive additions
- Record: post text, author, timestamp, engagement metrics (likes, retweets, replies)

### Step 2: Score Each Post (0-100)
- **Originality (0-25):** Is this a new idea, or a repackage of common knowledge?
- **Data Backing (0-25):** Does the post cite data, research, or verifiable facts?
- **Relevance (0-25):** How relevant is this to Bit Foundry AI's audience and positioning?
- **Impact (0-25):** Will this matter in a week? Does it signal a shift?

### Step 3: Filter by Score
- Posts scoring 70+ proceed to classification
- Posts scoring 50-69 go to the watch list (may become relevant with additional signals)
- Posts scoring below 50 are discarded

### Step 4: Classify Selected Posts
- **Educational:** Teaches something new, explains a concept, shares data
- **Impact:** Announces a development, signals a market shift, reveals a strategic move
- Tag with primary topic area for signal_aggregator categorization

### Step 5: Pass to Content Pipeline
- Format qualifying posts with score breakdown, classification, and source attribution
- Attach to the current signal batch for signal_aggregator processing
- Flag any post that is time-sensitive (trending topic, breaking news)

## Output Format
- **Signal Batch:** List of qualifying posts (score 70+) with full score breakdown
- **Per Post:** Author, text summary, scores (O/D/R/I), classification, timestamp, urgency flag
- **Watch List:** Posts scoring 50-69 for potential follow-up
- **Scan Summary:** Total posts scanned, qualified count, top themes detected
- **Cycle Limit:** Maximum 5-8 posts per scan cycle to prevent pipeline flooding

## Key Principles
- Signal over noise: the 70/100 threshold is firm; do not lower it for volume
- Maximum 5-8 posts per scan cycle; quality over quantity always
- Engagement metrics inform but do not determine score; a viral post can still be low-signal
- Monitor the profiles, not the platform; trending topics without profile corroboration are noise
- Attribution is mandatory: every signal must carry its source for credibility tracking

## Integration
- **Primary Agent:** Sukra, Agastya, Arundhati
- **Input from:** Curated profile list (16 accounts), Twitter/X API or manual scan
- **Output to:** signal_aggregator (signal batches), content pipeline (high-urgency items), source_matrix (new source evaluation)
