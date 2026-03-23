---
name: idea_generation
description: Creates diverse ideas across any domain with rapid iteration and category mixing
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: []
feeds_into: []
parallel_with: [brainstorming_agent]
---

# Idea Generation

## Purpose
Produces 20 diverse ideas organized into Safe, Stretch, and Moonshot categories for any given domain. Uses cross-pollination between categories to discover unexpected combinations. Operated by agent Dushyanta.

## When to Use
- Content calendar needs fresh topic ideas at volume
- A new product feature, campaign, or initiative needs divergent options
- The daily pipeline requires 10 posts and the well feels dry
- Any creative block that needs systematic ideation to break through

## Workflow

### Step 1: Define Domain and Constraints
Specify the domain (e.g., AI content, SaaS positioning, audience growth). List hard constraints (budget, timeline, platform rules) and soft constraints (brand voice, audience expectations).

### Step 2: Generate 20 Ideas in Three Categories
- **Safe (7 ideas):** Proven formats and topics with reliable engagement
- **Stretch (7 ideas):** Existing concepts pushed into unfamiliar territory
- **Moonshot (6 ideas):** Bold, unconventional, potentially polarizing ideas

### Step 3: Cross-Pollinate
Take elements from each category and combine them. Merge a Safe topic with a Moonshot format. Apply a Stretch angle to a Safe idea. Generate 3-5 hybrid ideas from these combinations.

### Step 4: Select Most Promising
Pick the top idea from each category plus the best hybrid. Four finalists total.

### Step 5: Refine Top Picks
For each finalist, write a one-paragraph expansion covering angle, hook, target audience, and expected outcome.

## Output Format
- **Domain:** Topic area and constraints
- **Safe Ideas:** Numbered list of 7
- **Stretch Ideas:** Numbered list of 7
- **Moonshot Ideas:** Numbered list of 6
- **Hybrids:** 3-5 cross-pollinated combinations
- **Top 4 Finalists:** One per category plus best hybrid, each with one-paragraph expansion

## Key Principles
- Set a number target and hit it; do not stop early
- Combine unrelated concepts to find originality
- Every idea builds on the last; use momentum not isolation
- Constraint is the mother of creativity; embrace limitations
- Moonshots are not jokes; they must have a plausible path to value

## Integration
- Downstream from `brainstorming_agent` for deeper refinement
- Feeds directly into `content_factory` and `writing_agent` for production
- Morning briefs from `morning_brief_generator` can trigger idea generation sessions
- Works with `signal_aggregator` to turn trends into topic ideas
