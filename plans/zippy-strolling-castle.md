# CoWork Plugins Integration Plan for Bit Foundry AI

## Context

Bit Foundry AI currently runs 27 Mahabharata-themed agents + 91 skills as standalone components in Claude Code. The Anthropic `knowledge-work-plugins` repo provides 15 core plugins + 4 partner-built plugins + 15 marketplace plugins that package domain expertise as self-contained "teams." The goal: merge both worlds into **goal-in, result-out plugins** where setting a goal triggers all 100 internal steps automatically — no manual orchestration needed.

**Design Principle:** CoWork plugin = base framework. User's skills/agents = injected specializations. Each merged plugin is a self-contained team with its own orchestrator agent, domain skills, brand customization, and tool connectors.

---

## Phase 0: Foundation Setup

### 0.1 Install Plugin Infrastructure
```bash
claude plugin marketplace add anthropics/knowledge-work-plugins
```

### 0.2 Create Plugin Workspace
```
D:/Work Weaver/Plugins/
├── merged/          # Our customized plugins (CoWork base + our specializations)
├── custom/          # New plugins built from our unique capabilities
└── reference/       # CoWork originals (read-only reference)
```

### 0.3 Establish Plugin Template
Every plugin follows:
```
plugin-name/
├── .claude-plugin/plugin.json    # Manifest
├── .mcp.json                     # Tool connections
├── skills/                       # Domain knowledge (auto-triggered)
├── commands/                     # Explicit slash commands
├── agents/                       # Orchestrator + sub-agents
├── references/                   # Brand voice, style guides, templates
├── CONNECTORS.md                 # Tool-agnostic category placeholders
└── README.md
```

---

## Phase 1: MERGED PLUGINS (CoWork base + Our Specializations)

### Plugin 1: `marketing` (MEGA MERGE — Highest Complexity)

**CoWork base brings (NEW capabilities we lack):**
- campaign-planning (frameworks, content calendars, budget allocation)
- performance-analytics (metrics by channel, trend analysis, attribution)
- seo-audit capability
- email-sequence drafting
- Commands: `/marketing:campaign-plan`, `/marketing:performance-report`, `/marketing:seo-audit`, `/marketing:email-sequence`

**Our specializations injected:**
- **Orchestrator Agent:** Krishna (coordinates full pipeline)
- **Sub-Agents:** Ved Vyasa (write), Agastya (research), Nakula (review 9.0/10 gate), Vayu (format), Sahadeva (publish DRAFTS ONLY), Vishwakarma (visual assets)
- **Skills merged in:**
  - `content-factory` (replaces generic content-creation with our pipeline)
  - `writing-agent` (7-phase elite writing)
  - `triad-writer`, `hormozi-content-writer`, `dan-koe-audience-builder`
  - 6-phase enhancement pipeline (razor → truth → lateral → reality → strategist → operator)
  - `hook-master` (scroll-stopping hooks)
  - `linkedin-post-generator-2026`, `twitter-post-optimizer`
  - `content-formatter-linkedin`, `content-formatter-twitter`
  - `ai-writing-humanizer` (final pass)
  - `visual-asset-matcher`, `notebooklm-operator`
  - `hybrid-social-media-scheduler`, `publer-operator`
  - Self-improving loop (observer → inspector → amender)
- **Brand customization:**
  - `writing_style.md` injected into brand-voice skill
  - Banned words list, grade 5 reading level, 1/3/1 rhythm
  - Alex Hormozi meets Steve Jobs voice
  - Platform rules: LinkedIn 8-10 hashtags, Twitter 280-char threads
- **Quality gate:** 9.0/10 minimum, max 3 revision cycles
- **Publishing rule:** DRAFTS ONLY on Publer, 30-min review window

**Commands exposed:**
- `/marketing:create-content [topic]` — Full pipeline: research → write → review → format → asset → draft
- `/marketing:campaign-plan [goal]` — Campaign framework with calendar and budget
- `/marketing:performance-report` — Channel analytics and optimization
- `/marketing:seo-audit [url]` — SEO analysis and recommendations
- `/marketing:brand-review [content]` — Check against brand voice
- `/marketing:email-sequence [goal]` — Drip sequence creation
- `/marketing:daily-content` — Run daily 10-post pipeline (5 LI + 5 TW)

