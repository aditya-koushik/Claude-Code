# Claude Code Workflow Guide

## Quick Reference for Bit Foundry AI

---

## New Custom Slash Commands

| Command | Purpose | When to Use |
|---------|---------|-------------|
| `/checkpoint` | Create a git checkpoint commit | Before autonomous work, after changes |
| `/review` | Code/PR review with analysis | Before merging, for quality checks |
| `/debug` | Systematic debugging workflow | When encountering errors |
| `/session` | End-of-session summary | Wrapping up work sessions |
| `/prototype` | Rapid prototyping with auto-accept | Exploring new features |
| `/ai-tools` | Research latest AI tools | Daily tool discovery |

---

## Task Classification Quick Guide

### Use Auto-Accept Mode (Shift+Tab) For:
- Prototyping new features
- Writing tests
- Documentation
- UI polish
- Refactoring

### Use Supervised Mode For:
- Core business logic
- Security code
- Database changes
- API contracts
- Critical fixes

---

## Checkpoint Workflow

```
1. Check git status (clean state?)
2. Work with Claude
3. Commit checkpoint frequently
4. Review at milestones
5. Rollback if needed (easy!)
```

---

## Memory Files Location

```
C:\Users\Windows\.claude\projects\C--Users-Windows\memory\
├── MEMORY.md          # Persistent learnings
└── WORKFLOW-GUIDE.md  # This file
```

---

## Project CLAUDE.md Location

```
C:\Users\Windows\workweaver\CLAUDE.md
```

---

## MCP Servers Available

| Server | Capability |
|--------|------------|
| web-search-prime | Web search |
| playwright | Browser automation |
| web-reader | URL content fetching |
| zread | GitHub repo reading |
| zai-mcp-server | Image/video analysis |

---

## Tips from Anthropic Teams

1. **"Let Claude talk first"** - Give it autonomy, check in periodically
2. **"Treat it like a slot machine"** - Save state, try, accept or reset
3. **"Interrupt for simplicity"** - Ask "why are you doing this? Try simpler"
4. **"Try one-shot first"** - Quick prompt, see if it works, then collaborate

---

## Daily Workflow Recommendation

```
Morning:
├── /ai-tools - Check latest tools
├── Review priorities
└── Start work

During Work:
├── Classify task (async vs sync)
├── Use appropriate mode
├── /checkpoint frequently
└── /debug when issues arise

End of Day:
├── /session - Summarize work
├── Update MEMORY.md with learnings
└── Ensure clean git state
```

---

*Created: Based on "How Anthropic teams use Claude Code" recommendations*

