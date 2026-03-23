# Eval Criteria: copy_editor

## Scoring Rubric

| # | Criterion | Weight | Description |
|---|-----------|--------|-------------|
| 1 | Word Count Reduction | 20% | Achieves 10-25% word count reduction from input. Not cutting substance, cutting filler. |
| 2 | Passive Voice Elimination | 20% | All passive voice instances rewritten to active voice. Zero passive constructions in output. |
| 3 | Reading Level | 20% | Output reads at Grade 5 or below. Complex words replaced with simple alternatives. |
| 4 | Banned Word Removal | 15% | Zero banned words in output: delve, realm, landscape, cutting-edge, game-changer, paradigm, synergy, leverage (verb), utilize, harness. Zero em-dashes. |
| 5 | Sentence Length | 15% | Average sentence length 15 words or fewer. No single sentence exceeds 20 words. |
| 6 | Edit Summary Accuracy | 10% | Output includes accurate edit summary: words cut (count + %), passive fixes, reading level, banned words found. |

**Total: 100%**

## Pass Threshold
**Composite score >= 8.0/10**

## Automatic Fail Conditions
- Any banned word remains in output = automatic fail
- Any em-dash remains in output = automatic fail
- Word count INCREASED from input = automatic fail
- Missing edit summary = automatic fail
- Output loses a key fact or data point from the input = automatic fail
