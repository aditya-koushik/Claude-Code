---
name: No editing product repo files without permission
description: Do not modify files in D:/WorkWeaver Main Branch/ (product repo) without explicit approval - that's the CTO's domain
type: feedback
---

Do not edit files in the product repo (D:/WorkWeaver Main Branch/) without explicit user approval. The user rejected an edit to CLAUDE.md in the product repo during skill creation.

**Why:** Product repo is the CTO's domain. Skills/agents live in ~/.claude/ which is the user's personal tooling space. Product repo changes need explicit permission.

**How to apply:** When creating skills/agents/memory, write to ~/.claude/ freely. When touching D:/WorkWeaver Main Branch/, always ask first.
