---
name: visual_asset_matcher
description: Validates that visual assets semantically pair with their companion text content
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: [notebooklm_operator]
feeds_into: [publer_operator]
parallel_with: [content_reviewer_factchecker]
---

# Visual Asset Matcher

## Purpose
Evaluates whether a visual asset (image, infographic, diagram) semantically matches the text content it accompanies. Scores relevance, checks for contradictions, verifies brand consistency, and either approves or requests regeneration. Ensures every post ships with a visual that reinforces rather than undermines the message. Operated by agent Vishwakarma.

## When to Use
- `notebooklm_operator` generates a new visual asset for a content post
- An existing asset is being reused for new content and needs revalidation
- A visual asset was manually created and needs quality assurance before pairing
- Any time a text-image pair is being sent to `publer_operator` for drafting

## Workflow

### Step 1: Analyze Text Content
Read the full post text. Extract the core message, key themes, emotional tone, and any specific data points or claims made.

### Step 2: Extract Key Visual Concept
Determine what the ideal visual should communicate. Define the expected subject matter, mood, and information hierarchy the image should convey.

### Step 3: Score Candidate Asset on Relevance
Rate the visual asset on a 0-10 scale across four dimensions:
- **Message Alignment (0-10):** Does the image reinforce the text's core message?
- **Tone Match (0-10):** Does the visual tone match the text tone?
- **Information Accuracy (0-10):** Are any data, labels, or text in the image correct?
- **Brand Consistency (0-10):** Does it follow brand colors, style, and quality standards?

### Step 4: Check for Contradictions
Verify the asset does not contradict, undermine, or distract from the text content. A motivational post paired with a negative image fails this check.

### Step 5: Approve or Request Regeneration
If the average score is 7/10 or higher and no contradictions exist, approve the asset. Otherwise, provide specific feedback to `notebooklm_operator` for regeneration with a corrected prompt.

## Output Format
- **Content ID:** Linked post identifier
- **Scores:** Message Alignment, Tone Match, Information Accuracy, Brand Consistency
- **Average Score:** Composite (0-10)
- **Contradictions Found:** Yes/No with details
- **Verdict:** APPROVED / REGENERATE
- **Feedback:** Specific guidance for regeneration if rejected

## Key Principles
- The image should reinforce the text message; redundancy is better than mismatch
- Avoid generic stock-photo aesthetics; visuals should feel intentional and specific
- Text-image mismatch kills credibility faster than no image at all
- Simple visuals outperform complex ones; clarity is the priority
- When in doubt, regenerate; the cost of a bad visual exceeds the cost of a retry

## Integration
- Called by `notebooklm_operator` after asset generation for validation
- Provides feedback loop back to `notebooklm_operator` for regeneration
- Must approve before `hybrid_social_media_scheduler` proceeds to drafting
- Quality scores logged by `execution_logger` for asset performance tracking
