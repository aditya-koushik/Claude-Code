# Expected Output Characteristics: Test 02 (Edge Case)

## Must Exhibit

1. **Minimal word count reduction (5-12%):** Content is already clean. Editor should find 10-20 words to cut, not 50. Over-editing would damage the piece.
2. **Subtle passive voice fixes:** "The breakeven point is reached" > "You hit breakeven" or similar. "costs are being driven" type constructions caught.
3. **Preserves author voice:** The direct, confrontational tone must survive editing. "Your AI vendor is about to raise prices. Again." must NOT be softened or merged.
4. **No banned words present in input, none introduced:** The editor should confirm zero banned words rather than introducing any.
5. **Sentence structure mostly preserved:** Since the input already uses short declarative sentences, the editor should not merge them into longer ones.
6. **Edit summary reflects light touch:** Summary should show modest cuts (10-20 words), 1-2 passive fixes, already-good reading level. The summary should honestly reflect that this was a light edit.
7. **All facts preserved:** Price increase counts, Apple/Meta references, 40% cost difference, 6-month breakeven, 1M/10M thresholds.

## Must NOT Exhibit

1. Over-editing (>15% word reduction on already-clean copy)
2. Voice change (making it more formal or softer)
3. Merging the punchy fragment sentences into longer ones
4. Adding words or elaborating (editor should only cut, never add)
5. Changing the CTA question at the end
6. Introducing any banned words
7. Missing edit summary
