# Eval Criteria: content_reviewer_factchecker

## Scoring Rubric

| # | Criterion | Weight | Description |
|---|-----------|--------|-------------|
| 1 | Factual Claim Detection | 25% | Identifies ALL factual claims in the content. Missing a verifiable claim = points deducted proportionally. |
| 2 | Scoring Accuracy | 20% | Each dimension score (Factual Accuracy, Logical Coherence, Platform Optimization, Tone/Voice, Grammar, Asset Readiness) is within 1.0 point of the expected range. |
| 3 | Decision Correctness | 20% | APPROVE/REVISE/REJECT decision matches the content quality. Good content approved, bad content rejected, borderline gets REVISE. |
| 4 | Revision Note Specificity | 15% | For REVISE/REJECT decisions: revision notes cite specific lines/phrases to fix, not vague guidance like "improve quality". |
| 5 | Weight Application | 10% | Composite score correctly applies the 6-dimension weights (30%, 20%, 15%, 15%, 10%, 10%). Math is accurate. |
| 6 | Error Detection Rate | 10% | Planted errors (factual, grammatical, formatting) are caught. Detection rate = errors found / errors planted. |

**Total: 100%**

## Scoring Scale
- 0-2: Missed most claims or gave wildly incorrect scores
- 3-4: Caught some issues but missed critical ones
- 5-6: Adequate review with some gaps
- 7-8: Thorough review, minor misses
- 9-10: Every claim checked, scoring accurate, actionable notes

## Pass Threshold
**Composite score >= 8.0/10**

## Automatic Fail Conditions
- Approves content with an unverified factual claim = automatic fail
- Composite score math is wrong by >0.5 points = automatic fail
- Misses a planted factual error = automatic fail
- Approves content scoring below 8.0 = automatic fail
- Gives REJECT to content scoring above 8.5 = automatic fail
