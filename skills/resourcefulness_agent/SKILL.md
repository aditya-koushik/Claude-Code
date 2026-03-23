---
name: resourcefulness_agent
description: Verifies tools, skills, API access, and timeline feasibility before task execution
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: []
feeds_into: []
parallel_with: []
---

# Resourcefulness Agent

## Purpose
Performs a pre-flight readiness check before any significant task execution. Verifies that required tools exist, API keys are valid, skills are available, timelines are realistic, and blockers are identified upfront. Prevents wasted effort by catching missing resources before work begins. Operated by agents Bhima, Banasura, Brihaspati, and Duryodhana.

## When to Use
- Before starting any multi-step pipeline or complex task
- When a new tool, API, or skill is required for the first time
- When estimating delivery timelines for the chairman
- When the `morning_brief_generator` flags potential resource issues
- Before committing to a scope that depends on external integrations

## Workflow

### Step 1: Receive Task Request
Accept the task description and its requirements. Decompose into discrete resource needs: tools, APIs, skills, data sources, and time.

### Step 2: Check Required Tools
Verify each required tool is installed, accessible, and functioning. Test connectivity for external tools. Flag missing or broken tools.

### Step 3: Verify API Access and Keys
For each required API (Publer, Twitter, search, image generation), confirm the key is present, not expired, and has sufficient quota remaining.

### Step 4: Assess Skill Availability
Check that all required skills from the 53-skill library are operational. Cross-reference with latest `skill_inspector` health report for any degraded skills.

### Step 5: Estimate Timeline
Calculate realistic time estimates for each sub-task. Account for sequential dependencies and parallel opportunities. Add a buffer for unknowns.

### Step 6: Identify Blockers and Alternatives
For every RED or YELLOW item, propose a fallback: alternative tool, manual workaround, or scope reduction via `scope_modification`.

## Output Format
- **Task:** One-line description
- **Readiness:** GREEN (all clear) / YELLOW (proceed with caution) / RED (blocked)
- **Resource Checklist:** Table of tools, APIs, skills with status (available/missing/degraded)
- **Missing Resources:** List with proposed alternatives for each
- **Estimated Timeline:** Breakdown by sub-task with total
- **Blockers:** Items that must be resolved before starting
- **Confidence Score:** 0-100% readiness to execute

## Key Principles
- Check before you build; verification is cheaper than rework
- Identify blockers early; a blocker found at step 1 saves hours at step 5
- Always have a fallback plan for every critical dependency
- Resource verification saves more time than it costs
- A RED readiness is not a failure; it is valuable information

## Integration
- Called by `content_factory` before daily pipeline execution
- Feeds into `scope_modification` when resources require scope adjustment
- Reports to `morning_brief_generator` for daily readiness status
- Works with `council_dispatcher` when resource gaps require strategic decisions
