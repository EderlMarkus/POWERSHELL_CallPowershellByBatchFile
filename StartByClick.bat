@echo off
@REM Set the current Path, in which this file was executed to 'HOME'
set HOME=%~dp0%
@REM Define absolute Path to your Powershell.exe
set POWERSHELL_PATH = C:\Windows\System32\WindowsPowerShell\v1.0
echo "####################"
echo "Starting Batch Script"
echo "####################"
CD %POWERSHELL_PATH%
Powershell -ExecutionPolicy Bypass -command "& '%HOME%./Powershell/HelloWorld.ps1' '%HOME%'"
pause