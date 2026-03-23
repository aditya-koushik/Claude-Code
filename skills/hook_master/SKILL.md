---
name: hook_master
description: Generates scroll-stopping hooks for blog posts, LinkedIn, and Twitter using 2026 algorithm-optimized patterns, real-time trend awareness, and platform-specific constraints. The hook decides whether anyone reads the rest.
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: [web_search_agent]
feeds_into: [hormozi_content_writer, triad_writer, linkedin_post_generator_2026, twitter_post_optimizer, content_formatter_linkedin, content_formatter_twitter]
parallel_with: [the_razor, source_matrix]
---

# Hook Master

## Purpose
The hook is the only line that matters. If the hook fails, the content never existed. This skill generates hooks that stop the scroll, create cognitive tension, and force read-through. Every hook is grounded in what is working RIGHT NOW on each platform, not what worked last year.

## When to Use
- Before writing ANY content (blog, LinkedIn, Twitter, newsletter)
- When a draft exists but the opening is weak
- When generating multiple hook variants for A/B selection
- As the FIRST step in the content pipeline, before Ved Vyasa writes a single paragraph

## Critical Rule
NEVER write a hook without completing Step 1 (Trend Pulse). A hook that references yesterday's world gets ignored. A hook that touches today's nerve gets shared.

---

## Workflow

### Step 1: Trend Pulse (Mandatory, Non-Skippable)
Before generating any hook, run a rapid web search to answer:
- What are the 3 biggest AI/tech stories THIS WEEK?
- What controversies or debates are live RIGHT NOW?
- What numbers, stats, or events dropped in the last 7 days?

Use: `web_search_agent` with queries like "AI news this week [current month year]", "[topic] latest developments [current month year]"

**Output:** A 3-5 bullet "Zeitgeist Snapshot" capturing the current moment. This snapshot informs every hook generated in this session.

**Why this matters:** Hooks that reference what happened today feel like insider knowledge. Hooks that reference what happened two months ago feel like recycled content. The audience can tell the difference in 0.5 seconds.

### Step 2: Identify the Core Tension
Every great hook contains a tension. Exactly one of these:

| Tension Type | Formula | Example |
|---|---|---|
| **Belief Contradiction** | [Thing they believe] is wrong | "The best AI models are not the smartest ones." |
| **Identity Challenge** | If you are [X], you are probably [Y] | "If you are an AI founder, you are probably pricing for adoption, not value." |
| **Unexpected Outcome** | [Action] produced [opposite result] | "We added AI to onboarding. Support tickets went up 31%." |
| **Mechanism Reveal** | Here is the exact [gear] behind [outcome] | "12 companies launched AI employees this year. Only 2 survived. Same reason for all 10 failures." |
| **Uncomfortable Specific** | [Data point too specific to be fake] | "3 of my last 5 enterprise deals fell apart at legal review. Same clause every time." |
| **Stakes Escalation** | [Familiar thing] has [unfamiliar consequence] | "One misconfigured memory function cost us 4 months of user trust." |

**Pick ONE tension.** Hooks that try to contain two tensions contain zero.

### Step 3: Apply Platform Constraints

#### For Blog Posts
- Hook = the first 1-2 sentences of the entire piece
- Can be up to 3 sentences (but 1 is better)
- Must create a "slippery slope" into paragraph 2
- The reader should feel physically unable to stop reading
- NO em-dashes. Use periods, commas, colons.
- Reference a specific name, company, number, or date in the first sentence. Vague openings die.

#### For LinkedIn
- **210 characters MAX** (before "see more" fold). This is non-negotiable.
- Optimal: 1 sentence, under 12 words
- Must work as a standalone statement even if nobody clicks "see more"
- NO external links in the hook line
- First 2 lines are the ONLY thing 80% of readers will see

#### For Twitter/X
- **Under 110 characters** for the hook tweet
- Must stand alone as a shareable statement
- Thread hook must make the reader NEED the next tweet
- No hashtags in the hook tweet (closing tweet only)

### Step 4: Generate Hook Variants (Minimum 5)
For every piece of content, generate at least 5 hook variants using DIFFERENT tension types. Label each with:
- The tension type used
- The platform it is optimized for
- A confidence score (1-10) based on how well it matches current 2026 patterns

### Step 5: Validate Against Kill List
Check every hook against the DEAD PATTERNS list below. If it matches any dead pattern, discard and regenerate.

