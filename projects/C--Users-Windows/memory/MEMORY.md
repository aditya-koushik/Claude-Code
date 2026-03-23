# Bit Foundry AI - Memory Index

Central hub for all modular memory. Load referenced modules for full context.

---

## USER PROFILE

- **Role:** Co-Founder of Bit Foundry AI
- **Mission:** Building world-class AI product for millions of enterprises
- **Vision:** Create a product used for the next 20 years
- **Communication Style:** Concise, direct, brutally honest (Alex Hormozi meets Steve Jobs)
- **Audience:** 9400 LinkedIn followers, 800 newsletter subscribers, 0 Twitter followers (growing)
- **Writing Style Guide:** See `writing_style.md`

---

## MEMORY MODULES

| File | Description |
|------|-------------|
| [content_pipeline.md](content_pipeline.md) | Content generation workflow, sub-agent orchestration, research protocol, asset creation |
| [mcp_servers.md](mcp_servers.md) | MCP server configurations, active/missing integrations |
| [skills_matrix.md](skills_matrix.md) | Categorized skills for content, research, and QC |
| [storage_structure.md](storage_structure.md) | Directory layout, session memory modules |
| [operational_protocols.md](operational_protocols.md) | Session startup, daily requirements, error handling, performance tracking |
| [positioning_project.md](positioning_project.md) | Positioning & landing page project, sales workflow, locked decisions |
| [self_improving_skills.md](self_improving_skills.md) | Self-improving skills loop: observe, inspect, amend, evaluate |
| [launch_readiness_audit.md](launch_readiness_audit.md) | Workweaver product launch readiness audit 2026-03-21 — 12-pillar findings |

---

## QUICK REFERENCE

**Daily Target:** 10 posts/day (5 LinkedIn + 5 Twitter) with visual assets
**Pipeline:** Research -> Write -> Review -> Asset -> Publish (DRAFTS ONLY)
**Quality Gate:** 9.0/10 minimum score
**Sub-Agents:** Krishna (orchestrate), Agastya (research), Ved Vyasa (write), Nakula (review), Vayu (format), Sahadeva (publish), Arjuna (product QA orchestrator), Abhimanyu (code quality specialist)
**Installed:** 27 agents in `~/.claude/agents/`, 87 skills in `~/.claude/skills/` (66 Work Weaver + 21 gstack)
**Self-Improving:** Observe → Inspect → Amend → Evaluate loop via skill_execution_observer, skill_inspector, skill_amender
**Rules:** 6 files in `.claude/rules/` (content-pipeline, quality-gate, business-council, agent-skill-map, writing-style, skill-self-improvement)

---

## CRITICAL RULES

- NEVER auto-publish on Publer - save as DRAFTS ONLY
- 30-minute review window before final publishing
- Every post MUST have accompanying visual asset
- Post on both LinkedIn and Twitter simultaneously

---

## CRITICAL TODO LIST

1. [x] Configure Notebook LM MCP integration (done 2026-03-16, via notebooklm-mcp@latest npx)
2. [x] Set up error tracking system (execution log bootstrapped 2026-03-17: Content/skill-execution-log.jsonl)
3. [ ] Create daily metrics tracking
4. [ ] Implement post-approval workflow
5. [ ] Test Publer API connection
6. [ ] Create content database schema
7. [ ] Build Twitter monitoring system (Playwright fallback working via twitter_reader skill)

---

## STATUS

**Last Session:** 2026-03-21
**Active Project:** gstack integration complete (see below)
**System Status:** CONFIGURED - Self-improving skills loop + gstack sprint workflow integrated
**Product Repo:** D:/WorkWeaver Main Branch/ (cloned from bitfoundry-ai/workweaver)
**gstack:** Installed 2026-03-21 at ~/.claude/skills/gstack. Browse binary compiled. Playwright Chromium downloaded. 21 skills registered. Bhima + Duryodhana wired with careful/freeze/guard.
