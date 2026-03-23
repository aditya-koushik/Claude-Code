# ~/.claude/switch-model.ps1
# Enhanced model switcher for Windows PowerShell
# Usage: .\switch-model.ps1 -Model "opus-4-6"
# Or set env: $env:ANTHROPIC_API_KEY = "sk-ant-..."

param(
    [string]$Model = ""
)

$SETTINGS = "$env:USERPROFILE\.claude\settings.json"
$ZAI_KEY = "364af2d669b946478eb1c0dfa0acd11d.xKddd1CHKEm5lPVH"
$ZAI_URL = "https://api.z.ai/api/anthropic"

$anthropicModels = @{
    'opus-4-6'   = 'claude-opus-4-6'
    'opus-4-5'   = 'claude-opus-4-5-20250514'
    'sonnet-4-6' = 'claude-sonnet-4-6-20250514'
    'sonnet-4-5' = 'claude-sonnet-4-5-20241022'
    'haiku-4-5'  = 'claude-haiku-4-5-20251001'
}

$zaiModels = @{
    'glm5'   = 'glm-5'
    'glm-5'  = 'glm-5'
    'gemini' = 'gemini-2.0-pro-exp'
}

# Show available models if no argument
if (-not $Model) {
    $settings = Get-Content $SETTINGS | ConvertFrom-Json
    $env_obj = $settings.env
    $currentModel = $env_obj.ANTHROPIC_MODEL
    $provider = if ($env_obj.ANTHROPIC_BASE_URL) { "z.ai proxy" } else { "Anthropic API" }

    Write-Host ""
    Write-Host "  Active model : $currentModel"
    Write-Host "  Provider     : $provider"
    Write-Host ""
    Write-Host "  Anthropic Models:"
    Write-Host "    opus-4-6   (Claude 4.6 Opus - latest)"
    Write-Host "    opus-4-5   (Claude 4.5 Opus)"
    Write-Host "    sonnet-4-6 (Claude 4.6 Sonnet)"
    Write-Host "    sonnet-4-5 (Claude 4.5 Sonnet)"
    Write-Host "    haiku-4-5  (Haiku 4.5)"
    Write-Host ""
    Write-Host "  Z.ai Models (via proxy):"
    Write-Host "    glm5       (GLM-5)"
    Write-Host "    gemini     (Gemini 2.0 Pro)"
    Write-Host ""
    exit 0
}

$Model = $Model.ToLower()

# Read current settings
$settings = Get-Content $SETTINGS | ConvertFrom-Json

# Ensure env object exists
if (-not $settings.env) {
    $settings | Add-Member -Type NoteProperty -Name "env" -Value @{}
}

# Switch to Anthropic model
if ($anthropicModels.ContainsKey($Model)) {
    $ANTHROPIC_KEY = $env:ANTHROPIC_API_KEY

    if (-not $ANTHROPIC_KEY) {
        Write-Host ""
        Write-Host "  Error: ANTHROPIC_API_KEY not set"
        Write-Host "  Set your API key:"
        Write-Host "    `$env:ANTHROPIC_API_KEY = 'sk-ant-xxxxx'"
        Write-Host ""
        exit 1
    }

    $settings.env.ANTHROPIC_API_KEY = $ANTHROPIC_KEY
    $settings.env.ANTHROPIC_MODEL = $anthropicModels[$Model]
    $settings.env | Add-Member -Force -Name "ANTHROPIC_BASE_URL" -Value ""

    Write-Host ""
    Write-Host "  Switched to  : $Model ($($anthropicModels[$Model]))"
    Write-Host "  Provider     : Anthropic API"
}
# Switch to Z.ai model
elseif ($zaiModels.ContainsKey($Model)) {
    $settings.env.ANTHROPIC_API_KEY = $ZAI_KEY
    $settings.env.ANTHROPIC_BASE_URL = $ZAI_URL
    $settings.env.ANTHROPIC_MODEL = $zaiModels[$Model]

    Write-Host ""
    Write-Host "  Switched to  : $Model ($($zaiModels[$Model]))"
    Write-Host "  Provider     : z.ai Anthropic proxy"
}
else {
    Write-Host ""
    Write-Host "  Unknown model: $Model"
    Write-Host "  Run: .\switch-model.ps1 (no args) to see available models"
    Write-Host ""
    exit 1
}

# Write updated settings back
$settings | ConvertTo-Json -Depth 10 | Set-Content $SETTINGS
Write-Host "  Restart Claude Code to apply."
Write-Host ""
