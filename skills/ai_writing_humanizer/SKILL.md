---
name: ai_writing_humanizer
description: Final pass to remove AI-generated patterns and add authentic personality
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: [copy_editor]
feeds_into: [content_formatter_linkedin, content_formatter_twitter]
parallel_with: []
---

# AI Writing Humanizer

## Purpose
Scans content for AI-generated patterns and replaces them with direct, human language. Adds authentic personality markers so every piece reads like a real person wrote it, not a machine. This is the last quality gate before formatting.

## When to Use
- After Ved Vyasa or Chitrasena drafts any content
- When a quality review flags "sounds like AI"
- Before any post enters the formatting pipeline
- When copy scores below 8.0 on the authenticity check

## Workflow

### Step 1: Scan for AI Patterns
Search the text for: passive voice clusters, hedging language ("it seems", "arguably", "it's worth noting"), filler transitions ("moreover", "furthermore", "in conclusion"), em-dashes, and any word on the banned list (delve, realm, landscape, cutting-edge, game-changer, paradigm, synergy, leverage as verb, utilize, harness).

### Step 2: Replace with Direct Language
Rewrite every flagged sentence. Use active voice. Use short sentences. Replace hedging with a clear position. Cut filler transitions entirely or replace with a period and a new sentence.

### Step 3: Add Personality Markers
Insert at least 2 of these per piece: rhetorical questions, specific numbers from real experience, contrarian opinions, first-person stories ("I" not "we"), or a bold claim followed by proof.

### Step 4: Verify Reading Level
Run a readability check. Target Grade 5 or below. If any sentence scores above Grade 8, split it or simplify the words.

### Step 5: Final Banned Words Scan
One last pass for banned words. Zero tolerance. Also confirm zero em-dashes in the output. Use periods or commas instead.

## Output Format
Return the cleaned text with a short changelog listing what was removed or replaced. Example:
- Removed 3 instances of passive voice
- Replaced "delve into" with "look at"
- Added 2 rhetorical questions
- Reading level: Grade 4

## Key Principles
- If it sounds like ChatGPT wrote it, rewrite it.
- Prefer short sentences. One idea per sentence.
- Use "you" and "I", never "one" or "we".
- Add specific examples from real business experience.
- Personality beats polish. A rough human voice wins over a smooth robot voice.
- Zero em-dashes. Zero banned words. No exceptions.

## Integration
- Primary Agents: Ved Vyasa, Chitrasena
- Runs after drafting, before content_formatter_linkedin or content_formatter_twitter
- Feeds into copy_editor for final grammar polish
- Quality gate: content must score 8.0+ on authenticity before passing
