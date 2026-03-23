---
name: copy_editor
description: Polish pass for grammar, clarity, conciseness, and flow
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: [triad_writer, hormozi_content_writer]
feeds_into: [ai_writing_humanizer]
parallel_with: []
---

# Copy Editor

## Purpose
Final polish pass that tightens grammar, kills unnecessary words, enforces active voice, and checks reading level. The goal is 20% fewer words with zero loss of meaning. Every sentence must earn its place.

## When to Use
- After ai_writing_humanizer completes its pass
- Before content enters formatting (LinkedIn or Twitter)
- When Nakula flags a draft for polish
- When any content scores below 8.0 on clarity

## Workflow

### Step 1: Grammar Check
Fix spelling, punctuation, and grammar errors. Check subject-verb agreement. Fix dangling modifiers. Ensure consistent tense throughout.

### Step 2: Kill Passive Voice
Find every instance of passive voice and rewrite in active voice. "The report was written by the team" becomes "The team wrote the report." Active voice is shorter and clearer.

### Step 3: Cut Unnecessary Words
Target 20% word count reduction. Remove filler words: "very", "really", "just", "that" (when optional), "in order to" (use "to"), "basically", "essentially". If a sentence works without a word, cut the word.

### Step 4: Check Sentence Length
Calculate average sentence length. Target: 15 words or fewer on average. Max: 20 words for any single sentence. Split long sentences. One idea per sentence.

### Step 5: Verify Reading Level
Run readability check. Target Grade 5 or below. Replace complex words with simple ones. "Implement" becomes "build." "Facilitate" becomes "help." "Demonstrate" becomes "show."

### Step 6: Check Flow
Read the piece start to finish. Each sentence should connect to the next. Cut transition words that add no meaning ("however", "additionally", "furthermore"). Use short sentences to create rhythm.

### Step 7: Final Banned Words Scan
One last check for banned words: delve, realm, landscape, cutting-edge, game-changer, paradigm, synergy, leverage (as verb), utilize, harness. Also confirm zero em-dashes.

## Output Format
Return the edited text plus a brief edit summary:
- Words cut: X (Y% reduction)
- Passive voice fixes: X
- Reading level: Grade X
- Banned words found and replaced: X

## Key Principles
- If a sentence works without a word, cut the word.
- Active voice always. No exceptions.
- One idea per sentence. One topic per paragraph.
- Simple words beat complex words every time.
- Zero em-dashes. Zero banned words.

## Integration
- Primary Agent: Nakula
- Receives content from ai_writing_humanizer
- Outputs to content_formatter_linkedin or content_formatter_twitter
- Quality gate: must hit Grade 5 reading level before passing
