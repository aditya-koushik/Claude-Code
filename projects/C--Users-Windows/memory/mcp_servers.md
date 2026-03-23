---
name: MCP Servers and Integrations
description: Active MCP server configurations, status, and missing integrations
type: reference
---

# MCP Servers & Integrations

## Active Servers

### Project-Level
- **publer** - Stdio server at `C:\Users\Windows\OneDrive\Desktop\Marketing\publer-mcp\src\index.js` (Node.js, API key configured). Used for scheduling posts as drafts on LinkedIn and Twitter.

### System-Level (Always Available)
- **web-search-prime** - WebSearch tool for ground truth research and fact-checking. Available in all sessions.
- **playwright** - Browser automation. Used for Twitter/X reading (fallback for missing Twitter API), Publer interaction, and general web scraping.
- **zai-mcp-server** - Image and video analysis. Supports: analyze_image, analyze_video, diagnose_error_screenshot, extract_text_from_screenshot, ui_diff_check, ui_to_artifact, understand_technical_diagram, analyze_data_visualization.
- **web-reader / zread** - GitHub repository reading and web content fetching. System-level integration.
- **AWS Marketplace** - AWS solution research: search, get details, get related solutions, submit feedback. System-level integration.

### Project-Level (Recently Added)
- **notebooklm** - Stdio server via `npx notebooklm-mcp@latest`. Used for visual asset generation (infographics, slides, concept illustrations). Requires one-time Google auth via browser. Configured 2026-03-16.
- **chrome-devtools** - Stdio server via `npx -y chrome-devtools-mcp@latest --no-usage-statistics --browserUrl http://127.0.0.1:9222`. 29 tools: click, fill, screenshot, navigate, network inspector, performance trace, memory snapshot, Lighthouse audit, JS evaluate, accessibility tree, and more. Configured 2026-03-17.

### Chrome DevTools — Session Prerequisite
Chrome MUST be launched BEFORE starting Claude Code, using the "Chrome (Debug)" Desktop shortcut:
`chrome.exe --remote-debugging-port=9222 --remote-allow-origins=* --user-data-dir=C:\Temp\ChromeDebug`
If Chrome is not running on port 9222 at startup, chrome-devtools MCP will fail to connect.

## Missing / Pending

| Server | Status | Notes |
|--------|--------|-------|
| **Twitter API** | NOT CONFIGURED | Using Playwright fallback for reading tweets/profiles. No native posting API. |
| **Canva** | DEFERRED | Alternative asset creation. Low priority now that NotebookLM is configured. |
| **LinkedIn MCP** | PARTIAL | Has bash permission for `uvx` but not fully integrated as a standalone MCP server. LinkedIn posting goes through Publer instead. |

## Integration Notes
- Publer handles cross-platform publishing (LinkedIn + Twitter) via its MCP server
- Twitter reading uses `twitter_reader` skill which invokes Playwright browser automation
- NotebookLM handles visual asset creation for Vishwakarma agent (requires restart + auth)
- All MCP config in `C:\Users\Windows\.claude\mcp.json`
