# Notebook LM Integration System
**Purpose:** Generate visual content assets (infographics, slides, videos)
**Agent:** Da Vinci (Asset Agent)
**Daily Target:** 10 visual assets (one per post)

---

## MCP INTEGRATION PROTOCOL

### Current Status
- **MCP Access:** Pending configuration via OpenClaw
- **Fallback Strategy:** Prompt-based manual generation
- **Asset Storage:** `D:\Work Weaver\Marketing Assets\Infographic\`

### Integration Attempts
```python
# Try MCP integration first
def try_mcp_access():
    try:
        # Attempt MCP connection
        result = mcp_notebook_lm.query({
            'action': 'create_infographic',
            'content': processed_content,
            'type': determined_asset_type
        })

        if result['status'] == 'success':
            return result['asset_url']
        else:
            raise Exception("MCP access failed")

    except Exception as e:
        # Fall back to prompt generation
        return generate_manual_prompt(processed_content)
```

---

## ASSET TYPE SELECTION LOGIC

### Content-to-Asset Mapping
```python
def select_asset_type(content):
    # Analyze content characteristics
    content_analysis = analyze_content(content)

    # Determine optimal asset type
    if content_analysis['has_data_points']:
        return 'infographic'
    elif content_analysis['is_conceptual']:
        return 'slide_deck'
    elif content_analysis['is_narrative']:
        return 'video_script'
    else:
        # Default to most versatile
        return 'infographic'
```

### Selection Criteria
| Asset Type | Best For | Content Indicators |
|------------|----------|-------------------|
| **Infographic** | Data, stats, trends | Numbers, comparisons, charts |
| **Slide Deck** | Concepts, frameworks, steps | Process flows, models, how-tos |
| **Video** | Stories, explanations, tutorials | Case studies, tutorials, narratives |

---

## PROMPT TEMPLATES

### 1. Infographic Template
```markdown
# Notebook LM Infographic Prompt

## Content Summary
[Insert compelling summary of the post content - 3-5 sentences]

## Key Data Points
1. [Statistic/Point 1 with context]
2. [Statistic/Point 2 with context]
3. [Statistic/Point 3 with context]
4. [Statistic/Point 4 with context]
5. [Statistic/Point 5 with context]

## Visual Requirements
- **Style:** Modern, clean, professional
- **Color Scheme:** Brand colors (blue, white, accent)
- **Layout:** Vertical scrolling format for social media
- **Fonts:** Bold headings, readable body text
- **Icons:** Use simple line icons for concepts

## Structure
1. **Hook Section** (Top 20%)
   - Title that grabs attention
   - Key statistic or question
   - Branding at bottom

2. **Data Section** (Middle 60%)
   - Visual representation of data points
   - Clear hierarchy of information
   - Minimal text, maximum impact

3. **CTA Section** (Bottom 20%)
   - Clear call to action
   - Contact/website information
   - Social media handles

## Branding Requirements
- Include Bit Foundry AI logo
- Use consistent color palette
- Maintain professional tone
- Include website: bitfoundry.ai

## Special Instructions
- Make it highly shareable
- Ensure text is readable on mobile
- Optimize for LinkedIn and Twitter
- Save as PNG with transparency option
```

### 2. Slide Deck Template
```markdown
# Notebook LM Slide Deck Prompt

## Concept Overview
[Insert core concept explanation - what the post is about]

## Key Learning Objectives
1. [Main point 1]
2. [Main point 2]
3. [Main point 3]
4. [Main point 4]

## Slide Structure
1. **Title Slide**
   - Compelling title
   - Subtitle
   - Bit Foundry AI branding

2. **Problem Slide**
   - Visual representation of problem
   - Pain points highlighted
   - Statistics showing impact

3. **Solution Slide**
   - Framework or process
   - Step-by-step visual
   - Key benefits

4. **Implementation Slide**
   - How to apply
   - Practical examples
   - Action steps

5. **Results Slide**
   - Expected outcomes
   - Success metrics
   - Social proof elements

6. **CTA Slide**
   - Clear next steps
   - Contact information
   - Additional resources

## Design Requirements
- **Template:** Clean, modern business style
- **Colors:** Professional blue/white scheme
- **Fonts:** Bold sans-serif for headings
- **Visuals:** Icons, minimal charts
- **Branding:** Consistent with Bit Foundry AI

## Special Instructions
- Create 6 slides maximum
- Make each slide visually distinct
- Use minimal text per slide
- Include speaker notes for each slide
```

### 3. Video Template
```markdown
# Notebook LM Video Prompt

## Video Concept
[Insert video concept and narrative arc]

## Video Structure (60 seconds)
1. **Hook (0-10 seconds)**
   - Attention-grabbing visual
   - Compelling question or statement
   - Brand introduction

2. **Problem/Solution (10-30 seconds)**
   - Show the problem visually
   - Introduce the solution
   - Key benefits highlighted

3. **How It Works (30-45 seconds)**
   - Step-by-step demonstration
   - Visual examples
   - Data points reinforced

4. **Social Proof (45-50 seconds)**
   - Quick testimonials or stats
   - Credibility builders
   - Results shown

