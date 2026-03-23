# Eval Criteria: ai_writing_humanizer

## Scoring Rubric

| # | Criterion | Weight | Description |
|---|-----------|--------|-------------|
| 1 | AI Pattern Detection | 25% | Identifies ALL AI-generated patterns: passive voice clusters, hedging, filler transitions, em-dashes, banned words, list-heavy structure, perfectly balanced paragraphs. |
| 2 | Pattern Replacement Quality | 20% | Replacements sound authentically human. Not just removing AI patterns but replacing with direct, personality-rich language. |
| 3 | Personality Markers Added | 20% | At least 2 personality markers inserted: rhetorical questions, specific numbers, contrarian opinions, first-person stories, or bold claims with proof. |
| 4 | Banned Word Elimination | 15% | Zero banned words in output. Zero em-dashes. Every instance caught and replaced. |
| 5 | Reading Level | 10% | Output at Grade 5 or below. Complex words replaced with simple alternatives. |
| 6 | Changelog Accuracy | 10% | Includes accurate changelog: passive voice fixes, banned words replaced, personality markers added, final reading level. |

**Total: 100%**

## Pass Threshold
**Composite score >= 8.0/10**

## Automatic Fail Conditions
- Any banned word remains in output = automatic fail
- Any em-dash remains = automatic fail
- Output still "sounds like AI" (hedging, filler transitions, perfectly structured lists) = automatic fail
- No personality markers added = automatic fail
- Missing changelog = automatic fail
