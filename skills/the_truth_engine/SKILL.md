---
name: the_truth_engine
description: Fact-checks claims and validates sources - Phase 2 of 6 Enhancement Pipeline
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: [the_razor]
feeds_into: [the_lateral_thinker]
parallel_with: []
---

# The Truth Engine

## Purpose
Phase 2 of the 6-phase content enhancement pipeline. Answers the question: "Is this factually accurate?" Takes the distilled signal from The Razor and rigorously verifies every claim. No content moves forward without a verification report. The goal is zero factual errors in published content.

## When to Use
- Content has passed through The Razor (Phase 1) and contains claims that need verification
- Any statistical claim, quote, or causal assertion appears in a draft
- A piece references industry data, benchmarks, or historical events
- Content makes predictions or forward-looking statements that need grounding

## Workflow
### Step 1: Extract Claims
- Parse the input for every verifiable statement
- Isolate each claim as an independent item for checking

### Step 2: Categorize Claims
- **Statistical:** Numbers, percentages, growth rates, benchmarks
- **Quotation:** Attributed statements from named individuals
- **Causal:** "X causes Y" or "X leads to Y" assertions
- **Predictive:** Forward-looking claims about what will happen

### Step 3: Verify Each Claim
- Cross-reference against known sources (use web_search_agent if needed)
- For statistics: find the original study or dataset
- For quotes: locate the primary source (interview, speech, publication)
- For causal claims: check if evidence supports causation, not just correlation
- For predictions: assess the track record of the predictor and underlying logic

### Step 4: Rate Confidence
- **Verified (90-100%):** Primary source confirmed, data matches
- **Likely Accurate (70-89%):** Multiple credible secondary sources agree
- **Uncertain (40-69%):** Conflicting sources or incomplete data
- **Unverifiable (<40%):** No reliable source found

### Step 5: Output Verification Report
- Compile results with confidence ratings per claim
- Flag any claim below 70% for revision or removal
- Clearly label speculation and opinion as such

## Output Format
- **Verification Report:** Table of claims with category, confidence score, and source
- **Flagged Items:** Claims below 70% confidence with recommended action (revise, remove, or label as opinion)
- **Phase 2 Status:** PASS (all claims 70%+), CONDITIONAL (some flags), or FAIL (critical inaccuracies found)

## Key Principles
- Every claim needs a source; unsourced claims get flagged
- Distinguish correlation from causation explicitly
- Flag speculation clearly; never present opinion as fact
- Primary sources beat secondary sources every time
- Recency matters: data older than 12 months in fast-moving fields gets flagged

## Integration
- **Primary Agent:** Nakula, Matarisvan
- **Input from:** the_razor (Phase 1)
- **Output to:** the_lateral_thinker (Phase 3)