5. **CTA (50-60 seconds)**
   - Clear call to action
   - Website/contact info
   - Brand closing

## Visual Style
- **Format:** Square (1:1) for social media
- **Animation:** Clean, professional motion graphics
- **Color Scheme:** Brand colors throughout
- **Typography:** Bold, readable fonts
- **Music:** Upbeat but professional background music

## Requirements
- Include Bit Foundry AI branding
- Display website: bitfoundry.ai
- Use real data/imagery where possible
- End with clear CTA
- Include social handles

## Technical Specifications
- Resolution: 1080x1080 pixels
- Format: MP4 with transparency
- Duration: 60 seconds maximum
- File size: Under 100MB
```

---

## ASSET MANAGEMENT SYSTEM

### Asset Tracking Manifest
```python
class AssetManifest:
    def __init__(self):
        self.manifest = {
            'content_id': '',
            'content_text': '',
            'asset_type': '',
            'prompt_used': '',
            'status': 'pending',
            'file_path': '',
            'publer_url': '',
            'created_date': '',
            'approved': False
        }

    def update_manifest(self, content, asset_type, prompt):
        self.manifest.update({
            'content_id': content['id'],
            'content_text': content['text'][:100] + '...',
            'asset_type': asset_type,
            'prompt_used': prompt,
            'status': 'created',
            'created_date': datetime.now().isoformat()
        })

    def mark_approved(self, file_path):
        self.manifest.update({
            'status': 'approved',
            'file_path': file_path,
            'approved': True,
            'approved_date': datetime.now().isoformat()
        })
```

### File Naming Convention
```
[YYYYMMDD]_[ContentID]_[AssetType]_[Version].[ext]
Example: 20260302_CNT001_Infographic_v1.png
```

---

## QUALITY ASSURANCE PROTOCOLS

### Before Generation
```python
def validate_asset_generation_request(content, asset_type):
    checks = {
        'content_length': len(content['text']) <= 2800,  # Notebook LM limit
        'valid_asset_type': asset_type in ['infographic', 'slide_deck', 'video'],
        'brand_compliance': check_branding(content),
        'content_clarity': assess_content_clarity(content)
    }

    if not all(checks.values()):
        raise Exception(f"Validation failed: {checks}")

    return True
```

### After Generation
```python
def validate_generated_asset(asset_path, content):
    validation = {
        'file_exists': os.path.exists(asset_path),
        'file_size': validate_file_size(asset_path),
        'image_quality': validate_image_quality(asset_path),
        'content_alignment': check_content_asset_match(content, asset_path)
    }

    if not all(validation.values()):
        raise Exception(f"Asset validation failed: {validation}")

    return True
```

---

## ERROR HANDLING & FALLBACKS

### MCP Access Failure Protocol
1. **Immediate Detection**
   - Log error to error tracking
   - Switch to prompt generation mode
   - Notify user of temporary workaround

2. **Prompt Generation**
   - Create complete prompt template
   - Save to manual creation folder
   - Provide clear instructions for user

3. **Follow-up Actions**
   - Attempt MCP reconnection every 6 hours
   - Document failure patterns
   - Update integration strategy if needed

### Common Issues
- **API Rate Limits** → Switch to prompt mode
- **Content Too Long** → Summarize and regenerate
- **Asset Mismatch** → Regenerate with corrected prompt
- **File Upload Failures** → Retry with different parameters

---

## PERFORMANCE METRICS

### Success Tracking
```python
class AssetMetrics:
    def __init__(self):
        self.metrics = {
            'assets_generated': 0,
            'mcp_successes': 0,
            'mcp_failures': 0,
            'manual_generations': 0,
            'quality_failures': 0,
            'user_approvals': 0,
            'average_generation_time': 0
        }

    def update_generation(self, success, method, time_taken):
        self.metrics['assets_generated'] += 1

        if success:
            if method == 'mcp':
                self.metrics['mcp_successes'] += 1
            else:
                self.metrics['manual_generations'] += 1
        else:
            self.metrics['quality_failures'] += 1

        self.metrics['average_generation_time'] = (
            (self.metrics['average_generation_time'] * (self.metrics['assets_generated'] - 1) + time_taken) /
            self.metrics['assets_generated']
        )

    def get_success_rate(self):
        return (self.metrics['mcp_successes'] + self.metrics['manual_generations']) / self.metrics['assets_generated'] * 100
```

---

## AUTOMATION CHECKLIST

### Before Asset Creation
- [ ] Content approved by Aristotle
- [ ] Asset type determined
- [ ] Prompt template selected
- [ ] MCP connection tested (if available)

### During Creation
- [ ] Asset generation started
- [ ] Time tracked
- [ ] Error monitoring active

### After Creation
- [ ] Asset validated
- [ ] Manifest updated
- [ ] User notification sent
- [ ] Metrics updated

---

## STATUS: READY WITH FALLBACK
**MCP Integration:** Pending configuration
**Manual Mode:** ✅ Fully functional
**Success Rate:** Target 95%
**Storage:** `D:\Work Weaver\Marketing Assets\Infographic\`