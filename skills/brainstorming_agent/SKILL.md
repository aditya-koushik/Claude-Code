---
name: brainstorming_agent
description: Generates multiple solution angles using structured ideation frameworks
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: []
feeds_into: []
parallel_with: [web_search_agent]
---

# Brainstorming Agent

## Purpose
Generates 10-15 diverse solution angles for any problem using structured ideation frameworks. Applies SCAMPER, First Principles, 6-3-5 Brainwriting, and Reverse Brainstorming to ensure breadth and depth. Operated by agent Dushyanta.

## When to Use
- A problem needs creative solutions beyond the obvious
- Strategy discussions require diverse perspectives before committing
- Content ideation needs fresh angles on a familiar topic
- The team is stuck and needs to break out of conventional thinking

## Workflow

### Step 1: Define Problem Statement
Frame the problem as a clear, specific question. Identify constraints, stakeholders, and success criteria.

### Step 2: Apply Three Frameworks
Select three frameworks from SCAMPER, First Principles, 6-3-5 Brainwriting, and Reverse Brainstorming. Run each independently to maximize diversity of output.

### Step 3: Generate 10-15 Raw Ideas
Produce at least 10 ideas across all frameworks. No filtering at this stage. Capture everything including wild and impractical ideas.

### Step 4: Score and Rank
Score each idea on three dimensions (1-10 each): Novelty, Feasibility, Impact. Calculate composite score. Rank all ideas by composite.

### Step 5: Select Top 5 and Sketch Implementation
Select the five highest-scoring ideas. For each, write a 2-3 sentence implementation sketch. For the #1 idea, provide a more detailed action plan with first steps.

## Output Format
- **Problem Statement:** One clear sentence
- **Frameworks Used:** Three named frameworks
- **Raw Ideas:** Numbered list of 10-15 ideas with originating framework
- **Top 5 Ranked:** Table with scores (Novelty, Feasibility, Impact, Composite)
- **#1 Implementation Plan:** Detailed next steps for the winning idea

## Key Principles
- Quantity before quality during generation; filter only after all ideas are captured
- No idea is too crazy in the brainstorming phase
- Combine frameworks deliberately for maximum diversity of thinking
- Score objectively; do not anchor on the first idea generated
- The best ideas often emerge from combining two mediocre ones

## Integration
- Feeds into `idea_generation` for deeper refinement of selected ideas
- Supports `council_dispatcher` when strategic decisions need creative options
- Used by Krishna and Yudhishthira during content planning and strategy sessions
- Output can seed `writing_agent` for content development
