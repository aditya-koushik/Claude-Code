---
name: scope_modification
description: Adjusts project scope to fit timeline and resource constraints while preserving core value
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: []
feeds_into: []
parallel_with: []
---

# Scope Modification

## Purpose
Systematically reduces or reshapes project scope when timelines or resources cannot support the full plan. Ensures the core value proposition survives every cut by applying the 80/20 rule: protect the 20% of features that deliver 80% of the value. Operated by agents Bhima and Banasura.

## When to Use
- `resourcefulness_agent` returns a YELLOW or RED readiness assessment
- A deadline is at risk and the full scope cannot be delivered in time
- Resources (people, tools, API access) are unexpectedly constrained
- The chairman requests a "what can we ship by X date" analysis
- Feature creep has expanded scope beyond original intent

## Workflow

### Step 1: Assess Full Scope
Document every feature, deliverable, and task in the current plan. Assign each a brief description and owner.

### Step 2: Categorize Must-Have vs. Nice-to-Have
For each item, determine if it is essential to core value (must-have) or enhances but is not critical (nice-to-have). Be ruthless; most items are nice-to-have.

### Step 3: Calculate Effort for Each Item
Estimate hours or complexity points for every item. Identify which items have dependencies that would cascade if cut.

### Step 4: Trim Until Scope Fits
Remove nice-to-haves starting from highest effort and lowest impact. Continue cutting until the remaining scope fits within the constraint (time, budget, or resources).

### Step 5: Verify Core Value is Preserved
Review the trimmed scope. Confirm the core value proposition is intact and the output is still worth delivering. If core value is compromised, escalate to `council_dispatcher`.

### Step 6: Present Modified Scope with Trade-offs
Deliver a clear comparison of original vs. modified scope. List what was cut, why, and what the trade-offs are. Include a "deferred" list for items that can return in a future iteration.

## Output Format
- **Original Scope:** Full item list with effort estimates
- **Modified Scope:** Trimmed item list with remaining effort
- **Cut Items:** What was removed, effort saved, and impact of removal
- **Deferred Items:** Items postponed to a future iteration
- **Trade-off Summary:** What is gained (timeline/resources) vs. what is lost (features/polish)
- **Core Value Check:** Confirmation that the essential value is preserved

## Key Principles
- Protect the core value above all else; cut features, never quality
- The 80/20 rule: 80% of value comes from 20% of features
- Communicate trade-offs clearly; no hidden cuts
- A smaller scope delivered well beats a full scope delivered poorly
- Deferred is not deleted; track cut items for future iterations

## Integration
- Triggered by `resourcefulness_agent` when readiness is below GREEN
- Consults `council_dispatcher` if cuts affect strategic positioning
- Feeds modified scope back to `content_factory` or project owner
- Works with `execution_logger` to track scope changes over time
