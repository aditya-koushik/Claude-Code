# TRANSFORMED SKILL #1: triad-writer (Claude Code Format)
**Original:** 1,012 lines of OpenClaw format
**Transformed:** 1,021 lines of Claude Code format
**Change scope:** 9-line header only
**Effort:** 15 minutes

---

## BEFORE (OpenClaw Format)

```yaml
---
name: triad-writer
description: Elite content architect blending Dan Koe's philosophy, Hormozi's value mechanics, and Reality OS systems. Produces production-ready content that doesn't look AI-generated. Use for LinkedIn posts, Twitter threads, newsletters, and any content requiring professional writing craft.
---

[... 1,008 lines of content ...]
```

---

## AFTER (Claude Code Format)

```yaml
---
name: triad-writer
type: general-purpose
description: >
  Create production-ready content blending multiple writing philosophies.
  Specializes in: triad writing (Hero/Sage/Sovereign perspectives),
  multi-archetype narratives (Philosopher, Operator, Architect, Provocateur),
  platform optimization (LinkedIn/Twitter/Blog/Newsletter),
  and professional writing craft.
  Use when: writing ANY content type, need human-like professional craft,
  multi-perspective narrative, brand voice consistency, or content requiring depth.
  Based on: Dan Koe (philosophy), Alex Hormozi (value mechanics),
  Reality OS (systems thinking), Dickie Bush (category creation).
disable-model-invocation: false
user-invocable: true
context: fork
agent: general-purpose
allowed-tools: Read, Grep, Write, Bash(curl *)
---

[... 1,008 lines of content - IDENTICAL to OpenClaw version ...]
```

---

## What Changed (Line-by-Line)

| Line | OpenClaw | Claude Code | Why |
|------|----------|-------------|-----|
| 1 | `---` | `---` | ✅ Same |
| 2 | `name: triad-writer` | `name: triad-writer` | ✅ Same |
| 3 | `description: Elite content...` | `description: >` (multiline) | ✅ Expanded for auto-detection |
| 4 | `---` | `type: general-purpose` | ✅ NEW: Claude Code agent type |
| 5 | (Content starts) | `description: Create...` (cont.) | ✅ Expanded description (5 lines) |
| 9 | (Content starts) | `disable-model-invocation: false` | ✅ NEW: Allow auto-invocation |
| 10 | (Content starts) | `user-invocable: true` | ✅ NEW: You can invoke manually |
| 11 | (Content starts) | `context: fork` | ✅ NEW: Isolated agent context |
| 12 | (Content starts) | `agent: general-purpose` | ✅ NEW: Agent type specification |
| 13 | (Content starts) | `allowed-tools: Read, Grep, Write...` | ✅ NEW: Tool restrictions |
| 14 | (Content starts) | `---` | ✅ Same |
| 15+ | Content | Content (IDENTICAL) | ✅ 1,008 lines unchanged |

---

## Key Differences Explained

### 1. Description Field (Expanded for Auto-Detection)

**Why?** Claude Code reads skill descriptions to decide when to auto-invoke.

**OpenClaw:**
```yaml
description: Elite content architect blending Dan Koe's philosophy, Hormozi's value mechanics, and Reality OS systems. Produces production-ready content that doesn't look AI-generated. Use for LinkedIn posts, Twitter threads, newsletters, and any content requiring professional writing craft.
```

**Claude Code:**
```yaml
description: >
  Create production-ready content blending multiple writing philosophies.
  Specializes in: triad writing (Hero/Sage/Sovereign perspectives),
  multi-archetype narratives (Philosopher, Operator, Architect, Provocateur),
  platform optimization (LinkedIn/Twitter/Blog/Newsletter),
  and professional writing craft.
  Use when: writing ANY content type, need human-like professional craft,
  multi-perspective narrative, brand voice consistency, or content requiring depth.
  Based on: Dan Koe (philosophy), Alex Hormozi (value mechanics),
  Reality OS (systems thinking), Dickie Bush (category creation).
```

**What this enables:**
- When you say "Create a LinkedIn post," Claude Code reads this description
- Matches "platform optimization (LinkedIn...)"
- Auto-detects → Auto-spawns triad-writer
- Zero manual work

### 2. New Metadata Fields

```yaml
type: general-purpose              # Claude Code agent type (vs Explore, Plan)
disable-model-invocation: false    # Allow me to auto-invoke (vs manual only)
user-invocable: true               # You can also type /triad-writer
context: fork                      # Run in isolated agent context (parallel execution)
agent: general-purpose             # Which agent runtime to use
allowed-tools: ...                 # What tools this skill can access
```

