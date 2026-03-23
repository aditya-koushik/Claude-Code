---
name: ux_terminology_scanner
description: >
  Scans all customer-visible UI surfaces for terminology inconsistencies, legacy labels,
  internal jargon, and brand violations. Catches "Crew", "AI Employee Brain", "OpenClaw",
  "TENANT#" and any term that shouldn't face customers. Produces a terminology health map.
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: []
feeds_into: []
parallel_with: [accessibility_auditor, product_claims_validator]
allowed-tools:
  - Bash
  - Read
  - Grep
  - Glob
  - Write
---

# UX Terminology Scanner

## Purpose
Customers see words before they see features. A single "Crew" label in a dashboard that should say "AI-Ops Team" breaks trust and signals an unfinished product. This skill systematically scans every customer-visible surface for terminology violations — legacy labels, internal jargon, placeholder text, and brand inconsistencies.

## When to Use
- Pre-launch terminology cleanup
- After major rebranding (e.g., "Crew" → "AI-Ops Team")
- When audit flags legacy terminology (ORANGE-P11-001, ORANGE-P11-002)
- Before demo or investor meetings

## Configuration

### Terminology Rules (update per project)
```yaml
BANNED_TERMS:
  # Legacy product names
  - term: "Crew"
    replacement: "AI-Ops Team" or "Team"
    severity: RED
    context: "Old HR-style terminology from pre-pivot"
  - term: "AI Employee Brain"
    replacement: "Agent Intelligence" or remove entirely
    severity: RED
    context: "Internal engineering label, not customer-facing"
  - term: "OpenClaw"
    replacement: "Workweaver"
    severity: RED
    context: "Old product name"

  # Internal jargon
  - term: "TENANT#"
    replacement: "Organization"
    severity: ORANGE
    context: "Internal ID prefix leaking to UI"
  - term: "tenant_id"
    replacement: Should never appear in UI
    severity: ORANGE
  - term: "skill_executor"
    replacement: Should never appear in UI
    severity: ORANGE

  # Placeholder / debug text
  - term: "TODO"
    replacement: Remove or implement
    severity: YELLOW
    context: "Unfinished work visible to customers"
  - term: "FIXME"
    replacement: Remove or fix
    severity: YELLOW
  - term: "Lorem ipsum"
    replacement: Real copy
    severity: RED
  - term: "test123"
    replacement: Remove
    severity: RED

CONSISTENCY_PAIRS:
  # Terms that should be used consistently (pick one)
  - variants: ["AI-Ops", "AI Ops", "AIops", "AI ops"]
    canonical: "AI-Ops"
  - variants: ["Workspace", "workspace", "Work Space"]
    canonical: "Workspace"
  - variants: ["Mission", "mission", "Project"]
    canonical: "Mission" (if this is the product term)
  - variants: ["Agent", "agent", "AI Agent", "AI agent", "Bot"]
    canonical: "Agent"
```

## Workflow

### Step 1: Discover Customer-Visible Surfaces
```
Scan for files that render customer-visible text:

HTML templates:
  - apps/landing/public/**/*.html
  - apps/dashboard/**/*.html
  - **/*.html (excluding test files)

JavaScript (UI strings):
  - **/*.js, **/*.ts, **/*.tsx, **/*.jsx
  - Focus on: string literals, template literals, i18n keys

Route manifests:
  - runtime-route-manifest.js
  - Any router configuration with page titles/labels

Config files with customer-facing text:
  - manifest.webmanifest
  - brand-facts.json
  - *.json with "label", "title", "description" keys

Error messages:
  - HTTP error responses with human-readable messages
  - Toast/notification messages
  - Form validation messages

Emails/notifications:
  - Email templates
  - SMS templates
  - Push notification templates

Exclude:
  - Test files (**/test_*, **/*_test.*)
  - Backend-only code (unless it generates user-facing errors)
  - Comments and docstrings (separate pass, lower severity)
```

### Step 2: Scan for Banned Terms
```
For each BANNED_TERM:
  - Grep across all customer-visible files
  - Record: file:line, surrounding context (5 chars each side)
  - Classify: is this definitely customer-visible or backend-only?
  - Apply severity from rules

Special patterns:
  - "Crew" in HTML text content (RED) vs "Crew" in a CSS class name (YELLOW)
  - "TENANT#" in rendered text (RED) vs variable name (YELLOW)
```

### Step 3: Check Terminology Consistency
```
For each CONSISTENCY_PAIR:
  - Count occurrences of each variant across all customer-visible files
  - Flag if multiple variants are used
  - Recommend the canonical form
  - Provide specific file:line for each non-canonical usage
```

### Step 4: Detect Internal Jargon Leaks
```
Scan for patterns that suggest internal terminology leaking:
  - Variable names rendered directly: {{tenant_id}}, ${skill_executor}
  - Technical IDs in UI: UUIDs, DynamoDB key formats, AWS ARNs
  - Stack traces or error codes in user-facing messages
  - HTTP status codes without human-readable explanation
  - "null", "undefined", "None" rendered as text
```

### Step 5: Empty State & Placeholder Audit
```
Find UI surfaces with:
  - Empty states that say "Coming soon" or "Under construction"
  - Placeholder text that was never replaced
  - Dead-end pages with no call to action
  - Broken links or "404" text in navigation

For each: record file:line, current text, recommended action
```

### Step 6: Generate Terminology Health Map

## Output Format

```markdown
# UX Terminology Health Report

## Terminology Score: X.X / 10.0

## Summary
- Surfaces scanned: X files
- Banned term occurrences: X
- Consistency violations: X
- Internal jargon leaks: X
- Placeholder/empty states: X

## RED Violations (Must Fix Before Launch)
| # | Term | Found In | Line | Context | Replacement |
|---|------|----------|------|---------|-------------|
| 1 | "Crew" | crew-hub.html | 14 | "Manage Crew" | "Manage Team" |

## ORANGE Violations (Should Fix)
...

## Consistency Issues
| Canonical Term | Variants Found | Files Affected |
|----------------|---------------|----------------|
| "AI-Ops" | "AI Ops" (3), "AIops" (1) | dashboard.html, settings.html, ... |

## Empty States & Dead Ends
| # | Page | Current State | Recommended Action |
|---|------|--------------|-------------------|

## Fix Script (Auto-Generated)
These replacements can be applied with find-and-replace:
1. "Crew" → "Team" in: crew-hub.html, manifest.webmanifest, ...
2. "AI Employee Brain" → "Agent Intelligence" in: settings.html, ...
```

## Scoring
```
Composite score (0-10):
  Banned terms:      35% weight (0 = 10/10, each RED = -1.0)
  Consistency:       25% weight
  Jargon leaks:      20% weight
  Empty states:      10% weight
  Placeholder text:  10% weight
```
