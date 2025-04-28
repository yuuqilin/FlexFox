#!/bin/bash

# Ensure script stops on error
set -e

# Save the current location
originalLocation=$(pwd)

# Set profile path based on OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    profilePath="$HOME/Library/Application Support/Firefox/Profiles"
else
    # Linux
    profilePath="$HOME/.mozilla/firefox"
fi

# Function for colored output
print_yellow() {
    echo -e "\e[33m$1\e[0m"
}

print_green() {
    echo -e "\e[32m$1\e[0m"
}

print_red() {
    echo -e "\e[31m$1\e[0m"
}

# 1. Search for the local Firefox default user profile directory
print_yellow "Searching for Firefox default profile..."
defaultProfile=$(find "$profilePath" -maxdepth 1 -type d -name "*.default-release" | head -n 1)

if [ -z "$defaultProfile" ]; then
    print_red "Could not find a default-release profile."
    cd "$originalLocation"
    exit 1
fi

print_green "Found default profile at: $defaultProfile"
cd "$defaultProfile"

# 2. Check if it's a Git managed directory, initialize and set up if not
if [ ! -d ".git" ]; then
    print_yellow "Initializing Git repository..."
    git init
    git remote add origin https://github.com/yuuqilin/FlexFox.git
    git sparse-checkout init --no-cone
    git sparse-checkout set /chrome
    git fetch origin
    git checkout -b main origin/main
    print_green "Git repository initialized and 'chrome' directory checked out."
else
    print_green "Git repository already initialized."
    
    # 3. Check if a remote repository address is being tracked, add if not
    if ! git remote | grep -q "origin"; then
        print_yellow "Adding remote origin..."
        git remote add origin https://github.com/yuuqilin/FlexFox.git
        print_green "Remote 'origin' added."
    else
        print_green "Remote 'origin' already exists."
    fi
    
    # 4. Pull the chrome directory from the remote repository
    print_yellow "Fetching latest changes for 'chrome' directory..."
    git fetch origin
    git checkout main # Ensure on the main branch
    git merge origin/main --allow-unrelated-histories || {
        print_red "Git pull failed."
        cd "$originalLocation"
        exit 1
    }
    print_green "'chrome' directory updated."
fi

# Return to original location
cd "$originalLocation"
print_green "Script completed."