### Step 6: Select Top Hook
Rank all variants by:
1. Specificity (does it name a real thing, person, company, number?)
2. Tension strength (how badly does the reader NEED to resolve this?)
3. Zeitgeist alignment (does it touch something happening RIGHT NOW?)
4. Platform fit (does it respect character limits and algorithm mechanics?)

The winner scores highest across all four dimensions.

---

## The 8 Proven Hook Patterns (2026, Algorithm-Validated)

### Pattern 1: The Mechanism Reveal
"Here is exactly how [specific entity] [achieved specific outcome] without [expected cost/resource]."

Why it works: Hormozi-style specificity. The "without X" element removes the objection before the reader forms it.

Example: "Here is exactly how a 4-person team outranked HubSpot on 40 keywords in 90 days without a single backlink campaign."

Best for: LinkedIn, Blog posts. Drives saves (strongest algorithmic signal on LinkedIn in 2026).

### Pattern 2: The Credibility Tension
"[Known belief/approach] is [specific negative consequence]. Here is what the top [specific %] are doing instead."

Why it works: Attacks a belief the reader currently holds. Creates cognitive dissonance that can only be resolved by reading on.

Example: "Most AI startups are optimizing for model intelligence. The ones winning are optimizing for something else entirely."

Best for: LinkedIn, Blog posts. Drives comments (2x algorithmic weight vs likes).

### Pattern 3: Numbers That Contradict
"[We/Company] [did X]. [Counterintuitive metric followed]."

Why it works: A specific number that goes the wrong direction is immediately credible and demands explanation.

Example: "We shipped memory to our AI agent. Customer complaints went up 40% in the first week."

Best for: All platforms. Twitter especially (short, punchy, bookmarkable).

### Pattern 4: The Personal Reversal
"I used to believe [common belief]. [Specific event/data] changed that."

Why it works: Vulnerability + earned wisdom. Activates the reader's own belief structure.

Example: "I used to think the model was our moat. Then I watched three competitors ship the same model in a weekend."

Best for: LinkedIn (drives depth engagement), Twitter threads (story arc opener).

### Pattern 5: The Identity Hook
"If you are [specific identity], you are probably [specific mistake] right now."

Why it works: Names the reader. Creates personal stakes. Drives comments because readers confirm or refute their inclusion.

Example: "If you are building an AI product, you are probably solving the wrong problem right now."

Best for: LinkedIn (comment-driving), Blog posts (audience targeting).

### Pattern 6: The Uncomfortable Specific
"[Very specific internal data point that feels too honest to be marketing]."

Why it works: Irreproducible data. No AI can generate this story. Passes the authenticity test instantly.

Example: "28% of US organizations have zero confidence in the data feeding their AI. Gartner published this last week."

Best for: All platforms. Highest trust signal.

### Pattern 7: The Prediction With Stakes
"By [specific date], [specific entities] will [specific outcome]. Most people will miss why."

Why it works: Bookmarkable. People save predictions to check later. Bookmark signals drive reach on both LinkedIn and Twitter.

Example: "By Q4 2026, half the AI SaaS companies funded in 2024 will be dead. Not because of technology."

Best for: Twitter (bookmark multiplier is 5x likes), LinkedIn (save signal).

### Pattern 8: The Contrarian Stake
"[Bold declarative that contradicts conventional wisdom]. Full stop."

Why it works: Zero hedging. Creates immediate "wait, what?" response. Algorithm rewards the reply velocity this generates.

Example: "Your AI does not need to be smarter. It needs a better harness."

Best for: Twitter hook tweets (under 110 chars), LinkedIn openers.

---

## DEAD PATTERNS (Discard on Sight)

These patterns are algorithmically penalized or audience-fatigued in 2026:

| Dead Pattern | Why It Died |
|---|---|
| "Comment YES if you agree" | LinkedIn NLP filter flags as engagement bait. 60% reach penalty. |
| "Like for Part 2" | Engagement bait. Flagged and suppressed. |
| "5 things I learned from X years" | Saturated. Zero tension. No reason to click "see more." |
| "I just got featured in [publication]" | Humble brag. Triggers cynicism. Kills depth signal. |
| "What I learned from losing $X changed everything" | Vague curiosity gap. Audiences have seen this 10,000 times. |
| "Success is not about working harder" | Generic wisdom. Zero specificity. Infinite prior art. |
| "Unpopular opinion:" (followed by popular opinion) | Overused. Only works if the opinion is genuinely unpopular. |
| "[Inspirational quote] + Here is why" | Quote-then-explain format is dead. Start with your own claim. |
| Any hook starting with "I" on LinkedIn | Opens to cynicism unless the "I" is immediately followed by vulnerability or failure. |
| Em-dashes anywhere in the hook | AI writing fingerprint. Kills authenticity. ZERO TOLERANCE. |

