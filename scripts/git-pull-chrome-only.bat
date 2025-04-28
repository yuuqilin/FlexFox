@echo off
setlocal EnableDelayedExpansion

:: Save the current location
set "originalLocation=%CD%"

:: Set profile path
set "profilePath=%APPDATA%\Mozilla\Firefox\Profiles"

:: 1. Search for the local Firefox default user profile directory
powershell -Command "Write-Host 'Searching for Firefox default profile...' -ForegroundColor Yellow"

set "defaultProfile="
for /d %%D in ("%profilePath%\*.default-release") do (
    set "defaultProfile=%%~nxD"
    goto :found_profile
)

:found_profile
if not defined defaultProfile (
    powershell -Command "Write-Host 'Could not find a default-release profile.' -ForegroundColor Red"
    cd /d "%originalLocation%"
    exit /b 1
)

set "profileDir=%profilePath%\%defaultProfile%"
powershell -Command "Write-Host 'Found default profile at: %profileDir%' -ForegroundColor Green"
cd /d "%profileDir%"

:: 2. Check if it's a Git managed directory, initialize and set up if not
if not exist ".git" (
    powershell -Command "Write-Host 'Initializing Git repository...' -ForegroundColor Yellow"
    git init
    git remote add origin https://github.com/yuuqilin/FlexFox.git
    git sparse-checkout init --no-cone
    git sparse-checkout set /chrome
    git fetch origin
    git checkout -b main origin/main
    powershell -Command "Write-Host 'Git repository initialized and ''chrome'' directory checked out.' -ForegroundColor Green"
) else (
    powershell -Command "Write-Host 'Git repository already initialized.' -ForegroundColor Green"
    
    :: 3. Check if a remote repository address is being tracked, add if not
    git remote | findstr "origin" > nul
    if errorlevel 1 (
        powershell -Command "Write-Host 'Adding remote origin...' -ForegroundColor Yellow"
        git remote add origin https://github.com/yuuqilin/FlexFox.git
        powershell -Command "Write-Host 'Remote ''origin'' added.' -ForegroundColor Green"
    ) else (
        powershell -Command "Write-Host 'Remote ''origin'' already exists.' -ForegroundColor Green"
    )
    
    :: 4. Pull the chrome directory from the remote repository
    powershell -Command "Write-Host 'Fetching latest changes for ''chrome'' directory...' -ForegroundColor Yellow"
    git fetch origin
    git checkout main
    git merge origin/main --allow-unrelated-histories
    
    if errorlevel 1 (
        powershell -Command "Write-Host 'Git pull failed.' -ForegroundColor Red"
        cd /d "%originalLocation%"
        exit /b 1
    )
    
    powershell -Command "Write-Host '''chrome'' directory updated.' -ForegroundColor Green"
)

:: Return to original location
cd /d "%originalLocation%"
powershell -Command "Write-Host 'Script completed.' -ForegroundColor Green"

endlocal