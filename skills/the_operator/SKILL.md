---
name: the_operator
description: Creates executable action plans and distribution strategies - Phase 6 of 6 Enhancement Pipeline
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: [the_strategist]
feeds_into: [content_reviewer_factchecker]
parallel_with: []
---

# The Operator

## Purpose
Phase 6 of the 6-phase content enhancement pipeline. Answers the question: "How do we execute and distribute?" Takes strategically positioned content and builds the launch plan. Defines channels, timeline, responsibilities, and success metrics. A great piece of content with bad distribution is a wasted piece of content.

## When to Use
- Content has passed strategic review (Phase 5) and is ready for distribution planning
- A new content piece needs a channel-specific adaptation plan
- Existing content needs repurposing across platforms
- Distribution performance needs review and optimization

## Workflow
### Step 1: Define Distribution Channels
- Map content to primary platform (LinkedIn or Twitter) based on format and audience
- Identify secondary platforms for repurposing (newsletter, blog, other social)
- Adapt format for each channel (character limits, media requirements, tone adjustments)

### Step 2: Set Timeline
- Assign publish date and time based on audience activity data
- Schedule supporting actions (engagement replies, reshares, follow-up posts)
- Account for review window (minimum 30 minutes before final publish)

### Step 3: Assign Responsibilities
- **Content finalization:** Ved Vyasa
- **Visual asset creation:** Vayu
- **Quality gate review:** Nakula (content_reviewer_factchecker)
- **Draft upload to Publer:** Sahadeva
- **Engagement monitoring:** Post-publish responsibility assignment

### Step 4: Create Distribution Checklist
- [ ] Content finalized and approved (score 8.0+)
- [ ] Visual asset created and attached
- [ ] LinkedIn version formatted (with line breaks, hooks, CTA)
- [ ] Twitter version formatted (thread or single post, character count verified)
- [ ] Publer draft created (NEVER auto-publish)
- [ ] 30-minute review window scheduled
- [ ] Engagement plan documented (first-hour response strategy)

### Step 5: Define Success Metrics
- Set target impressions, engagement rate, and click-through for the piece
- Define what "success" looks like for this specific content type
- Schedule a 48-hour performance review

## Output Format
- **Distribution Plan:** Channel-by-channel breakdown with format notes
- **Timeline:** Specific dates and times for each action
- **Checklist:** Complete pre-publish checklist with status
- **Metrics Targets:** Quantified success criteria
- **Phase 6 Status:** READY (all checklist items complete) or BLOCKED (with specific blockers listed)

## Key Principles
- Distribution is as important as creation; great content with no plan dies quietly
- Every piece needs a launch plan before it enters the publish queue
- Repurpose across platforms; one idea should generate 3-5 distribution touchpoints
- NEVER auto-publish on Publer; save as DRAFTS ONLY
- Measure everything; untracked content cannot be optimized

## Integration
- **Primary Agent:** Narada
- **Input from:** the_strategist (Phase 5)
- **Output to:** Publer (via Sahadeva, drafts only), content database, metrics tracker
