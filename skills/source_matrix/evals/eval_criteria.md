# Eval Criteria: source_matrix

## Scoring Rubric

| # | Criterion | Weight | Description |
|---|-----------|--------|-------------|
| 1 | Dimension Scoring Accuracy | 25% | Authority, Track Record, Data Backing, and Recency scores (each 0-25) are reasonable and justified for the given source. |
| 2 | Tier Assignment Correctness | 20% | Tier (A/B/C/D) matches the total score: A=80-100, B=60-79, C=40-59, D=0-39. Math is correct. |
| 3 | Reasoning Quality | 20% | Each dimension has 1-2 sentences of specific justification. Not generic ("good source") but specific ("peer-reviewed journal with 15-year publication history"). |
| 4 | Bias/Conflict Detection | 15% | Identifies conflicts of interest, funding sources, or ideological biases that affect credibility. Does not assume neutrality. |
| 5 | Recommendation Clarity | 10% | Clear recommendation: Use freely / Use with verification / Use only with corroboration / Do not use. Matches the tier. |
| 6 | Output Format Compliance | 10% | Output includes all required fields: Source name/type/URL, 4 dimension scores, total, tier, reasoning, recommendation. |

**Total: 100%**

## Pass Threshold
**Composite score >= 8.0/10**

## Automatic Fail Conditions
- Total score math is wrong (4 dimensions don't add up) = automatic fail
- Tier doesn't match total score range = automatic fail
- A Tier D source gets "Use freely" recommendation = automatic fail
- Missing any of the 4 dimension scores = automatic fail
- No reasoning provided for any dimension = automatic fail
