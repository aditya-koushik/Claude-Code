---
name: publer_operator
description: Manages Publer draft creation and social media distribution with strict draft-only policy
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: [content_reviewer_factchecker]
feeds_into: [hybrid_social_media_scheduler]
parallel_with: []
---

# Publer Operator

## Purpose
Handles all interactions with the Publer API for social media draft creation and scheduling. Creates draft posts with attached visual assets, sets scheduled times, and confirms successful saves. Enforces the absolute rule that no post is ever auto-published. Operated by agent Sahadeva.

## When to Use
- Approved content and its visual asset are ready for draft creation on Publer
- A scheduled draft needs its time adjusted or content updated
- Draft status needs to be checked or confirmed
- The publishing queue needs a current inventory of pending drafts

## Workflow

### Step 1: Receive Approved Content and Asset
Accept the formatted content (platform-specific version) and the paired visual asset from `hybrid_social_media_scheduler` or `content_factory`. Verify both are present before proceeding.

### Step 2: Format for Publer API
Structure the payload according to Publer API requirements: post text, media attachment, target platform (LinkedIn or Twitter), and draft status flag. Double-check character limits and media format compatibility.

### Step 3: Create Draft Post
**CRITICAL: NEVER publish directly. ALWAYS set status to DRAFT.**
Send the API request to create a draft. The draft flag must be explicitly set. There is no scenario where auto-publish is acceptable.

### Step 4: Attach Visual Asset
Upload and attach the visual asset to the draft. Verify the attachment is successful and the preview renders correctly.

### Step 5: Set Scheduled Time
Apply the proposed scheduled time from `hybrid_social_media_scheduler`. This time is a suggestion for chairman review, not an auto-publish trigger.

### Step 6: Confirm and Log
Verify the draft is saved successfully in Publer. Record the Publer draft ID, platform, scheduled time, and content ID in the publishing queue. Notify `execution_logger`.

## Output Format
- **Publer Draft ID:** Unique ID returned by Publer API
- **Platform:** LinkedIn / Twitter
- **Content ID:** Internal content identifier
- **Scheduled Time:** Proposed publish time (pending chairman approval)
- **Asset Attached:** Yes / No
- **Status:** Draft saved / Error (with error details)

## Key Principles
- **DRAFTS ONLY. NEVER auto-publish. This rule has zero exceptions.**
- Chairman must approve before any post goes live
- 30-minute review window minimum between draft creation and any potential publish
- Publishing is irreversible; drafts are safe
- Always double-check formatting before creating the draft
- If the API call fails, retry once then escalate; do not silently drop content

## Integration
- Publer MCP server at `C:\Users\Windows\OneDrive\Desktop\Marketing\publer-mcp\src\index.js`
- Receives instructions from `hybrid_social_media_scheduler`
- Reports status to `execution_logger` for pipeline tracking
- Drafts reviewed by chairman before `Sahadeva` triggers final publish
