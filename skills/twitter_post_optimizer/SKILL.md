---
name: twitter_post_optimizer
description: Crafts viral Twitter threads respecting character limits and trends
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: []
feeds_into: [content_formatter_twitter]
parallel_with: []
---

# Twitter Post Optimizer

## Purpose
Optimizes Twitter content for maximum reach and engagement. Researches trending topics, crafts hook tweets designed to go viral, builds threads with one clear insight per tweet, and ensures every tweet stays within 280 characters. The hook tweet must work as a standalone viral post.

## When to Use
- When creating original Twitter threads from scratch
- When optimizing existing content for Twitter performance
- When trending topics align with Bit Foundry AI's content themes
- Before any Twitter content enters the publishing pipeline

## Workflow

### Step 1: Research Trending Topics
Check current trends that overlap with AI, enterprise, business, or tech. Find angles where Bit Foundry AI's perspective adds value. Do not force a trend. Only ride waves that fit the brand.

### Step 2: Craft the Hook Tweet
This is the most important step. The hook tweet must:
- Stand alone as a complete, shareable thought
- Use a specific number, contrarian take, or bold claim
- Stop the scroll in under 280 characters
- Make people want to click "Show this thread"

### Step 3: Build the Thread Body
One insight per tweet. Each tweet is a complete thought. Use this structure:
- Tweet 2-3: Context or the story setup
- Tweet 4-6: The framework, data, or proof
- Tweet 7-8: The surprise insight or contrarian angle
- Final tweet: CTA + 2-3 hashtags

### Step 4: Add Data and Examples
Every claim needs a number or a real example. "AI reduces reporting time by 73%" beats "AI saves time on reporting." Specifics drive retweets. Vague claims get ignored.

### Step 5: Verify Character Counts
Check every single tweet. Max 280 characters including spaces, numbering, and punctuation. If a tweet hits 281, cut a word. Do not abbreviate. Do not use "u" or "&" instead of full words.

### Step 6: Final Coherence Check
Read the full thread top to bottom. Each tweet should connect to the next. Someone who reads only the hook should get value. Someone who reads the full thread should get 10x value.

## Output Format
Numbered thread (1/ through n/) with character count noted beside each tweet. Hashtags in final tweet only. Max 25 tweets per thread.

## Key Principles
- Hook tweet is everything. 80% of engagement lives in tweet 1.
- Numbers in the hook outperform adjectives every time.
- Contrarian takes get retweets. Safe takes get silence.
- 9:1 value-to-promotion ratio. Give 9 tweets of value for every 1 ask.
- Hashtags in the final tweet only. 2-3 max.
- Never exceed 280 characters. Not even by one.

## Integration
- Primary Agent: Vayu
- Receives optimized content from ai_writing_humanizer and copy_editor
- Works alongside content_formatter_twitter for thread formatting
- Outputs to Publer as DRAFTS ONLY
