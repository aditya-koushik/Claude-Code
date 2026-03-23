# Skill Evaluation Log Schema

Log file: `D:\Work Weaver\Content\skill-eval-log.jsonl`

Each line is a JSON object representing one evaluation run.

## Schema

```json
{
  "eval_id": "eval-YYYYMMDD-NNN",
  "timestamp": "2026-03-17T14:00:00Z",
  "skill_name": "hormozi_content_writer",
  "amendment_id": "amend-20260317-001",
  "trigger": "amender_auto | user_request | post_amendment_verify | batch_audit",
  "test_inputs_used": 2,
  "baseline_scores": {
    "criterion_1": 8.5,
    "criterion_2": 7.0
  },
  "candidate_scores": {
    "criterion_1": 9.0,
    "criterion_2": 7.5
  },
  "baseline_composite": 7.95,
  "candidate_composite": 8.40,
  "delta": 0.45,
  "per_criterion_deltas": {
    "criterion_1": 0.5,
    "criterion_2": 0.5
  },
  "regressions": [],
  "automatic_fail_triggers": {
    "baseline": [],
    "candidate": []
  },
  "decision": "ACCEPT",
  "caveats": [],
  "reasoning": "Candidate improves all criteria. No regressions. Composite increases by 0.45 points.",
  "re_eval_attempt": 1,
  "duration_seconds": 30
}
```

## Field Definitions

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| eval_id | string | yes | Unique ID: `eval-YYYYMMDD-NNN` |
| timestamp | string | yes | ISO 8601 timestamp |
| skill_name | string | yes | Directory name of the skill evaluated |
| amendment_id | string | no | Linked amendment ID (null for audits) |
| trigger | string | yes | What initiated this evaluation |
| test_inputs_used | int | yes | Number of test inputs evaluated |
| baseline_scores | object | yes | Per-criterion scores for current SKILL.md |
| candidate_scores | object | yes* | Per-criterion scores for proposed SKILL.md (* null for audits) |
| baseline_composite | float | yes | Weighted composite of baseline scores |
| candidate_composite | float | no | Weighted composite of candidate scores |
| delta | float | no | candidate_composite - baseline_composite |
| per_criterion_deltas | object | no | Per-criterion score differences |
| regressions | array | yes | Criteria where candidate < baseline |
| automatic_fail_triggers | object | yes | Fail conditions triggered by each version |
| decision | string | yes | ACCEPT, ACCEPT_WITH_CAVEAT, REJECT, or SKIP |
| caveats | array | yes | List of concerns (empty if clean ACCEPT) |
| reasoning | string | yes | Human-readable explanation of decision |
| re_eval_attempt | int | yes | Which attempt this is (1, 2, or 3) |
| duration_seconds | int | no | How long the evaluation took |

## Decision Values

| Value | Meaning |
|-------|---------|
| `ACCEPT` | Candidate improves or maintains all criteria |
| `ACCEPT_WITH_CAVEAT` | Candidate improves overall but regresses on 1+ criteria by >1.0 |
| `REJECT` | Candidate scores lower overall or triggers new automatic fail |
| `SKIP` | No eval fixtures available for this skill |

## Trigger Values

| Value | Meaning |
|-------|---------|
| `amender_auto` | Automatically invoked by skill_amender before proposing |
| `user_request` | User manually requested evaluation |
| `post_amendment_verify` | 7-day post-amendment verification check |
| `batch_audit` | Part of a batch evaluation of all skills |

## Example Entries

### Successful Amendment Evaluation
```json
{"eval_id":"eval-20260317-001","timestamp":"2026-03-17T14:00:00Z","skill_name":"triad_writer","amendment_id":"amend-20260317-001","trigger":"amender_auto","test_inputs_used":2,"baseline_scores":{"hook_quality":7.0,"structure_adherence":8.0,"voice_consistency":7.5,"output_completeness":8.5,"constraint_compliance":9.0},"candidate_scores":{"hook_quality":8.5,"structure_adherence":8.0,"voice_consistency":8.0,"output_completeness":8.5,"constraint_compliance":9.0},"baseline_composite":7.85,"candidate_composite":8.35,"delta":0.50,"per_criterion_deltas":{"hook_quality":1.5,"structure_adherence":0.0,"voice_consistency":0.5,"output_completeness":0.0,"constraint_compliance":0.0},"regressions":[],"automatic_fail_triggers":{"baseline":[],"candidate":[]},"decision":"ACCEPT","caveats":[],"reasoning":"Amendment improves hook quality by 1.5 points and voice consistency by 0.5. No regressions. Composite moves from 7.85 to 8.35, crossing the 8.0 threshold.","re_eval_attempt":1,"duration_seconds":25}
```

### Rejected Amendment
```json
{"eval_id":"eval-20260317-002","timestamp":"2026-03-17T15:00:00Z","skill_name":"content_formatter_linkedin","amendment_id":"amend-20260317-002","trigger":"amender_auto","test_inputs_used":2,"baseline_scores":{"format_compliance":9.0,"hashtag_accuracy":8.0,"hook_placement":8.5,"length_compliance":8.0,"readability":7.5},"candidate_scores":{"format_compliance":7.0,"hashtag_accuracy":8.5,"hook_placement":9.0,"length_compliance":6.5,"readability":8.0},"baseline_composite":8.25,"candidate_composite":7.70,"delta":-0.55,"per_criterion_deltas":{"format_compliance":-2.0,"hashtag_accuracy":0.5,"hook_placement":0.5,"length_compliance":-1.5,"readability":0.5},"regressions":["format_compliance","length_compliance"],"automatic_fail_triggers":{"baseline":[],"candidate":[]},"decision":"REJECT","caveats":[],"reasoning":"Candidate regresses on format_compliance (-2.0) and length_compliance (-1.5). Overall composite drops below 8.0 threshold. Amendment needs revision to maintain formatting discipline while improving hooks.","re_eval_attempt":1,"duration_seconds":28}
```

## Storage

- **Location:** `D:\Work Weaver\Content\skill-eval-log.jsonl`
- **Format:** JSONL (one JSON object per line)
- **Retention:** Indefinite (needed for trend analysis)
- **Read by:** skill_inspector (trend analysis), Yudhishthira (morning brief), skill_amender (re-eval tracking)
