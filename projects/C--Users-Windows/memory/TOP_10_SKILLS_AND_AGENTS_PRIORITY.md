# Top 10 Skills & Agents - Prioritized for 100K Goal
**Date:** 2026-03-11 | **Focus:** Content generation + Publishing velocity | **Timeline:** This week

---

## PART 1: TOP 10 CRITICAL SKILLS (In Priority Order)

### Why These 10?
- **5 are content creation** (writing, formatting)
- **2 are content research** (validation, monitoring)
- **2 are signal processing** (filtering, strategy)
- **1 is quality control** (gate-keeper)

All others are supporting/optional.

---

### Priority Tier 1: MUST MIGRATE (Core Content)

#### **#1: `triad-writer`** ⭐⭐⭐
**What it does:** Elite content architect using 3 perspectives (Hero, Sage, Sovereign)
**Why critical:** Foundation for ALL writing. Used by Ved Vyasa agent.
**Transformation effort:** 15 min
**Current format:** ✅ 99% Claude Code ready
**Key change:** Expand description for auto-detection

```yaml
# Current (OpenClaw)
---
name: triad-writer
description: Elite content architect blending Dan Koe's philosophy, Hormozi's value mechanics...
---

# Needed (Claude Code)
---
name: triad-writer
description: >
  Create production-ready content blending multiple writing philosophies.
  Use when: writing any content type, need professional craft, multi-perspective narrative,
  or content requiring depth and authenticity. Blends Dan Koe (philosophy),
  Hormozi (value mechanics), Reality OS (systems thinking).
disable-model-invocation: false
user-invocable: true
---
```

**Skills this enables:** YouTube optimization, LinkedIn posts, blog articles, newsletters

---

#### **#2: `linkedin-post-generator-2026`** ⭐⭐⭐
**What it does:** LinkedIn algorithm optimization for 2026 (Depth Score focus)
**Why critical:** Your main platform. $9,400 followers. Direct revenue channel.
**Transformation effort:** 15 min
**Current format:** ✅ Perfect (we showed you this one)
**Key change:** Add auto-invocation metadata

**Skills this enables:** LinkedIn thought leadership, viral posts, engagement

---

#### **#3: `hormozi-content-writer`** ⭐⭐⭐
**What it does:** Direct-response copywriting. High-converting value messages.
**Why critical:** Conversion focus. Used by Drona agent for strategy layers.
**Transformation effort:** 15 min
**Current format:** ✅ 99% ready
**Key change:** Expand description for Hormozi framework matching

**Skills this enables:** Grand Slam Offers, value stacking, persuasive messaging

---

#### **#4: `content-formatter-linkedin`** ⭐⭐
**What it does:** LinkedIn-specific formatting (character limits, hashtags, breaklines)
**Why critical:** Post polish. Prevents algorithm penalties.
**Transformation effort:** 10 min
**Current format:** ✅ Ready
**Key change:** Link to linkedin-post-generator as upstream

**Skills this enables:** Final LinkedIn post polish

---

#### **#5: `content-formatter-twitter`** ⭐⭐
**What it does:** Twitter thread structure optimization
**Why critical:** Second platform. Will post 5-10 tweets/day.
**Transformation effort:** 15 min
**Current format:** ✅ Ready
**Key change:** Add thread-specific activation conditions

**Skills this enables:** Viral Twitter threads, engagement loops

---

### Priority Tier 2: HIGH VALUE (Research + Validation)

#### **#6: `content-reviewer-factchecker`** ⭐⭐
**What it does:** Quality assurance gate-keeper. Fact-checks, validates, quality scores.
**Why critical:** Your approval bottleneck. Prevents bad posts.
**Transformation effort:** 15 min
**Current format:** ✅ 95% ready
**Key change:** Add quality metrics + approval workflow

**Skills this enables:** Zero-error content pipeline

---

#### **#7: `twitter-signal-monitor`** ⭐⭐
**What it does:** Real-time Twitter monitoring for 13 handles (trends, content gaps)
**Why critical:** Competitive intelligence + trend detection. Informs content angles.
**Transformation effort:** 30 min
**Current format:** ⚠️ Needs description overhaul
**Key change:** Add monitoring protocol + output format

**Current:**
```yaml
description: Monitors Twitter profiles for high-signal posts
```

**Needed:**
```yaml
description: >
  Monitor Twitter handles for trending topics, content gaps, and competitor moves.
  Use when: starting content creation, analyzing market trends, identifying what NOT to post,
  finding engagement patterns from top creators. Monitors: @KobeissiLetter, @chamath,
  @AlexHormozi, @saxena_puru, @naval, @elonmusk, and 7 others.
disable-model-invocation: false
user-invocable: true
```

