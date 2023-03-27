@echo off
@REM Step 1 for individually colored Lines
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)
@REM Setting current Path to 'HOME'
set HOME=%~dp0%
@REM Define absolut Path to your Powershell-Directory
set POWERSHELL_PATH = C:\Windows\System32\WindowsPowerShell\v1.0
@REM Definiere Farbe des Outputs
call :colorEcho 0a "####################"
call :colorEcho 0a "Starting Batch Script"
call :colorEcho 0a "####################"
CD %POWERSHELL_PATH%
Powershell -ExecutionPolicy Bypass -command "& '%HOME%./Powershell/HelloWorld.ps1' '%HOME%'"
pause
exit
@REM Step 2 for individually colored Lines
:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i
echo: