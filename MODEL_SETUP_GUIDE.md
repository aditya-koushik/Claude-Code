# Claude Code - Complete Model Configuration Guide

## Current Status
- ✅ Z.ai GLM-5 & Gemini: Ready to use (API key already configured)
- ⏳ Anthropic Claude Models: Requires API key setup

---

## Quick Start

### 1. Get an Anthropic API Key (if you don't have one)
1. Visit: https://console.anthropic.com/
2. Sign in or create account
3. Go to **API Keys** section
4. Create new API key
5. Copy the key (starts with `sk-ant-`)

### 2. Set Your Anthropic API Key

**Option A: Permanent (Recommended)**
```bash
# Set environment variable
export ANTHROPIC_API_KEY="sk-ant-xxxxxxxxxxxxxx"

# Verify it's set
echo $ANTHROPIC_API_KEY
```

**Option B: One-time per command**
```bash
ANTHROPIC_API_KEY="sk-ant-xxxxxxxxxxxxxx" model opus-4-6
```

### 3. View Available Models
```bash
model
```

Output will show:
```
  Active model : haiku-4-5
  Provider     : Anthropic API

  Anthropic Models:
    opus-4-6   (Claude 4.6 Opus - latest)
    opus-4-5   (Claude 4.5 Opus)
    sonnet-4-6 (Claude 4.6 Sonnet)
    sonnet-4-5 (Claude 4.5 Sonnet)
    haiku-4-5  (Haiku 4.5)

  Z.ai Models (via proxy):
    glm5       (GLM-5)
    gemini     (Gemini 2.0 Pro)
```

### 4. Switch Models
```bash
# Switch to Claude Opus 4.6 (latest)
model opus-4-6

# Switch to Claude Sonnet 4.5
model sonnet-4-5

# Switch to Z.ai GLM-5
model glm5

# Switch to Gemini 2.0 Pro (via Z.ai)
model gemini

# Check current model
model
```

---

## Model Details

### Anthropic Claude Models
| Model | ID | Best For |
|-------|----|---------|
| Opus 4.6 | `opus-4-6` | **Most capable** - Complex tasks, reasoning, analysis |
| Opus 4.5 | `opus-4-5` | Good alternative to 4.6 |
| Sonnet 4.6 | `sonnet-4-6` | **Best balance** - Speed + capability |
| Sonnet 4.5 | `sonnet-4-5` | Lighter Sonnet version |
| Haiku 4.5 | `haiku-4-5` | **Fastest** - Simple tasks, low latency |

### Z.ai Models (Anthropic Proxy)
| Model | ID | Provider |
|-------|----|---------|
| GLM-5 | `glm5` | Alibaba's GLM |
| Gemini 2.0 Pro | `gemini` | Google's Gemini |

---

## How It Works

The `switch-model.sh` script updates your `~/.claude/settings.json` with:
```json
{
  "env": {
    "ANTHROPIC_API_KEY": "your-key-here",
    "ANTHROPIC_BASE_URL": "https://api.z.ai/api/anthropic",  // Only for Z.ai models
    "ANTHROPIC_MODEL": "claude-opus-4-6"
  }
}
```

Claude Code reads these environment variables and routes your requests accordingly.

---

## Troubleshooting

### ❌ "Unknown model: xyz"
Run `model` with no arguments to see all available models.

### ❌ "ANTHROPIC_API_KEY not set"
You tried to use an Anthropic model without setting your API key:
```bash
export ANTHROPIC_API_KEY="your-key-here"
model opus-4-6
```

### ❌ Model doesn't change after switching
Restart Claude Code after running the `model` command.

### ❌ Z.ai models not working
The API key in switch-model.sh might be expired. Contact support if GLM-5/Gemini fail.

---

## Advanced Usage

### Bash Alias (Optional)
Add to your `~/.bashrc` or `~/.zshrc`:
```bash
alias m='model'
```

Then use: `m opus-4-6`

### Multiple API Keys
If you need to switch between Anthropic accounts:
```bash
# Account 1
export ANTHROPIC_API_KEY="sk-ant-account1xxxxx"
model opus-4-6

# Account 2
export ANTHROPIC_API_KEY="sk-ant-account2xxxxx"
model sonnet-4-6
```

---

## Security Notes
⚠️ **Never commit your API key to version control**
- Store in environment variables
- Or use `.env` files (add to `.gitignore`)
- The settings.json will contain your key after switching - keep it private

---

## Support
- View current setup: `cat ~/.claude/settings.json | grep -A3 env`
- View available models: `model`
- Test a model: `model opus-4-6 && claude code --help`
