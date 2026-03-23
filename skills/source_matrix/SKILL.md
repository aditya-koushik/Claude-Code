---
name: source_matrix
description: Rates signal strength and evaluates source credibility on a 0-100 scale
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: [web_search_agent]
feeds_into: [hormozi_content_writer, triad_writer]
parallel_with: []
---

# Source Matrix

## Purpose
Evaluates the credibility of any information source using a structured 4-dimension scoring system. Assigns a credibility tier (A/B/C/D) and numerical score (0-100) so that downstream skills know how much weight to give a particular source. Prevents low-quality information from contaminating the content pipeline.

## When to Use
- A new source is encountered and its reliability is unknown
- web_search_agent needs to evaluate results from unfamiliar domains
- A claim rests on a single source and its credibility determines whether the claim survives
- Building a source library for recurring topics

## Workflow
### Step 1: Identify Source
- Record source name, type (individual, institution, publication, dataset), and URL
- Note the specific claim or information being evaluated
- Check if this source has been scored before in the source library

### Step 2: Score on 4 Dimensions (each 0-25)
- **Authority (0-25):** Domain expertise, credentials, institutional backing, recognition by peers
- **Track Record (0-25):** Historical accuracy of past claims, corrections issued, prediction accuracy
- **Data Backing (0-25):** Does the source cite data? Is the methodology transparent? Is raw data available?
- **Recency (0-25):** How current is the information? Is the source actively maintained?

### Step 3: Calculate and Assign Tier
- Sum the four dimension scores for a total (0-100)
- **Tier A (80-100):** Gold standard; use with confidence
- **Tier B (60-79):** Reliable; use with standard verification
- **Tier C (40-59):** Mixed; use only with corroboration from Tier A or B source
- **Tier D (0-39):** Unreliable; do not use for factual claims

### Step 4: Document Reasoning
- Write 1-2 sentences justifying each dimension score
- Note any conflicts of interest, known biases, or caveats
- Flag if the source's credibility varies by topic area

## Output Format
- **Source:** Name, type, URL
- **Scores:** Authority / Track Record / Data Backing / Recency (each out of 25)
- **Total Score:** 0-100
- **Tier:** A, B, C, or D
- **Reasoning:** Brief justification for each dimension
- **Recommendation:** Use freely / Use with verification / Use only with corroboration / Do not use

## Key Principles
- Past accuracy is the strongest predictor of future accuracy
- Beware conflicts of interest: who pays the source matters
- Institutional sources need the same scrutiny as individuals
- A source can be Tier A in one domain and Tier D in another; score per topic
- Update scores when new evidence about source reliability emerges

## Integration
- **Primary Agent:** Agastya, Sukra, Arundhati
- **Input from:** web_search_agent (new sources to evaluate), the_truth_engine (sources behind claims)
- **Output to:** the_truth_engine (credibility scores), web_search_agent (source filtering), signal_aggregator (source weighting)
