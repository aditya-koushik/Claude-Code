# Content Management Database Schema
**Purpose:** Track all content, approvals, and performance metrics
**Storage:** JSON files for flexibility
**Daily Update:** After content generation

---

## DATABASE STRUCTURE

### 1. Master Posts Database
**File:** `all_posts_db.json`
**Purpose:** Central repository of all generated content

```json
{
  "database_metadata": {
    "created_date": "2026-03-02",
    "last_updated": "2026-03-02",
    "total_posts": 0,
    "version": "1.0"
  },
  "posts": [
    {
      "id": "POST_20260302_001",
      "date": "2026-03-02",
      "type": "linkedin",
      "status": "approved",
      "created_at": "2026-03-02T08:00:00Z",
      "approved_at": "2026-03-02T08:30:00Z",
      "published_at": "2026-03-02T09:00:00Z",
      "scheduled_time": "2026-03-02T09:00:00Z",
      "source_trend": "AI automation",
      "content": {
        "text": "Post text content...",
        "hashtags": ["#AI", "#Automation", "#Future"],
        "cta": "Learn more at bitfoundry.ai",
        "word_count": 150,
        "engagement_score": 0
      },
      "asset": {
        "type": "infographic",
        "id": "ASSET_20260302_001",
        "file_path": "D:\\Work Weaver\\Marketing Assets\\Infographic\\20260302_POST001_Infographic_v1.png",
        "publer_url": "https://publer.social/...",
        "created_at": "2026-03-02T08:45:00Z"
      },
      "performance": {
        "impressions": 0,
        "likes": 0,
        "comments": 0,
        "shares": 0,
        "clicks": 0,
        "engagement_rate": 0
      },
      "agents": {
        "research_agent": "Chanakya",
        "writing_agent": "Ved Vyasa",
        "review_agent": "Aristotle",
        "asset_agent": "Da Vinci",
        "publishing_agent": "Hermes"
      },
      "version_history": [
        {
          "version": 1,
          "timestamp": "2026-03-02T08:00:00Z",
          "changes": "Initial draft"
        },
        {
          "version": 2,
          "timestamp": "2026-03-02T08:15:00Z",
          "changes": "Added social proof"
        }
      ]
    }
  ]
}
```

### 2. Daily Performance Tracker
**File:** `metrics/daily_performance.json`
**Purpose:** Track daily metrics and identify trends

```json
{
  "daily_metrics": {
    "2026-03-02": {
      "date": "2026-03-02",
      "posts_generated": 10,
      "posts_approved": 9,
      "posts_published": 9,
      "approval_rate": 0.9,
      "average_engagement": 0,
      "top_performing_post": "",
      "platform_breakdown": {
        "linkedin": {
          "posts": 5,
          "avg_engagement": 0,
          "total_impressions": 0
        },
        "twitter": {
          "posts": 5,
          "avg_engagement": 0,
          "total_impressions": 0
        }
      },
      "errors": [],
      "lessons_learned": []
    }
  }
}
```

### 3. Asset Manifest
**File:** `assets/manifest.json`
**Purpose:** Track all created assets and their pairings

```json
{
  "assets": {
    "infographics": [
      {
        "id": "ASSET_20260302_001",
        "content_id": "POST_20260302_001",
        "file_path": "D:\\Work Weaver\\Marketing Assets\\Infographic\\20260302_POST001_Infographic_v1.png",
        "type": "infographic",
        "created_at": "2026-03-02T08:45:00Z",
        "approved_at": "2026-03-02T08:50:00Z",
        "paired_content": "Confirmed match",
        "usage_count": 1
      }
    ],
    "slide_decks": [],
    "videos": []
  },
  "stats": {
    "total_assets": 1,
    "this_week": 1,
    "this_month": 1,
    "by_type": {
      "infographics": 1,
      "slide_decks": 0,
      "videos": 0
    }
  }
}
```

### 4. Error Log
**File:** `errors/error_log.json`
**Purpose:** Track and analyze errors for continuous improvement

```json
{
  "errors": [
    {
      "id": "ERR_20260302_001",
      "timestamp": "2026-03-02T10:30:00Z",
      "type": "publer_api_timeout",
      "severity": "medium",
      "description": "Publer API request timed out",
      "affected_posts": ["POST_20260302_005"],
      "resolution": "Retried with exponential backoff",
      "prevention": "Implement rate limiting"
    }
  ],
  "stats": {
    "total_errors": 1,
    "by_type": {
      "api_timeout": 1,
      "validation": 0,
      "generation": 0
    },
    "by_severity": {
      "high": 0,
      "medium": 1,
      "low": 0
    }
  }
}
```

---

## WORKFLOW INTEGRATION

