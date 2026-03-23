---
name: creative_alternatives
description: Generates alternative solutions and approaches when the primary path is blocked
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: []
feeds_into: []
parallel_with: []
---

# Creative Alternatives

## Purpose
Generate diverse alternative solutions and approaches when the obvious or primary path is blocked, suboptimal, or untested. Applies structured divergent thinking to produce at least five viable options, scores them objectively, and recommends the best path forward with fallbacks. Used by Dushyanta when the team is stuck, when a Plan A fails, or when assumptions need to be challenged with fresh approaches.

## When to Use
- Primary plan has failed or is no longer viable
- Team is stuck in groupthink or anchored on one approach
- A constraint_analysis reveals blockers that need creative workarounds
- Exploring a new market, product, or strategy with no established playbook
- Need a Plan B and Plan C before committing to Plan A

## Workflow

### Step 1: Define the Problem Clearly
State the problem in one sentence. Identify what "solved" looks like (success criteria). List what has already been tried and why it failed or was rejected. Separate the goal from the method: the goal stays fixed, the method is what changes.

### Step 2: Generate 5+ Alternatives
Apply multiple generation frameworks to maximize diversity:
- **Inversion**: What if we did the exact opposite?
- **Analogy**: How did a different industry solve a similar problem?
- **Constraint Removal**: What would we do if [biggest constraint] disappeared?
- **10x Thinking**: What if we needed a solution 10x better/cheaper/faster?
- **Minimum Viable**: What is the simplest possible version that still works?
Each alternative must be genuinely distinct, not a variation of the same idea.

### Step 3: Score Each Alternative
Rate every alternative on four dimensions (1-10 each):
- **Feasibility**: Can we actually execute this with current resources?
- **Impact**: How well does this solve the core problem?
- **Cost**: Total investment required (time, money, opportunity cost)
- **Speed**: How quickly can this deliver results?
Calculate composite score: (Impact x 3 + Feasibility x 2 + Speed x 2) / (Cost x 1).

### Step 4: Present Top 3
For each of the top three scoring alternatives, provide: description, pros, cons, resource requirements, timeline estimate, and key risk.

### Step 5: Recommend Best Path Forward
Select the recommended alternative with clear reasoning. Include a trigger condition for switching to the second-choice alternative (the "dead man's switch").

## Output Format
- **Problem Statement**: One sentence with success criteria
- **Alternatives Table**: All 5+ options with scores across four dimensions
- **Top 3 Deep Dives**: Full analysis with pros, cons, resources, timeline
- **Recommendation**: Best path with reasoning and switch trigger
- **Quick Win**: If available, one alternative that can start delivering value within 48 hours

## Key Principles
- The obvious solution is rarely the best one; it is merely the first one
- Constraints breed creativity; embrace them as design parameters
- Always have a Plan B and Plan C before executing Plan A
- Diversity of options matters more than depth of any single option at this stage
- Speed of iteration beats quality of initial plan

## Integration
Primary agent: **Dushyanta** (Innovation/Alternatives). Triggered after constraint_analysis identifies blockers. Works with first_principles_thinking for deeper deconstruction, brainstorming_agent for raw idea volume, and strategic_advisory for vetting the final recommendation against long-term strategy.
