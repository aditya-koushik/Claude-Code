---
description: Analyzes daily conversations to create meaningful LinkedIn posts in your voice, stores them for approval, and posts after confirmation
name: linkedin-post-generator
version: 1.0.0
author: Workweaver CEO
depends_on: []
feeds_into: [content_formatter_linkedin]
parallel_with: []
---

# LinkedIn Post Generator Skill

This skill transforms your daily conversations and insights into meaningful LinkedIn posts in your authentic voice, with full approval before posting.

## Workflow

### 1. Analyze Conversation
- Scan recent conversations for valuable insights
- Extract relevant chunks that resonate with your audience
- Identify themes: startup journey, product updates, learnings, industry insights

### 2. Create Post
- Write in YOUR natural language and voice
- Keep it authentic and conversational
- Structure for engagement (hook → value → CTA)

### 3. Add Hashtags
- 10-12 relevant hashtags per post
- Mix of broad (#startup, #SaaS) and niche (#AIvoiceagents, #B2Bsales)
- Include trending and evergreen tags

### 4. Store & Approve
- Save post as `.md` file in dedicated folder
- Show complete post for your review
- **Only post to LinkedIn after your explicit approval**

## Post Storage

All posts are stored in:
```
C:\Users\Windows\OneDrive\Desktop\workweaver\LinkedIn Posts\
├── 2025-12-29-product-update.md
├── 2025-12-30-startup-learnings.md
└── pending/
    ├── draft-001.md
    └── draft-002.md
```

## Usage Examples

```
"Create a LinkedIn post from today's conversation about contract work"
"Turn this insight into a post: [paste text]"
"Generate a post about our AI voice agent progress"
"Review pending posts and let me approve one for publishing"
```

## Approval Process

1. **Draft**: I create the post and save as `.md`
2. **Review**: I show you the complete post with hashtags
3. **Edit**: Tell me what to change (tone, length, hashtags)
4. **Approve**: Say "Post it" or "Publish" to post to LinkedIn
5. **Published**: I post via LinkedIn MCP and move file to published folder

## Your Voice Guidelines

- Be authentic and conversational
- Share real challenges, not just wins
- Use simple language (avoid jargon)
- Include specific examples and numbers when possible
- End with questions to spark discussion

## Hashtag Strategy

**Workweaver-specific**: #Workweaver #AIVoiceAgent #B2BSales

**Startup journey**: #StartupLife #FounderJourney #SaaSStartup #BuildInPublic

**Industry**: #AI #SalesAutomation #CustomerService #ConversationalAI

**Engagement**: #Entrepreneurship #SmallBusiness #TechStartup
