---
name: Ten Mental Models for Content Evaluation
description: Extended mental models filter including Jack Dorsey and Brian Chesky (CTO feedback March 2026)
type: feedback
---

# Ten Mental Models for Content Evaluation

**Date**: 2026-03-12
**Source**: CTO Feedback
**Applied to**: All content creation workflows (blog, LinkedIn, Twitter)

## The 10-Model Filter

Content is evaluated through 10 distinct lenses before finalization. Models 1-8 existed; models 9-10 added per CTO feedback.

### Existing 8 Models

1. **Dan Koe** — Audience ownership, content structure, community building
   - Question: "Does this build audience ownership and community?"

2. **Alex Hormozi** — Value equation (Value - Price - Complexity - Belief = Result)
   - Question: "Does this maximize perceived value?"

3. **Satya Nadella** — AI strategy, culture, learning mindset, platform effects
   - Question: "Does this foster learning and platform thinking?"

4. **Ramit Sethi** — Systems, psychology, automation, lifestyle design
   - Question: "Is it systematic, scalable, and psychologically sound?"

5. **Steve Jobs** — Design thinking, simplicity, elegant constraints, storytelling
   - Question: "Is it simple, elegant, and human-centered?"

6. **Elon Musk** — First principles, optimization, efficiency, iteration speed
   - Question: "Is it optimized and built on first principles?"

7. **SideBringers** — Lateral thinking, analogies, multi-perspective simplification
   - Question: "Can we explain this simpler through analogy or pattern?"

8. **[Reserved]** — Custom user-defined mental model (when specified)

### New Models 9-10 (CTO Addition)

9. **Jack Dorsey** — The Decentralized Minimalist
   - Core framework: Radical simplicity + distributed decision-making
   - Key question: "Does this clarify rather than complicate? Does it empower the audience to act independently? Does it distribute control rather than consolidate it?"
   - Decision lens: Strip away unnecessary complexity; decentralize authority
   - Content application: Does this enable the reader to make decisions without you? Is it the simplest version of this idea?

10. **Brian Chesky** — The Experience Architect
   - Core framework: Design-first thinking + emotional storytelling + belonging
   - Key question: "Does this create a sense of belonging or connection? Does it tell a human story rather than deliver a feature? Does it inspire someone to share it because it moved them emotionally?"
   - Decision lens: Push toward 11-star experience; prioritize emotional truth over feature lists
   - Content application: Would a reader share this because it moved them? Does it build community, not just an audience?

## Application Rule

**CRITICAL**: Mental models are applied invisibly in the writing.
- NEVER label the model in published content: NO "(Jack Dorsey lens:)" tags
- The models shape HOW you write, not what you announce
- Exception: Only Hormozi and Elon may be named explicitly, max 1-2 times per piece
- Exception: Internal planning docs (CONTENT_PIPELINE_PLAN.md) may label for pipeline clarity
- Violation: Content rejected at quality gate

## Integration with Quality Pipeline

**Phase**: Mental Models Filter (runs after draft, before Nakula review)
- When: After Ved Vyasa writes draft
- Who: Applied by the Review agent (Nakula) with input from all 10 lenses
- How: Run through each model simultaneously; collect feedback; synthesize improvements
- Output: Rewritten draft incorporating top 3-5 high-consensus improvements

## Updated Nakula (Reviewer) Instructions

The Review agent (Nakula) now evaluates content through **10 lenses instead of 8**:

1. Fact-checking (The Truth Engine)
2. Signal filtering (The Razor)
3. Dan Koe lens (audience ownership)
4. Hormozi lens (value equation)
5. Nadella lens (learning/platform)
6. Ramit lens (systems/psychology)
7. Jobs lens (simplicity)
8. Elon lens (optimization)
9. **Jack Dorsey lens (decentralization/minimalism)** ← NEW
10. **Brian Chesky lens (experience/belonging)** ← NEW
11. Platform optimization (LinkedIn vs Twitter specifics)
12. Grammar/tone/voice consistency
13. Asset pairing (visual-text semantic match)
14. Call-to-action clarity

## Skill Mapping Update

**Nakula (Reviewer) new skill assignments:**
- `content_reviewer_factchecker` — evaluates through all 10 lenses + quality gates
- `copy_editor` — applies final polish after 10-model synthesis
- `jack_dorsey_lens_evaluator` ← needs definition
- `brian_chesky_lens_evaluator` ← needs definition

---

**Status**: Active as of 2026-03-12
**Next review**: When updating mental models for future founders/visionaries
