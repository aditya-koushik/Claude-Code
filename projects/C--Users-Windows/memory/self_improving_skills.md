---
name: self-improving-skills
description: Self-improving skills system with Skills 2.0 upgrade. Closed-loop Observe-Inspect-Amend-Evaluate cycle with eval fixtures, composability metadata, and Tier 3 references.
type: project
---

Self-improving skills loop implemented on 2026-03-16, upgraded to Skills 2.0 on 2026-03-17.

**Why:** Static SKILL.md files degrade as models, tasks, and audience preferences change. Without execution tracking AND automated evaluation, failures are invisible and amendments can't be validated.

**How to apply:** After every pipeline run, log execution data. Weekly inspection identifies underperforming skills. Amendments proposed with evidence, evaluated against eval fixtures BEFORE chairman approval, then verified 7 days post-amendment.

## Skills 2.0 Upgrade (2026-03-17)

### Eval Fixtures (Priority 1)
10 skills now have `evals/` directories with test inputs, expected output characteristics, and scoring rubrics:
- hormozi_content_writer, content_reviewer_factchecker, content_formatter_linkedin, content_formatter_twitter, content_factory (core 5)
- copy_editor, ai_writing_humanizer, sidebringers_explainer, web_search_agent, source_matrix (support 5)
- Each skill has: eval_criteria.md, test_01_input.md, test_01_expected.md, test_02_input.md, test_02_expected.md
- Total: 50 eval fixture files

### Skill Evaluator (Priority 2)
- NEW skill: `skill_evaluator` — automated before/after comparison using eval fixtures
- skill_amender updated with Step 6: auto-invoke evaluator before submitting proposals
- skill_inspector updated with eval fixture coverage tracking
- Eval log: `D:\Work Weaver\Content\skill-eval-log.jsonl`
- Decision types: ACCEPT, ACCEPT_WITH_CAVEAT, REJECT, SKIP
- Loop is now CLOSED: Observe → Inspect → Amend → Evaluate → back to Observe

### Composability Metadata (Priority 3)
- All 55 skills now have structured frontmatter: `depends_on`, `feeds_into`, `parallel_with`
- Enables dependency graph traversal without reading full SKILL.md content
- Pipeline chains documented in structured YAML, not just prose

### Tier 3 References (Priority 4)
- 8 key skills have `references/` directories with templates, examples, and guides (pending P4 agent completion)

## Components
- `skill_execution_observer` (Observe): Logs to `D:\Work Weaver\Content\skill-execution-log.jsonl`
- `skill_inspector` (Inspect): Analyzes patterns + eval fixture coverage
- `skill_amender` (Amend): Proposes changes, auto-invokes evaluator
- `skill_evaluator` (Evaluate): Compares baseline vs candidate using eval fixtures

## Agent Assignments
- Krishna: skill_execution_observer, skill_amender, skill_evaluator (orchestrates full loop)
- Nakula: skill_inspector (quality analysis feeds inspection)
- Yudhishthira: skill_inspector, skill_execution_observer (weekly morning brief includes skill health + eval coverage)

## Rule File
`D:\Work Weaver\.claude\rules\skill-self-improvement.md` (global scope, loaded for all operations)
