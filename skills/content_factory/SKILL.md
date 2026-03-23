---
name: content-factory
version: "2.0"
description: >
  Orchestrates end-to-end content production: signal detection → research → write → review →
  visual asset → Publer draft. Produces 5 LinkedIn + 5 Twitter posts daily. DRAFTS ONLY.
user-invocable: true
chains_from: [sukra, agastya, user_request]
chains_to: [vayu, nakula, vishwakarma, sahadeva]
tier3_refs: []
depends_on: []
feeds_into: [execution_logger]
parallel_with: []
---

# Content Factory — Production Pipeline Orchestrator

End-to-end content production using the full Mahabharata agent ecosystem.

---

## EVALS (Self-Testing)

Run these before deploying changes to this skill. All 3 must pass.

### Eval 1: Topic-Driven Mode
**Input:** `"Write 2 LinkedIn posts about AI agents replacing human teams"`
**Pass Criteria:**
- [ ] Produces 2 distinct LinkedIn posts with unique angles
- [ ] Each post: hook in first 2 lines, no banned words, 1/3/1 rhythm
- [ ] Each post: 8-10 hashtags, space-separated, at end only
- [ ] Each post includes a visual asset brief
- [ ] Quality score >= 8.0 from Nakula
- [ ] Output saved to `Marketing Assets/LinkedIn/`
- [ ] No auto-publish — DRAFTS ONLY

### Eval 2: Full Daily Run
**Input:** `"Run full content factory — produce today's 10 posts"`
**Pass Criteria:**
- [ ] 5 LinkedIn + 5 Twitter posts produced
- [ ] Sukra signal detection invoked OR Agastya research triggered
- [ ] All posts pass quality gate (8.0+)
- [ ] All posts have paired visual asset brief
- [ ] Sahadeva saves to Publer as DRAFTS (never publishes)
- [ ] Execution logged via skill_execution_observer

### Eval 3: Failure Recovery
**Input:** Content with 2 quality gate failures
**Pass Criteria:**
- [ ] After 2nd fail: pipeline STOPS, does NOT loop again
- [ ] Failure documented with specific reasons
- [ ] Human guidance requested with context
- [ ] No partial/broken content saved to Publer

---

## REFINEMENT_TRIGGERS

Auto-flag this skill for `skill_amender` review when:

```yaml
triggers:
  - condition: quality_gate_fail_rate > 30%
    window: last_10_runs
    action: inspect_writing_phase

  - condition: avg_quality_score < 8.2
    window: last_7_days
    action: inspect_research_or_writing_phase

  - condition: pipeline_completion_rate < 80%
    window: last_5_runs
    action: inspect_failure_handling

  - condition: revision_count_avg > 1.5
    window: last_10_runs
    action: inspect_draft_quality

  - condition: banned_word_detected
    window: any_run
    action: immediate_flag_to_skill_amender
```

---

## Daily Target

- 5 LinkedIn posts + 5 Twitter posts = 10 posts/day
- Every post has an accompanying visual asset brief
- All posts saved as DRAFTS (never auto-publish)
- 30-minute review window before final approval
- Quality gate: minimum 8.0/10 score

---

## Pipeline Architecture

```
SIGNAL DETECTION (Sukra)
  Monitor 16 Twitter/X profiles, score posts (70+ threshold)
  |
  v
RESEARCH (Agastya)
  Web search, fact verification, source matrix
  |
  v
TRANSFORMATION (Chitrasena)
  Sidebrinders simplification + Hormozi optimization
  |
  v
WRITING (Ved Vyasa)
  Triad writer + hormozi content writer + 1/3/1 rhythm
  |
  v
FORMATTING (Vayu)
  LinkedIn format (8-10 hashtags) + Twitter format (5-8 hashtags)
  Unified Content ID: SIG-YYYYMMDD-###
  |
  v
QUALITY GATE (Nakula)
  6 quality tests + fact-check + brand alignment
  Score >= 8.0/10 = PASS
  |
  v
ASSETS (Vishwakarma)
  Visual asset paired with content (infographic, quote card, etc.)
  |
  v
PUBLISHING (Sahadeva)
  Save as DRAFT in Publer — NEVER auto-publish
  Chairman approval required before publishing
  |
  v
ORCHESTRATION (Krishna)
  Coordinates all agents, manages dependencies, logs execution
```

---

## Composability Map

```yaml
upstream_skills:
  - twitter_signal_monitor   # signal source
  - web_search_agent         # research source
  - source_matrix            # credibility scoring

core_skills:
  - triad_writer             # Phase 3: Draft
  - hormozi_content_writer   # Phase 3: Conversion
  - sidebringers_explainer   # Phase 2: Simplify
  - content_formatter_linkedin  # Phase 4: Format
  - content_formatter_twitter   # Phase 4: Format

downstream_skills:
  - content_reviewer_factchecker  # Quality gate
  - visual_asset_matcher          # Asset pairing
  - notebooklm_operator           # Asset creation
  - publer_operator               # Save as draft

logging_skills:
  - skill_execution_observer  # Log every run
```