**Skills this enables:** Real-time trend detection

---

#### **#8: `web-search-agent`** ⭐
**What it does:** Research specialist. Validates claims, finds sources, ground truth.
**Why critical:** Fact-checking foundation. Prevents SOTA claim errors.
**Transformation effort:** 20 min
**Current format:** ✅ Ready
**Key change:** Link to content-reviewer for validation pipeline

**Skills this enables:** Fact-verified content

---

### Priority Tier 3: SIGNAL PROCESSING (Framework + Strategy)

#### **#9: `the-razor`** ⭐
**What it does:** Filter signals using "Strict Necessity Test" (Phase 1 of signal pipeline)
**Why critical:** Removes noise from raw input. Prepares for analysis.
**Transformation effort:** 10 min
**Current format:** ✅ Ready
**Key change:** Add phase indicator for pipeline sequencing

**Skills this enables:** Signal Refinery workflow

---

#### **#10: `the-operator`** ⭐
**What it does:** Formulate concrete action plans. The final phase of signal pipeline.
**Why critical:** Converts analysis → actionable tasks. Closes the loop.
**Transformation effort:** 10 min
**Current format:** ✅ Ready
**Key change:** Add output format specification (tasks, deadlines, owners)

**Skills this enables:** Actionable strategic moves

---

## PART 2: TOP 10 CRITICAL AGENTS (In Priority Order)

### Why These 10?
- **3 are writers** (content production)
- **2 are researchers** (facts + trends)
- **2 are strategists** (Hormozi + business)
- **1 is quality control**
- **1 is coordinator**
- **1 is specialist** (first principles)

---

### Priority Tier 1: MUST MIGRATE (Core Team)

#### **#1: Ved Vyasa - Master Writer** ⭐⭐⭐
**Current Status:** 150+ lines of brilliant agent definition
**Transformation needed:** SIGNIFICANT (see detailed breakdown below)
**Effort:** 45 min
**Why:** Foundation for all content creation

**Current format (OpenClaw):**
```
# VED VYASA - Master Writer
## Agent Identity
- Agent ID: ved-vyasa
- Name: Ved Vyasa (वेद व्यास)
- Codename: The Compiler
## Role Description: [paragraph]
## MANDATORY PROTOCOLS: [list]
## EXPLICIT Skill List: [table]
## Activation Conditions: [if-then rules]
## Capabilities: [lists]
## Configuration: [env vars]
## Workflow: [flowchart]
## Integration Points: [matrix]
```

**Transformed format (Claude Code):**
```yaml
---
name: ved-vyasa
type: general-purpose
description: >
  Master writer producing production-ready content across all platforms.
  Specializes in: triad writing (Hero/Sage/Sovereign perspectives),
  platform-specific optimization (LinkedIn/Twitter/Blog), direct-response copy,
  narrative architecture. Use when: creating any written content, need professional
  craft, multi-perspective analysis, or brand voice consistency.
user-invocable: true
disable-model-invocation: false
allowed-tools: Read, Grep, Write
context: fork
agent: general-purpose
---

# VED VYASA - Master Writer

[All agent instructions here - same content as before]

## Pre-Assigned Skills

When activated, MUST use these skills in order:
1. **triad-writer** - Multi-perspective content creation
2. **hormozi-content-writer** - High-converting copy
3. **content-formatter-[platform]** - Platform optimization
4. **sidebringers-explainer** - Complex concept simplification (if needed)

## Activation Conditions

Automatically invoked when:
- Task involves writing or editing content
- User requests blog post, article, or social media content
- Other agents need written output
- Content needs platform-specific optimization

## Workflow

1. Receive content request
2. Clarify requirements (platform, voice, goal)
3. Activate triad-writer for multi-perspective draft
4. Activate hormozi-content-writer for conversion optimization
5. Activate content-formatter for platform compliance
6. Pass to content-reviewer for quality check
7. Deliver to user

## Integration Points

- **Receives input from:** Arundhati (research), User (requests), Drona (strategy)
- **Sends output to:** Content Reviewer, User
```

**What changed:**
- ✅ `## Agent Identity` → `---` frontmatter (YAML)
- ✅ `## Role Description` → `description:` (auto-detection enabled)
- ✅ `## EXPLICIT Skill List` → Listed in Instructions
- ✅ `## Activation Conditions` → In `description:` + markdown
- ✅ `## Workflow` → Simplified to markdown
- ✅ Removed: Environment variables (not needed in Claude Code)
- ✅ Added: `context: fork`, `agent: general-purpose`, `allowed-tools`

**Key difference:** OpenClaw agent is self-contained with all config. Claude Code agent is simpler—config goes in frontmatter, instructions in markdown.

---

