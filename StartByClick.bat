@echo off
@REM Set the current Path, in which this file was executed to 'HOME'
set HOME=%~dp0%
@REM Define absolute Path to your Powershell.exe
set POWERSHELL_PATH = C:\Windows\System32\WindowsPowerShell\v1.0
echo "####################"
echo "Starting Batch Script"
echo "####################"
CD %POWERSHELL_PATH%
@REM If SayHello, we don't need a second parameter
Powershell -ExecutionPolicy Bypass -command "& '%HOME%./Powershell/DynamicParam.ps1' 'SayHello'"
@REM If ShowMessage, we need the Message as a second parameter, Message is given in code
Powershell -ExecutionPolicy Bypass -command "& '%HOME%./Powershell/DynamicParam.ps1' 'ShowMessage' 'Message was given in Code'"
@REM If ShowMessage, we need the Message as a second parameterm, Message is given in terminal
Powershell -ExecutionPolicy Bypass -command "& '%HOME%./Powershell/DynamicParam.ps1' 'ShowMessage'"
pause