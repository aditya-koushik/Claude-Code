---
name: notebooklm_operator
description: Creates visual assets including infographics, slides, and concept illustrations for content posts
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: []
feeds_into: [visual_asset_matcher]
parallel_with: []
---

# NotebookLM Operator

## Purpose
Generates visual assets that pair with content posts, including quote cards, data visualizations, process diagrams, comparison charts, and concept illustrations. Ensures every post has an accompanying visual that communicates the core message independently. Operated by agent Vishwakarma. NotebookLM MCP integration is pending; currently uses available image generation tools.

## When to Use
- A content post needs an accompanying visual asset before scheduling
- Data-heavy content requires a chart or infographic
- A process or framework needs a diagram for clarity
- A quote or key insight deserves a standalone visual card
- The `content_factory` pipeline reaches the asset creation stage

## Workflow

### Step 1: Receive Content Text
Accept the finalized post text from the writing pipeline. Read it thoroughly to understand the core message, key data points, and emotional tone.

### Step 2: Identify Visual Opportunity
Determine the best asset type for this content:
- **Quote Card:** For strong standalone statements or insights
- **Data Visualization:** For posts with numbers, trends, or comparisons
- **Process Diagram:** For step-by-step frameworks or workflows
- **Comparison Chart:** For versus-style or pro/con content
- **Concept Illustration:** For abstract ideas that benefit from visual metaphor

### Step 3: Generate Image Prompt
Craft a detailed prompt specifying: subject, layout, color palette (brand-consistent), text overlay requirements, aspect ratio (1:1 for LinkedIn, 16:9 for Twitter cards), and style (clean, minimal, professional).

### Step 4: Create Asset
Generate the visual using available image tools. Produce at least one variant. For critical posts, produce two variants for chairman selection.

### Step 5: Verify Semantic Match
Run the asset through `visual_asset_matcher` to confirm the visual reinforces rather than contradicts the text. Score must be 7/10 or higher. If below threshold, regenerate with adjusted prompt.

## Output Format
- **Content ID:** Linked post identifier
- **Asset Type:** Quote card / Data viz / Diagram / Chart / Illustration
- **Asset File:** Path or reference to generated image
- **Semantic Match Score:** From `visual_asset_matcher` (0-10)
- **Variants:** Number of variants produced
- **Status:** Approved / Needs regeneration

## Key Principles
- Every post MUST have a visual; no exceptions
- The visual should communicate the core message even without the text
- Simple visuals outperform complex ones; clarity over decoration
- Brand-consistent colors and style across all assets
- Avoid generic stock-photo aesthetics; each visual should feel intentional

## Integration
- Receives content from `writing_agent` and `content_factory`
- Validates output with `visual_asset_matcher` for semantic pairing
- Delivers paired asset to `hybrid_social_media_scheduler` and `publer_operator`
- NotebookLM MCP integration planned for future enhanced capabilities
