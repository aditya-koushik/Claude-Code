---
name: constraint_analysis
description: Identifies and analyzes constraints, limitations, and bottlenecks blocking progress
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: []
feeds_into: []
parallel_with: []
---

# Constraint Analysis

## Purpose
Systematically identify, categorize, and analyze constraints that limit business outcomes, project execution, or strategic options. Distinguishes between hard constraints (physics, law, math) and soft constraints (assumptions, conventions, habits), then recommends which to accept, challenge, or work around. Used by Bhishma, Banasura, and Duryodhana when reality-checking plans and stripping false limitations.

## When to Use
- A project or strategy feels blocked and the team cannot articulate why
- Scoping a new initiative and need to understand real boundaries
- Evaluating whether a "limitation" is genuinely immovable or merely assumed
- Prioritizing which bottlenecks to address first for maximum throughput
- Pre-mortem analysis: identifying what will actually kill this plan

## Workflow

### Step 1: List All Constraints
Enumerate every constraint across all dimensions: time, budget, technical capability, legal/regulatory, human resources, market conditions, dependencies, and organizational politics. Capture stated constraints and unstated assumptions alike.

### Step 2: Categorize Each Constraint
Classify along two axes:
- **Hard vs Soft**: Hard constraints cannot be changed (laws of physics, signed contracts, regulatory requirements). Soft constraints are assumptions, conventions, or self-imposed limits that feel fixed but are not.
- **Internal vs External**: Internal constraints are within your control (team size, tech stack, budget allocation). External constraints come from outside (market timing, competitor actions, regulations).

### Step 3: Rank by Impact
Score each constraint on two dimensions (1-10 each): severity of impact if unaddressed, and difficulty of removal. Plot on an impact-difficulty matrix. Focus attention on high-impact, low-difficulty constraints first.

### Step 4: Identify Workarounds
For each top constraint, generate at least two workarounds: one that removes the constraint entirely, and one that reduces its impact while accepting its existence. Include cost and timeline for each workaround.

### Step 5: Recommend Accept vs Challenge
Deliver a clear verdict for each constraint: ACCEPT (work within it), CHALLENGE (invest resources to remove it), or MONITOR (revisit when conditions change). Justify each recommendation.

## Output Format
- **Constraint Matrix**: Table with columns: Constraint, Type (Hard/Soft), Scope (Internal/External), Impact (1-10), Difficulty (1-10), Verdict (Accept/Challenge/Monitor)
- **Top 3 Bottlenecks**: The constraints with highest impact on the stated goal
- **Workaround Plan**: Specific actions for each top bottleneck
- **False Constraints**: Soft constraints masquerading as hard ones (high-value targets)
- **Residual Risk**: What remains even after addressing top constraints

## Key Principles
- Most constraints people cite are soft, not hard; challenge them ruthlessly
- The real bottleneck is rarely the one the team complains about most loudly
- Removing one constraint often reveals the next one; plan for cascading analysis
- Time and money constraints are almost always softer than they appear
- Legal and physics constraints are almost always harder than people wish

## Integration
Primary agents: **Bhishma** (Legal/Ethics), **Banasura** (Technical), **Duryodhana** (Tech Strategy). Feeds into creative_alternatives when constraints need novel solutions, scope_modification when constraints require plan changes, and first_principles_thinking when a constraint needs deeper deconstruction.
