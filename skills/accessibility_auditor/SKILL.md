---
name: accessibility_auditor
description: >
  WCAG 2.1 compliance auditor for web applications. Analyzes HTML templates, CSS,
  JavaScript for accessibility violations. Checks ARIA attributes, color contrast,
  keyboard navigation, screen reader compatibility, and semantic HTML structure.
  Code-level analysis (no browser required) plus browser-assisted testing when available.
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: []
feeds_into: []
parallel_with: [ux_terminology_scanner, design-review]
allowed-tools:
  - Bash
  - Read
  - Grep
  - Glob
  - Write
---

# Accessibility Auditor

## Purpose
Systematic WCAG 2.1 AA compliance audit. Combines static code analysis (HTML templates, CSS, JS) with optional browser-assisted testing via Playwright. Produces a scored report with specific file:line references for every violation.

## When to Use
- Pre-launch accessibility audit
- After major UI changes
- When enterprise customers require WCAG compliance documentation
- Paired with /design-review for comprehensive visual + accessibility QA

## Workflow

### Step 1: Discover UI Surfaces
```
Scan for all HTML/template files:
  - apps/landing/public/**/*.html
  - apps/dashboard/**/*.html
  - apps/backend/templates/**/*.html (if any)
  - **/*.htm, **/*.hbs, **/*.jinja2

Build inventory: {file, page_name, route (if determinable)}
```

### Step 2: Semantic HTML Audit (WCAG 1.3.1)
```
For each HTML file:
  - Check document has <html lang="..."> attribute
  - Check heading hierarchy (h1 → h2 → h3, no skips)
  - Check all <img> tags have alt attributes
  - Check <table> elements have <caption> or aria-label
  - Check <form> inputs have associated <label> or aria-label
  - Check landmark regions (<nav>, <main>, <header>, <footer>) are present
  - Check lists use <ul>/<ol>/<dl> (not styled divs)

Severity:
  RED: Missing alt text on functional images, missing form labels
  ORANGE: Heading hierarchy violations, missing landmarks
  YELLOW: Missing lang attribute, decorative images without alt=""
```

### Step 3: ARIA Audit (WCAG 4.1.2)
```
For each interactive element:
  - Buttons: have accessible name (text content or aria-label)
  - Links: have descriptive text (not "click here" or "read more")
  - Custom widgets: have appropriate role, state, and property attributes
  - aria-hidden="true" not used on focusable elements
  - aria-expanded, aria-selected properly toggled
  - No redundant ARIA (e.g., role="button" on <button>)

Flag ARIA_MISUSE if roles/states don't match expected patterns
```

### Step 4: Keyboard Navigation Audit (WCAG 2.1.1)
```
Static analysis:
  - Check tabindex values (negative tabindex hides from tab order)
  - Check onclick handlers on non-interactive elements without role/tabindex
  - Check for keyboard event handlers (onkeydown/onkeypress) alongside mouse handlers
  - Check modal/dialog elements have focus trapping
  - Check skip navigation links exist

Flag NO_KEYBOARD if interactive elements are mouse-only
```

### Step 5: Color & Contrast Audit (WCAG 1.4.3)
```
Analyze CSS files for:
  - Text color + background color pairs
  - Calculate contrast ratio (target: 4.5:1 for normal text, 3:1 for large text)
  - Check for color-only information indicators (e.g., red = error without icon/text)
  - Check focus indicators are visible (outline not removed without replacement)

Note: This is approximate from static CSS. Browser testing provides more accurate results.
```

### Step 6: Dynamic Content Audit (WCAG 4.1.3)
```
Scan JavaScript for:
  - Dynamic content updates without aria-live regions
  - Alert/notification patterns without role="alert"
  - SPA route changes without focus management
  - Loading states without aria-busy or screen reader announcements
  - Toast/snackbar components without accessible announcements
```

### Step 7: Browser-Assisted Testing (Optional)
```
If /browse skill is available and app is running:
  - Run axe-core via Playwright for automated WCAG scanning
  - Tab through all pages to verify keyboard navigation
  - Check focus visibility on every interactive element
  - Verify screen reader announcement order
```

## Output Format

```markdown
# Accessibility Audit Report (WCAG 2.1 AA)

## Accessibility Score: X.X / 10.0

## Summary
- Pages audited: X
- Total violations: X
- Critical (A): X
- Serious (AA): X
- Minor: X

## Violations by Category
| Category | Count | Worst Severity |
|----------|-------|----------------|
| Images & alt text | X | RED |
| Form labels | X | RED |
| Heading hierarchy | X | ORANGE |
| Keyboard access | X | RED |
| ARIA usage | X | ORANGE |
| Color contrast | X | YELLOW |
| Dynamic content | X | YELLOW |

## RED Violations (WCAG Level A — Must Fix)
| # | Rule | Element | File:Line | WCAG Criterion |
|---|------|---------|-----------|----------------|

## ORANGE Violations (WCAG Level AA — Should Fix)
...

## Recommendations
1. ...
```

## Scoring
```
Composite score (0-10):
  Semantic HTML:    20% weight
  Form accessibility: 20% weight
  Keyboard access:  20% weight
  ARIA correctness: 15% weight
  Color contrast:   15% weight
  Dynamic content:  10% weight
```