#### **#2: Drona - Hormozi Strategist** ⭐⭐⭐
**Current Status:** 180+ lines of Hormozi framework
**Transformation needed:** SIGNIFICANT
**Effort:** 45 min
**Why:** Adds strategy layer to all content. Hormozi focus for 100K goal.

**Key changes same as Ved Vyasa:**
- Frontmatter: Add `---` + metadata
- Description: Expand for auto-detection
- Skills mapping: Include explicit list
- Activation: Add clear triggers
- Remove: OpenClaw-specific config

---

#### **#3: Arundhati - Social Media Monitor** ⭐⭐
**Current Status:** 120+ lines for trend monitoring
**Transformation needed:** SIGNIFICANT
**Effort:** 40 min
**Why:** Real-time competitive intelligence. Twitter monitoring.

**Key transformations:**
- Twitter handle list → in instructions
- Monitoring protocol → in markdown
- Output format → structured JSON
- Activation trigger → "when analyzing market trends"

---

### Priority Tier 2: HIGH VALUE (Research Team)

#### **#4: Agastya - Research Specialist** ⭐⭐
**Current Status:** Well-defined research agent
**Transformation needed:** MODERATE
**Effort:** 30 min
**Why:** Web research foundation. Fact-checking support.

---

#### **#5: Vidur - Business Consultant** ⭐⭐
**Current Status:** Business strategy agent
**Transformation needed:** MODERATE
**Effort:** 30 min
**Why:** Strategic decision support. Hormozi + business acumen.

---

#### **#6: Karna - First Principles Thinker** ⭐
**Current Status:** Deep research + deconstruction
**Transformation needed:** MODERATE
**Effort:** 25 min
**Why:** Complex analysis. Breaking down fundamentals.

---

### Priority Tier 3: Supporting Roles

#### **#7: Content Reviewer (Nakula)** ⭐
**Current Status:** QA gatekeeper
**Transformation needed:** MODERATE
**Effort:** 25 min
**Why:** Quality gate. Prevents bad content from publishing.

---

#### **#8: Brainstorming Agent** ⭐
**Current Status:** Idea generation
**Transformation needed:** LIGHT
**Effort:** 20 min
**Why:** Quick ideation. Content angle discovery.

---

#### **#9: Signal Monitor Agent** ⭐
**Current Status:** Alert system
**Transformation needed:** MODERATE
**Effort:** 25 min
**Why:** Proactive trend detection.

---

#### **#10: Orchestrator (Krishna)** ⭐⭐⭐
**Current Status:** Main coordinator
**Transformation needed:** MAJOR (new role in Claude Code)
**Effort:** 60 min
**Why:** Central coordinator. Spawns all sub-agents. Different in Claude Code.

---

## PART 3: THE AGENT TRANSFORMATION (Detailed)

### Agent Format Differences: OpenClaw vs Claude Code

**OpenClaw agents are:**
- Self-contained with full configuration
- Pre-assigned skill mappings
- Explicit activation conditions (if-then rules)
- Environment variables for config
- Integration matrix for inter-agent communication

**Claude Code agents are:**
- Simpler (config in frontmatter)
- Skill activation via prompt instructions
- Auto-detection based on description
- Tool restrictions via `allowed-tools`
- Integration via Agent tool spawning

---

### Agent Migration Formula

**Every agent needs:**

1. **Frontmatter (new):**
```yaml
---
name: [agent-id]
type: [general-purpose | Explore | Plan]
description: [expanded for auto-detection]
user-invocable: [true | false]
disable-model-invocation: [true | false]
context: [fork | inline]
agent: [general-purpose | Explore | Plan]
allowed-tools: [Read, Grep, Write, Bash(gh *)]
---
```

2. **Identity (from OpenClaw):**
```markdown
# [AGENT NAME]

[Role description]
[Codename]
[Version]
```

3. **Instructions (from OpenClaw):**
```markdown
## Primary Role

[Everything from MANDATORY PROTOCOLS]

## Pre-Assigned Skills

[From EXPLICIT Skill List]

## When to Use This Agent

[From Activation Conditions]

## Workflow

[From Workflow section]

## Integration

[From Integration Points]
```

---

### Comparison: Ved Vyasa Agent

**OpenClaw (Original):** 155 lines
**Claude Code (Transformed):** 165 lines (frontmatter + same content)

**What changed:**
- ✅ Added 8-line YAML frontmatter
- ✅ Removed OpenClaw configuration section
- ✅ Condensed activation conditions → Into description
- ✅ Simplified workflow for readability
- ✅ Everything else stays the same

**Risk level:** LOW (metadata only)
**Testing:** Spawn with Agent tool, verify functionality

---