**MCPs:** Canva, Figma, Notion, Publer, Playwright (Twitter), NotebookLM + CoWork defaults

---

### Plugin 2: `sales` (MERGE)

**CoWork base brings (NEW):**
- account-research, call-prep, call-summary
- pipeline-review, forecast (weighted scenarios)
- competitive-intelligence, daily-briefing
- create-an-asset (landing pages, decks, one-pagers)
- Commands: `/sales:call-prep`, `/sales:forecast`, `/sales:pipeline-review`

**Our specializations injected:**
- **Orchestrator Agent:** Rama (lead gen orchestrator)
- **Sub-Agents:** Drona (Hormozi grand slam offers), Vidur (ROI/value analysis)
- **Skills merged in:**
  - `grand-slam-offer-architect` (irresistible offer bundles)
  - `hormozi-strategy-injector` (value equation applied to deals)
  - `value-equation` (dream outcome x likelihood / time x effort)
  - `strategic-positioning` (category ownership)
  - `pattern-recognition` (deal pattern detection)
- **Brand customization:**
  - Bit Foundry AI positioning, ICP definition
  - Enterprise sales workflow from positioning_project.md

**Commands exposed:**
- `/sales:prospect [icp-description]` — Research + qualify + rank leads
- `/sales:call-prep [company/person]` — Full context + talking points + objections
- `/sales:outreach [target]` — Personalized multi-channel sequence
- `/sales:forecast` — Pipeline forecast with scenarios
- `/sales:offer-design [product]` — Hormozi grand slam offer creation

**MCPs:** Apollo, Common Room, HubSpot, Slack, Google Calendar, Gmail

---

### Plugin 3: `engineering` (MERGE)

**CoWork base brings (NEW):**
- incident-response (triage, manage, postmortems)
- system-design (architecture diagrams, API design)
- tech-debt (identify, categorize, prioritize)
- testing-strategy, documentation, deploy-checklist
- standup generation from git activity
- Commands: `/engineering:standup`, `/engineering:architecture`, `/engineering:incident`, `/engineering:deploy-checklist`

**Our specializations injected:**
- **Orchestrator Agent:** Arjuna (QA orchestrator)
- **Sub-Agents:** Abhimanyu (code quality), Duryodhana (CTO perspective)
- **Skills merged in:**
  - All 12 QA skills (product-claims-validator, api-contract-validator, test-quality-analyzer, accessibility-auditor, ux-terminology-scanner, onboarding-flow-auditor, documentation-accuracy-checker, dead-code-detector, error-handling-auditor, data-flow-tracer, state-machine-validator, dependency-health-scanner)
  - gstack skills: qa, review, investigate, ship, design-review, browse, careful, freeze, guard
  - `product-qa-orchestrator` (8-parallel-agent evaluation)
- **Brand customization:**
  - WorkWeaver product repo context (D:/WorkWeaver Main Branch/)
  - Launch readiness audit findings
  - Tech stack awareness

**Commands exposed:**
- `/engineering:qa [url-or-path]` — Full QA sweep (12 dimensions)
- `/engineering:review` — Pre-landing code review
- `/engineering:ship` — Ship workflow (test → review → bump → PR)
- `/engineering:standup` — Daily standup from git activity
- `/engineering:incident [description]` — Incident response workflow
- `/engineering:architecture [topic]` — ADR with trade-off analysis
- `/engineering:audit` — Full launch readiness audit (12 pillars)

**MCPs:** GitHub, Linear, Slack, Datadog, PagerDuty

---

### Plugin 4: `legal` (MERGE)

**CoWork base brings (NEW):**
- NDA triage (screening criteria, classification)
- canned-responses (template management)
- meeting-briefing (legal meeting prep)
- vendor-check
- Commands: `/legal:triage-nda`, `/legal:vendor-check`, `/legal:brief`

