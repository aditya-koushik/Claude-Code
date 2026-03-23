---
name: onboarding_flow_auditor
description: >
  Tests the complete new-user experience from first landing page visit through signup,
  onboarding, first value moment ("aha!"), and ongoing engagement. Identifies friction
  points, dead ends, confusing copy, and missing guidance that cause user drop-off.
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: [product_claims_validator, ux_terminology_scanner]
feeds_into: []
parallel_with: [accessibility_auditor]
allowed-tools:
  - Bash
  - Read
  - Grep
  - Glob
  - Write
---

# Onboarding Flow Auditor

## Purpose
A product can have perfect code and still fail if new users can't figure out how to get value. This skill walks the entire new-user journey step-by-step, identifying every point where a user might get confused, stuck, or abandon the product. The goal: zero friction from "I found Workweaver" to "I got my first result."

## When to Use
- Pre-launch: verify the new user experience is complete
- After signup flow changes
- When activation metrics are low (signups → active users)
- When the audit flags onboarding gaps (ORANGE-P1-001)

## Workflow

### Step 1: Map the Intended Journey
```
Document the ideal path:
  1. Landing page → understands value proposition
  2. Click "Sign Up" → reaches signup form
  3. Complete signup (email/Google/Microsoft/Zoho) → account created
  4. Onboarding flow → workspace configured
  5. First action → hire first agent OR create first mission
  6. First result → see agent complete a task with evidence
  7. Ongoing → return to dashboard, check progress

For each step: identify the expected UI, the expected data flow, and the expected outcome.
```

### Step 2: Audit Landing Page → Signup
```
From the landing page:
  - Is the value proposition clear in <5 seconds?
  - Is the CTA (sign up / get started) visible above the fold?
  - Does the CTA link work? (not broken, not placeholder)
  - Is pricing visible or linked?
  - Are there trust signals? (testimonials, security badges, logos)

From signup:
  - Do all OAuth buttons work? (Google, Microsoft, Zoho)
  - Is email signup functional?
  - What happens on error? (duplicate email, invalid input)
  - Is the error message helpful?
  - Does the signup send a confirmation email (if required)?
```

### Step 3: Audit Post-Signup Onboarding
```
After account creation:
  - Where does the user land? (dashboard, onboarding wizard, blank page?)
  - Is there a guided setup? (workspace name, first agent, preferences)
  - Are empty states helpful? ("No agents yet. Click here to hire your first.")
  - Or are empty states dead ends? ("No data" with no CTA)

Check for:
  - Onboarding checklist or progress indicator
  - Contextual tooltips or guided tour
  - Sample data or templates to get started
  - Clear next-step guidance at every point

Flag DEAD_END if user reaches a state with no guidance on what to do next
Flag FRICTION if a step requires information the user doesn't have yet
```

### Step 4: Audit Time-to-First-Value
```
How quickly can a new user:
  1. Create their first mission/goal?
  2. Hire/configure their first agent?
  3. See the agent do something useful?
  4. Get proof that it worked (evidence)?

For each step:
  - How many clicks required?
  - How many form fields to fill?
  - Are there sensible defaults?
  - Can it be done in <5 minutes?

Flag BLOCKER if any step is impossible without external setup (API keys, integrations)
Flag HIGH_FRICTION if >10 clicks or >5 minutes to first value
```

### Step 5: Audit Error Recovery
```
At each onboarding step, what happens if something goes wrong?
  - OAuth fails → helpful message or blank screen?
  - Network timeout → retry prompt or lost progress?
  - Validation error → specific field highlight or generic toast?
  - Session expires mid-onboarding → can user resume or start over?
  - Browser back button → preserved state or broken form?
```

### Step 6: Audit Return Experience
```
When a user comes back after first visit:
  - Is the dashboard populated with their previous actions?
  - Is there a "welcome back" or continuation prompt?
  - Are there notifications of agent activity since last visit?
  - Is the navigation clear? (can they find what they did before?)
```

## Output Format

```markdown
# Onboarding Flow Audit Report

## Onboarding Score: X.X / 10.0

## Journey Map
| Step | Expected | Actual | Status | Friction |
|------|----------|--------|--------|----------|
| 1. Landing → Signup | Clear CTA | ... | ✅/❌ | Low/Med/High |

## Time-to-First-Value
- Estimated clicks to first result: X
- Estimated time: X minutes
- Blockers: X
- Verdict: ACCEPTABLE / NEEDS_WORK / BROKEN

## Dead Ends Found
| # | Step | Current State | User Sees | Should See |
|---|------|-------------|-----------|------------|

## Friction Points
| # | Step | Friction Type | Severity | Fix |
|---|------|-------------|----------|-----|

## Error Recovery
| # | Scenario | Current Behavior | Expected Behavior |
|---|----------|-----------------|-------------------|

## Recommendations (Priority)
1. ...
```

## Scoring
```
Composite score (0-10):
  Signup flow works:       20% weight
  Onboarding guidance:     25% weight
  Time-to-first-value:     25% weight
  Empty state quality:     15% weight
  Error recovery:          15% weight
```
