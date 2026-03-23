# AGENT-TO-SKILL MAPPING REGISTRY
**Last Updated:** 2026-03-12
**Total Skills:** 46
**Total Agents:** 12

---

## Master Agent Roster

### Content Creation Pipeline

#### Ved Vyasa (Master Storyteller & Writer)
**Primary Role:** Narrative structure, conversion, platform optimization
**Skills:** 8
- `triad_writer` - Hero/Sage/Sovereign archetypes
- `hormozi_content_writer` - Value equation & conversion
- `dan_koe_audience_builder` - Community & utility
- `linkedin_post_generator_2026` - LinkedIn optimization
- `twitter_post_optimizer` - Twitter viral patterns
- `content_formatter_linkedin` - LinkedIn formatting
- `content_formatter_twitter` - Twitter formatting
- `ai_writing_humanizer` - Voice & authenticity

#### Agastya (Master Researcher & Signal Detective)
**Primary Role:** Ground truth validation, trend detection, signal analysis
**Skills:** 6
- `web_search_agent` - Fact & research
- `twitter_signal_monitor` - Social trends
- `ai_industry_tracker` - SOTA benchmarks
- `source_matrix` - Source credibility
- `signal_aggregator` - Pattern detection
- `concept_simplifier` - Accessible explanation

#### Nakula (Quality Gatekeeper & Fact Checker)
**Primary Role:** Multi-dimensional quality assurance, fact verification
**Skills:** 3
- `content_reviewer_factchecker` - Comprehensive QA
- `copy_editor` - Grammar & polish
- `the_truth_engine` - Fact validation

#### Vishwakarma (Master Artisan & Asset Creator)
**Primary Role:** Visual asset creation and semantic pairing
**Skills:** 2
- `notebooklm_operator` - Infographics & slides
- `visual_asset_matcher` - Asset-to-text pairing

#### Narada (Publishing & Distribution Specialist)
**Primary Role:** Cross-platform scheduling and content distribution
**Skills:** 4
- `hybrid_social_media_scheduler` - Multi-platform coordination
- `publer_operator` - Publer scheduling
- `content_formatter_linkedin` - LinkedIn formatting
- `content_formatter_twitter` - Twitter formatting

---

### Strategic Council

#### Drona (Value & Offer Architect)
**Primary Role:** Business model innovation, grand slam offers
**Skills:** 3
- `hormozi_strategy_injector` - Value injection
- `value_equation` - Value optimization
- `grand_slam_offer_architect` - Offer design

#### Vidur (Master Strategist)
**Primary Role:** Long-term positioning, competitive strategy
**Skills:** 3
- `chanakya_business_strategist` - Strategic positioning
- `business_analysis` - Market analysis
- `strategic_positioning` - Differentiation

#### Bhishma (Wise Counselor)
**Primary Role:** Pattern recognition, wisdom synthesis
**Skills:** 3
- `strategic_advisory` - Strategic counsel
- `pattern_recognition` - Pattern identification
- `wisdom_synthesis` - Insight synthesis

#### Karna (First Principles Master)
**Primary Role:** Mechanism deconstruction, fundamental truth
**Skills:** 3
- `the_reality_os_destructor` - Root cause analysis
- `first_principles_thinking` - Fundamental deconstruction
- `mechanism_analysis` - System mechanics

---

### Supporting Agents

#### Dushyenta (Creative Brainstormer)
**Primary Role:** Ideation, alternatives, creative exploration
**Skills:** 4
- `brainstorming_agent` - Multi-angle ideation
- `the_lateral_thinker` - Analogies & patterns
- `idea_generation` - Diverse ideas
- `creative_alternatives` - Alternative approaches

#### Banasura (Resourcefulness Gate)
**Primary Role:** Constraint analysis, feasibility verification
**Skills:** 3
- `resourcefulness_agent` - Resource verification
- `constraint_analysis` - Constraint identification
- `scope_modification` - Scope optimization

#### Krishna (Master Orchestrator)
**Primary Role:** System coordination, agent dispatch, execution logging
**Skills:** 2
- `council_dispatcher` - Strategic routing
- `execution_logger` - Metrics & tracking