**Our specializations injected:**
- **Orchestrator Agent:** contract-master-orchestrator
- **Sub-Agents:** Bhishma (legal/compliance), contract-comparator, contract-updater, consistency-guard, requirements-aligner
- **Skills merged in:**
  - Contract pipeline (compare → update → align → consistency check)
  - GDPR/CCPA compliance knowledge
  - WorkWeaver-specific: ToS, Privacy Policy, DPA context
- **Brand customization:**
  - Bit Foundry AI legal entity details
  - Feature-agnostic contract language patterns
  - Data controller/processor positioning

**Commands exposed:**
- `/legal:review-contract [file]` — Full playbook-based contract review
- `/legal:triage-nda [file]` — NDA screening and classification
- `/legal:compliance-check [regulation]` — Regulatory compliance assessment
- `/legal:update-contracts` — Full contract pipeline (compare → update → align → verify)

**MCPs:** Box, Egnyte, Slack, DocuSign, MS365

---

### Plugin 5: `product-management` (MERGE)

**CoWork base brings (NEW):**
- feature-spec / write-spec (PRD structure, user stories)
- roadmap-management (RICE/MoSCoW prioritization)
- stakeholder-comms (update templates by audience)
- user-research-synthesis (thematic analysis, personas)
- metrics-tracking (OKRs, dashboards)
- Commands: `/pm:write-spec`, `/pm:roadmap-update`, `/pm:stakeholder-update`, `/pm:brainstorm`

**Our specializations injected:**
- **Orchestrator Agent:** Ashwatthama (product strategy)
- **Skills merged in:**
  - `plan-ceo-review` (CEO-mode scope challenge)
  - `plan-eng-review` (architecture lock-in)
  - `plan-design-review` (design dimension review)
  - `office-hours` (YC-style idea validation)
  - `ai-industry-tracker`, `signal-aggregator`, `pattern-recognition`
- **Brand customization:**
  - WorkWeaver product context and positioning
  - Enterprise SaaS ICP understanding

**Commands exposed:**
- `/pm:write-spec [feature]` — Full PRD with acceptance criteria
- `/pm:office-hours [idea]` — YC-style idea validation
- `/pm:review [plan-file]` — CEO + Eng + Design triple review
- `/pm:competitive-brief [competitor]` — Feature comparison + positioning
- `/pm:roadmap-update` — Prioritized roadmap with dependencies

---

### Plugin 6: `operations` (MERGE)

**CoWork base brings (NEW):**
- vendor-management, process-optimization, change-management
- risk-assessment, compliance-tracking, resource-planning
- runbook creation
- Commands: `/ops:vendor-review`, `/ops:process-doc`, `/ops:status-report`, `/ops:runbook`

**Our specializations injected:**
- **Orchestrator Agent:** Bhima (executor)
- **Sub-Agent:** Yudhishthira (morning coordination)
- **Skills merged in:**
  - `morning-brief-generator` (daily briefing)
  - `execution-logger` (pipeline tracking)
  - `resourcefulness-agent`
  - `scope-modification`
- **Brand customization:**
  - Daily operational cadence
  - Content pipeline as core operation

**Commands exposed:**
- `/ops:morning-brief` — Full daily briefing with priorities
- `/ops:status-report` — Cross-functional status
- `/ops:runbook [process]` — Create operational runbook
- `/ops:vendor-review [vendor]` — Vendor evaluation

---

### Plugin 7: `design` (MERGE)

**CoWork base brings (NEW):**
- design-critique (usability, visual hierarchy)
- design-system-management (tokens, components, patterns)
- ux-writing (microcopy, error messages, onboarding)
- user-research synthesis
- design-handoff (developer specs)
- Commands: `/design:critique`, `/design:design-system`, `/design:handoff`, `/design:ux-copy`

**Our specializations injected:**
- **Skills merged in:**
  - `design-review` (gstack — visual QA with before/after)
  - `design-consultation` (gstack — full design system creation)
  - `plan-design-review` (gstack — plan-mode design review)
  - `accessibility-auditor`, `ux-terminology-scanner`
