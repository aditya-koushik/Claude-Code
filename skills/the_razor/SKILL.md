---
name: the_razor
description: Discriminates signal from noise in raw input - Phase 1 of 6 Enhancement Pipeline
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: []
feeds_into: [the_truth_engine]
parallel_with: []
---

# The Razor

## Purpose
Phase 1 of the 6-phase content enhancement pipeline. Answers the question: "What matters? What doesn't?" Takes raw input (research notes, drafts, signal feeds) and strips it down to the core message by removing filler, redundancy, and low-value content. Every piece of content that enters the pipeline passes through The Razor first.

## When to Use
- Raw research output needs distillation before writing
- A draft is bloated and needs to be cut to its essence
- Multiple signals need prioritization before deeper analysis
- Any time content feels unfocused or tries to say too many things

## Workflow
### Step 1: Scan Input
- Read the full raw input without judgment
- Identify the topic, intended audience, and apparent thesis

### Step 2: Identify Core Claims
- Extract every distinct claim, insight, or data point
- List them as atomic statements (one idea per line)

### Step 3: Score Relevance
- Rate each claim 1-10 on relevance to the core thesis
- Rate each claim 1-10 on value to the target audience
- Multiply scores for a composite (max 100)

### Step 4: Strip Filler
- Remove anything scoring below 50 composite
- Eliminate hedging language, throat-clearing, and redundant phrasing
- Collapse overlapping claims into single stronger statements

### Step 5: Output Clean Signal
- Produce a distilled version with only high-signal content
- Order claims by composite score (highest first)
- Tag each surviving claim for the next phase (the_truth_engine)

## Output Format
- **Signal Report:** Numbered list of surviving claims with scores
- **Removed Items:** Brief list of what was cut and why
- **Core Thesis:** Single sentence capturing the essential message
- **Phase 1 Status:** PASS (ready for Phase 2) or INSUFFICIENT (needs more raw input)

## Key Principles
- Ruthless prioritization: if it doesn't serve the core message, it goes
- When in doubt, leave it out
- Shorter is almost always stronger
- Filler includes: obvious statements, excessive qualifiers, repeated ideas in different words
- The goal is compression without loss of meaning

## Integration
- **Primary Agent:** Nakula
- **Input from:** Research pipeline (Agastya), raw drafts (Ved Vyasa), signal feeds
- **Output to:** the_truth_engine (Phase 2)
