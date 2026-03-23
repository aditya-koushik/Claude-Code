---
name: council_dispatcher
description: Routes business decisions to the 5-member Business Advisory Council for multi-perspective analysis
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: []
feeds_into: []
parallel_with: []
---

# Council Dispatcher

## Purpose
Routes business decisions to the five-member Business Advisory Council, collects each member's perspective in parallel, and synthesizes a weighted recommendation with a confidence score. Ensures no significant decision is made from a single viewpoint. Operated by agents Krishna and Yudhishthira.

## When to Use
- Strategic decisions: pricing, positioning, launch timing, partnerships
- Build vs. buy decisions for tools or infrastructure
- Investment decisions on time, money, or attention
- Any question containing keywords: "should we", "build vs buy", "invest", "pricing", "strategy", "launch"
- When the chairman requests a council review before committing

## Workflow

### Step 1: Receive and Frame Decision
Accept the decision request. Restate it as a clear yes/no or option-selection question. Identify the stakes and reversibility.

### Step 2: Assess Urgency
Classify as Critical (respond within 1 hour), High (same day), Medium (within 48 hours), or Low (next planning session). Urgency determines how many council members are required.

### Step 3: Identify Required Perspectives
Map the decision to relevant council members. All five weigh in by default; for urgent decisions, prioritize the most relevant three.

### Step 4: Spawn Council Members in Parallel
- **Drona:** Value lens (Hormozi value equation, customer perceived value)
- **Vidur:** Financial lens (ROI, unit economics, cash flow impact)
- **Karna:** Speed lens (first principles, execution velocity, time-to-market)
- **Duryodhana:** Technical lens (feasibility, architecture, scalability)
- **Bhishma:** Ethics and legal lens (compliance, reputation risk, long-term consequences)

### Step 5: Collect and Synthesize
Gather all responses. Identify agreements, conflicts, and blind spots. Produce a weighted recommendation based on relevance of each lens to the specific decision.

## Output Format
- **Decision:** Restated question
- **Urgency:** Critical / High / Medium / Low
- **Council Perspectives:** Each member's position with reasoning (2-3 sentences each)
- **Consensus Areas:** Where members agree
- **Conflict Areas:** Where members disagree, with reasoning
- **Recommendation:** Synthesized action with confidence score (0-100%)
- **Risk Assessment:** Top 3 risks if recommendation is followed

## Key Principles
- No single perspective is sufficient for strategic decisions
- Conflict between council members is a feature, not a bug
- The confidence score must honestly reflect uncertainty
- Speed of decision matters; do not over-deliberate on reversible choices
- Chairman always has final authority; the council advises, never decides

## Integration
- Called by `morning_brief_generator` when daily priorities involve strategic choices
- Supports `scope_modification` when trade-off decisions need multi-lens evaluation
- Works with `resourcefulness_agent` for feasibility validation on technical decisions
- Council output feeds into `strategic_advisory` for deeper strategic analysis
