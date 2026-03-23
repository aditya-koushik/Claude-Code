# Eval Criteria: content_factory

## Scoring Rubric

The content_factory is an orchestrator, not a content skill. Its eval measures orchestration quality, not content quality.

| # | Criterion | Weight | Description |
|---|-----------|--------|-------------|
| 1 | Agent Selection | 20% | Correct agents assigned to correct pipeline stages. Research agent for research, writing agent for writing, etc. No misrouting. |
| 2 | Pipeline Completeness | 20% | All required pipeline stages executed: Research → Write → Format → Review → Asset → Publish-draft. No skipped stages. |
| 3 | Parallelization | 15% | Independent stages run in parallel where possible (research + brainstorming, LinkedIn + Twitter formatting, review + asset). Sequential dependencies respected. |
| 4 | Dual Platform Output | 15% | Produces BOTH LinkedIn AND Twitter formatted versions for every content piece. Neither platform skipped. |
| 5 | Quality Gate Enforcement | 15% | Content passes through content_reviewer_factchecker. Posts scoring below 8.0 are not forwarded to publishing. Failed posts enter revision loop. |
| 6 | Draft-Only Publishing | 15% | All output saved as DRAFTS. Zero auto-publish actions. Chairman approval required flag set. |

**Total: 100%**

## Scoring Scale
- 0-2: Pipeline broken or critical stages skipped
- 3-4: Pipeline runs but with significant orchestration errors
- 5-6: Pipeline completes but with missed parallelization or routing issues
- 7-8: Clean pipeline run with minor inefficiencies
- 9-10: Optimal orchestration, all stages correct, maximized parallelism

## Pass Threshold
**Composite score >= 8.0/10**

## Automatic Fail Conditions
- Any content auto-published (not saved as draft) = automatic fail
- Quality gate skipped entirely = automatic fail
- Content published without visual asset = automatic fail
- Only one platform output (LinkedIn without Twitter or vice versa) = automatic fail
- Research stage skipped before writing = automatic fail
