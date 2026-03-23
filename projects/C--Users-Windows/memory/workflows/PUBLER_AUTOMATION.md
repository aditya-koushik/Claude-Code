# Publer Automation System
**Purpose:** Cross-platform social media publishing
**Agent:** Hermes (Publishing Agent)
**Platforms:** LinkedIn & Twitter
**Daily Target:** 10 posts (5 each)

---

## PUBLER INTEGRATION PROTOCOL

### API Configuration
```python
publer_config = {
    'api_key': 'ENCRYPTED_KEY_HERE',
    'base_url': 'https://api.publer.social/v2',
    'timeout': 30,
    'max_retries': 3,
    'draft_only': True  # CRITICAL: Never auto-publish
}
```

### Authentication Setup
```python
def authenticate_publer():
    credentials = load_credentials()

    # Check API key validity
    validation = api_validate_key(credentials)

    if validation['status'] == 'valid':
        return {
            'authenticated': True,
            'user_id': validation['user_id'],
            'platforms': validation['platforms'],
            'rate_limits': validation['rate_limits']
        }
    else:
        raise Exception("Publer API authentication failed")
```

---

## POST SCHEDULING PROTOCOL

### Optimal Posting Times
```python
# User timezone: EST (Assumed)
posting_times = {
    'linkedin': [
        '09:00',    # Morning commute
        '11:00',    # Mid-morning slump
        '14:00',    # Afternoon
        '16:00',    # Pre-evening
        '18:00'     # Evening
    ],
    'twitter': [
        '12:00',    # Lunchtime
        '13:00',    # Post-lunch
        '15:00',    # Afternoon
        '19:00',    # Evening
        '21:00'     # Night
    ]
}
```

### Scheduling Logic
```python
def schedule_post(content, platform, posting_time):
    # Validate content
    if not validate_content(content):
        raise Exception("Content validation failed")

    # Get optimal time
    optimal_time = get_next_available_slot(platform, posting_time)

    # Create post data
    post_data = {
        'platform': platform,
        'content': content['text'],
        'media': content['asset'],
        'schedule_time': optimal_time,
        'draft': True,  # CRITICAL: Draft only
        'hashtag_research': content['hashtags'],
        'cta': content['cta'],
        'tracking_pixel': generate_tracking_pixel()
    }

    # Schedule via API
    result = publer_schedule_post(post_data)

    return {
        'post_id': result['id'],
        'scheduled_time': result['schedule_time'],
        'status': 'draft',
        'review_url': generate_review_url(result['id'])
    }
```

---

## ASSET PAIRING SYSTEM

### Asset Matching Protocol
```python
class AssetMatcher:
    def __init__(self):
        self.manifest = load_asset_manifest()

    def match_content_asset(self, content_id):
        # Find content in manifest
        content_entry = self.manifest.find(content_id)

        if not content_entry:
            raise Exception(f"Content {content_id} not found in manifest")

        # Verify asset exists
        if not self.verify_asset_exists(content_entry['asset']):
            raise Exception(f"Asset {content_entry['asset']} not found")

        return {
            'content': content_entry['content'],
            'asset': content_entry['asset'],
            'asset_type': content_entry['asset_type'],
            'verified': True
        }
```

### Quality Assurance Before Scheduling
```python
def pre_publish_checks(content_asset_pair):
    checks = {
        'content_length': validate_length(content_asset_pair['content']),
        'asset_format': validate_asset_format(content_asset_pair['asset']),
        'platform_requirements': validate_platform_requirements(
            content_asset_pair['content'],
            content_asset_pair['asset']
        ),
        'hashtag_count': validate_hashtag_count(content_asset_pair['content'])
    }

    if not all(checks.values()):
        raise Exception(f"Pre-publish checks failed: {checks}")

    return True
```

---

## DAILY PUBLISHING WORKFLOW

### Morning Publishing (9:00 AM)
```python
def morning_publishing():
    # Get approved content
    approved_content = get_approved_content()

    # Schedule LinkedIn posts
    linkedin_posts = []
    for content in approved_content[:5]:  # First 5 for LinkedIn
        post = schedule_post(
            content,
            'linkedin',
            posting_times['linkedin'][0]
        )
        linkedin_posts.append(post)

    # Return scheduling manifest
    return {
        'linkedin_posts': linkedin_posts,
        'status': 'scheduled',
        'review_window': '30_minutes'
    }
```

