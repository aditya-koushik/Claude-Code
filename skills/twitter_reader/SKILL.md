---
name: twitter_reader
description: "Read and extract content from Twitter/X tweets, threads, and profiles using Playwright browser automation. Use when given a tweet URL, Twitter handle, or asked to monitor Twitter content for signal detection."
version: 1.0.0
author: Bit Foundry AI
user-invocable: true
disable-model-invocation: false
allowed-tools:
  - mcp__playwright__browser_navigate
  - mcp__playwright__browser_snapshot
  - mcp__playwright__browser_wait_for
  - mcp__playwright__browser_evaluate
  - mcp__playwright__browser_take_screenshot
  - mcp__playwright__browser_click
  - mcp__playwright__browser_press_key
  - mcp__playwright__browser_console_messages
  - mcp__playwright__browser_mouse_wheel
  - Read
  - Write
depends_on: []
feeds_into: [twitter_signal_monitor]
parallel_with: []
---

# Twitter/X Reader Skill

Read tweets, threads, and profile timelines from Twitter/X using Playwright browser automation.

## Input Types

| Input | Example | Action |
|-------|---------|--------|
| Tweet URL | `https://x.com/user/status/123456` | Navigate directly, extract single tweet/thread |
| Profile URL | `https://x.com/AlexHormozi` | Navigate to profile, extract recent tweets |
| Handle only | `@AlexHormozi` | Auto-construct URL: `https://x.com/AlexHormozi` |
| "monitor all" | No argument needed | Iterate all 16 monitored handles |

## Execution Protocol

### Step 1: Navigate
```
Use browser_navigate to go to the target URL.
- For handles: construct https://x.com/{handle_without_@}
- For tweet URLs: navigate directly
- For profiles: navigate to https://x.com/{handle}
```

### Step 2: Wait for Content
```
Use browser_wait_for to ensure content is loaded.
- Wait for tweet text elements to appear
- Timeout: 10 seconds
- If login wall appears: see Error Handling section
```

### Step 3: Snapshot & Extract
```
Use browser_snapshot to get the accessible page content.
This returns structured text including tweet content, author info, and engagement.
```

### Step 4: Deep Extraction (if snapshot insufficient)
```
Use browser_evaluate with JavaScript to extract structured data:

async (page) => {
  const tweets = [];
  const articles = await page.$$('article');
  for (const article of articles) {
    const text = await article.innerText();
    tweets.push(text);
  }
  return tweets;
}
```

### Step 5: Scroll for More (Profile Monitoring)
```
For profiles, use browser_mouse_wheel to scroll down and load more tweets.
Then snapshot again to capture additional content.
Repeat 2-3 times to get 15-20 recent tweets.
```

### Step 6: Structure Output
Format all extracted content into the standard output format below.

## Output Format

### Single Tweet
```markdown
## Tweet Content
- **Author:** @handle (Display Name)
- **Date:** YYYY-MM-DD (extracted or estimated)
- **Content:** [full tweet text]
- **Engagement:** Likes: X | Retweets: X | Replies: X | Views: X
- **Media:** [description of any images/videos if present]
- **URL:** [original tweet URL]
```

### Thread
```markdown
## Thread by @handle
- **Date:** YYYY-MM-DD
- **Thread Length:** X tweets

### Tweet 1/X
[content]

### Tweet 2/X
[content]

...

- **Total Engagement:** Likes: X | Retweets: X | Views: X
```

### Profile Scan
```markdown
## Profile: @handle (Display Name)
- **Bio:** [profile bio]
- **Followers:** X | Following: X
- **Scan Date:** YYYY-MM-DD
- **Tweets Captured:** X

### High-Signal Posts (sorted by engagement)

1. **[Date]** - [first 100 chars of tweet]...
   - Engagement: Likes X | RT X | Views X
   - Signal Score: X/10
   - URL: [link]

2. ...
```

## Signal Scoring (for Profile Scans)

