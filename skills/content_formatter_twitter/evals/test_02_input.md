# Test Input 02: Edge Case — Content with URLs and Mentions

## Task
Format the following content as a Twitter/X thread. This content includes a URL and an @mention that must be handled correctly for character counting.

## Raw Content

Just published our analysis of the AI voice agent market for 2026. Key findings from the report: The market grew 340% year over year. Enterprise adoption jumped from 12% to 47% in 18 months. The top 3 use cases are customer support (67%), appointment scheduling (52%), and lead qualification (41%). @elikidesignstudio pointed out something interesting in their recent thread — the companies winning aren't the ones with the best AI models. They're the ones with the best data pipelines feeding those models. We found the same pattern. The enterprises getting 10x ROI from AI voice agents all have one thing in common: clean, structured data flowing into the agent in real time. The ones struggling? They bolted AI onto messy, siloed data and wondered why the agent kept hallucinating. Full report available at bitfoundry.ai/voice-report-2026. Three takeaways for CTOs: First, data quality is your AI quality ceiling. Second, voice agents need real-time data, not batch updates. Third, the integration layer matters more than the model layer.

## Why This Is Hard
- URL "bitfoundry.ai/voice-report-2026" counts as 23 characters (Twitter's t.co wrapping)
- @mention must be preserved exactly
- Heavy with numbers/stats that must be formatted concisely within 280 chars per tweet
- Contains a list of 3 takeaways that could be formatted various ways
