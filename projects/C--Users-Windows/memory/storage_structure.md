---
name: Storage Structure
description: Actual directory layout for agents, skills, rules, memory, content, and project files
type: reference
---

# Storage Structure

## Core System Paths

```
C:\Users\Windows\.claude\
├── agents\                    # 25 agent subdirectories (AGENT.md each)
├── skills\                    # 53 skill subdirectories (SKILL.md each)
├── projects\
│   └── C--Users-Windows\
│       └── memory\            # All memory modules (this directory)
│           ├── MEMORY.md              # Central index (auto-loaded)
│           ├── mcp_servers.md
│           ├── skills_matrix.md
│           ├── storage_structure.md   # (this file)
│           ├── operational_protocols.md
│           ├── content_pipeline.md
│           ├── positioning_project.md
│           ├── self_improving_skills.md
│           └── writing_style.md
```

## Project Paths

```
D:\Work Weaver\
├── .claude\
│   └── rules\                 # 6 rule files (auto-loaded by path)
│       ├── content-pipeline.md
│       ├── quality-gate.md
│       ├── business-council.md
│       ├── agent-skill-map.md
│       ├── writing-style.md
│       └── skill-self-improvement.md
├── CLAUDE.md                  # Master config (v4.0)
├── Content\
│   ├── skill-execution-log.jsonl      # Execution logs (JSONL)
│   ├── skill-inspection-reports\      # Inspector output
│   └── daily-summaries\              # Daily performance summaries
├── Marketing Assets\
│   ├── Text Posts\            # Approved content (.md files)
│   ├── Blog Posts\            # Long-form content
│   ├── Infographic\           # Notebook LM outputs
│   └── Scheduled Posts\       # Publer drafts for review
├── Positioning\               # Positioning & landing page project docs
├── Call Recording with Santhanakrishnan\  # Sales call recordings
└── Claude_Code_Setup_TRANSFORMED\     # Pipeline docs
```

## External Paths

```
C:\Users\Windows\OneDrive\Desktop\Marketing\
└── publer-mcp\
    └── src\
        └── index.js           # Publer MCP server entry point
```

## Quick Path Reference

| Resource | Path |
|----------|------|
| Agents | `C:\Users\Windows\.claude\agents\` |
| Skills | `C:\Users\Windows\.claude\skills\` |
| Rules | `D:\Work Weaver\.claude\rules\` |
| Memory Modules | `C:\Users\Windows\.claude\projects\C--Users-Windows\memory\` |
| CLAUDE.md | `D:\Work Weaver\CLAUDE.md` |
| Content Output | `D:\Work Weaver\Content\` |
| Execution Logs | `D:\Work Weaver\Content\skill-execution-log.jsonl` |
| Inspection Reports | `D:\Work Weaver\Content\skill-inspection-reports\` |
| Daily Summaries | `D:\Work Weaver\Content\daily-summaries\` |
| Marketing Assets | `D:\Work Weaver\Marketing Assets\` |
| Call Recordings | `D:\Work Weaver\Call Recording with Santhanakrishnan\` |
| Publer MCP | `C:\Users\Windows\OneDrive\Desktop\Marketing\publer-mcp\` |
| Gold Standard Blog | `D:\Work Weaver\Marketing Assets\Blog Posts\Engineering_Is_Never_The_Moat.md` |
