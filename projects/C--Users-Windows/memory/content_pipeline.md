---
name: Content Pipeline Configuration
description: Sub-agent orchestration, research protocol, asset creation workflow for daily content generation
type: project
---

# Content Generation Workflow

## Content Generation Mandate

**Mission Statement:** Generate minimum 5 posts per day on both LinkedIn and Twitter (10 total), every day, without fail.

**Content Pipeline Architecture:**
1. **Raw Idea Input** -> Research Agent -> Ground Truth Collection
2. **Information Transfer** -> Writing Agent (Ved Vyasa) -> Master Draft
3. **Quality Control** -> Review Agent -> Fact Check & Critical Review
4. **Iterative Improvement** -> Feedback Loop -> Rewrite if Needed
5. **Asset Creation** -> Notebook LM -> Infographic/Slide/Video
6. **Publication** -> Publer Scheduler -> Cross-Platform Posting

**Critical Rules:**
- NEVER auto-publish on Publer - save as DRAFTS ONLY
- 30-minute review window for user before final publishing
- Must track all posts with metadata in .md files
- Every post MUST have accompanying visual asset
- Post on both LinkedIn and Twitter simultaneously

## Sub-Agent Orchestration Protocol

1. **Orchestrator (Main Agent)** - Never creates content directly, only spawns sub-agents
2. **Research Agent (Chanakya)** - Scopes, researches ground truth, collects data
3. **Writing Agent (Ved Vyasa)** - Uses all skills (triad-writer, hormozi, etc.) to create master drafts
4. **Review Agent (Aristotle)** - Fact-checks, critical review, quality assurance
5. **Asset Agent (Da Vinci)** - Creates Notebook LM prompts and tracks assets
6. **Publishing Agent (Hermes)** - Schedules on Publer, ensures proper pairing

## Research Protocol (for Twitter monitoring)

**File:** `E:\Business\Bit Foundry\Vision & Product Strategy\Next Prompts\All Twitter Handles.txt`

**Handles to Monitor:**
- Primary: @KobeissiLetter, @chamath, @saxena_puru, @AlexHormozi, @naval, @elonmusk
- Secondary: @AndrewYNg, @dhh, @tobi, @karpathy, @lexfridman, @balajis
- Tech Leaders: @johnrushx, @mattshumer_, @godofprompt, @stevesi

**Protocol:** Search last 7 days content, identify trends, ground truth check, content gap analysis

## Asset Creation Protocol

**Notebook LM Integration:**
- Access MCP integration first (OpenClaw)
- If unavailable, provide exact sources + prompts
- Asset types: Infographics (trending data), Slides (concepts), Videos (animated explanations)
- Save to: `D:\Work Weaver\Marketing Assets\Infographic\`

**Asset Pairing System:**
- Create asset manifest before generation
- User provides exact paths after manual review
- Cross-reference with text content before publishing
