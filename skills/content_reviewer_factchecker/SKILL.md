---
name: content_reviewer_factchecker
description: Multi-dimensional quality gate for content before publishing
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: [content_formatter_linkedin, content_formatter_twitter]
feeds_into: [publer_operator]
parallel_with: [visual_asset_matcher]
---

# Content Reviewer & Fact-Checker

## Purpose
The final quality gate before any content enters the publish queue. Evaluates content across 6 weighted dimensions, produces a single composite score, and makes a clear decision: Approve, Revise, or Reject. Nothing gets published without passing this gate at 8.0/10 or above. This is the last line of defense against low-quality or inaccurate content.

## When to Use
- Content has completed the enhancement pipeline and is ready for review
- A draft has been written or revised and needs quality assessment
- Content is being fast-tracked and needs expedited quality verification
- A revision has been made and needs re-scoring before approval

## Workflow
### Step 1: Score Factual Accuracy (Weight: 30%)
- Verify every factual claim in the content
- Cross-reference statistics, quotes, and data points against sources
- Flag any unverified claim; a single unverified factual claim blocks approval
- Score 0-10

### Step 2: Score Logical Coherence (Weight: 20%)
- Check argument structure: does the conclusion follow from the premises?
- Identify logical fallacies, unsupported leaps, or contradictions
- Ensure the piece has a clear thesis that every section supports
- Score 0-10

### Step 3: Score Platform Optimization (Weight: 15%)
- LinkedIn: hook in first line, line breaks for readability, appropriate length (150-300 words), hashtags
- Twitter: character count, thread structure if needed, hook tweet strength
- Verify format matches the target platform's best practices
- Score 0-10

### Step 4: Score Tone and Voice (Weight: 15%)
- Match against Bit Foundry AI writing style guide (concise, direct, brutally honest)
- Check for consistency: no shifts between formal and casual mid-piece
- Verify the piece sounds like a human expert, not a language model
- Score 0-10

### Step 5: Score Grammar and Mechanics (Weight: 10%)
- Check spelling, grammar, punctuation
- Verify proper nouns, company names, and technical terms are correct
- Ensure no broken links or formatting artifacts
- Score 0-10

### Step 6: Score Asset Readiness (Weight: 10%)
- Confirm visual asset exists and is attached
- Verify asset matches content theme and platform specs
- Check image quality, text legibility, and brand consistency
- Score 0-10

## Output Format
- **Scorecard:** Each dimension with raw score (0-10) and weighted contribution
- **Composite Score:** Weighted total (0-10, one decimal place)
- **Decision:** APPROVE (8.0+), REVISE (6.0-7.9), or REJECT (<6.0)
- **Revision Notes:** For REVISE/REJECT, specific items to fix ranked by impact
- **Flagged Claims:** Any unverified claims with recommended action
- **Revision Cycle:** Current cycle number (maximum 3 before escalation)

## Key Principles
- Never approve content scoring below 8.0/10; the threshold is absolute
- Flag ALL unverified claims regardless of overall score
- Maximum 3 revision cycles; if content cannot reach 8.0 in 3 tries, escalate to human review
- Every post MUST have an accompanying visual asset; missing asset = automatic REVISE
- The reviewer is the audience's advocate: if it would not earn their respect, it does not ship

## Integration
- **Primary Agent:** Nakula, Matarisvan
- **Input from:** the_operator (Phase 6 output), content pipeline (direct submissions)
- **Output to:** Publer (via Sahadeva, approved drafts only), revision queue (for REVISE), escalation queue (for REJECT or 3+ cycles)
