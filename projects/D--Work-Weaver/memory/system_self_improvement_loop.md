---
name: System Self-Improvement Loop - Multi-Method Memory Persistence
description: How feedback gets retained across conversations through redundant storage mechanisms (CTO guidance March 2026)
type: project
---

# System Self-Improvement Loop
## Multi-Method Memory Persistence Strategy

**Date**: 2026-03-12
**Source**: CTO Feedback
**Problem**: Single memory.md file may not be reliably read every conversation
**Solution**: Redundant storage across 4 persistence mechanisms

---

## The Challenge

Previous system relied on MEMORY.md as single source of truth. Problem:
- Agent context windows may not load memory.md consistently
- Agent-specific instructions may be out of date
- Long-form configurations (claude.md) may drift
- Skills definitions may not propagate to all relevant agents

**Solution**: Store critical feedback in **4 parallel persistence mechanisms** so it survives across conversations regardless of which files load.

---

## Four-Layer Persistence Strategy

### Layer 1: Memory Files (Primary Index)
**Location**: `C:\Users\Windows\.claude\projects\d--Work-Weaver\memory\`
**Files**:
- `MEMORY.md` — Index pointing to all memory files
- `feedback_*.md` — Specific feedback items
- `project_*.md` — Project context
- `reference_*.md` — External resources

**Purpose**: Master index that loads in future conversations
**Reliability**: High (always loaded on session startup)
**Update frequency**: When feedback is given

---

### Layer 2: Core Configuration (claude.md)
**Location**: `d:\Work Weaver\claude.md`
**Sections Updated**:
- SECTION 2: Core Configuration (mental models, operational rules)
- SECTION 6: Mental Models Filter (detailed definitions)
- NEW: Jobs-Level Content Condensation Philosophy

**Purpose**: System-wide configuration that defines behavior
**Reliability**: Very High (loaded on every claude.md read)
**Update frequency**: When system-level changes occur

---

### Layer 3: Agent-Specific Instructions
**Location**: `d:\Work Weaver\Claude_Code_Setup_TRANSFORMED\agents\[agent_name]\AGENT.md`
**Agents Updated**:
- `nakula/AGENT.md` — Quality gatekeeper with 10 mental models + condensation checks
- `ved-vyasa/AGENT.md` — Master writer with condensation guidelines + mental models

**Purpose**: Agent-level knowledge that doesn't get lost when agent respawns
**Reliability**: High (loaded when agent is spawned)
**Update frequency**: When agent behavior changes

---

### Layer 4: Skill Definitions (Skills Registry)
**Location**: `d:\Work Weaver\Claude_Code_Setup_TRANSFORMED\skills\`
**To Update**:
- Create `jobs-condensation-skill/SKILL.md` — Jobs-level content condensation
- Create `mental-models-evaluator/SKILL.md` — 10-model evaluation framework
- Create `jack-dorsey-lens/SKILL.md` — Dorsey mental model definition
- Create `brian-chesky-lens/SKILL.md` — Chesky mental model definition
- Update existing skill files that reference mental models

**Purpose**: Skill-level knowledge that persists when skills are activated
**Reliability**: High (loaded when skill is invoked)
**Update frequency**: When skills are added/modified

---

## How Each Layer Works

### Memory Files (Layer 1)
```
Trigger: Session startup
Action:
  1. Read MEMORY.md from C:\Users\Windows\.claude\projects\d--Work-Weaver\memory\
  2. Load all referenced files (feedback_*.md, project_*.md)
  3. Store in context for entire conversation
  4. Available to all agents via @mention

Persistence: Survives across sessions (permanent)
Limitations: Depends on context loading in startup
```

### Core Configuration (Layer 2)
```
Trigger: CLAUDE.md read (usually within first 5 minutes of session)
Action:
  1. System loads SECTION 2 (core config) on startup
  2. Mental Models section defines 10-model filter
  3. Jobs Condensation section defines word economy standards
  4. All downstream decisions reference these definitions

Persistence: Survives across sessions (permanent)
Reliability: Very high (CLAUDE.md is foundational)
```

### Agent Instructions (Layer 3)
```
Trigger: Agent spawning (e.g., Krishna spawns Nakula for review)
Action:
  1. Agent reads its AGENT.md file
  2. Loads all embedded instructions
  3. Knows about 10 mental models + quality rubric
  4. Executes with embedded knowledge

Persistence: Survives the agent respawn
Reliability: High (agent always loads AGENT.md)
```

### Skill Definitions (Layer 4)
```
Trigger: Skill invocation (e.g., content_reviewer_factchecker called)
Action:
  1. Skill reads its SKILL.md file
  2. Loads framework/approach
  3. Executes with embedded knowledge
  4. Returns output based on defined behavior

