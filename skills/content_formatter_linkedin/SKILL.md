---
name: content_formatter_linkedin
description: Formats content with LinkedIn-optimized structure and 8-10 hashtags
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: [ai_writing_humanizer, copy_editor]
feeds_into: [content_reviewer_factchecker]
parallel_with: [content_formatter_twitter]
---

# Content Formatter LinkedIn

## Purpose
Takes approved content and formats it for maximum LinkedIn performance. Applies hook-first structure, mobile-friendly line breaks, bold key phrases, a clear CTA, and exactly 8-10 hashtags at the end. Every post must leave this skill ready to paste into LinkedIn.

## When to Use
- After content passes quality review (8.0+ score)
- When Ved Vyasa or Vayu hands off approved copy
- Before publishing to Publer as a DRAFT
- Whenever raw content needs LinkedIn formatting

## Workflow

### Step 1: Apply Hook-First Structure
Move the strongest sentence to line 1. This is the hook. It must stop the scroll. Use a pattern interrupt, bold claim, specific number, or question. The hook stands alone on its own line.

### Step 2: Format for Mobile
Add a blank line after every 1-3 sentences. One idea per paragraph. No paragraph longer than 3 sentences. LinkedIn users scroll on phones. White space is your friend.

### Step 3: Bold Key Phrases
Wrap 2-4 key phrases in bold using double asterisks. Bold the main takeaway, a surprising stat, or the core framework name. Do not bold entire sentences.

### Step 4: Add CTA
End the body with a clear call-to-action. Prefer questions that invite comments ("What's your take?" or "Have you seen this in your company?"). Comments drive reach more than likes.

### Step 5: Add 8-10 Hashtags
Add exactly 8-10 hashtags on the final line. Space-separated. No commas between them. No hashtags anywhere else in the post. Mix broad (#AI #Leadership) with niche (#EnterpriseAI #BuildInPublic).

## Output Format
```
[Hook line - strongest sentence]

[Body paragraph 1 - 1-3 sentences]

[Body paragraph 2 - 1-3 sentences]

[Body paragraph 3 - optional, 1-3 sentences]

[CTA - question or invitation]

#Hashtag1 #Hashtag2 #Hashtag3 #Hashtag4 #Hashtag5 #Hashtag6 #Hashtag7 #Hashtag8
```

## Key Principles
- First 2 lines determine 80% of engagement. Nail the hook.
- CRITICAL: 8-10 hashtags are REQUIRED. No post ships without them.
- No hashtags inside the body text. Only at the end.
- Short paragraphs. Mobile-first. White space wins.
- Bold sparingly. 2-4 phrases max.
- No engagement bait ("Like if you agree"). Ask real questions.

## Integration
- Primary Agents: Ved Vyasa, Vayu
- Receives content from ai_writing_humanizer and copy_editor
- Outputs formatted post ready for Publer (DRAFTS ONLY)
- Pair with linkedin_post_generator_2026 for algorithm optimization
