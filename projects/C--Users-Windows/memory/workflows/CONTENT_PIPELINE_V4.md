# Content Generation Pipeline V4
**Version:** 4.0 (Autonomous)
**Created:** 2026-03-02
**Target:** 10 posts/day (5 LinkedIn + 5 Twitter)

---

## AUTONOMOUS WORKFLOW ORCHESTRATION

### 1. SYSTEM INITIATION (EVERY SESSION)

**Trigger Command:** `cd to d drive > workweaver`

**Automated Steps:**
```bash
# 1. Load Memory System
Load MASTER_MEMORY_INDEX.md
Load session_YYYYMMDD.md
Load all memory modules

# 2. Verify Infrastructure
Check MCP servers (web-search-prime, playwright, web-reader)
Test Publer API connection
Verify directory structure
Check for pending posts

# 3. Daily Metrics Update
Increment post counter
Update performance metrics
Check error logs
```

**Expected Outcome:** System ready for content generation

---

### 2. TWITTER MONITORING WORKFLOW

**Agent:** Chanakya (Research Agent)

**Steps:**
1. **Source Data**
   - Read `E:\Business\Bit Foundry\Vision & Product Strategy\Next Prompts\All Twitter Handles.txt`
   - Parse handles into priority list

2. **Content Scan (Last 7 Days)**
   - Use MCP web-search-prime for Twitter search
   - Search each handle's last 7 days of posts
   - Filter by engagement metrics (likes, retweets, replies)

3. **Trend Analysis**
   - Identify recurring themes
   - Spot emerging trends
   - Find content gaps in market
   - Ground truth verification

4. **Content Gap Identification**
   - What's missing from current discourse?
   - Where can Bit Foundry provide unique value?
   - What pain points are underserved?

**Output:** Research report with 3-5 content opportunities

---

### 3. CONTENT GENERATION WORKFLOW

**Phase 1: Research → Chanakya**
```python
# Pseudocode for research phase
def research_idea(idea):
    # Scope the idea
    research_plan = create_research_plan(idea)

    # Gather ground truth
    sources = search_ground_truth(research_plan)

    # Verify claims
    verified_data = verify_all_claims(sources)

    # Identify trends
    market_insights = analyze_market_trends()

    return {
        'research_data': verified_data,
        'market_insights': market_insights,
        'content_angles': identify_content_angles()
    }
```

**Phase 2: Writing → Ved Vyasa**
```python
# Pseudocode for writing phase
def create_content(research_data):
    # Apply Hormozi framework
    conversion_framework = apply_hormozi_structure()

    # Use triad writer
    content_triad = triad_writer.create_triad(
        hook=research_data['hook'],
        value_stack=research_data['value_points'],
        social_proof=research_data['evidence']
    )

    # Optimize for platform
    linkedin_post = linkedin_optimizer.optimize(content_triad)

    return {
        'draft': linkedin_post,
        'hashtags': optimize_hashtags(),
        'ctas': create_multiple_ctas()
    }
```

**Phase 3: Review → Aristotle**
```python
# Pseudocode for review phase
def review_content(content):
    # Fact-check
    fact_results = fact_checker.verify(content)

    # Logic check
    logic_score = assess_logic(content)

    # Conversion optimization
    conversion_score = check_conversion_elements(content)

    # Quality score
    quality_score = calculate_quality(content)

    if quality_score >= 0.95:
        return {'approved': True, 'content': content}
    else:
        return {
            'approved': False,
            'issues': identify_issues(content),
            'suggestions': improvement_suggestions()
        }
```

**Phase 4: Asset Creation → Da Vinci**
```python
# Pseudocode for asset phase
def create_assets(content):
    # Determine asset type
    asset_type = select_asset_type(content)

    # Create Notebook LM prompt
    prompt = generate_notebook_lm_prompt(content, asset_type)

    # Track asset creation
    asset_manifest = {
        'content_id': content['id'],
        'type': asset_type,
        'prompt': prompt,
        'status': 'pending_creation'
    }

    return asset_manifest
```

