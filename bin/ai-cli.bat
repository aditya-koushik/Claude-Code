@echo off
REM AI CLI Wrapper - Tries Gemini first, falls back to GLM
REM Usage: ai-cli [prompt] or ai-cli "your prompt here"

setlocal enabledelayedexpansion

REM Get the prompt from arguments
set PROMPT=%*

REM If no prompt provided, run in interactive mode
if "%PROMPT%"=="" (
    echo Starting AI CLI (Gemini 2.5 Flash with GLM fallback)...
    echo Type 'exit' to quit
    echo.

    :interactive_loop
    set /p INPUT="You> "
    if /i "%INPUT%"=="exit" goto :eof
    if "%INPUT%"=="" goto :interactive_loop

    call :try_gemini "%INPUT%"
    if !ERRORLEVEL! neq 0 (
        echo Gemini failed, trying GLM fallback...
        call :try_glm "%INPUT%"
    )
    goto :interactive_loop
) else (
    REM One-shot mode
    call :try_gemini "%PROMPT%"
    if !ERRORLEVEL! neq 0 (
        echo Gemini failed, trying GLM fallback...
        call :try_glm "%PROMPT%"
    )
)

endlocal
goto :eof

:try_gemini
set GEMINI_PROMPT=%~1
gemini -m gemini-2.5-flash -p "!GEMINI_PROMPT!" -o text 2>nul
exit /b %ERRORLEVEL%

:try_glm
set GLM_PROMPT=%~1

REM Check if GLM_API_KEY is set
if "%GLM_API_KEY%"=="" (
    echo Error: GLM_API_KEY not set. Set it with: setx GLM_API_KEY "your_key_here"
    echo Get your API key from: https://open.bigmodel.cn/usercenter/apikeys
    exit /b 1
)

REM Call GLM API using curl
curl -s -X POST "https://open.bigmodel.cn/api/paas/v4/chat/completions" ^
  -H "Content-Type: application/json" ^
  -H "Authorization: Bearer %GLM_API_KEY%" ^
  -d "{\"model\":\"glm-4-flash\",\"messages\":[{\"role\":\"user\",\"content\":\"!GLM_PROMPT!\"}]}" ^
  2>nul | findstr /C:"content" >nul

if !ERRORLEVEL! equ 0 (
    curl -s -X POST "https://open.bigmodel.cn/api/paas/v4/chat/completions" ^
      -H "Content-Type: application/json" ^
      -H "Authorization: Bearer %GLM_API_KEY%" ^
      -d "{\"model\":\"glm-4-flash\",\"messages\":[{\"role\":\"user\",\"content\":\"!GLM_PROMPT!\"}]}"
) else (
    echo GLM API call failed
)
exit /b %ERRORLEVEL%