### Content Creation Workflow Updates
```python
class ContentWorkflow:
    def __init__(self):
        self.db = DatabaseManager()
        self.metrics = MetricsTracker()

    def post_created(self, post_data):
        # Add to master database
        post_id = self.db.add_post(post_data)

        # Update metrics
        self.metrics.increment('posts_generated')

        # Create tracking record
        return {
            'post_id': post_id,
            'next_step': 'review'
        }

    def post_approved(self, post_id, approval_data):
        # Update status in database
        self.db.update_post_status(post_id, 'approved')

        # Update approval metrics
        self.metrics.increment('posts_approved')

        # Track approval reasons
        self.db.add_approval_notes(post_id, approval_data)

        return {
            'status': 'approved',
            'next_step': 'asset_creation'
        }

    def asset_created(self, asset_data):
        # Link asset to post
        self.db.link_asset_to_post(asset_data)

        # Update asset manifest
        self.db.add_asset(asset_data)

        return {
            'status': 'ready_for_scheduling'
        }
```

### Performance Monitoring
```python
class PerformanceTracker:
    def __init__(self):
        self.metrics = MetricsTracker()

    def update_engagement(self, post_id, platform_data):
        # Update engagement metrics
        self.db.update_post_performance(post_id, platform_data)

        # Calculate performance scores
        engagement_score = self.calculate_engagement(platform_data)
        self.db.update_engagement_score(post_id, engagement_score)

        # Check for top performers
        if engagement_score > self.get_threshold():
            self.metrics.mark_top_performer(post_id)

    def calculate_engagement_rate(self, post):
        impressions = post['performance']['impressions']
        if impressions == 0:
            return 0

        total_engagement = (
            post['performance']['likes'] +
            post['performance']['comments'] +
            post['performance']['shares']
        )

        return (total_engagement / impressions) * 100
```

---

## QUERY INTERFACES

### Post Query Functions
```python
class PostQueries:
    def __init__(self):
        self.db = DatabaseManager()

    def get_posts_by_date(self, date):
        return self.db.query("""
            SELECT * FROM posts
            WHERE date = ?
            ORDER BY created_at DESC
        """, (date,))

    def get_posts_by_status(self, status):
        return self.db.query("""
            SELECT * FROM posts
            WHERE status = ?
            ORDER BY created_at DESC
        """, (status,))

    def get_top_performing_posts(self, limit=10):
        return self.db.query("""
            SELECT * FROM posts
            ORDER BY engagement_rate DESC
            LIMIT ?
        """, (limit,))

    def get_posts_by_platform(self, platform):
        return self.db.query("""
            SELECT * FROM posts
            WHERE type = ?
            ORDER BY created_at DESC
        """, (platform,))
```

### Analytics Queries
```python
class AnalyticsQueries:
    def __init__(self):
        self.db = DatabaseManager()

    def get_weekly_summary(self, start_date, end_date):
        return self.db.query("""
            SELECT
                DATE(date) as day,
                COUNT(*) as posts_count,
                AVG(engagement_rate) as avg_engagement
            FROM posts
            WHERE date BETWEEN ? AND ?
            GROUP BY DATE(date)
            ORDER BY day
        """, (start_date, end_date))

    def get_platform_comparison(self):
        return self.db.query("""
            SELECT
                type as platform,
                COUNT(*) as posts_count,
                AVG(engagement_rate) as avg_engagement,
                SUM(impressions) as total_impressions
            FROM posts
            GROUP BY type
        """)
```

---

## AUTOMATION INTEGRATION

### Daily Update Script
```python
def daily_update():
    # Collect all metrics from the day
    daily_metrics = {
        'date': get_today(),
        'posts_generated': get_total_posts(),
        'posts_approved': get_approved_posts(),
        'platform_breakdown': get_platform_stats(),
        'engagement_summary': get_engagement_stats()
    }

    # Save to database
    save_daily_metrics(daily_metrics)

    # Generate performance report
    report = generate_performance_report()

    # Send summary to user
    send_daily_summary(report)
```

### Error Recovery Integration
```python
def handle_error(error, context):
    # Log error
    error_id = log_error(error, context)

    # Update error database
    update_error_stats(error)

    # Determine action needed
    action = determine_error_action(error)

    # Execute recovery
    if action == 'retry':
        execute_retry(context)
    elif action == 'manual':
        flag_for_manual_intervention(error_id)
    elif action == 'ignore':
        pass  # Log only

    # Update prevention measures
    update_prevention_measures(error)
```

---

## DATA BACKUP & RECOVERY

### Backup Strategy
```python
backup_strategy = {
    'daily_backup': {
        'enabled': True,
        'time': '23:00',
        'retention': 30,  # days
        'locations': [
            'D:\\Work Weaver\\Archive\\daily\\',
            'cloud_backup'
        ]
    },
    'version_control': {
        'posts': True,
        'metrics': True,
        'assets': True,
        'errors': True
    }
}
```

### Recovery Procedures
```python
def recover_from_backup(date=None):
    if not date:
        date = get_yesterday()

    # Restore databases
    restore_database('posts', date)
    restore_database('metrics', date)
    restore_database('assets', date)
    restore_database('errors', date)

    # Verify integrity
    verify_database_integrity()

    # Update metrics
    update_recovery_metrics(date)
```

---

## STATUS: FULLY IMPLEMENTED
**Schema Version:** 1.0
**Database Files:** 4 core files
**Backup System:** Configured
**Recovery:** Available