# Claude Code Model Configuration - Windows Setup

## ✅ What's Configured

### Already Ready
- **Z.ai GLM-5** ✅ Can use immediately
- **Z.ai Gemini 2.0 Pro** ✅ Can use immediately
- **Bash switcher** (`switch-model.sh`) ✅ For Git Bash / WSL
- **PowerShell switcher** (`switch-model.ps1`) ✅ **Recommended for Windows**
- **Batch switcher** (`switch-model.bat`) ✅ Simple command line

### Needs Setup
- **Claude Opus 4.6, 4.5** ⏳ Requires Anthropic API key
- **Claude Sonnet 4.6, 4.5** ⏳ Requires Anthropic API key
- **Claude Haiku 4.5** ⏳ Requires Anthropic API key (alternative to current OAuth)

---

## Step 1: Get Anthropic API Key (5 minutes)

1. Go to: https://console.anthropic.com/
2. Sign in with your account
3. Click **"API Keys"** in left sidebar
4. Click **"Create New Key"**
5. Copy the key (looks like: `sk-ant-...`)

---

## Step 2: Set Environment Variable

### Option A: Permanent (Environment Variables GUI)
1. Press `Win + X` → Select **"System"**
2. Click **"Advanced system settings"** → **"Environment Variables"**
3. Under **"User variables"**, click **"New..."**
   - Variable name: `ANTHROPIC_API_KEY`
   - Variable value: `sk-ant-xxxxxxxxxxxxx`
4. Click **OK** and restart Claude Code

### Option B: PowerShell (One Session)
```powershell
$env:ANTHROPIC_API_KEY = "sk-ant-xxxxxxxxxxxxx"
```

### Option C: PowerShell Profile (Permanent)
1. Open PowerShell
2. Run: `notepad $PROFILE`
3. Add this line:
   ```powershell
   $env:ANTHROPIC_API_KEY = "sk-ant-xxxxxxxxxxxxx"
   ```
4. Save and restart PowerShell

---

## Step 3: Switch Models

### Using PowerShell (Recommended)
```powershell
# Show all available models
.\switch-model.ps1

# Switch to Opus 4.6 (most powerful)
.\switch-model.ps1 -Model "opus-4-6"

# Switch to Sonnet 4.6 (best balance)
.\switch-model.ps1 -Model "sonnet-4-6"

# Switch to Haiku 4.5 (fastest)
.\switch-model.ps1 -Model "haiku-4-5"

# Switch to Z.ai GLM-5
.\switch-model.ps1 -Model "glm5"

# Switch to Gemini (Z.ai)
.\switch-model.ps1 -Model "gemini"
```

### Using Batch File
```cmd
switch-model.bat opus-4-6
switch-model.bat sonnet-4-6
switch-model.bat glm5
```

### Using Git Bash
```bash
source switch-model.sh
model opus-4-6
model sonnet-4-6
model glm5
```

---

## Step 4: Verify Configuration

```powershell
# Check current model
.\switch-model.ps1

# View your settings
cat $env:USERPROFILE\.claude\settings.json
```

Should show:
```json
{
  "env": {
    "ANTHROPIC_API_KEY": "sk-ant-xxxxx",
    "ANTHROPIC_MODEL": "claude-opus-4-6",
    "ANTHROPIC_BASE_URL": ""
  }
}
```

---

## Quick Reference: Available Models

| Command | Model | Best For |
|---------|-------|----------|
| `opus-4-6` | Claude 4.6 | **Most intelligent** |
| `opus-4-5` | Claude 4.5 | Alternative to 4.6 |
| `sonnet-4-6` | Claude 4.6 | **Best balance** (speed + smarts) |
| `sonnet-4-5` | Claude 4.5 | Lighter version |
| `haiku-4-5` | Haiku 4.5 | **Fastest** |
| `glm5` | GLM-5 | Works immediately (no API key needed) |
| `gemini` | Gemini 2.0 | Works immediately (no API key needed) |

---

## Troubleshooting

### ❌ "ANTHROPIC_API_KEY not set"
```powershell
# Check if variable is set
$env:ANTHROPIC_API_KEY

# If empty, set it
$env:ANTHROPIC_API_KEY = "sk-ant-xxxxx"
```

### ❌ PowerShell execution policy error
```powershell
# Run this once to allow local scripts
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### ❌ Model still shows old one after switching
- **Restart Claude Code** after running the switch command
- The settings are updated, but Claude Code needs to restart to load them

### ❌ File not found errors
Make sure you're in the right directory:
```powershell
cd $env:USERPROFILE\.claude
.\switch-model.ps1
```

---

## Advanced: Create Aliases (Optional)

Add to your PowerShell profile (`notepad $PROFILE`):

```powershell
# Quick model switching
function model-opus { & "$env:USERPROFILE\.claude\switch-model.ps1" -Model "opus-4-6" }
function model-sonnet { & "$env:USERPROFILE\.claude\switch-model.ps1" -Model "sonnet-4-6" }
function model-haiku { & "$env:USERPROFILE\.claude\switch-model.ps1" -Model "haiku-4-5" }
function model-glm { & "$env:USERPROFILE\.claude\switch-model.ps1" -Model "glm5" }
function model-list { & "$env:USERPROFILE\.claude\switch-model.ps1" }
```

Then use:
```powershell
model-opus      # Switch to Opus 4.6
model-sonnet    # Switch to Sonnet 4.6
model-list      # Show available models
```

---

## Security ⚠️

- **Never** commit your API key to git
- **Never** share your API key with others
- Your key is now in `settings.json` - keep it private
- If you commit settings.json to a public repo, **revoke the key immediately** at console.anthropic.com

---

## Need Help?

1. Check current setup: `cat $env:USERPROFILE\.claude\settings.json | findstr /A:2 "env"`
2. View all available models: `.\switch-model.ps1`
3. Test a model: After switching, restart Claude Code and it should use the new model

Enjoy your expanded model access! 🚀