- **Brand customization:**
  - WorkWeaver design system context
  - Brand visual guidelines

---

### Plugins 8-13: MOSTLY NEW (Minimal merge, light customization)

| # | Plugin | CoWork Base | Our Addition | Priority |
|---|--------|------------|--------------|----------|
| 8 | `productivity` | Task/calendar/memory management | Yudhishthira morning brief, execution logger | HIGH |
| 9 | `customer-support` | Ticket triage, KB articles, escalation | Brand voice, writing style | MEDIUM |
| 10 | `finance` | Journal entries, reconciliation, statements | Vidur business analysis, value equation | MEDIUM |
| 11 | `data` | SQL, visualization, dashboards, stats | — (entirely new capability) | MEDIUM |
| 12 | `enterprise-search` | Cross-tool search | — (entirely new capability) | HIGH |
| 13 | `human-resources` | Recruiting, onboarding, comp analysis | — (entirely new, light brand customization) | LOW |

---

## Phase 2: CUSTOM PLUGINS (No CoWork Equivalent)

### Plugin 14: `business-advisory-council`
**Purpose:** Multi-perspective strategic analysis — 5 advisors analyze any business decision simultaneously.
- **Orchestrator Agent:** council_dispatcher
- **Sub-Agents:** Karna (Elon/First Principles), Vidur (Money/ROI), Duryodhana (CTO/Tech), Bhishma (Legal/Compliance), Drona (Hormozi/Value)
- **Skills:** first-principles-thinking, business-analysis, constraint-analysis, mechanism-analysis, strategic-advisory, wisdom-synthesis, chanakya-business-strategist, value-equation, hormozi-strategy-injector
- **Command:** `/council:decide [question]` — All 5 perspectives + synthesized recommendation

### Plugin 15: `content-quality-system`
**Purpose:** Self-improving quality assurance for all content production.
- **Orchestrator:** Nakula (quality gatekeeper)
- **Skills:** 6-phase enhancement pipeline, content-reviewer-factchecker, copy-editor, ai-writing-humanizer, skill-execution-observer, skill-inspector, skill-amender, skill-evaluator
- **Command:** `/quality:review [content]` — Full quality pipeline with score
- **Command:** `/quality:inspect` — Analyze execution logs for declining performance
- **Command:** `/quality:improve [skill]` — Propose targeted skill improvement

### Plugin 16: `brand-identity`
**Purpose:** Central brand enforcement across ALL other plugins.
- **Source:** CoWork `brand-voice` partner plugin + our writing_style.md + ai_writing_humanizer
- **Contains:**
  - writing_style.md (Alex Hormozi meets Steve Jobs)
  - Banned words list
  - Platform-specific rules (LinkedIn, Twitter)
  - Grade 5 reading level enforcement
  - 1/3/1 rhythm, no em-dashes
  - Brand voice constants and tone flexes
- **Command:** `/brand:check [content]` — Validate against all brand rules
- **Command:** `/brand:guidelines` — Generate current brand guide
- **Cross-plugin:** ALL other plugins reference this plugin's skills for voice consistency

### Plugin 17: `research-intelligence`
**Purpose:** Unified research and signal detection across all domains.
- **Orchestrator Agent:** Agastya (research specialist)
- **Sub-Agents:** Sanjaya (research), Arundhati (social monitor), Sukra (signal detection)
- **Skills:** web-search-agent, twitter-signal-monitor, twitter-reader, ai-industry-tracker, source-matrix, signal-aggregator, concept-simplifier, sidebringers-explainer
- **Command:** `/research:deep [topic]` — Multi-source research with credibility scoring
- **Command:** `/research:signals` — Scan all sources for high-signal content
- **Command:** `/research:competitive [competitor]` — Full competitive intelligence

---

## Phase 3: PARTNER & MARKETPLACE PLUGINS (Install as-is + light customization)

