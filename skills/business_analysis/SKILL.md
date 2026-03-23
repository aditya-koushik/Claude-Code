---
name: business_analysis
description: Analyzes business models, markets, and competitive landscapes with structured frameworks
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: []
feeds_into: []
parallel_with: []
---

# Business Analysis

## Purpose
Analyze business models, markets, and competitive landscapes to produce actionable strategic recommendations. Uses established frameworks (Porter's Five Forces, SWOT, TAM/SAM/SOM) to transform raw business questions into structured analysis with quantified metrics and confidence-scored recommendations. Primary tool for Vidur when evaluating market opportunities and competitive threats for Bit Foundry AI.

## When to Use
- Evaluating a new market opportunity or product direction
- Assessing competitive landscape before strategic decisions
- Sizing a market (TAM/SAM/SOM) for investor or internal planning
- Benchmarking against competitors on pricing, features, or positioning
- Supporting content that requires business data backing

## Workflow

### Step 1: Define the Business Question
Clarify the exact question being analyzed. Scope it to one of: market sizing, competitive analysis, business model evaluation, or opportunity assessment. Identify the decision this analysis will inform.

### Step 2: Gather Data
Collect relevant data points: market size estimates, competitor list with revenue/funding/headcount where available, industry growth rates, customer segments, pricing models, and technology trends. Use web_search_agent and signal_aggregator for current data.

### Step 3: Apply Framework
Select and apply the appropriate framework:
- **Porter's Five Forces**: Supplier power, buyer power, competitive rivalry, threat of substitution, threat of new entry
- **SWOT**: Strengths, weaknesses, opportunities, threats
- **TAM/SAM/SOM**: Total addressable market, serviceable addressable market, serviceable obtainable market
- **Business Model Canvas**: Value proposition, channels, revenue streams, cost structure

### Step 4: Calculate Key Metrics
Quantify findings: market share potential, revenue projections, competitive gap scores (1-10), growth rate comparisons, and unit economics where applicable.

### Step 5: Produce Analysis
Compile into structured output with executive summary, supporting data, and a recommendation with confidence score (0-100%).

## Output Format
- **Executive Summary**: 2-3 sentence verdict
- **Market Analysis Table**: Key metrics in tabular format
- **Competitive Positioning Map**: Players mapped by relevant axes
- **Framework Analysis**: Full framework output with scoring
- **Recommendation**: Clear action with confidence score and reasoning
- **Risks**: Top 3 risks to the recommendation

## Key Principles
- Data over opinions: every claim needs a supporting data point or explicit assumption label
- Confidence scores must be honest; 60% confidence is more useful than false 90%
- Always identify what data is missing and how it would change the analysis
- Bias toward actionability: analysis that does not lead to a decision is wasted work

## Integration
Primary agent: **Vidur** (Money/Business). Feeds into strategic_advisory for high-stakes decisions, strategic_positioning for market entry, and value_equation for offer optimization. Outputs can be used by content pipeline agents to produce data-backed thought leadership posts.