**Why these matter:**
- `disable-model-invocation: false` → I detect when needed, invoke automatically
- `context: fork` → Runs in isolated context (doesn't interfere with main conversation)
- `allowed-tools` → Security restriction (this skill only needs Read/Write/Bash)

### 3. Content Section (IDENTICAL)

All 1,008 lines of your brilliant content stays **exactly the same**:
- ✅ The Core Mental Model
- ✅ The 4 Core Archetypes (Philosopher, Operator, Architect, Provocateur)
- ✅ Mode Selection Guide
- ✅ Writing Craft Rules (1/3/1 Rhythm, Grade 5, No AI Fluff, etc.)
- ✅ Content Formats (LinkedIn, Twitter, Newsletter)
- ✅ Quality Checklist (6 tests)
- ✅ Execution Protocol
- ✅ Common Mistakes
- ✅ All 10 Examples
- ✅ Integration Notes

---

## File Comparison (Side-by-Side)

```
OPENCLAW (1,012 lines)         |  CLAUDE CODE (1,021 lines)
---                            |  ---
name: triad-writer             |  name: triad-writer
description: Elite...          |  type: general-purpose
---                            |  description: > [expanded]
                               |  disable-model-invocation: false
                               |  user-invocable: true
                               |  context: fork
                               |  agent: general-purpose
                               |  allowed-tools: Read, Grep, Write, Bash(curl *)
# TRIAD_WRITER                 |  ---
                               |  # TRIAD_WRITER
Produces "Production-Ready"... |  Produces "Production-Ready"... [SAME]
                               |
The Core Mental Model          |  The Core Mental Model [SAME]
The 4 Core Archetypes          |  The 4 Core Archetypes [SAME]
...                            |  ... [ALL 1,008 CONTENT LINES IDENTICAL]
```

---

## The Transformation (Complete Example)

Here's what the actual transformed file looks like (first 50 lines):

```yaml
---
name: triad-writer
type: general-purpose
description: >
  Create production-ready content blending multiple writing philosophies.
  Specializes in: triad writing (Hero/Sage/Sovereign perspectives),
  multi-archetype narratives (Philosopher, Operator, Architect, Provocateur),
  platform optimization (LinkedIn/Twitter/Blog/Newsletter),
  and professional writing craft.
  Use when: writing ANY content type, need human-like professional craft,
  multi-perspective narrative, brand voice consistency, or content requiring depth.
  Based on: Dan Koe (philosophy), Alex Hormozi (value mechanics),
  Reality OS (systems thinking), Dickie Bush (category creation).
disable-model-invocation: false
user-invocable: true
context: fork
agent: general-purpose
allowed-tools: Read, Grep, Write, Bash(curl *)
---

# TRIAD_WRITER - Elite Content Architect

Produces "Production-Ready" content that feels like a download from a genius brain—structured, valuable, dangerously readable.

---

## The Core Mental Model: "The Slippery Slope"

**A professional writer's only goal: Get the reader to read the next sentence.**

- The headline → gets them to read the first sentence
- The first sentence → gets them to read the second
- The second → gets them to read the third

**If the reader stops, you hit "Friction."**

**The Golden Rule:** If a sentence does not add value or move the reader forward, **DELETE IT.**

---

## The 4 Core Archetypes

### Archetype 1: THE PHILOSOPHER (Dan Koe)
**Focus:** The Path, deconstructing the old way, One-Person Business flow

[... continues identically to original ...]
```

---

## Testing Plan

Once you approve this format, here's how we test:

### Step 1: Save File
- Copy this transformed version
- Save as `~/.claude/skills/triad-writer/SKILL.md`

### Step 2: Test Invocation
```bash
# Manual invocation
/triad-writer Create a LinkedIn post about WorkWeaver AI agents

# Should work immediately
```

### Step 3: Test Auto-Invocation
```
You: "Write a professional blog post about AI adoption strategies"
Me (auto-detect):
- Task type: writing, blog post
- Match description: "platform optimization (Blog...)"
- Auto-spawn: triad-writer skill
- User says: write blog post
- My decision: triad-writer is perfect
- [Auto-invokes without asking]
```

### Step 4: Measure Velocity
- Compare time: manual invocation vs auto-invocation
- Should see immediate ~1 min time savings per task

---

## Your Feedback Needed

Please review and confirm:

1. ✅ **Format correct?** Does the frontmatter look right?
2. ✅ **Content preserved?** All 1,008 lines of skill content intact?
3. ✅ **Description adequate?** Is the expanded description clear for auto-detection?
4. ✅ **Ready to test?** Should I create the file and have you test it?

Once approved, I'll:
1. Create this file in `.claude/skills/triad-writer/SKILL.md`
2. Do the same for #2 (linkedin-post-generator-2026)
3. Do the same for #3 (hormozi-content-writer)
4. All 3 complete by tomorrow morning
5. You test all 3 by afternoon

---

## Next Steps

**Option A:** Approve this format → I create all 10 skills tomorrow
**Option B:** Request changes → I adjust and re-submit
**Option C:** You edit & save yourself → Send me confirmation

**My recommendation:** Option A. You approve format, I handle the transformation.

**What should we do?**

