---
name: Successful Notebook LM Data Visualization Pattern
description: The optimal Notebook LM prompt structure for data visualizations combines balanced text overlays with strong visual hierarchy. Proven effective for platform vs. point solution comparisons and market cap visualizations.
type: feedback
---

## Successful Notebook LM Pattern: Data Visualization Template

### Pattern Identified (2026-03-12)

The Orchestration Control Data Visualization prompt achieved optimal results by following this structure:

**What Worked:**
- Wide background canvas (1200×800px) with appropriate whitespace
- Balanced text overlays (not too dense, not too sparse)
- Strong visual hierarchy with clear headline (36pt), subheading (20pt), and data callout (48pt)
- Combination chart approach (bar chart + metric highlight)
- Color psychology applied effectively (blue for strong platforms, gray for weaker competitors, green for premium advantage)
- Specific data points that tell a story (6.4x premium is the star metric)
- Supporting context that explains the "why" (switching costs, network effects)
- Professional but accessible tone

**Visual Balance:**
- Chart area: 70% of canvas
- Whitespace: 10-15% minimum
- Icons supporting concept differentiation
- Legend positioned for readability
- Text density: ~40-50% of visible area

### How to Apply This Pattern

**For future Notebook LM prompts:**

1. **Start with data story first** - What metric is the hero of this visualization?
2. **Structure the canvas** - Allocate 70% for visual, 10-15% whitespace, 15-20% text overlays
3. **Typography hierarchy** - Title (36pt) > Subheading (20pt) > Data callout (48pt bold highlight) > Supporting text (14-16pt)
4. **Color psychology** - Use color to reinforce narrative (blue = power, green = advantage, gray = comparison baseline)
5. **Supporting elements** - Include icons or small illustrations that reinforce the concept difference
6. **Story integration** - Text overlays should explain the "why," not just the "what"

### Template for Data Visualizations

```
DESIGN BRIEF: Data Visualization

Topic: [Your topic]
Data Focus: [What story does the data tell? What's the hero metric?]
Audience: [Enterprise stakeholders / technical leaders / founders]
Visual Style: Modern, clear, data-forward
Format: 1200×800px PNG

PRIMARY DATA:
  Metric 1 (Hero): [Value] [Unit] - This is your star metric
  Metric 2: [Value] [Unit]
  Metric 3: [Value] [Unit]
  Metric 4: [Value] [Unit]

CHART TYPE: Combination (bar chart + highlighted metric callout recommended for comparison stories)

VISUAL DESIGN:
  Color Scheme:
    Hero comparison A: #3B82F6 (tech blue - strong, dominant)
    Hero comparison B: #9CA3AF (neutral gray - baseline for comparison)
    Premium/Advantage: #10B981 (green - highlight the win)
    Background: #F3F4F6 (light)
  Grid Lines: Subtle, light gray
  Legend: Clear, positioned for readability

TEXT OVERLAYS:
  Headline: [The story in 8-10 words, specific metric included]
  Sub-points: 2-3 bullets explaining implications
  Source: "Source: [Attribution]"

TYPOGRAPHY:
  Title: 36pt, bold, #1F2937
  Subheading: 20pt (the context headline)
  Axis Labels: 14pt
  Data callout (hero metric): 48pt, bold, [green or accent color]
  Supporting text: 12pt

LAYOUT:
  Chart Area: 70% of canvas
  Whitespace: 10-15% minimum
  Balance visual weight across quadrants
  Include supporting icons/illustrations for concept reinforcement
```

### When to Use This Pattern

- Comparisons between competing options (platforms vs. point solutions)
- Market cap or valuation data
- Growth metrics with premium advantages
- Feature/capability matrix visualizations
- Before/after scenarios with quantified improvements

### Success Indicators

The prompt should produce a visualization where:
- All text is readable at thumbnail size (test at 200px width)
- The hero metric jumps out immediately (6.4x premium in this case)
- Color psychology reinforces the narrative
- Supporting context explains significance
- Chart takes 70% of visual space, text 20%, whitespace 10%

### Agent Responsible for Applying This

**Vishwakarma (Visual Creator Agent)**
- Primary skill: notebooklm_operator
- Should use this pattern template for all data visualization Notebook LM requests
- Template reference: This memory file
- Override old templates when this pattern is identified

---

**Pattern Validated:** 2026-03-12
**Approval:** User feedback (exact quote: "This notebook LLM prompt was far better, with a wide background and an optimal level of text and an optimal level of visualization.")
**Status:** APPROVED - Use as primary template going forward
