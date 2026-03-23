---
name: state_machine_validator
description: >
  Validates state machine transitions for all stateful entities: agents, billing
  subscriptions, approval workflows, tasks, goals, and voice calls. Detects impossible
  states, missing transitions, orphan states, and states with no exit path.
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: []
feeds_into: []
parallel_with: [data_flow_tracer]
allowed-tools:
  - Bash
  - Read
  - Grep
  - Glob
  - Write
---

# State Machine Validator

## Purpose
Every stateful entity (agent, subscription, task, approval) has a lifecycle. When state transitions are wrong — an agent goes from "terminated" back to "active", or a billing subscription skips "pending" and jumps to "active" — the system enters impossible states that corrupt data and confuse users. This skill maps every state machine and validates every transition.

## When to Use
- Pre-launch lifecycle audit
- After adding new states or transitions
- When users report entities "stuck" in unexpected states
- When the audit flags wiring gaps between features

## Workflow

### Step 1: Discover Stateful Entities
```
Find all entities with status/state fields:

Search patterns:
  - Enum classes with "Status" or "State" in name
  - Model fields named "status", "state", "lifecycle_state"
  - Constants like STATUS_ACTIVE, STATE_PENDING
  - Database columns named *_status, *_state

Expected entities in Workweaver:
  - Agent: created → active → paused → terminated
  - Task: pending → in_progress → completed → failed
  - Goal: draft → active → completed → archived
  - Subscription: trial → active → past_due → canceled
  - Approval: pending → approved → rejected → expired
  - Voice call: ringing → connected → recording → ended
  - Mission: draft → active → completed
  - Connector: connecting → connected → error → disconnected
  - Skill: registered → active → deprecated → removed
```

### Step 2: Map State Transitions
```
For each entity:
  - Extract all places where status/state is SET (not just read)
  - Record: from_state → to_state, triggered by what code, file:line
  - Build the complete transition graph

Look for transitions in:
  - Service methods that update state
  - API endpoints that change status
  - Background jobs that advance state
  - Event handlers that react to state changes
  - Webhook handlers (Stripe, Twilio) that update state
```

### Step 3: Validate Transitions
```
For each state machine:

IMPOSSIBLE TRANSITIONS:
  - Can a terminated agent become active? (should be blocked)
  - Can a completed task go back to pending? (should be blocked)
  - Can a canceled subscription become active without re-subscribing?

MISSING TRANSITIONS:
  - Is there a path from every state to an end state?
  - Can every state be reached from the start state?
  - Are there orphan states defined in enum but never entered?

DEAD-END STATES:
  - States with no outgoing transitions (not terminal states)
  - States where entities get "stuck" with no way forward

RACE CONDITIONS:
  - Can concurrent requests cause conflicting state transitions?
  - Is there optimistic/pessimistic locking on state changes?
  - Are state transitions atomic (check-then-update in one operation)?

GUARD CLAUSES:
  - Does the code verify current state before transition?
  - Or does it blindly set the new state regardless of current?
```

### Step 4: Check State-Dependent Behavior
```
For each state:
  - What actions are allowed in this state?
  - What actions are blocked?
  - Is this enforced in code (guard clauses) or just assumed?

Example:
  Agent in "paused" state:
    - Should NOT execute tasks → is this enforced?
    - Should NOT consume billing credits → is this enforced?
    - Should still be visible in dashboard → is this working?
```

### Step 5: Validate State Persistence
```
For each state change:
  - Is the new state persisted to DB? (or only in memory?)
  - Is there an audit trail of state changes?
  - Can the state be recovered after a crash?
  - Is the state change idempotent? (safe to retry)
```

## Output Format

```markdown
# State Machine Validation Report

## State Machine Health Score: X.X / 10.0

## Entities Discovered
| Entity | States | Transitions | Issues |
|--------|--------|-------------|--------|
| Agent | 4 | 6 | 2 RED |

## State Transition Diagrams
### Agent Lifecycle
```
created → active → paused → terminated
              ↓              ↑
           terminated ←──────┘
```
(Actual transitions found in code)

## RED Findings (Impossible States)
| # | Entity | Transition | Why Impossible | File:Line |
|---|--------|-----------|----------------|-----------|

## ORANGE Findings (Missing Guards)
...

## Dead-End States
| # | Entity | State | No Exit Because |
|---|--------|-------|-----------------|

## Race Condition Risks
| # | Entity | Scenario | Mitigation Present? |
|---|--------|----------|-------------------|
```

## Scoring
```
Composite score (0-10):
  Impossible transitions:  30% weight (0 found = 10/10)
  Missing guards:          25% weight
  Dead-end states:         20% weight
  Persistence safety:      15% weight
  Race condition coverage: 10% weight
```
