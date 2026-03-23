#!/bin/bash
# ~/.claude/switch-model.sh
# Enhanced model switcher for Anthropic Claude + Z.ai models
# Usage: model [opus-4-6|sonnet-4-6|haiku-4-5|opus-4-5|sonnet-4-5|glm5|gemini]

SETTINGS="$HOME/.claude/settings.json"
ZAI_KEY="364af2d669b946478eb1c0dfa0acd11d.xKddd1CHKEm5lPVH"
ZAI_URL="https://api.z.ai/api/anthropic"
ANTHROPIC_KEY="${ANTHROPIC_API_KEY:-}"  # Your Anthropic API key

MODEL="${1,,}"  # lowercase

if [ -z "$MODEL" ]; then
    node -e "
const s = JSON.parse(require('fs').readFileSync('$SETTINGS', 'utf8'));
const env = s.env || {};
const model = env.ANTHROPIC_MODEL || 'unknown';
const isZai = env.ANTHROPIC_BASE_URL ? 'z.ai proxy' : 'Anthropic API';
console.log('');
console.log('  Active model : ' + model);
console.log('  Provider     : ' + isZai);
console.log('');
console.log('  Anthropic Models:');
console.log('    opus-4-6   (Claude 4.6 Opus - latest)');
console.log('    opus-4-5   (Claude 4.5 Opus)');
console.log('    sonnet-4-6 (Claude 4.6 Sonnet)');
console.log('    sonnet-4-5 (Claude 4.5 Sonnet)');
console.log('    haiku-4-5  (Haiku 4.5)');
console.log('');
console.log('  Z.ai Models (via proxy):');
console.log('    glm5       (GLM-5)');
console.log('    gemini     (Gemini 2.0 Pro)');
console.log('');
"
    exit 0
fi

node -e "
const fs = require('fs');
const s = JSON.parse(fs.readFileSync('$SETTINGS', 'utf8'));
if (!s.env) s.env = {};

const MODEL = '$MODEL';
const ZAI_KEY = '$ZAI_KEY';
const ZAI_URL = '$ZAI_URL';
const ANTHROPIC_KEY = '$ANTHROPIC_KEY';

// Anthropic models (requires API key)
const anthropicModels = {
    'opus-4-6': 'claude-opus-4-6',
    'opus-4-5': 'claude-opus-4-5-20250514',
    'sonnet-4-6': 'claude-sonnet-4-6-20250514',
    'sonnet-4-5': 'claude-sonnet-4-5-20241022',
    'haiku-4-5': 'claude-haiku-4-5-20251001'
};

// Z.ai models
const zaiModels = {
    'glm5': 'glm-5',
    'glm-5': 'glm-5',
    'gemini': 'gemini-2.0-pro-exp'
};

// Clear previous model/provider settings
delete s.env.ANTHROPIC_BASE_URL;
delete s.env.ANTHROPIC_MODEL;

if (anthropicModels[MODEL]) {
    if (!ANTHROPIC_KEY) {
        console.error('');
        console.error('  Error: ANTHROPIC_API_KEY not set');
        console.error('  Set your API key: export ANTHROPIC_API_KEY=\"your-key-here\"');
        console.error('');
        process.exit(1);
    }
    s.env.ANTHROPIC_API_KEY = ANTHROPIC_KEY;
    s.env.ANTHROPIC_MODEL = anthropicModels[MODEL];
    console.log('');
    console.log('  Switched to  : ' + MODEL + ' (' + s.env.ANTHROPIC_MODEL + ')');
    console.log('  Provider     : Anthropic API');
} else if (zaiModels[MODEL]) {
    s.env.ANTHROPIC_API_KEY = ZAI_KEY;
    s.env.ANTHROPIC_BASE_URL = ZAI_URL;
    s.env.ANTHROPIC_MODEL = zaiModels[MODEL];
    console.log('');
    console.log('  Switched to  : ' + MODEL + ' (' + s.env.ANTHROPIC_MODEL + ')');
    console.log('  Provider     : z.ai Anthropic proxy');
} else {
    console.error('');
    console.error('  Unknown model: ' + MODEL);
    console.error('  Run: model (no args) to see available models');
    console.error('');
    process.exit(1);
}

fs.writeFileSync('$SETTINGS', JSON.stringify(s, null, 2));
console.log('  Restart Claude Code to apply.');
console.log('');
" 2>&1

exit $?