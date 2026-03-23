@echo off
REM ~/.claude/switch-model.bat
REM Windows batch file for model switching
REM Usage: switch-model.bat opus-4-6

setlocal enabledelayedexpansion

set SETTINGS=%USERPROFILE%\.claude\settings.json

if "%1"=="" (
    echo.
    echo   Anthropic Models:
    echo.
    echo     switch-model.bat opus-4-6   (Claude 4.6 Opus - latest^)
    echo     switch-model.bat opus-4-5   (Claude 4.5 Opus^)
    echo     switch-model.bat sonnet-4-6 (Claude 4.6 Sonnet^)
    echo     switch-model.bat sonnet-4-5 (Claude 4.5 Sonnet^)
    echo     switch-model.bat haiku-4-5  (Haiku 4.5^)
    echo.
    echo   Z.ai Models (via proxy^):
    echo.
    echo     switch-model.bat glm5       (GLM-5^)
    echo     switch-model.bat gemini     (Gemini 2.0 Pro^)
    echo.
    echo   Recommended: Use PowerShell script for better experience
    echo     .\switch-model.ps1 -Model "opus-4-6"
    echo.
    exit /b 0
)

REM For full functionality, use PowerShell instead
powershell -NoProfile -ExecutionPolicy Bypass -Command "& '%~dp0switch-model.ps1' -Model '%1'"

endlocal