Rate each tweet 1-10 based on:
- **Originality (25%):** Novel insight vs. common knowledge
- **Data/Experience Backing (25%):** Has numbers, case studies, personal experience
- **Relevance to Target Audience (25%):** Relevant to AI, SaaS, B2B, enterprise, startups
- **Impact Potential (25%):** Could generate content angles for Bit Foundry AI

**Threshold:** Only surface tweets scoring 7+ as "high-signal"

## 16 Monitored Handles

### Primary (Business/Finance/Strategy)
| Handle | Focus Area |
|--------|-----------|
| @KobeissiLetter | Market analysis, macro trends, financial signals |
| @chamath | Venture capital, tech trends, bold predictions |
| @saxena_puru | Enterprise SaaS, B2B strategy, market insights |
| @AlexHormozi | Business scaling, offers, value creation |
| @naval | Philosophy, startups, long-term thinking |
| @elonmusk | First principles, disruption, bold moves |

### Secondary (AI/Tech Leaders)
| Handle | Focus Area |
|--------|-----------|
| @AndrewYNg | AI education, industry trends, research |
| @dhh | Contrarian tech views, bootstrapping, Rails |
| @tobi | E-commerce, Shopify ecosystem, founder insights |
| @karpathy | AI/ML technical insights, LLMs, training |
| @lexfridman | AI research, deep conversations, philosophy |
| @balajis | Network state, crypto, technology futures |

### Tech Builders
| Handle | Focus Area |
|--------|-----------|
| @johnrushx | Indie hacking, SaaS building, growth tactics |
| @mattshumer_ | AI agents, prompt engineering, building in public |
| @godofprompt | Prompt engineering, AI workflows, automation |
| @stevesi | Enterprise tech, Microsoft history, product strategy |

## Batch Monitoring Protocol

When invoked with "monitor all" or by Sukra agent:

1. **Iterate** through all 16 handles
2. **For each handle:**
   - Navigate to profile
   - Snapshot recent tweets (last 7 days focus)
   - Score each tweet for signal value
   - Capture top 3-5 high-signal posts per handle
3. **Aggregate** into a single report:
   ```markdown
   ## Twitter Signal Report - YYYY-MM-DD

   ### Top Signals (Score 8+)
   [list of highest-signal posts across all handles]

   ### Trending Themes
   [common themes appearing across multiple handles]

   ### Content Opportunities
   [angles that align with Bit Foundry AI positioning]

   ### Handle-by-Handle Summary
   [brief summary per handle]
   ```
4. **Save** report to `D:\Work Weaver\Marketing Assets\Twitter Signals\signal_report_YYYY-MM-DD.md`

## Error Handling

| Error | Solution |
|-------|----------|
| Login wall / "Sign in" prompt | Try navigating to `https://x.com/{handle}` without `/status/`. If still blocked, take screenshot and report to user. |
| Rate limited | Wait 30 seconds, retry once. If still blocked, report and move to next handle. |
| Content not loading | Take screenshot for debugging via `browser_take_screenshot`. Try refreshing with `browser_navigate` to same URL. |
| DOM structure changed | Fall back to `browser_snapshot` (accessible text) instead of `browser_evaluate` (DOM queries). |
| Profile suspended/deleted | Log as "unavailable" and skip to next handle. |

## Integration Points

| Agent | How This Skill Feeds In |
|-------|------------------------|
| **Sukra** (Signal Monitor) | Primary consumer — uses batch monitoring output to identify trends |
| **Chitrasena** (Content Transformer) | Takes high-signal tweets and transforms into Bit Foundry content |
| **Agastya** (Research) | Uses individual tweet reads for ground truth verification |
| **Arundhati** (Social Research) | Uses profile scans for competitive/social landscape analysis |
| **Ved Vyasa** (Writer) | References original tweets when creating derivative content |

## Quick Reference

```
/twitter_reader https://x.com/AlexHormozi/status/123456   → Read single tweet
/twitter_reader @AlexHormozi                                → Scan profile
/twitter_reader monitor all                                 → Full 16-handle scan
```
