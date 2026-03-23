---
name: triad_writer
description: Applies Hero, Sage, and Sovereign narrative archetypes for long-form storytelling
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: [web_search_agent, source_matrix]
feeds_into: [copy_editor]
parallel_with: [hormozi_content_writer]
---

# Triad Writer

## Purpose
Uses three narrative archetypes to create long-form content with a clear story arc. Hero tells transformation stories. Sage teaches frameworks and wisdom. Sovereign declares bold positions and vision. Every long-form piece picks a dominant archetype and blends 1-2 others for depth.

## When to Use
- When writing long-form content (newsletters, articles, LinkedIn long posts)
- When a piece needs a narrative arc, not just information
- When the goal is to inspire (Hero), educate (Sage), or position (Sovereign)
- When content feels flat and needs a storytelling backbone

## Workflow

### Step 1: Choose the Dominant Archetype
Pick based on the content goal:
- **Hero**: Personal journey. Struggle, transformation, lesson. Use when sharing your story or a customer's story. "I was broke. I tried this. Now I'm not."
- **Sage**: Educational framework. Wisdom from experience. Use when teaching a concept or process. "Here are the 3 rules I follow."
- **Sovereign**: Bold positioning. Vision and authority. Use when declaring a stance or predicting the future. "This is where the industry is going. Here's why."

### Step 2: Build the Narrative Arc
Every piece needs a beginning, middle, and end:
- Hero: Setup (the problem), Struggle (what you tried), Transformation (what worked), Lesson (what the reader takes away)
- Sage: Question (what people get wrong), Framework (the better way), Evidence (proof it works), Application (how to start)
- Sovereign: Observation (what's happening), Position (your take), Vision (where this leads), Call (what to do about it)

### Step 3: Blend Secondary Archetypes
A pure Hero story can feel self-centered. Add Sage elements (teach a framework from the story). A pure Sage piece can feel dry. Add Hero elements (share the personal moment you learned the lesson). A pure Sovereign piece can feel arrogant. Add Sage evidence to back the bold claim.

### Step 4: Write with Conviction
No hedging. No "I think" or "it seems." The Hero faced real struggles. The Sage earned real wisdom. The Sovereign has a real vision. Write like you mean it.

### Step 5: Close with Purpose
Hero closes with the lesson others can apply. Sage closes with the first step the reader should take. Sovereign closes with a challenge or invitation to join the movement.

## Output Format
Long-form content (500-2000 words) with a clear narrative arc. Label the dominant archetype at the top for pipeline tracking. Include the arc structure as internal notes if needed.

## Key Principles
- Every long-form piece needs a narrative arc. Information alone is not enough.
- Choose archetype based on goal: inspire (Hero), educate (Sage), position (Sovereign).
- Blend archetypes for depth. Pure archetypes feel one-dimensional.
- Write with conviction. Hedging kills narrative power.
- Mental models: Build in Public (Hero), Value Density (Sage), Platform Thinking (Sovereign).

## Integration
- Primary Agent: Ved Vyasa
- Best for newsletters, LinkedIn articles, and long-form posts
- Feeds into ai_writing_humanizer, then copy_editor, then formatters
- Pairs with hormozi_content_writer when the goal is conversion