#### Ashwatthama (Signal Aggregator) [Secondary Agent]
**Primary Role:** Cross-source meta-trend identification
**Skills:** 1
- `signal_aggregator` - Pattern synthesis

---

## Skill Categories & Usage

### Content Creation (8 skills)
Use when: Writing posts, articles, content, newsletters
Primary Agent: Ved Vyasa
**In `/c/Users/Windows/.claude/skills/`:**
- triad_writer/
- hormozi_content_writer/
- dan_koe_audience_builder/
- linkedin_post_generator_2026/
- twitter_post_optimizer/
- content_formatter_linkedin/
- content_formatter_twitter/
- ai_writing_humanizer/

### Research & Signals (5 skills)
Use when: Researching, validating facts, monitoring trends
Primary Agent: Agastya
**In `/c/Users/Windows/.claude/skills/`:**
- web_search_agent/
- twitter_signal_monitor/
- ai_industry_tracker/
- source_matrix/
- signal_aggregator/

### Content Enhancement (6 skills) - The Six Phases
Use when: Quality assurance, enhancement, polish
Primary Agents: Various (input-specific)
**In `/c/Users/Windows/.claude/skills/`:**
- the_razor/
- the_truth_engine/
- the_lateral_thinker/
- the_reality_os_destructor/
- the_strategist/
- the_operator/

### Review & Quality (2 skills)
Use when: Fact-checking, final review, polish
Primary Agent: Nakula
**In `/c/Users/Windows/.claude/skills/`:**
- content_reviewer_factchecker/
- copy_editor/

### Business & Strategy (10 skills)
Use when: Pricing, positioning, strategy decisions, offer design
Primary Agents: Drona, Vidur, Bhishma, Karna
**In `/c/Users/Windows/.claude/skills/`:**
- chanakya_business_strategist/
- hormozi_strategy_injector/
- council_dispatcher/
- value_equation/
- grand_slam_offer_architect/
- business_analysis/
- strategic_positioning/
- strategic_advisory/
- pattern_recognition/
- wisdom_synthesis/

### Asset Creation (2 skills)
Use when: Creating visuals, infographics, designing assets
Primary Agent: Vishwakarma
**In `/c/Users/Windows/.claude/skills/`:**
- notebooklm_operator/
- visual_asset_matcher/

### Infrastructure & Coordination (3 skills)
Use when: Planning, resource checking, logging
Primary Agents: Banasura, Krishna
**In `/c/Users/Windows/.claude/skills/`:**
- resourcefulness_agent/
- execution_logger/
- morning_brief_generator/

### Brainstorming (3 skills)
Use when: Ideating, exploring options, creative thinking
Primary Agent: Dushyenta
**In `/c/Users/Windows/.claude/skills/`:**
- brainstorming_agent/
- idea_generation/
- creative_alternatives/

### Specialized (7 skills)
Use when: First principles analysis, constraint handling, scheduling
Primary Agents: Various
**In `/c/Users/Windows/.claude/skills/`:**
- concept_simplifier/
- first_principles_thinking/
- mechanism_analysis/
- constraint_analysis/
- scope_modification/
- hybrid_social_media_scheduler/
- publer_operator/

---

## How Claude Code Uses This

1. **Skill Discovery:** Claude Code scans `~/.claude/skills/` directories and reads SKILL.md files
2. **Skill Display:** `/skills` command shows all discovered skills (now 46 instead of 7)
3. **Agent Routing:** When user input is analyzed, this mapping determines which agent gets invoked
4. **Skill Invocation:** Agents automatically use assigned skills via the Skill tool

---

## Verification Checklist

- [x] All 46 skills have directory structure in `~/.claude/skills/`
- [x] All 46 SKILL.md files have proper frontmatter (name, description, version, author)
- [x] Agent-to-skill mapping documented
- [x] Skill categories organized by function
- [x] Primary and secondary agent assignments clear

**Status:** ✅ COMPLETE - All skills registered and discoverable by Claude Code