### Afternoon Publishing (2:00 PM)
```python
def afternoon_publishing():
    # Check user feedback
    feedback = check_user_feedback()

    if feedback['changes_required']:
        # Requeue with modifications
        updated_content = apply_changes(feedback)
        return reschedule_posts(updated_content)
    else:
        # Schedule remaining posts
        return schedule_remaining_posts()
```

### Evening Finalization (7:00 PM)
```python
def evening_finalization():
    # Review all scheduled posts
    scheduled_posts = get_all_scheduled_posts()

    # Verify everything is correct
    verification_results = []
    for post in scheduled_posts:
        result = verify_post(post)
        verification_results.append(result)

    # Create summary report
    return {
        'total_scheduled': len(scheduled_posts),
        'verified_count': sum(1 for r in verification_results if r['verified']),
        'issues_found': [r for r in verification_results if not r['verified']],
        'next_day_prepared': True
    }
```

---

## REVIEW PROTOCOLS

### 30-Minute Review Window
```python
def manage_review_window():
    # Calculate review end time
    review_end_time = datetime.now() + timedelta(minutes=30)

    # Monitor for user feedback
    while datetime.now() < review_end_time:
        feedback = check_for_user_feedback()

        if feedback:
            if feedback['approval']:
                return finalize_posts(feedback['approved'])
            elif feedback['changes']:
                return apply_changes(feedback)
            elif feedback['cancel']:
                return cancel_posts(feedback['cancelled'])

    # Auto-approve if no feedback (fallback)
    return auto_approve_posts()
```

### User Communication
```python
def notify_user_ready_for_review():
    return {
        'notification': 'READY_FOR_REVIEW',
        'message': 'Your posts are ready for 30-minute review',
        'publer_url': 'https://publer.social/dashboard/scheduled',
        'deadline': datetime.now() + timedelta(minutes=30),
        'post_count': get_scheduled_post_count()
    }
```

---

## ERROR HANDLING

### Common Errors & Solutions
```python
error_responses = {
    'rate_limit': {
        'action': 'wait_and_retry',
        'delay': calculate_backoff(),
        'message': 'Publer rate limit reached, retrying...'
    },
    'authentication_failed': {
        'action': 're_authenticate',
        'message': 'Re-authenticating Publer API...'
    },
    'asset_not_found': {
        'action': 'alert_user',
        'message': 'Asset missing, please upload manually'
    },
    'content_rejected': {
        'action': 'rework_content',
        'message': 'Content violates platform guidelines'
    }
}
```

### Recovery Procedures
1. **Immediate Actions**
   - Log error to error tracking
   - Notify user of issue
   - Attempt automatic recovery

2. **Manual Intervention Points**
   - Asset upload failures
   - Content guideline violations
   - API authentication issues

3. **Follow-up Tasks**
   - Update protocol based on error patterns
   - Train improved responses
   - Document for future reference

---

## PERFORMANCE TRACKING

### Publishing Metrics
```python
class PublishingMetrics:
    def __init__(self):
        self.metrics = {
            'posts_scheduled': 0,
            'posts_published': 0,
            'user_approvals': 0,
            'user_rejections': 0,
            'errors': 0,
            'average_scheduling_time': 0
        }

    def update_metrics(self, event, data):
        self.metrics[event] += 1
        # Calculate averages and trends

    def get_performance_report(self):
        return {
            'success_rate': (self.metrics['posts_published'] /
                          self.metrics['posts_scheduled']) * 100,
            'user_satisfaction': (self.metrics['user_approvals'] /
                                 (self.metrics['user_approvals'] +
                                  self.metrics['user_rejections'])) * 100,
            'error_rate': (self.metrics['errors'] /
                          self.metrics['posts_scheduled']) * 100
        }
```

---

## AUTONOMOUS EXECUTION CHECKLIST

### Before Scheduling
- [ ] Publer API authenticated
- [ ] Content approved by Aristotle
- [ ] Assets created and verified
- [ ] Asset manifest updated
- [ ] User notification prepared

### During Scheduling
- [ ] Optimal times calculated
- [ ] Platform requirements met
- [ ] Draft status confirmed
- [ ] Review window started

### After Scheduling
- [ ] Review window managed
- [ ] User feedback processed
- [ ] Posts finalized if approved
- [ ] Performance metrics updated

---

## STATUS: CONFIGURED AND READY
**Last Updated:** 2026-03-02
**Safety Feature:** Draft-only publishing (CRITICAL)
**Review Window:** 30 minutes always
**Automation Level:** Full scheduling with manual review