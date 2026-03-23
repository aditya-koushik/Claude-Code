# Eval Criteria: web_search_agent

## Scoring Rubric

| # | Criterion | Weight | Description |
|---|-----------|--------|-------------|
| 1 | Source Diversity | 20% | Uses 3+ distinct source types (news, academic, company reports, government data, expert blogs). Not all results from one domain. |
| 2 | Claim Verification | 25% | Each factual claim in the research output is attributed to a specific source. No unattributed assertions. |
| 3 | Synthesis Quality | 20% | Research is synthesized into a coherent narrative, not a raw dump of search results. Connections between sources drawn. |
| 4 | Recency | 15% | Sources are current (within 12 months for fast-moving topics, within 3 years for stable topics). Outdated sources flagged. |
| 5 | Contradiction Handling | 10% | When sources disagree, both perspectives noted. Does not cherry-pick only supporting evidence. |
| 6 | Output Structure | 10% | Research organized with clear sections: key findings, supporting evidence, source list, confidence level. |

**Total: 100%**

## Pass Threshold
**Composite score >= 8.0/10**

## Automatic Fail Conditions
- Any claim presented as fact without attribution = automatic fail
- All sources from a single domain (e.g., all from one news site) = automatic fail
- Research conclusion contradicted by a cited source without acknowledgment = automatic fail
- Zero sources cited = automatic fail
