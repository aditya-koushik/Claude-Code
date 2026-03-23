---
name: web_search_agent
description: Validates ground truth using web search and multi-source fact gathering
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: []
feeds_into: [source_matrix]
parallel_with: [brainstorming_agent]
---

# Web Search Agent

## Purpose
Validates ground truth by executing structured web searches and synthesizing findings from multiple credible sources. Serves as the primary tool for grounding content claims in verifiable, current information. Used by fact-checking phases and research pipelines to ensure every published claim has a real-world basis.

## When to Use
- The truth_engine flags a claim that needs external verification
- Research pipeline needs current data on a topic (SOTA, benchmarks, market data)
- A content piece references a statistic, event, or quote that needs sourcing
- Competitive analysis requires up-to-date information on industry players

## Workflow
### Step 1: Define Search Query
- Decompose the claim or question into a precise, searchable query
- Create 2-3 query variants to maximize coverage (exact phrase, broader terms, alternative phrasing)
- Include date qualifiers for time-sensitive information

### Step 2: Execute WebSearch
- Run queries using the WebSearch tool
- Collect results from first two pages of results
- Note the date, domain, and type of each result

### Step 3: Evaluate Source Credibility
- Apply source_matrix scoring to each result if high-stakes
- For quick checks: prioritize .gov, .edu, established publications, and primary sources
- Discard results from known low-credibility domains or content farms

### Step 4: Extract Key Facts
- Pull the specific data points, quotes, or facts that answer the query
- Record the exact source URL and publication date for each extracted fact
- Note any caveats, methodology notes, or context from the source

### Step 5: Cross-Reference Sources
- Require minimum 3 independent sources for any factual claim
- Flag discrepancies between sources with specifics
- Weight primary sources over secondary, recent over old

### Step 6: Synthesize Findings
- Compile a clean summary answering the original query
- Include confidence level (High/Medium/Low) based on source agreement
- Attach source list with URLs and dates

## Output Format
- **Query:** The search queries executed
- **Findings:** Synthesized answer with key facts
- **Confidence:** High (3+ agreeing primary sources), Medium (2 sources or secondary only), Low (single source or conflicting data)
- **Sources:** Numbered list with URL, date, and credibility note
- **Discrepancies:** Any conflicts between sources

## Key Principles
- Minimum 3 sources for any claim; one source is an anecdote, not a fact
- Prefer primary sources (original research, official announcements, raw data)
- Note recency: in AI/tech, information older than 6 months may be outdated
- Distinguish fact from opinion even in credible sources
- Never present search results as truth without cross-referencing

## Integration
- **Primary Agent:** Agastya, Sanjaya, Rama
- **Input from:** the_truth_engine, ai_industry_tracker, content pipeline research requests
- **Output to:** the_truth_engine (verification reports), content pipeline (research findings)