---

## Execution Modes

### Mode 1: Signal-Driven (Automated)
```
Sukra (signal) -> Chitrasena (transform) -> Vayu (format)
                                         -> Nakula (review)
                                         -> Vishwakarma (asset)
                                         -> Sahadeva (draft)
```

### Mode 2: Topic-Driven (User Request)
```
User (topic) -> Agastya (research) -> Ved Vyasa (write) -> Vayu (format)
                                                        -> Nakula (review)
                                                        -> Vishwakarma (asset)
                                                        -> Sahadeva (draft)
```

### Mode 3: Source-Driven (Call Recordings, Articles)
```
Source material -> Agastya (extract insights) -> Ved Vyasa (write)
                                              -> Chitrasena (simplify)
                                              -> Vayu (format)
                                              -> Nakula (review)
                                              -> Sahadeva (draft)
```

---

## Parallelization

```yaml
max_concurrent_agents: 5
parallel_opportunities:
  - Research + Brainstorming = Independent (run parallel)
  - Writing depends on Research = Sequential
  - Review + Asset creation = Independent (run parallel)
  - Multiple content pieces = Fully parallel
  - LinkedIn + Twitter formatting = Parallel
estimated_speedup: 2.6x vs sequential
```

---

## Agent Responsibilities

| Agent | Role | Input | Output |
|-------|------|-------|--------|
| Sukra | Signal detection | 16 Twitter profiles | High-signal posts (70+ score) |
| Agastya | Research | Topics, signals | Research dossiers with sources |
| Chitrasena | Transformation | Raw signals | Simplified, Hormozi-optimized content |
| Ved Vyasa | Writing | Research, topics | Polished content drafts |
| Vayu | Formatting | Content drafts | Platform-formatted posts (LI + TW) |
| Nakula | Quality gate | Formatted posts | PASS/REVISE/REJECT decisions |
| Vishwakarma | Assets | Content context | Visual assets (images, infographics) |
| Sahadeva | Publishing | Approved posts | Publer drafts + calendar |
| Krishna | Orchestration | All pipeline data | Coordination, logging, escalation |

---

## Quality Requirements

### Non-Negotiable Rules
1. Research before writing (never write unverified claims)
2. Mental models applied invisibly (never labeled in output)
3. 1/3/1 sentence rhythm throughout
4. Zero AI fluff words
5. Zero em-dashes
6. Every claim backed by data or specific example
7. Grade 5 reading level
8. Minimum 8.0/10 quality score

### Banned Words
delve, dynamic, unlock, revolutionize, harness, comprehensive, landscape, paradigm, synergy, leverage, might, perhaps, arguably, it could be said

### Platform Rules
- **LinkedIn:** 8-10 hashtags at end (space-separated, no commas). Hook in first 2 lines.
- **Twitter:** 5-8 hashtags in closing tweet only. 280 chars per tweet. Hook must stand alone.
- **Blog:** 2,000-3,000 words. Visual every 300-400 words. Never summarize at end.

---

## Content Sources

1. **Twitter/X Signals** (via Sukra): 16 monitored profiles
2. **Call Recordings** (CEO-CTO): Strategic insights, product positioning
3. **Industry Research** (via Agastya): Trends, benchmarks, competitor analysis
4. **User Requests**: Direct content briefs

---

## Output Directory

All content saved to: `D:\Work Weaver\Marketing Assets\`
- LinkedIn posts: `Marketing Assets\LinkedIn\`
- Twitter threads: `Marketing Assets\Twitter\`
- Blog posts: `Marketing Assets\Blog\`
- Infographics: `Marketing Assets\Infographic\`
- Approved posts: `Marketing Assets\APPROVED_POSTS_[DATE].md`

---

## Failure Handling

- **Quality gate fails 2x**: Stop, document issues, request human guidance
- **Research incomplete**: Do not proceed to writing phase
- **Agent unavailable**: Log, try alternative agent, escalate to Krishna
- **Asset generation fails**: Content can proceed, asset created separately
- **Publer API error**: Save content locally, retry scheduling later

---

## Self-Improvement Integration

After each pipeline run:
1. Log execution data via `skill_execution_observer`
2. Record quality scores, pass/fail rates, revision counts
3. Check REFINEMENT_TRIGGERS — auto-flag if any condition met
4. Weekly: Run `skill_inspector` to analyze patterns
5. If skill underperforms: Run `skill_amender` to propose improvements
6. After amendment: Evaluate improvement via before/after quality scores