| Plugin | Action | Integration Point |
|--------|--------|-------------------|
| **Apollo** | Install → wire into `sales` plugin | Lead enrichment for Rama |
| **Common Room** | Install → wire into `sales` plugin | GTM signal data |
| **Slack** | Install → shared connector for all plugins | Cross-plugin communication |
| **Brand Voice** (Tribe AI) | ABSORB into our `brand-identity` plugin | Discovery + enforcement |
| **Postiz** | Install → alternative to Publer for `marketing` | 28+ platform support |
| **SearchFit SEO** | Install → wire into `marketing` plugin | SEO audit capability |
| **Bright Data** | Install → wire into `research-intelligence` | Web scraping at scale |
| **Zapier** | Install → cross-functional automation | Connects 8000+ apps |
| **Adspirer** | Install → wire into `marketing` plugin | Paid ads management |
| **Figma** | Already have MCP → wire into `design` plugin | Design-to-code |
| **Mintlify** | Install → wire into `engineering` plugin | Documentation sites |

---

## Phase 4: CROSS-PLUGIN ARCHITECTURE

### 4.1 Shared Resources (referenced by all plugins)
```
shared/
├── brand-voice/          # writing_style.md, banned words, platform rules
├── connectors/           # Common MCPs (Slack, Notion, Gmail, Calendar)
├── quality-gate/         # 9.0/10 threshold, review protocols
└── execution-tracking/   # Self-improving loop, execution logger
```

### 4.2 Plugin Dependency Graph
```
brand-identity ──────────► ALL PLUGINS (voice enforcement)
research-intelligence ───► marketing, sales, product-management
content-quality-system ──► marketing (quality gate)
business-advisory-council ► sales, product-management, operations
engineering ─────────────► product-management (technical feasibility)
```

### 4.3 Goal-In, Result-Out Examples

**Goal:** "Create a marketing campaign for WorkWeaver's launch"
**What happens internally (100+ steps):**
1. `marketing` plugin activates Krishna orchestrator
2. Agastya researches market, competitors, audience
3. `business-advisory-council` provides strategic input
4. Ved Vyasa drafts content using Hormozi frameworks
5. 6-phase enhancement pipeline refines each piece
6. Nakula enforces 9.0/10 quality gate
7. Vayu formats for LinkedIn + Twitter
8. Vishwakarma generates visual assets
9. `brand-identity` validates all content against voice rules
10. Sahadeva saves as DRAFTS on Publer
11. Execution logger tracks all metrics

**Goal:** "Review this contract with Acme Corp"
**What happens internally:**
1. `legal` plugin activates contract-master-orchestrator
2. contract-comparator analyzes against playbook
3. Bhishma flags risk areas
4. compliance check runs (GDPR, CCPA)
5. contract-updater suggests redlines
6. consistency-guard verifies terminology
7. `brand-identity` ensures response uses correct tone
8. Structured output delivered with risk matrix

---

## Implementation Order

| Priority | Plugin | Effort | Reason |
|----------|--------|--------|--------|
| 1 | `brand-identity` (custom) | MEDIUM | Foundation — all other plugins depend on it |
| 2 | `marketing` (mega merge) | HIGH | Core daily operation, highest ROI |
| 3 | `content-quality-system` (custom) | MEDIUM | Quality gate for marketing |
| 4 | `research-intelligence` (custom) | MEDIUM | Feeds marketing + sales + PM |
| 5 | `sales` (merge) | MEDIUM | Revenue pipeline |
| 6 | `engineering` (merge) | HIGH | Product development velocity |
| 7 | `product-management` (merge) | MEDIUM | Product strategy |
| 8 | `business-advisory-council` (custom) | MEDIUM | Strategic decisions |
| 9 | `legal` (merge) | MEDIUM | Contract workflows |
| 10 | `operations` (merge) | MEDIUM | Daily ops + morning briefs |
| 11 | `productivity` (light merge) | LOW | Task/calendar management |
| 12 | `design` (merge) | LOW | Design workflows |
| 13 | `enterprise-search` (install) | LOW | Cross-tool search |
| 14 | `customer-support` (install) | LOW | Future need |
| 15 | `finance` (install) | LOW | Future need |
| 16 | `data` (install) | LOW | Future need |
| 17 | `human-resources` (install) | LOW | Future need |
| Partner plugins | Apollo, Slack, Postiz, SEO, etc. | LOW each | Install as needed |

