---
name: sidebringers-explainer
description: >
  Simplifies complex concepts using the Sidebrinders framework for non-technical
  decision makers (ICP, business leaders, entrepreneurs). Transforms technical content
  into accessible explanations with business impact. Supports educational and impact
  content workflows with 7-step framework including sector and employment analysis.
user-invocable: true
depends_on: [signal_aggregator]
feeds_into: [hormozi_content_writer, triad_writer]
parallel_with: []
---

# Sidebrinders Explainer

Simplifies complex concepts using the Sidebrinders framework for non-technical decision-makers.

## Quick Start

1. Receive signal post or complex topic
2. Strip jargon and explain in plain English
3. Apply Sidebrinders framework (7 steps)
4. For Impact content: Add sector analysis + employment impact
5. Pass simplified explanation to Hormozi Strategy Injector

**Use for: Educational content (tech frameworks, AI concepts, business systems) and Impact content (policy changes, economic shifts).**

## Target Audience

Three-tier audience:
1. **Primary:** Real estate agency owners (ICP) - 25+ employees, Dubai/GCC
2. **Secondary:** Decision makers across industries - CEOs, founders, executives
3. **Tertiary:** Entrepreneurs wanting to grow big - Startup founders, SMB owners

## Sidebrinders Framework (7 Steps)

### Step 1: What Is This Really About?
- Strip all technical jargon
- Explain in plain English (like you're talking to a smart friend)
- Use analogies or metaphors if helpful
- Focus on the core concept, not implementation details

### Step 2: Why Should I Care?
- Direct business impact for multiple industries
- Not just "this is interesting" - what does it DO for business?
- Connect to revenue, efficiency, competitive advantage
- Specific examples across industries (real estate, SaaS, manufacturing, etc.)

### Step 3: What's 1 Thing I Should Do?
- Single, actionable step (not 10 things)
- Specific: "Ask your AI vendor about context window size" (not "research AI")
- Concrete: Action they can take today
- Measurable result they'll see

### Step 4: What's the Risk If I Don't?
- Quantify opportunity cost
- Loss aversion: What will you LOSE by ignoring this?
- Specific: $ amount, % decrease, competitive disadvantage
- Urgency: Time-sensitive (prices changing, competitors adopting)

### Step 5: How Does This Help Me Make Money/Grow?
- Specific ROI connection
- Revenue increase or cost savings
- Efficiency gains (time, resources)
- Competitive advantage (unique capability, market differentiation)

### Step 6 (Impact Content Only): Which Sectors Are Affected/Benefited?
- Identify 3-5 sectors positively affected
- Identify 2-3 sectors negatively affected
- Explain WHY each is affected (mechanism)
- Use industry-specific examples

### Step 7 (Impact Content Only): How Does This Affect Employment?
- Job creation or loss projections
- Numbers (even estimates)
- Timeframe (short-term vs long-term)
- Labor market implications

## Content Type Workflows

### Workflow A: Educational Content

**Input:** Complex technical concept (e.g., "LLM context windows", "vector databases")

**Process:**
1. Strip jargon: Explain in plain English
2. Use analogies: "Imagine your intern remembers..." (context windows)
3. Apply Steps 1-5 of Sidebrinders framework
4. Skip Steps 6-7 (not relevant for educational content)
5. Output: Simplified explanation with business impact

### Workflow B: Impact Content

**Input:** News event or policy change (e.g., "RBI cuts repo rate by 0.5%")

**Process:**
1. Explain what happened (in plain terms)
2. Apply Steps 1-5 of Sidebrinders framework
3. Add Step 6: Sector analysis (affected/benefited)
4. Add Step 7: Employment impact
5. Output: Impact analysis with business implications

## Output Format

```
Sidebrinders Explanation [Content Type: Educational/Impact]

[Core Topic]

## 1. What is this really about?
[Plain English explanation, jargon removed or explained]

## 2. Why should I care?
[Business impact for multiple industries with examples]

## 3. What's 1 thing I should do?
[Single, actionable, concrete step]

## 4. What's the risk if I don't?
[Quantified opportunity cost, loss aversion]

## 5. How does this help me make money/grow?
[Specific ROI connection, revenue/cost efficiency]

[Impact Content Only]
## 6. Which sectors are affected/benefited?
[Benefiting sectors with explanation]
[Affected sectors with explanation]

## 7. How does this affect employment?
[Job creation/loss projections, timeframe, mechanism]
```

## Validation Rules

- **No jargon unexplained** - If technical term used, must explain it
- **Business impact clear** - Not just interesting, but practical application
- **Single actionable step** - Not 10 things, one concrete action
- **Risk quantified** - Specific numbers, not vague warnings
- **ROI connection made** - Revenue, cost, or efficiency explained
- **For Impact: Sector analysis included** - Benefiting + affected sectors
- **For Impact: Employment impact included** - Job projections with mechanism

## Anti-Patterns

**Don't:**
- Use academic language or complex terminology
- Give vague advice like "research this topic"
- Skip sector analysis for impact content
- Use generic examples only (specific industries required)

**Do:**
- Explain in plain English (like to a smart friend)
- Use analogies and metaphors
- Provide specific industry examples (real estate, SaaS, manufacturing)
- Quantify everything (numbers, percentages, estimates)
- Make it actionable (one concrete step)