## PART 4: TRANSFORMATION SCOPE & EFFORT

### Skills Migration

| Tier | Count | Effort/Each | Total Time | Priority |
|------|-------|---|---|---|
| **Tier 1 (Core)** | 5 | 15 min | 75 min | THIS WEEK |
| **Tier 2 (Research)** | 3 | 20 min | 60 min | THIS WEEK |
| **Tier 3 (Signal)** | 2 | 10 min | 20 min | NEXT WEEK |
| **Supporting** | 40+ | 10 min | 400+ min | Optional |
| **TOTAL (10)** | **10** | **15-30 min** | **2.5 hours** | **IMMEDIATE** |

---

### Agents Migration

| Tier | Count | Effort/Each | Total Time | Priority |
|------|-------|---|---|---|
| **Tier 1 (Core)** | 3 | 45 min | 135 min | THIS WEEK |
| **Tier 2 (Research)** | 3 | 30 min | 90 min | THIS WEEK |
| **Tier 3 (Support)** | 3 | 25 min | 75 min | NEXT WEEK |
| **Orchestrator** | 1 | 60 min | 60 min | NEXT WEEK |
| **TOTAL (10)** | **10** | **30-60 min** | **6 hours** | **1 WEEK** |

---

### Combined Timeline

```
TODAY (Skills Phase 1):
- Skills: 5 critical skills (75 min)
- Testing: Verify /skill-name invocation
- Time: 2 hours actual work

TOMORROW (Skills Phase 2):
- Skills: 3 research skills (60 min)
- Skills: 2 signal skills (20 min)
- Testing: Full skill suite
- Time: 2 hours

THIS WEEK (Agents Phase 1):
- Agents: 3 core agents (135 min)
- Testing: Sub-agent spawning
- Time: 3 hours

NEXT WEEK (Agents Phase 2):
- Agents: 7 remaining agents (225 min)
- Orchestrator: Central coordinator (60 min)
- Integration: Full pipeline test
- Time: 5-6 hours

TOTAL: ~11-12 hours over 2 weeks
```

---

## PART 5: EXECUTION PLAN (START NOW)

### What I'll Do (This Hour):

1. ✅ Create `.claude/skills/` directory structure for 10 skills
2. ✅ Create `.claude/agents/` directory structure for 10 agents
3. ✅ Reformat skill #1 (triad-writer) as Claude Code template
4. ✅ Reformat agent #1 (ved-vyasa) as Claude Code template
5. ✅ Provide both to you for review

### What You'll Do (Today):

1. ✅ Review transformed triad-writer skill (5 min)
2. ✅ Approve format or request changes (5 min)
3. ✅ Review transformed ved-vyasa agent (10 min)
4. ✅ Approve or request changes (10 min)
5. ✅ Test `/triad-writer [prompt]` (5 min)

### What We'll Do (Tomorrow):

1. ✅ Based on your feedback, transform remaining 9 skills (1.5 hours)
2. ✅ You test each skill (30 min)
3. ✅ Measure velocity improvement vs OpenClaw

### Then (This Week):

1. ✅ Transform 3 core agents (2 hours)
2. ✅ Test sub-agent spawning (1 hour)
3. ✅ Build orchestrator (1 hour)
4. ✅ Full end-to-end test (1 hour)

---

## PART 6: CRITICAL DECISION

**Question:** Should I reformat agents the same way as skills?

**Answer:** YES, but agents are more complex because they:
- Have explicit skill mappings
- Have activation conditions
- Have integration points
- May have configuration needs

**My recommendation:** Format agents like skills (YAML frontmatter + markdown), but preserve the skill mappings and integration notes in the markdown body. Everything works.

---

## FINAL SUMMARY

### Top 10 Skills (2.5 hours):
1. `triad-writer` — Foundation
2. `linkedin-post-generator-2026` — Your platform
3. `hormozi-content-writer` — Conversion
4. `content-formatter-linkedin` — Polish
5. `content-formatter-twitter` — Polish
6. `content-reviewer-factchecker` — QA
7. `twitter-signal-monitor` — Trends
8. `web-search-agent` — Research
9. `the-razor` — Signal filter
10. `the-operator` — Action planning

### Top 10 Agents (6 hours):
1. **Ved Vyasa** — Master Writer
2. **Drona** — Hormozi Strategist
3. **Arundhati** — Social Monitor
4. **Agastya** — Research Specialist
5. **Vidur** — Business Consultant
6. **Karna** — First Principles Thinker
7. **Content Reviewer** — QA Gate
8. **Brainstorming Agent** — Ideation
9. **Signal Monitor** — Alerts
10. **Orchestrator** — Coordinator

### Total Time: ~8.5 hours over 2 weeks

---

**Ready to start?**