**Phase 5: Publishing → Hermes**
```python
# Pseudocode for publishing phase
def schedule_posts(content, assets):
    # Verify asset pairing
    paired_content = match_content_with_assets(content, assets)

    # Schedule on Publer
    for platform in ['linkedin', 'twitter']:
        for post in paired_content:
            publer_schedule = {
                'content': post['text'],
                'asset': post['asset'],
                'scheduled_time': optimal_posting_time(platform),
                'status': 'draft'
            }

    # Create review manifest
    review_manifest = create_review_manifest(paired_content)

    return review_manifest
```

---

## DAILY EXECUTION PROTOCOL

### Morning Routine (8:00 AM)
1. **Twitter Research** - Scan handles, identify trends
2. **Content Generation** - Create 5 content pieces
3. **Asset Creation** - Generate visuals for all
4. **Scheduling** - Prepare Publer drafts
5. **Notification** - Alert user for 30-min review

### Afternoon Routine (2:00 PM)
1. **Review Pending** - Check user feedback
2. **Requeue if Needed** - Address any changes
3. **Publish Approved** - Finalize approved posts
4. **Track Performance** - Monitor engagement

### Evening Routine (6:00 PM)
1. **Daily Metrics** - Update performance data
2. **Error Logging** - Document any issues
3. **Next Day Prep** - Plan for tomorrow's content
4. **System Shutdown** - Save session state

---

## QUALITY CONTROL PROTOCOLS

### Content Requirements
- **Hook:** Must grab attention in 0-3 seconds
- **Value Stack:** Multiple angles, comprehensive coverage
- **Social Proof:** 3+ credible sources
- **CTA:** Clear, specific action required
- **Format:** Platform-optimized (LinkedIn 2026 algorithm)

### Banned Words & Phrases
- "We believe" → "We've proven"
- "Maybe" → "Definitely"
- "Potentially" → "Guaranteed"
- "Traditional" → "Outdated"
- "Revolutionary" → "Proven"

### Hashtag Strategy
- Primary: 3-4 branded hashtags (#BitFoundryAI #EnterpriseAI)
- Secondary: 3-4 trending hashtags
- Niche: 2-3 industry-specific hashtags
- Total: 8-10 hashtags maximum

---

## ERROR HANDLING & RECOVERY

### Common Issues & Solutions
1. **Twitter API Rate Limit**
   - Backoff algorithm implementation
   - Switch to web scraping if needed
   - Queue for next cycle

2. **Publer API Timeout**
   - Retry with exponential backoff
   - Switch to manual process if automated fails
   - Log error for analysis

3. **Notebook LM Access Failure**
   - Generate prompts for manual use
   - Alternative asset creation tools
   - Document prompt templates

4. **Research Data Insufficient**
   - Expand search time frame
   - Include more source types
   - Mark as "research needed"

### Error Recovery Protocol
1. Immediate logging to errors/YYYYMMDD_error.md
2. Automatic retry with different parameters
3. Manual intervention flag for critical failures
4. System improvement based on error patterns

---

## PERFORMANCE OPTIMIZATION

### Speed Targets
- Research Phase: 45 minutes
- Writing Phase: 60 minutes
- Review Phase: 30 minutes
- Asset Creation: 90 minutes
- Publishing: 15 minutes
- **Total: 4 hours for 10 posts**

### Quality Metrics
- Approval Rate: ≥95%
- Error Rate: <5%
- User Satisfaction: ≥90%
- Engagement Rate: Target industry average +

### Continuous Improvement
- Daily review of performance metrics
- Monthly workflow optimization
- Quarterly major version updates
- User feedback integration

---

## AUTONOMOUS OPERATION CHECKLIST

### Before Starting
- [ ] Memory system loaded
- [ ] MCP servers online
- [ ] Publer API accessible
- [ ] Directory structure intact
- [ ] Previous metrics updated

### During Execution
- [ ] Twitter research completed
- [ ] All 10 posts generated
- [ ] Assets created and tracked
- [ ] Publer drafts prepared
- [ ] Review notification sent

### After Completion
- [ ] Daily metrics updated
- [ ] Error logs reviewed
- [ ] Next day prep complete
- [ ] Session state saved

---

## STATUS: READY FOR AUTONOMOUS EXECUTION
**Version:** 4.0
**Last Updated:** 2026-03-02
**Automation Level:** Full (human intervention only at critical points)