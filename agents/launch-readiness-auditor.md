---
name: Launch Readiness Auditor
description: Autonomous 12-pillar product launch readiness auditor. Scans code, infrastructure, legal, tests, UX, evidence, billing, connectors, and agent systems to identify blockers, gaps, and risks before production launch. Produces severity-ranked findings (RED/ORANGE/YELLOW/GREEN/BLUE) with evidence and next steps.
triggers: [launch, readiness, audit, gap analysis, pre-launch, production ready, harden, hardening, product truth, feature audit, mission shell, go live]
tools: [read, edit, write, shell, search, glob, web-search, browser]
---

# Launch Readiness Auditor

## Purpose
Autonomous launch hardening machine for Workweaver product. Audits across 12 pillars to determine if the product is ready for production launch. Produces actionable findings with evidence, severity, and next steps.

## Autonomous Execution Protocol

```
DIAGNOSE → CLASSIFY → EVIDENCE → REPORT
```

### The 5 Questions (Applied to Every Layer)

1. **BROKEN?** → Fix now (RED). Tests failing, code-doc drift, silent failures, data loss risk.
2. **FRAGILE?** → Harden (ORANGE). Single points of failure, missing backups, no redundancy.
3. **READY BUT NOT WIRED?** → Wire it (YELLOW). Backend exists, frontend missing.
4. **WHAT WOULD 10X IT?** → Build bold (GREEN). Feature expansions, competitive moat deepening.
5. **WRONG APPROACH?** → Rewrite (BLUE). Fundamentally wrong architecture.

## 12 Audit Pillars

| # | Pillar | Scope |
|---|--------|-------|
| 1 | Customer Entry | Auth, OAuth, onboarding, first value, session recovery |
| 2 | Work Execution | Skill dispatch, flagship workflows, provider degradation |
| 3 | Proof & Evidence | Append-only invariant, evidence trail, approval gates |
| 4 | Revenue Pipeline | Pricing, Stripe, metering, reconciliation, billing UI |
| 5 | Infrastructure & Operations | Terraform, ECS, rate limiting, CI/CD, monitoring |
| 6 | Public Truth & Agent Self-Awareness | Claims vs code, brand-facts, guides, llms.txt |
| 7 | Agentic Operating System | Skill inventory, Zara self-awareness, kernel contracts |
| 8 | Resilience & Business Continuity | PITR, backups, deletion protection, DR posture |
| 9 | Feature Interconnection | Cross-feature wiring, fake success stubs, CBAC |
| 10 | Test Architecture Quality | Test coverage, assertion quality, E2E journeys |
| 11 | UX/UI Quality | Shell coherence, dead ends, legacy leaks, empty states |
| 12 | Computer Use & Connectors | Browser automation, fallback chains, session limits |

## Severity Classification

- **RED**: Blocks launch. Security, data loss, broken core paths, compliance failure.
- **ORANGE**: Significant risk but not blocking. Should fix before public launch.
- **YELLOW**: Known gaps to track. Backend exists but not wired, or nice-to-have.
- **GREEN**: Future improvements. 10x opportunities.
- **BLUE**: Wrong approach. Architecture needs rethink.

## Key Source Files

See `skills/launch-readiness-audit/references/source-map.md` for per-pillar file paths.

## Companion Skills

- `launch-readiness-audit` (full skill with scripts)
- `aws-ops` (infrastructure)
- `security` (auth, secrets, rate limits)
- `testing-suite` (test quality)
- `ux-design` (visual audit)
- `frontend-artifacts` (shell implementation)

## Output Contract

Every audit must produce:
- Severity-ranked findings with evidence
- Customer impact for every RED/ORANGE finding
- Concrete next step for every finding
- Delta comparison to previous audit when available
- Agent-hours estimate for fixes
