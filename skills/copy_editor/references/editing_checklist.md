# Editing Checklist

## The Complete Copy Editor Checklist

Run every check in order. Fix issues as you find them. A piece is done when every box passes.

---

## Phase 1: Kill Passive Voice

- [ ] Search for "was [verb]ed," "is being [verb]ed," "were [verb]ed," "has been [verb]ed"
- [ ] Rewrite every passive sentence in active voice
- [ ] Identify the subject in every sentence. If the subject is missing or buried, rewrite.
- [ ] Target: under 5% passive voice in the final output

**Quick test:** Can you add "by zombies" after the verb? If yes, it is passive. "The report was written [by zombies]" = passive. Rewrite.

**Common fixes:**
| Passive | Active |
|---------|--------|
| The report was written by the team | The team wrote the report |
| Results were achieved in 30 days | We hit results in 30 days |
| The platform is used by 347 companies | 347 companies use the platform |
| A decision was made to cut costs | We cut costs |
| Errors were reduced by 82% | We cut errors by 82% |

---

## Phase 2: Eliminate Hedge Words

- [ ] Search for: might, perhaps, possibly, potentially, arguably, somewhat, relatively, fairly, quite, rather
- [ ] Search for: "it seems," "it appears," "it could be," "in some cases," "to a certain extent," "in many ways"
- [ ] For each hedge: either commit to the claim or delete it entirely
- [ ] Zero hedge words in the final output

**Fix pattern:** Remove the hedge and state directly.
| Hedged | Direct |
|--------|--------|
| This might help reduce costs | This cuts costs |
| It could potentially improve efficiency | This improves efficiency |
| Perhaps the best approach is | The best approach is |
| Organizations may want to consider | Do this |
| It seems like AI adoption is growing | AI adoption is growing |

---

## Phase 3: Cut Filler Transitions

- [ ] Search for: moreover, furthermore, additionally, in addition, however, nevertheless, consequently, subsequently, in conclusion, to summarize, as mentioned above, it is worth noting
- [ ] Delete the transition word. Start the next sentence directly.
- [ ] If removing the transition makes the connection unclear, the problem is the writing structure, not the missing transition. Rewrite.

**Fix pattern:** Delete and start fresh.
| With filler | Without filler |
|-------------|---------------|
| Furthermore, the platform integrates with SAP. | The platform integrates with SAP. |
| Additionally, costs dropped by 40%. | Costs dropped by 40%. |
| In conclusion, AI adoption is accelerating. | AI adoption is accelerating. |
| However, not all companies succeed. | Not all companies succeed. |

---

## Phase 4: Enforce 1/3/1 Rhythm

- [ ] Check sentence count per paragraph. No paragraph exceeds 3 sentences.
- [ ] Verify single-sentence lines appear between multi-sentence paragraphs.
- [ ] Check for variety: not every paragraph should be 3 sentences. Mix 1, 2, and 3.
- [ ] Read the piece aloud. Does it flow? Monotonous rhythm = rewrite.

**Structure check:**
```
[1 sentence - hook]           GOOD: Varied rhythm
[3 sentences - context]
[1 sentence - pivot]
[3 sentences - insight]
[1 sentence - punch]

[3 sentences]                 BAD: Same length throughout
[3 sentences]
[3 sentences]
[3 sentences]
```

---

## Phase 5: Check Banned Word List

- [ ] Scan for every word on the banned list (see `banned_words_extended.md` for the full list)
- [ ] Core banned words: delve, dynamic, unlock, revolutionize, harness, comprehensive, landscape, paradigm, synergy, leverage (as verb), utilize, realm, cutting-edge, game-changer
- [ ] Replace each with the approved alternative
- [ ] Confirm zero banned words in the final output
- [ ] Confirm zero em-dashes in the final output

---

## Phase 6: Verify Grade 5 Reading Level

- [ ] Calculate average sentence length. Target: 15 words or fewer.
- [ ] No single sentence exceeds 20 words.
- [ ] Replace complex words with simple ones:

| Complex | Simple |
|---------|--------|
| Implement | Build |
| Facilitate | Help |
| Demonstrate | Show |
| Utilize | Use |
| Optimize | Improve |
| Commence | Start |
| Terminate | End |
| Subsequent | Next |
| Approximately | About |
| Endeavor | Try |
| Ascertain | Find out |
| Requisite | Required |
| Methodology | Method |
| Proliferation | Growth |
| Ameliorate | Fix |

- [ ] Run readability check. Target: Grade 5 or below.
- [ ] If any section scores above Grade 8, simplify until it drops.

---

## Phase 7: Remove Redundancy

- [ ] Check for repeated ideas. If you said the same thing in paragraph 1 and paragraph 4, cut one.
- [ ] Check for redundant modifiers: "completely eliminate" (just "eliminate"), "very unique" (just "unique"), "absolutely essential" (just "essential"), "total annihilation" (just "annihilation")
- [ ] Check for double descriptions: "small in size" (just "small"), "blue in color" (just "blue"), "round in shape" (just "round")
- [ ] Check for pointless intensifiers: very, really, truly, extremely, incredibly, absolutely

---

## Phase 8: Tighten Sentences to Minimum Words

- [ ] Read each sentence. Remove one word. Does it still work? Remove another. Keep going until removing a word breaks the meaning.
- [ ] Target: 20% word count reduction from the draft.
- [ ] Common cuts:

| Wordy | Tight |
|-------|-------|
| In order to | To |
| Due to the fact that | Because |
| At this point in time | Now |
| In the event that | If |
| For the purpose of | To |
| On a daily basis | Daily |
| In the near future | Soon |
| A large number of | Many |
| In spite of the fact that | Despite |
| Has the ability to | Can |
| Is able to | Can |
| Make a decision | Decide |
| Take into consideration | Consider |
| Come to the conclusion | Conclude |
| Give an indication of | Indicate |

---

## Phase 9: Final Read-Through

- [ ] Read the piece start to finish without stopping
- [ ] Every sentence connects to the next. No orphan ideas.
- [ ] The hook is the strongest line in the piece.
- [ ] The last line is the most memorable line in the piece.
- [ ] The piece sounds like a specific human, not a template.
- [ ] You would not be embarrassed to put your name on this.

---

## Output Summary Template

After editing, report:

```
EDIT SUMMARY:
- Words cut: [X] ([Y]% reduction)
- Passive voice fixes: [X]
- Hedge words removed: [X]
- Banned words replaced: [X]
- Filler transitions cut: [X]
- Reading level: Grade [X]
- Final word count: [X]
```