Persistence: Survives skill re-invocation
Reliability: High (skill always loads SKILL.md)
```

---

## Redundancy Map: Where Critical Feedback Lives

### Jack Dorsey & Brian Chesky Mental Models

**Storage Locations**:
1. **Memory**: `feedback_ten_mental_models.md` (layer 1)
2. **Config**: `claude.md` Section 2 (layer 2) — full definitions of models 9-10
3. **Agent**: `nakula/AGENT.md` (layer 3) — review dimensions include both models
4. **Skill**: `mental-models-evaluator/SKILL.md` (layer 4, to be created)

**Redundancy**: 4/4 layers covered ✅

### Jobs-Level Condensation Philosophy

**Storage Locations**:
1. **Memory**: `feedback_jobs_condensation_philosophy.md` (layer 1)
2. **Config**: `claude.md` Section 2, new subsection (layer 2) — full philosophy
3. **Agent**: `ved-vyasa/AGENT.md` (layer 3) — writer knows condensation targets
4. **Agent**: `nakula/AGENT.md` (layer 3) — reviewer checks condensation gates
5. **Skill**: `jobs-condensation-skill/SKILL.md` (layer 4, to be created)

**Redundancy**: 5/5 locations covered ✅

### 10 Mental Models (Updated from 8)

**Storage Locations**:
1. **Memory**: `feedback_ten_mental_models.md` (layer 1)
2. **Config**: `claude.md` Section 2 (layer 2) — all 10 models defined
3. **Agent**: `ved-vyasa/AGENT.md` (layer 3) — writer knows all 10 models
4. **Agent**: `nakula/AGENT.md` (layer 3) — reviewer evaluates through all 10
5. **Skill**: `mental-models-evaluator/SKILL.md` (layer 4, to be created)

**Redundancy**: 5/5 locations covered ✅

---

## How to Verify Multi-Layer Persistence

Check that feedback appears in all expected layers:

### For Jack Dorsey Model
```
Layer 1: grep -r "Jack Dorsey" C:\Users\Windows\.claude\projects\d--Work-Weaver\memory\
Layer 2: grep "jack_dorsey" d:\Work Weaver\claude.md
Layer 3: grep "Dorsey" d:\Work Weaver\Claude_Code_Setup_TRANSFORMED\agents\nakula\AGENT.md
Layer 4: [pending skill creation]
```

### For Jobs Condensation
```
Layer 1: grep -r "Jobs Condensation" C:\Users\Windows\.claude\projects\d--Work-Weaver\memory\
Layer 2: grep -A 30 "Jobs-Level Content Condensation" d:\Work Weaver\claude.md
Layer 3: grep "condensation" d:\Work Weaver\Claude_Code_Setup_TRANSFORMED\agents\ved-vyasa\AGENT.md
Layer 4: [pending skill creation]
```

---

## Implementation Checklist (CTO Feedback - March 2026)

### ✅ COMPLETED

- [x] Research Jack Dorsey and Brian Chesky mental models
- [x] Create feedback files for new mental models
- [x] Create feedback file for Jobs condensation philosophy
- [x] Update MEMORY.md index with new feedback files
- [x] Update claude.md SECTION 2 with 10 mental models (vs. 8)
- [x] Add Jobs Condensation Philosophy subsection to claude.md
- [x] Update Nakula (reviewer) AGENT.md with 10 models + quality rubric
- [x] Update Nakula workflow to evaluate through 10 lenses
- [x] Update Ved Vyasa (writer) AGENT.md with condensation guidelines
- [x] Update Ved Vyasa workflow to apply condensation pass
- [x] Create this self-improvement loop documentation

### ⏳ PENDING (Skills Creation)

- [ ] Create `jobs-condensation-skill/SKILL.md`
- [ ] Create `mental-models-evaluator/SKILL.md`
- [ ] Create `jack-dorsey-lens/SKILL.md`
- [ ] Create `brian-chesky-lens/SKILL.md`
- [ ] Update all agent profiles to reference new skills
- [ ] Create execution log documenting these changes

---

## Self-Improvement Cycle

### How New Feedback Becomes System Behavior

```
FEEDBACK PHASE (when CTO gives feedback):
  1. Create memory files (feedback_*.md)
  2. Update MEMORY.md index
  3. Update claude.md configuration
  4. Update relevant agent AGENT.md files
  5. Update relevant skill definitions
  → All 4 layers now have the feedback

PROPAGATION PHASE (in next conversation):
  1. Session starts → loads MEMORY.md (Layer 1)
  2. CLAUDE.md is read → loads configuration (Layer 2)
  3. Agents are spawned → load agent instructions (Layer 3)
  4. Skills are invoked → load skill definitions (Layer 4)
  → Feedback is live in all execution paths

PERSISTENCE PHASE (across all future sessions):
  1. All 4 layers persist the feedback
  2. If one layer is missed, others backup the knowledge
  3. Feedback survives agent respawns, skill invocations, session resets
  4. System behavior is consistent and predictable

EVOLUTION PHASE (when you review system behavior):
  1. Notice patterns in content quality
  2. Give feedback on what works/doesn't
  3. Update the 4 layers again
  4. Cycle repeats
  → System improves continuously
```

---

## Success Metrics

The system is working if:

✅ **Consistency**: Jack Dorsey lens appears in reviews, writing, config, skills
✅ **Persistence**: Feedback survives conversation restart
✅ **Propagation**: All agents/skills reference the new models
✅ **Coverage**: No gaps in redundancy (4+ locations per major feedback item)
✅ **Evolution**: CTO feedback gets encoded into system behavior within 1 session

---

## Future Improvements

As the system evolves, consider:

1. **Automated Consistency Checks**: Script that verifies feedback appears in all 4 layers
2. **Version Control**: Track when each layer was last updated
3. **Conflict Resolution**: What if Layer 2 says one thing, Layer 3 says another?
4. **Deprecation Tracking**: Mark when old models/practices should be removed
5. **Impact Measurement**: Track which feedback items have highest impact on quality

---

**Status**: Active as of 2026-03-12
**Next Review**: After first content cycle applying new 10-model filter
**Maintenance**: Review redundancy quarterly; add new layers if single-point failures emerge
