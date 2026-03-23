#!/usr/bin/env node

/**
 * AI CLI Wrapper - Gemini first, GLM fallback
 * Usage: node ai-cli.js "your prompt" or ai-cli "your prompt" (if in PATH)
 */

const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');

// Configuration
const CONFIG = {
  gemini: {
    model: 'gemini-2.5-flash',
    command: 'gemini'
  },
  glm: {
    model: 'glm-4-flash',
    apiKey: process.env.GLM_API_KEY,
    apiUrl: 'https://open.bigmodel.cn/api/paas/v4/chat/completions'
  }
};

async function tryGemini(prompt) {
  try {
    const cmd = `${CONFIG.gemini.command} -m ${CONFIG.gemini.model} -p "${prompt.replace(/"/g, '\\"')}" -o text`;
    const result = execSync(cmd, { encoding: 'utf8', stdio: ['pipe', 'pipe', 'pipe'] });
    return { success: true, output: result, source: 'Gemini' };
  } catch (error) {
    return { success: false, error: error.message, source: 'Gemini' };
  }
}

async function tryGLM(prompt) {
  if (!CONFIG.glm.apiKey) {
    return {
      success: false,
      error: 'GLM_API_KEY not set. Get it from https://open.bigmodel.cn/usercenter/apikeys',
      source: 'GLM'
    };
  }

  try {
    const fetch = (await import('node-fetch')).default;
    const response = await fetch(CONFIG.glm.apiUrl, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${CONFIG.glm.apiKey}`
      },
      body: JSON.stringify({
        model: CONFIG.glm.model,
        messages: [{ role: 'user', content: prompt }]
      })
    });

    if (!response.ok) {
      throw new Error(`GLM API Error: ${response.status}`);
    }

    const data = await response.json();
    const content = data.choices?.[0]?.message?.content || 'No response from GLM';

    return { success: true, output: content, source: 'GLM' };
  } catch (error) {
    return { success: false, error: error.message, source: 'GLM' };
  }
}

async function main() {
  const prompt = process.argv.slice(2).join(' ');

  if (!prompt) {
    console.log('AI CLI Wrapper - Gemini 2.5 Flash → GLM fallback\n');
    console.log('Usage: ai-cli "your prompt here"');
    console.log('       ai-cli -i    (interactive mode)');
    console.log('\nConfiguration:');
    console.log(`  Gemini: ${CONFIG.gemini.model}`);
    console.log(`  GLM: ${CONFIG.glm.model}`);
    console.log(`  GLM API Key: ${CONFIG.glm.apiKey ? 'SET' : 'NOT SET'}`);
    console.log('\nTo set GLM API Key: setx GLM_API_KEY "your_key_here"');
    process.exit(0);
  }

  // Interactive mode
  if (prompt === '-i') {
    const readline = require('readline');
    const rl = readline.createInterface({
      input: process.stdin,
      output: process.stdout
    });

    console.log('\n=== AI CLI Interactive Mode ===');
    console.log('Gemini 2.5 Flash → GLM fallback');
    console.log('Type "exit" to quit\n');

    const ask = (query) => new Promise(resolve => rl.question(query, resolve));

    while (true) {
      const input = await ask('You> ');
      if (input.toLowerCase() === 'exit') {
        rl.close();
        break;
      }
      if (!input.trim()) continue;

      console.log('\n[Trying Gemini...]');
      let result = await tryGemini(input);

      if (!result.success) {
        console.log(`[Gemini failed: ${result.error}]`);
        console.log('[Falling back to GLM...]\n');
        result = await tryGLM(input);
      }

      if (result.success) {
        console.log(`\n[${result.source}] ${result.output}\n`);
      } else {
        console.log(`\n[Error] Both Gemini and GLM failed: ${result.error}\n`);
      }
    }
    process.exit(0);
  }

  // One-shot mode
  console.log('[Trying Gemini 2.5 Flash...]');
  let result = await tryGemini(prompt);

  if (!result.success) {
    console.log(`[Gemini failed: ${result.error}]`);
    console.log('[Falling back to GLM...]');
    result = await tryGLM(prompt);
  }

  if (result.success) {
    console.log(`\n[${result.source}] Response:\n${result.output}`);
  } else {
    console.error(`\n[Error] Both models failed:\n  Gemini: ${result.error}\n  GLM: ${result.error}`);
    process.exit(1);
  }
}

main().catch(console.error);
