---
name: content_formatter_twitter
description: Formats content as Twitter-optimized threads with character counting
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: [ai_writing_humanizer, copy_editor]
feeds_into: [content_reviewer_factchecker]
parallel_with: [content_formatter_linkedin]
---

# Content Formatter Twitter

## Purpose
Splits approved content into tweet-sized chunks, enforces the 280-character limit per tweet, and formats threads for maximum engagement. Every thread must be numbered, coherent, and ready to post. The hook tweet must work as a standalone viral tweet.

## When to Use
- After content passes quality review (8.0+ score)
- When Ved Vyasa or Vayu hands off approved copy for Twitter
- Before publishing to Publer as a DRAFT
- When converting long-form content into a thread

## Workflow

### Step 1: Craft the Hook Tweet
Write tweet 1 as a standalone piece. It must grab attention on its own. Use a specific number, a contrarian take, or a bold claim. This tweet carries 80% of the thread's engagement.

### Step 2: Split into Tweet-Sized Chunks
Break the remaining content into tweets. Each tweet must be one complete thought. Do not split a sentence across two tweets. Target 200-260 characters per tweet to leave room for the thread numbering.

### Step 3: Number the Tweets
Format as "1/" for the hook, "2/" through "n/" for the body. The numbering tells readers there is more to come. Maximum 25 tweets per thread.

### Step 4: Count Characters
Verify every tweet is 280 characters or fewer, including the numbering prefix. If any tweet exceeds the limit, cut words or split into two tweets.

### Step 5: Add CTA and Hashtags
The final tweet should include a CTA (follow, retweet, reply) and 2-3 relevant hashtags. Hashtags only appear in the final tweet, nowhere else.

## Output Format
```
1/ [Hook tweet - standalone, max 280 chars]

2/ [Supporting point or story beat]

3/ [Data, example, or proof]

...

n/ [CTA + hashtags, max 280 chars]
```

## Key Principles
- Every tweet must stand alone as a complete thought.
- Hook tweet is everything. 80% of engagement comes from tweet 1.
- Numbers and specifics outperform vague claims.
- Contrarian takes get more retweets than safe opinions.
- 9:1 value-to-promotion ratio. Give before you ask.
- Hashtags in the final tweet only. 2-3 max.
- If a tweet hits 281 characters, cut a word. Never exceed 280.

## Integration
- Primary Agents: Ved Vyasa, Vayu
- Receives content from ai_writing_humanizer and copy_editor
- Outputs formatted thread ready for Publer (DRAFTS ONLY)
- Pair with twitter_post_optimizer for trend alignment
