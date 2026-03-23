---
name: dependency_health_scanner
description: >
  Audits dependency health: outdated packages, known vulnerabilities, license
  compatibility, unused dependencies, and version pinning quality. Covers both
  Python (pip) and Node (npm) ecosystems. Focuses on quality and maintenance risk.
user-invocable: true
version: 1.0.0
author: Bit Foundry AI
depends_on: []
feeds_into: []
parallel_with: [documentation_accuracy_checker]
allowed-tools:
  - Bash
  - Read
  - Grep
  - Glob
  - Write
---

# Dependency Health Scanner

## Purpose
Dependencies are inherited risk. An unmaintained package, a license incompatibility, or a known vulnerability in a transitive dependency can block a launch or create legal liability. This skill audits the full dependency tree for health, maintenance, and compatibility — focusing on quality risk, not just security.

## When to Use
- Pre-launch dependency audit
- Before major version upgrades
- When adding new dependencies
- When evaluating build-vs-buy for a feature

## Workflow

### Step 1: Inventory Dependencies
```
Parse all dependency declarations:

Python:
  - requirements.txt (full)
  - requirements.runtime.txt (production)
  - pyproject.toml (if exists)
  - setup.py/setup.cfg (if exists)

Node:
  - package.json (root and per-app)
  - package-lock.json / yarn.lock

For each: name, declared version, pinning strategy (exact, range, latest)
```

### Step 2: Version Pinning Audit
```
Classify pinning strategy for each dependency:

EXACT_PIN:     package==1.2.3 (reproducible, may miss patches)
RANGE_PIN:     package>=1.2,<2.0 (flexible, may break)
MINIMUM_ONLY:  package>=1.2 (dangerous — can pull breaking changes)
UNPINNED:      package (most dangerous — any version)
HASH_PIN:      package==1.2.3 --hash=sha256:... (most secure)

Flag UNPINNED for any production dependency
Flag MINIMUM_ONLY for critical dependencies (auth, crypto, DB)
```

### Step 3: Maintenance Health Check
```
For each dependency, assess maintenance status:
  - Last release date (via PyPI/npm API if available, or README check)
  - Is the project archived/deprecated?
  - Does it have active maintainers?
  - Is there a successor/replacement?

Flag UNMAINTAINED if no release in >12 months
Flag DEPRECATED if marked deprecated on PyPI/npm
Flag SINGLE_MAINTAINER if bus-factor risk is high (critical deps only)
```

### Step 4: License Compatibility Audit
```
For each dependency:
  - What license does it use?
  - Is it compatible with Workweaver's license (commercial SaaS)?

Compatibility matrix:
  MIT, BSD, Apache-2.0, ISC → COMPATIBLE
  LGPL → COMPATIBLE (if dynamically linked)
  GPL, AGPL → INCOMPATIBLE (viral license, cannot use in SaaS)
  Custom/Proprietary → REVIEW NEEDED
  No license → INCOMPATIBLE (all rights reserved by default)

Flag GPL_RISK if any dependency uses GPL/AGPL
Flag NO_LICENSE if dependency has no declared license
```

### Step 5: Unused Dependency Detection
```
Cross-reference declared dependencies with actual imports:
  - Parse all import statements in the codebase
  - Compare against declared dependencies
  - Flag UNUSED if declared but never imported
  - Flag SHADOW if imported but not declared (works via transitive dep)

Shadow dependencies are risky — they break when the parent dep removes them.
```

### Step 6: Known Vulnerability Scan
```
If pip-audit or npm audit is available:
  - Run against current lockfile
  - Report CVE ID, severity, affected version, fix version

If tools not available:
  - Parse requirements.txt for known-bad versions
  - Cross-reference major packages against known CVEs
  - Flag any package with known critical vulnerabilities

Focus on:
  - Auth-related packages (cryptography, pyjwt, python-jose)
  - Web frameworks (fastapi, uvicorn, starlette)
  - Database drivers (asyncpg, psycopg)
  - HTTP clients (httpx, requests, aiohttp)
```

## Output Format

```markdown
# Dependency Health Report

## Dependency Health Score: X.X / 10.0

## Summary
- Python dependencies: X
- Node dependencies: X
- Unpinned: X
- Unmaintained: X
- License issues: X
- Unused: X
- Known vulnerabilities: X

## Version Pinning
| Strategy | Python Count | Node Count | Risk |
|----------|-------------|------------|------|
| Exact | X | X | Low |
| Range | X | X | Medium |
| Minimum-only | X | X | High |
| Unpinned | X | X | Critical |

## License Issues
| # | Package | License | Compatibility | Risk |
|---|---------|---------|--------------|------|

## Maintenance Concerns
| # | Package | Last Release | Status | Risk |
|---|---------|-------------|--------|------|

## Unused Dependencies
| # | Package | Declared In | Never Imported |
|---|---------|-------------|----------------|

## Known Vulnerabilities
| # | Package | CVE | Severity | Fix Available |
|---|---------|-----|----------|---------------|

## Recommendations
1. ...
```