---

## What Happens to Existing Skills/Agents

| Current Asset | Destination | Action |
|---------------|-------------|--------|
| Krishna agent | `marketing` plugin orchestrator | MOVE into plugin |
| Ved Vyasa, Agastya, Nakula, Vayu, Sahadeva, Vishwakarma | `marketing` plugin sub-agents | MOVE into plugin |
| Rama agent | `sales` plugin orchestrator | MOVE into plugin |
| Arjuna, Abhimanyu agents | `engineering` plugin | MOVE into plugin |
| Ashwatthama agent | `product-management` orchestrator | MOVE into plugin |
| Bhima agent | `operations` orchestrator | MOVE into plugin |
| Bhishma agent | `legal` plugin + `business-advisory-council` | SHARED (referenced by both) |
| Karna, Vidur, Duryodhana, Drona | `business-advisory-council` | MOVE into plugin |
| Yudhishthira | `operations` + `productivity` | SHARED |
| Contract agents (6) | `legal` plugin | MOVE into plugin |
| Arundhati, Sanjaya, Sukra | `research-intelligence` | MOVE into plugin |
| Narada | Shared cross-plugin communicator | KEEP as standalone |
| Chitrasena, Dushyanta | `marketing` (signal transformation) | MOVE into plugin |
| All 91 skills | Distributed across plugins by category | MOVE (no duplicates) |
| gstack skills (21) | `engineering` + `design` plugins | MOVE into plugins |
| Self-improving loop (3 skills) | `content-quality-system` | MOVE into plugin |
| Writing style rules | `brand-identity` | MOVE into plugin |

**DECOMMISSION after migration:**
- Standalone agent files in `~/.claude/agents/` (now inside plugins)
- Standalone skill files in `~/.claude/skills/` (now inside plugins)
- Rules files (absorbed into plugin skills)

**KEEP standalone:**
- Narada (cross-plugin messaging)
- `cowork-plugin-management` (meta-plugin for creating new plugins)
- Memory system (MEMORY.md + memory files)

---

## Verification

### Per-Plugin Testing
1. Install plugin: `claude plugin install <name>`
2. Test each slash command works
3. Verify skills auto-trigger on relevant prompts
4. Confirm MCP connections are live
5. Test goal-in/result-out with a real goal
6. Verify brand voice consistency in outputs
7. Check execution logging captures metrics

### Integration Testing
1. Run `/marketing:daily-content` — verify full 10-post pipeline
2. Run `/council:decide "Should we expand to EU market?"` — verify 5 perspectives
3. Run `/sales:prospect "mid-market SaaS CTOs"` — verify end-to-end
4. Run `/engineering:qa https://workweaver.ai` — verify 12-dimension sweep
5. Cross-plugin: Marketing → Council → Sales pipeline

### Quality Gates
- Every plugin output must pass brand-identity validation
- Marketing content must score 9.0/10 minimum
- No plugin should auto-publish (DRAFTS ONLY)
- Execution logger must capture all plugin invocations

---

## File Count Estimate

- **17 plugins** (13 merged/installed + 4 custom)
- **~85 skill files** (redistributed from current 91, no duplicates)
- **~45 command files** (new slash commands)
- **~17 plugin.json manifests**
- **~17 .mcp.json configs**
- **~27 agent files** (redistributed into plugin directories)
- **Total: ~200 files** across all plugins

---

## Risk & Mitigation

| Risk | Mitigation |
|------|-----------|
| Breaking existing workflows during migration | Phase approach — brand-identity first, then marketing, keep old system running until verified |
| Plugin conflicts (duplicate skill triggers) | Each skill has unique trigger phrases; decommission old standalone skills after plugin verified |
| MCP connection failures | Keep CONNECTORS.md with fallback options per category |
| Context window pressure from too many skills | Progressive disclosure — SKILL.md lean (<3K words), details in references/ |
| Brand voice drift across plugins | brand-identity plugin referenced by ALL others as shared dependency |