---

## Platform Algorithm Mechanics (2026, Current)

### LinkedIn 2026
- **Depth Score** drives distribution: dwell time + conversation quality (thread depth in comments)
- Comments carry **2x algorithmic weight** vs likes
- Comments over 5 words triggering author reply = gold standard signal
- Saves = strongest single engagement type
- External links in caption = **60% reach penalty**
- Engagement bait phrases = **60% reach penalty** (NLP detection active)
- Optimal post length: **1,300-1,900 characters** (47% higher engagement)
- Hook must be under **210 characters** (before "see more" fold)
- Sentences under 12 words perform 20% better
- First 60 minutes are critical for algorithmic pickup

### Twitter/X 2026
- Bookmarks carry **5x algorithmic multiplier** over likes (+10 vs +0.5 points)
- Rapid replies beat slow likes (15 replies in 10 min > 50 likes over 6 hours)
- Threads get **63% more impressions** than single tweets
- Optimal thread length: **7 tweets**
- Hook tweet sweet spot: **under 110 characters**
- Critical velocity window: **first 30-60 minutes**
- No hashtags in thread body (closing tweet only)

---

## Zeitgeist Anchors (Updated Monthly)

### March 2026 Snapshot
These are the live tensions in the AI space right now. Use them to make hooks feel immediate:

- **12+ AI model releases in one week** (GPT-5.4, Claude 4.6, Gemini 3.1 Flash-Lite, Nemotron 3 Super). Model releases are becoming noise. What differentiates now?
- **28% of US organizations have zero confidence in their AI data quality** (Gartner). Capability is outrunning trust.
- **Gartner projects 1,000+ legal claims against enterprises for AI agent failures by end of 2026.** The liability question is no longer theoretical.
- **QuitGPT movement**: OpenAI Pentagon contract backlash. AI-military alignment debate is live.
- **Anthropic memory rollout**: Context persistence across sessions for all Claude users.
- **NVIDIA GTC**: Nemotron 3 Super built for multi-agent orchestration. Infrastructure bet accelerating.
- **Enterprise integration deepening**: Google Workspace CLI (40 agent skills), Canal+ multi-year AI deal.

**UPDATE PROTOCOL:** At the start of each content session, run Step 1 (Trend Pulse) to refresh this section. The skill evolves with the news cycle.

---

## Output Format

For each content piece, deliver:

```
ZEITGEIST SNAPSHOT (3-5 bullets from Step 1)

CORE TENSION: [One sentence describing the tension this hook exploits]

HOOK VARIANTS:

1. [Hook text] | Pattern: [name] | Platform: [target] | Confidence: [X/10]
2. [Hook text] | Pattern: [name] | Platform: [target] | Confidence: [X/10]
3. [Hook text] | Pattern: [name] | Platform: [target] | Confidence: [X/10]
4. [Hook text] | Pattern: [name] | Platform: [target] | Confidence: [X/10]
5. [Hook text] | Pattern: [name] | Platform: [target] | Confidence: [X/10]

RECOMMENDED WINNER: [#X]
REASONING: [Why this hook wins on specificity, tension, zeitgeist, platform fit]

DEAD PATTERN CHECK: [Confirmed none of the variants match dead patterns]
```

---

## Key Principles
- The hook is not a summary. It is an open loop that MUST be closed.
- Specificity is the currency of trust. Names, numbers, dates, companies. Never vague.
- The best hook makes the reader feel like they are about to learn something they should already know.
- A hook that works for "any audience" works for no audience. Name who you are talking to.
- If you cannot state the tension in one sentence, you do not have a hook. You have a preamble.
- Speed of reference matters. A hook referencing this week's news beats a hook referencing last month's news every time.
- ZERO em-dashes. ZERO hedging. ZERO "in my experience." ZERO "might" or "perhaps."

## Integration
- **Primary Agents:** Ved Vyasa, Chitrasena, Vayu
- **Input from:** Content topic/thesis, raw research (Agastya), trend pulse (web_search_agent)
- **Output to:** All writing skills (hormozi_content_writer, triad_writer, linkedin_post_generator_2026, twitter_post_optimizer)
- **Position in pipeline:** FIRST. Before any writing begins. The hook is written before the body.
