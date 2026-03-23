---
name: ai_industry_tracker
description: Tracks AI industry SOTA, benchmarks, and competitive positioning
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: []
feeds_into: [signal_aggregator, morning_brief_generator]
parallel_with: [twitter_signal_monitor]
---

# AI Industry Tracker

## Purpose
Monitors the AI industry for state-of-the-art developments, benchmark updates, major product launches, and competitive shifts. Maintains a running picture of where the industry stands so that Bit Foundry AI content is always grounded in the latest verified reality. Flags content opportunities when significant developments occur.

## When to Use
- A new model, benchmark, or capability claim surfaces in the AI space
- Content references AI performance claims that need current verification
- Strategic planning requires an up-to-date competitive landscape
- A content opportunity may exist around a recent industry development

## Workflow
### Step 1: Monitor Key AI Sources
- Track announcements from major AI labs (OpenAI, Anthropic, Google DeepMind, Meta AI, Mistral, xAI)
- Monitor benchmark leaderboards (MMLU, HumanEval, MATH, Arena ELO, etc.)
- Watch regulatory developments (EU AI Act, US executive orders, industry standards)
- Follow key conferences and paper releases (NeurIPS, ICML, ArXiv highlights)

### Step 2: Identify New SOTA Claims
- Flag any claim of state-of-the-art performance on a recognized benchmark
- Record the specific benchmark, score, model, and date
- Note the methodology and any caveats from the source

### Step 3: Verify Benchmarks
- Cross-reference claims against independent evaluations where available
- Check for methodology issues (data contamination, cherry-picked benchmarks, unfair comparisons)
- Use web_search_agent for real-time verification when needed

### Step 4: Assess Impact on Positioning
- Evaluate how each development affects Bit Foundry AI's market position
- Categorize: direct competitor move, market expansion, technology shift, or noise
- Rate impact severity: Critical (requires response), Notable (worth tracking), Minor (log only)

### Step 5: Flag Content Opportunities
- Identify developments that the audience cares about and Bit Foundry AI can credibly comment on
- Suggest content angles that demonstrate expertise without being reactive
- Prioritize: breaking analysis > trend piece > commentary

## Output Format
- **Development Summary:** What happened, who did it, verified details
- **Benchmark Update:** Specific numbers with source and verification status
- **Impact Assessment:** Rating and category with justification
- **Content Opportunity:** Suggested angle and urgency (immediate/this week/backlog)
- **Tracking Status:** ACTIVE (ongoing development) or LOGGED (recorded, no action needed)

## Key Principles
- Only track verified claims; hype without evidence gets logged but not amplified
- Focus on practical impact, not theoretical capability
- Distinguish incremental improvement from genuine breakthrough
- Speed matters but accuracy matters more; be fast AND right
- Every tracked development should answer: "Does our audience need to know this?"

## Integration
- **Primary Agent:** Agastya, Ashwatthama, Sanjaya
- **Input from:** web_search_agent, twitter_signal_monitor, signal_aggregator
- **Output to:** Content pipeline (topic suggestions), the_truth_engine (benchmark data), the_strategist (positioning input)
