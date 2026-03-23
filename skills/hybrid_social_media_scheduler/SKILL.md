---
name: hybrid_social_media_scheduler
description: Coordinates cross-platform social media scheduling for LinkedIn and Twitter with staggered timing
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: [publer_operator]
feeds_into: []
parallel_with: []
---

# Hybrid Social Media Scheduler

## Purpose
Manages cross-platform scheduling for LinkedIn and Twitter, ensuring content is adapted for each platform, posted at optimal times, and staggered to maximize reach. All posts are saved as DRAFTS only on Publer with a mandatory 30-minute review window. Operated by agents Sahadeva and Narada.

## When to Use
- Approved content is ready for scheduling across platforms
- The daily batch of 5 LinkedIn + 5 Twitter posts needs time-slot assignment
- Content needs platform-specific formatting adjustments before scheduling
- Rescheduling is needed due to breaking news or timing conflicts

## Workflow

### Step 1: Receive Approved Content
Accept content that has passed the quality gate (8.0/10 minimum from `content_reviewer_factchecker`). Verify both text and visual asset are present.

### Step 2: Check Platform-Specific Formatting
- **LinkedIn:** Verify hook line, paragraph structure, 8-10 hashtags, professional tone
- **Twitter:** Verify character count per tweet, thread structure, conversational tone, 2-3 hashtags
Adapt the same core message to fit each platform's style.

### Step 3: Determine Optimal Posting Time
- **LinkedIn peak hours:** Tuesday-Thursday, 8:00-10:00 AM IST
- **Twitter peak hours:** Monday-Friday, 12:00-2:00 PM IST
Stagger posts so LinkedIn and Twitter versions do not publish simultaneously. Space posts at least 90 minutes apart within the same platform.

### Step 4: Create Draft on Publer
**CRITICAL: NEVER auto-publish. Save as DRAFTS ONLY on Publer.**
Send formatted content and visual asset to `publer_operator` for draft creation. Set the proposed scheduled time on the draft.

### Step 5: Schedule Review Window
Block a 30-minute review window before the scheduled publish time. Notify the chairman that drafts are ready for review and approval.

### Step 6: Log in Publishing Queue
Record the draft in the publishing queue with status, platform, scheduled time, and content ID. Update `execution_logger` with scheduling data.

## Output Format
- **Content ID:** Unique identifier for the content pair
- **LinkedIn Draft:** Status, scheduled time, Publer draft ID
- **Twitter Draft:** Status, scheduled time, Publer draft ID
- **Review Window:** Start and end time for chairman review
- **Queue Position:** Where this content sits in the daily schedule

## Key Principles
- NEVER auto-publish; save as DRAFTS ONLY on Publer
- Same content adapted for each platform, not copy-pasted
- LinkedIn tone is professional and authoritative; Twitter tone is conversational and punchy
- Stagger posts; simultaneous posting across platforms wastes reach
- The 30-minute review window is non-negotiable

## Integration
- Receives content from `content_factory` and `writing_agent` after quality gate
- Delegates draft creation to `publer_operator`
- Formatting validated by `content_formatter_linkedin` and `content_formatter_twitter`
- Logs activity through `execution_logger` for morning brief metrics
