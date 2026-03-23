# Checkpoint Workflow Command

Commit current work as a checkpoint to enable easy rollback.

## Instructions

1. First, check git status to see what changes exist
2. Stage all relevant changes (exclude sensitive files)
3. Create a checkpoint commit with a descriptive message
4. Confirm the commit was successful

## Commit Message Format

```
checkpoint: [brief description of current work]

- What was changed
- Current state
- Any known issues

Co-Authored-By: Claude <noreply@anthropic.com>
```

## Important

- Do NOT commit files in .gitignore
- Do NOT commit sensitive files (.env, credentials, etc.)
- Always verify clean state before major autonomous work
