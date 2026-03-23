---
name: value_equation
description: Analyzes and optimizes value using Hormozi's Value Equation framework
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: []
feeds_into: []
parallel_with: []
---

# Value Equation

## Purpose
Analyze and optimize any offer, product, or service using Alex Hormozi's Value Equation: Value = (Dream Outcome x Perceived Likelihood of Achievement) / (Time Delay x Effort & Sacrifice). Provides a quantified framework for understanding why prospects buy or do not buy, and exactly which variable to improve for maximum impact. Used by Drona as the foundational scoring mechanism for all offer evaluation and optimization at Bit Foundry AI.

## When to Use
- Evaluating why an offer is underperforming or overperforming
- Comparing two offer variations to determine which delivers more perceived value
- Designing a new offer and need to ensure all four variables are optimized
- Diagnosing customer objections (each objection maps to a weak variable)
- Creating content that teaches value creation to the audience
- Scoring any recommendation from grand_slam_offer_architect or hormozi_strategy_injector

## Workflow

### Step 1: Define the Offer
State the offer clearly: what the customer gets, what they pay, and what transformation is promised. Identify the target customer and their current pain state.

### Step 2: Score Each Variable (1-10)
Rate each variable from the prospect's perspective (perceived, not actual):
- **Dream Outcome (DO)**: How desirable is the end result? (10 = life-changing, 1 = marginal improvement)
- **Perceived Likelihood (PL)**: How confident is the prospect it will work for them? (10 = guaranteed, 1 = unlikely)
- **Time Delay (TD)**: How long until they see results? (1 = instant, 10 = years)
- **Effort & Sacrifice (ES)**: How much work/pain is required from them? (1 = effortless, 10 = enormous effort)

### Step 3: Calculate Value Score
Apply the formula: Value = (DO x PL) / (TD x ES). A score above 5.0 is good. Above 10.0 is excellent. Below 2.0 means the offer needs significant work. Document the calculation with reasoning for each score.

### Step 4: Identify the Weakest Variable
The variable dragging the score down most is the highest-leverage improvement target. For numerator variables (DO, PL): increasing them multiplies value. For denominator variables (TD, ES): decreasing them multiplies value. The weakest variable often explains the primary customer objection.

### Step 5: Generate 3 Improvements for Weakest Variable
Produce three specific, actionable improvements targeting the weakest variable:
- **Quick Win**: Implementable within 1 week
- **Medium Investment**: Implementable within 1 month
- **Structural Change**: Requires significant effort but transforms the score

### Step 6: Recalculate Projected Score
Apply each improvement individually and show the projected new score. Rank improvements by effort-to-impact ratio. Recommend the highest-ratio improvement as the priority.

## Output Format
- **Offer Definition**: What is being sold, to whom, for what price
- **Variable Scores**: DO, PL, TD, ES each scored 1-10 with reasoning
- **Current Value Score**: Calculated with formula shown
- **Weakest Variable Analysis**: Which variable is the bottleneck and why
- **Improvement Options**: Three improvements with projected score impact
- **Priority Recommendation**: Highest effort-to-impact improvement
- **Objection Map**: How each weak variable manifests as a customer objection

## Key Principles
- Increasing the top of the equation (DO, PL) is harder than decreasing the bottom (TD, ES); start by removing friction before adding features
- Perceived beats actual for all four variables; if the customer does not believe it, the reality does not matter
- Remove friction before adding features; reducing effort from 8 to 3 often beats increasing dream outcome from 7 to 9
- Each customer objection maps to a specific variable; "too expensive" means value score is too low, not that price is too high
- The best offers score high on all four variables simultaneously; one weak variable can kill an otherwise strong offer

## Integration
Primary agent: **Drona** (Hormozi/Offers). Core scoring tool for grand_slam_offer_architect and hormozi_strategy_injector. Feeds into strategic_positioning for value-based messaging, business_analysis for market comparison, and the content pipeline for educational posts about value creation.
