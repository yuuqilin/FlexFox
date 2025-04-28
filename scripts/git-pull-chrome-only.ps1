# Ensure script stops on error
$ErrorActionPreference = "Stop"

# Save the current location
$originalLocation = Get-Location

# Set profile path
$profilePath = "$env:APPDATA\Mozilla\Firefox\Profiles"

# 1. Search for the local Firefox default user profile directory
Write-Host "Searching for Firefox default profile..." -ForegroundColor Yellow
$defaultProfile = Get-ChildItem $profilePath -Directory | Where-Object { $_.Name -like '*.default-release' } | Select-Object -First 1

if (-not $defaultProfile) {
    Write-Host "Could not find a default-release profile." -ForegroundColor Red
    Set-Location $originalLocation
    exit 1
}

$profileDir = Join-Path $profilePath $defaultProfile.Name
Write-Host "Found default profile at: $($profileDir)" -ForegroundColor Green
Set-Location $profileDir

# 2. Check if it's a Git managed directory, initialize and set up if not
if (-not (Test-Path .git)) {
    Write-Host "Initializing Git repository..." -ForegroundColor Yellow
    git init
    git remote add origin https://github.com/yuuqilin/FlexFox.git
    git sparse-checkout init --no-cone
    git sparse-checkout set /chrome
    git fetch origin
    git checkout -b main origin/main
    Write-Host "Git repository initialized and 'chrome' directory checked out." -ForegroundColor Green
} else {
    Write-Host "Git repository already initialized." -ForegroundColor Green
    # 3. Check if a remote repository address is being tracked, add if not
    $remoteExists = git remote | Select-String -Pattern "origin"
    if (-not $remoteExists) {
        Write-Host "Adding remote origin..." -ForegroundColor Yellow
        git remote add origin https://github.com/yuuqilin/FlexFox.git
        Write-Host "Remote 'origin' added." -ForegroundColor Green
    } else {
        Write-Host "Remote 'origin' already exists." -ForegroundColor Green
    }

    # 4. Pull the chrome directory from the remote repository
    Write-Host "Fetching latest changes for 'chrome' directory..." -ForegroundColor Yellow
    git fetch origin
    git checkout main # Ensure on the main branch
    git merge origin/main --allow-unrelated-histories
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Git pull failed." -ForegroundColor Red
        Set-Location $originalLocation
        exit 1
    }
    Write-Host "'chrome' directory updated." -ForegroundColor Green
}

# Return to original location
Set-Location $originalLocation
Write-Host "Script completed." -ForegroundColor Green