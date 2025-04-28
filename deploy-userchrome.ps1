<#
.SYNOPSIS
    FlexFox Deploy Script - Checks, downloads and installs/updates FlexFox for Firefox.
.DESCRIPTION
    This script checks if FlexFox needs to be installed or updated in Firefox profile directories.
    It compares local and remote versions and handles the installation/update process.
    
    Environment Variables:
    - FLEXFOX_INSTALL_MODE: When set to 'silent', the script will automatically answer 'y' to all prompts 
      and close the PowerShell window after execution.
#>

# Ensure script stops on error
$ErrorActionPreference = "Stop"

# Function to display colored text
function Write-ColoredText {
    param (
        [Parameter(Mandatory = $false)]
        [string]$Text = "",
        
        [Parameter(Mandatory = $false)]
        [string]$ForegroundColor = "White"
    )
    
    Write-Host $Text -ForegroundColor $ForegroundColor
}

# Function to clean up temporary folder
function Remove-TempFolder {
    param (
        [string]$TempFolderPath
    )
    
    if (Test-Path -Path $TempFolderPath) {
        try {
            Remove-Item -Path $TempFolderPath -Recurse -Force -ErrorAction Stop
            Write-ColoredText "Temporary folder cleaned up successfully." "Gray"
        }
        catch {
            Write-ColoredText "Failed to remove temporary folder: $_" "Red"
        }
    }
}

# Function to get user input with validation and default value
function Get-YesNoInput {
    param (
        [string]$Prompt,
        [string]$DefaultValue = "y",
        [string]$ErrorMessage = "Invalid input. Please enter 'y' or 'n'."
    )

    # Check if we're in silent mode
    if ($env:FLEXFOX_INSTALL_MODE -eq 'silent') {
        Write-Host "$Prompt (Y/n) [Y] > y" -ForegroundColor DarkGray
        return "y"
    }

    Write-Host "$Prompt " -NoNewline
    Write-Host "(Y/n) [Y] > " -ForegroundColor DarkGray -NoNewline
    $inputString = ""

    while ($true) {
        $key = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')

        if ($key.VirtualKeyCode -eq 13) {  # Enter key
            if ($inputString -eq "") {
                Write-Host $DefaultValue  # Echo default
                return $DefaultValue.ToLower()
            }
            elseif ($inputString -match "^[ynYN]$") {
                Write-Host ""  # Move to next line
                return $inputString.ToLower()
            }
            else {
                Write-Host ""  # Move to next line
                Write-Host $ErrorMessage -ForegroundColor Red
                return $null
            }
        }
        elseif ($key.VirtualKeyCode -eq 8) {  # Backspace key
            if ($inputString.Length -gt 0) {
                $inputString = $inputString.Substring(0, $inputString.Length - 1)
                Write-Host "`b `b" -NoNewline
            }
        }
        elseif ($key.Character -match "[a-zA-Z]") {
            $inputString += $key.Character
            Write-Host $key.Character -NoNewline
        }
    }
}

# Function to get branch choice input with validation
function Get-BranchInput {
    param (
        [string]$Prompt,
        [string]$ErrorMessage = "Invalid input. Please enter 'b' for Beta or 'e' for ESR."
    )
    
    Write-Host "$Prompt " -NoNewline
    Write-Host "(b/e) > " -ForegroundColor DarkGray -NoNewline
    $input = $Host.UI.ReadLine()
    
    $input = $input.ToLower()
    
    if ($input -eq "b" -or $input -eq "beta") {
        return "Beta"
    }
    elseif ($input -eq "e" -or $input -eq "esr") {
        return "ESR"
    }
    else {
        Write-ColoredText $ErrorMessage "Red"
        return $null
    }
}

# Function for Options step - Ask user if they want to install user.js
function Get-UserJsInstallOption {
    param (
        [string]$TempFolderPath
    )
    
    Write-ColoredText "===============================================" "Cyan"
    Write-ColoredText "                    Options                 " "Cyan"
    Write-ColoredText "===============================================" "Cyan"
    
    # Check if we're in silent mode
    if ($env:FLEXFOX_INSTALL_MODE -eq 'silent') {
        Write-ColoredText "Do you want to install 'user.js' file to add FlexFox default Options? (y/n) > y" "DarkGray"
        return $true
    }
    
    $userJsChoice = Get-YesNoInput -Prompt "Do you want to install 'user.js' file to add FlexFox default Options?"
    
    if ($null -eq $userJsChoice) {
        Remove-TempFolder -TempFolderPath $TempFolderPath
        exit
    }
    
    return ($userJsChoice -eq "y")
}

# Function to extract version from userChrome.css
function Get-FlexFoxVersion {
    param (
        [string]$FilePath
    )
    
    if (Test-Path -Path $FilePath) {
        try {
            $firstLine = Get-Content -Path $FilePath -TotalCount 1
            if ($firstLine -match '\/\*\s+FlexFox v([\d\.]+)\s+\*\/') {
                return $matches[1]
            }
            else {
                return $null
            }
        }
        catch {
            Write-ColoredText "Error reading file content: $_" "Red"
            return $null
        }
    }
    else {
        return $null
    }
}

# Function to get download information from GitHub API
function Get-GitHubDownloadInfo {
    param (
        [string]$Owner,
        [string]$Repo,
        [string]$Branch,
        [ValidateSet("Content", "Archive")]
        [string]$RequestType,
        [string]$FilePath = $null
    )
    
    try {
        # Construct API URL based on request type
        $apiUrl = if ($RequestType -eq "Content") {
            "https://api.github.com/repos/$Owner/$Repo/contents/$FilePath`?ref=$Branch"
        } else {
            "https://api.github.com/repos/$Owner/$Repo/zipball/$Branch"
        }
        
        Write-ColoredText "Processing GitHub API URL: $apiUrl" "Gray"
        
        # Use Invoke-RestMethod for API requests which handles JSON parsing
        if ($RequestType -eq "Content") {
            $response = Invoke-RestMethod -Uri $apiUrl -Method Get -Headers @{
                "Accept" = "application/vnd.github.v3+json"
                "User-Agent" = "PowerShell-FlexFoxUpdater"
            }
            
            if (-not $response -or -not $response.download_url) {
                Write-ColoredText "Error: Failed to get download URL from GitHub API" "Red"
                return $null
            }
            
            $downloadUrl = $response.download_url
            $fileSize = $response.size
            $actualSize = $true
        }
        else { # Archive type
            # For archives, we need to use the direct download URL
            $downloadUrl = "https://github.com/$Owner/$Repo/archive/refs/heads/$Branch.zip"
            
            # Method 1: Try to get file size via HEAD request
            $fileSize = 0
            $request = $null
            $response = $null
            $actualSize = $true
            
            try {
                $request = [System.Net.HttpWebRequest]::Create($downloadUrl)
                $request.Method = "HEAD"
                $request.UserAgent = "PowerShell-FlexFoxUpdater"
                $request.AllowAutoRedirect = $true
    
                $response = $request.GetResponse()
                $fileSize = $response.ContentLength
            }
            catch {
                Write-ColoredText "HEAD request failed, trying alternative method..." "Yellow"
                $actualSize = $false
            }
            finally {
                if ($response -ne $null) {
                    $response.Close()
                    $response.Dispose()
                }
            }
            
            # Method 2: If direct method failed, estimate size from repo stats
            if ($fileSize -le 0) {
                try {
                    $repoApiUrl = "https://api.github.com/repos/$Owner/$Repo"
                    $repoInfo = Invoke-RestMethod -Uri $repoApiUrl -Method Get -Headers @{
                        "Accept" = "application/vnd.github.v3+json"
                        "User-Agent" = "PowerShell-FlexFoxUpdater"
                    }
                    
                    # Repo size is in KB, convert to bytes and apply compression estimate
                    if ($repoInfo.size -gt 0) {
                        $compressionRatio = 0.92 # Using 92% compression ratio as requested
                        $fileSize = [long]($repoInfo.size * 1024 * $compressionRatio)
                        Write-ColoredText "Estimated archive size based on repo size" "Yellow"
                        $actualSize = $false
                    }
                }
                catch {
                    Write-ColoredText "Failed to estimate size from repo stats: $_" "Yellow"
                }
            }
        }
        
        if ([string]::IsNullOrEmpty($downloadUrl)) {
            Write-ColoredText "Error: Failed to get a valid download URL" "Red"
            return $null
        }
        
        Write-ColoredText "Download URL: $downloadUrl" "Gray"
        
        # Display file size based on whether it's actual or estimated
        if ($fileSize -gt 0) {
            $fileSizeKB = [Math]::Round($fileSize / 1KB, 2)
            if ($actualSize) {
                Write-ColoredText "File size: $fileSizeKB KB" "Gray"
            }
            else {
                Write-ColoredText "Estimated file size: $fileSizeKB KB" "Gray"
            }
        }
        else {
            Write-ColoredText "File size: Unknown" "Gray"
        }
        
        return @{
            "DownloadUrl" = $downloadUrl
            "Size" = $fileSize
        }
    }
    catch {
        Write-ColoredText "Error getting download information from GitHub: $_" "Red"
        return $null
    }
}

# Function to download file with progress animation
function Download-FileWithProgress {
    param (
        [string]$Url,
        [string]$OutFile,
        [long]$FileSize = 0
    )
    
    $webClient = $null
    $eventDownloadDataComplete = $null
    $eventDownloadProgressChanged = $null
    $stopwatch = $null
    
    try {
        Write-ColoredText "Starting download from $Url" "Yellow"
        
        # Create WebClient object
        $webClient = New-Object System.Net.WebClient
        $webClient.Headers.Add("User-Agent", "PowerShell-FlexFoxUpdater")
        
        # Set up variables to track download progress
        $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
        $downloadedBytes = 0
        $Global:DownloadComplete = $false
        $Global:BytesReceived = 0
        $Global:TotalBytesToReceive = 0
        $Global:ProgressPercentage = 0
        
        # Set up event handlers
        $eventDownloadDataComplete = Register-ObjectEvent -InputObject $webClient -EventName DownloadFileCompleted -Action {
            $Global:DownloadComplete = $true
        }
        
        # Progress Event Handler
        $eventDownloadProgressChanged = Register-ObjectEvent -InputObject $webClient -EventName DownloadProgressChanged -Action {
            $Global:BytesReceived = $EventArgs.BytesReceived
            $Global:TotalBytesToReceive = $EventArgs.TotalBytesToReceive
            $Global:ProgressPercentage = $EventArgs.ProgressPercentage
        }
        
        # Start asynchronous download
        $webClient.DownloadFileAsync([System.Uri]$Url, $OutFile)
        
        # Show progress animation
        $spinner = @('|', '/', '-', '\')
        $spinnerPos = 0
        
        while (-not $Global:DownloadComplete) {
            $spinnerChar = $spinner[$spinnerPos]
            $spinnerPos = ($spinnerPos + 1) % $spinner.Length
            
            # Calculate progress
            $bytesReceived = $Global:BytesReceived
            if ($Global:TotalBytesToReceive -gt 0) {
                $totalSize = $Global:TotalBytesToReceive
            } else {
                $totalSize = $FileSize
            }
            
            if ($totalSize -gt 0) {
                $percentage = [Math]::Min(100, [Math]::Floor(($bytesReceived / $totalSize) * 100))
                $progressBar = "["
                $progressBarSize = 20
                $filledSize = [Math]::Floor($percentage / (100 / $progressBarSize))
                $progressBar += "#" * $filledSize
                $progressBar += " " * ($progressBarSize - $filledSize)
                $progressBar += "]"
                
                $bytesReadable = "{0:N2} KB" -f ($bytesReceived / 1KB)
                $totalBytesReadable = "{0:N2} KB" -f ($totalSize / 1KB)
                
                Write-Host "`r$spinnerChar Downloading... $progressBar $percentage% ($bytesReadable of $totalBytesReadable)" -ForegroundColor Yellow -NoNewline
            }
            else {
                # If total size is unknown
                $bytesReadable = "{0:N2} KB" -f ($bytesReceived / 1KB)
                Write-Host "`r$spinnerChar Downloading... ($bytesReadable downloaded)" -ForegroundColor Yellow -NoNewline
            }
            
            Start-Sleep -Milliseconds 100
        }
        
        $stopwatch.Stop()
        
        Write-Host "`r$(' ' * 100)" -NoNewline
        
        if (Test-Path -Path $OutFile) {
            $fileSize = (Get-Item -Path $OutFile).Length
            if ($fileSize -gt 0) {
                Write-ColoredText "`rDownload completed successfully." "Green"
                return $true
            }
            else {
                Write-ColoredText "`rDownload completed but file is empty." "Red"
                return $false
            }
        }
        else {
            Write-ColoredText "`rDownload failed: File not found." "Red"
            return $false
        }
    }
    catch {
        Write-Host "`r$(' ' * 100)" -NoNewline
        Write-ColoredText "`rError downloading file: $_" "Red"
        return $false
    }
    finally {
        if ($eventDownloadDataComplete -ne $null) {
            Unregister-Event -SourceIdentifier $eventDownloadDataComplete.Name -ErrorAction SilentlyContinue
        }
        if ($eventDownloadProgressChanged -ne $null) {
            Unregister-Event -SourceIdentifier $eventDownloadProgressChanged.Name -ErrorAction SilentlyContinue
        }
        if ($webClient -ne $null) {
            $webClient.Dispose()
        }
        if ($stopwatch -ne $null -and $stopwatch.IsRunning) {
            $stopwatch.Stop()
        }
    }
}

# Function to extract ZIP file with progress animation
function Extract-ZipWithProgress {
    param (
        [string]$ZipPath,
        [string]$DestinationPath
    )
    
    $zip = $null
    
    try {
        Write-ColoredText "Extracting ZIP file..." "Yellow"
        
        # Animation setup
        $spinner = @('|', '/', '-', '\')
        $spinnerPos = 0
        
        # Expand ZIP file
        Add-Type -AssemblyName System.IO.Compression.FileSystem
        $zip = [System.IO.Compression.ZipFile]::OpenRead($ZipPath)
        $totalEntries = $zip.Entries.Count
        $currentEntry = 0
        
        # Create destination directory if it doesn't exist
        if (-not (Test-Path -Path $DestinationPath)) {
            New-Item -Path $DestinationPath -ItemType Directory -Force | Out-Null
        }
        
        foreach ($entry in $zip.Entries) {
            $currentEntry++
            $percentage = [math]::Round(($currentEntry / $totalEntries) * 100)
            $spinnerChar = $spinner[$spinnerPos]
            $spinnerPos = ($spinnerPos + 1) % $spinner.Length
            
            Write-Host "`r$spinnerChar Extracting... $percentage% complete" -ForegroundColor Yellow -NoNewline
            
            $destinationFile = Join-Path -Path $DestinationPath -ChildPath $entry.FullName
            $destinationDir = Split-Path -Path $destinationFile -Parent
            
            if (-not [string]::IsNullOrWhiteSpace($destinationDir) -and -not (Test-Path -Path $destinationDir)) {
                New-Item -Path $destinationDir -ItemType Directory -Force | Out-Null
            }
            
            if (-not $entry.FullName.EndsWith('/') -and -not [string]::IsNullOrWhiteSpace($destinationFile)) {
                [System.IO.Compression.ZipFileExtensions]::ExtractToFile($entry, $destinationFile, $true)
            }
        }
        
        Write-Host "`r$(' ' * 80)" -NoNewline
        Write-ColoredText "`rExtraction completed." "Green"
        return $true
    }
    catch {
        Write-Host "`r$(' ' * 80)" -NoNewline
        Write-ColoredText "`rError extracting ZIP file: $_" "Red"
        return $false
    }
    finally {
        if ($zip -ne $null) {
            $zip.Dispose()
        }
    }
}

# Main script execution starts here
Clear-Host
Write-ColoredText "===============================================" "Cyan"
Write-ColoredText "          ░█▀▀░█░░░█▀▀░█░█░█▀▀░█▀█░█░█" "Cyan"
Write-ColoredText "          ░█▀▀░█░░░█▀▀░▄▀▄░█▀▀░█░█░▄▀▄" "Cyan"
Write-ColoredText "          ░▀░░░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀░▀" "Cyan"
Write-ColoredText " " "Cyan"
Write-ColoredText "             FlexFox Deploy Script" "Cyan"
Write-ColoredText "===============================================" "Cyan"

# Display silent mode info if enabled
if ($env:FLEXFOX_INSTALL_MODE -eq 'silent') {
    Write-ColoredText "Running in Silent Mode - Default options will be selected automatically" "Yellow"
}

# Set up variables
$tempFolderPath = Join-Path -Path $env:TEMP -ChildPath "FlexFoxTemp"
$owner = "yuuqilin"
$repo = "FlexFox"
$branchInfo = @{
    "main" = @{
        "Description" = "Firefox Release version"
    };
    "Beta" = @{
        "Description" = "Firefox Beta/Nightly version"
    };
    "ESR" = @{
        "Description" = "Firefox ESR version"
    }
}

# Step 1: Ask user if they want to use main branch as update channel
$mainBranchChoice = Get-YesNoInput -Prompt "Do you want to use FlexFox main branch as update channel?"

if ($null -eq $mainBranchChoice) {
    Remove-TempFolder -TempFolderPath $tempFolderPath
    exit
}

# Initialize selected branch
$selectedBranch = ""

if ($mainBranchChoice -eq "y") {
    $selectedBranch = "main"
    Write-ColoredText "Selected branch: main (for Firefox Release version)" "Green"
}
else {
    # Step 2: Ask user to choose between Beta and ESR channels
    Write-ColoredText "Please select update channel:" "Cyan"
    Write-ColoredText "  [b] Beta - for Firefox Beta/Nightly version" "Cyan"
    Write-ColoredText "  [e] ESR  - for Firefox ESR version" "Cyan"
    
    $channelChoice = Get-BranchInput -Prompt "Enter your choice"
    
    if ($null -eq $channelChoice) {
        Remove-TempFolder -TempFolderPath $tempFolderPath
        exit
    }
    
    $selectedBranch = $channelChoice
    Write-ColoredText "Selected branch: $selectedBranch (for $($branchInfo[$selectedBranch].Description))" "Green"
}

# Step 3: Check if Firefox profile directory exists
$defaultProfilePath = Join-Path -Path $env:APPDATA -ChildPath "Mozilla\Firefox\Profiles"
$workingDirectory = $null

if (Test-Path -Path $defaultProfilePath) {
    # Find default-release profile
    $defaultReleaseProfile = Get-ChildItem -Path $defaultProfilePath -Directory | Where-Object { $_.Name -match '\.default-release$' } | Select-Object -First 1
    
    if ($defaultReleaseProfile) {
        $defaultProfileFullPath = $defaultReleaseProfile.FullName
        
        # Step 4: Ask user if they want to install to the found Firefox profile
        Write-ColoredText "Found Firefox profile directory:" "Cyan"
        Write-ColoredText $defaultProfileFullPath "Yellow"
        
        $useDefaultProfile = Get-YesNoInput -Prompt "Do you want to install FlexFox in this directory?"
        
        if ($null -eq $useDefaultProfile) {
            Remove-TempFolder -TempFolderPath $tempFolderPath
            exit
        }
        
        if ($useDefaultProfile -eq "y") {
            $workingDirectory = $defaultProfileFullPath
        }
    }
    else {
        Write-ColoredText "No default-release Firefox profile found." "Yellow"
    }
}

# Step 5: If no profile selected yet, ask user to input a directory
if (-not $workingDirectory) {
    $customDirectory = Read-Host -Prompt "Enter the Firefox profile directory where you want to install FlexFox"
    
    if (Test-Path -Path $customDirectory) {
        $workingDirectory = $customDirectory
    }
    else {
        Write-ColoredText "The directory you entered does not exist: $customDirectory" "Red"
        Remove-TempFolder -TempFolderPath $tempFolderPath
        exit
    }
}

Write-ColoredText "Working directory set to: $workingDirectory" "Green"

# Ensure temporary folder exists
if (-not (Test-Path -Path $tempFolderPath)) {
    try {
        New-Item -Path $tempFolderPath -ItemType Directory -Force | Out-Null
        Write-ColoredText "Created temporary folder: $tempFolderPath" "Gray"
    }
    catch {
        Write-ColoredText "Failed to create temporary folder: $_" "Red"
        exit
    }
}

# Variables to track installation flow
$needToInstall = $false
$fromOptionsStep = $false
$installUserJs = $false

# Step 6: Check if chrome folder exists
$chromeFolderPath = Join-Path -Path $workingDirectory -ChildPath "chrome"
$chromeExists = Test-Path -Path $chromeFolderPath

if (-not $chromeExists) {
    Write-ColoredText "Chrome folder does not exist. Will create it during installation." "Yellow"
    # Go to Options step
    $fromOptionsStep = $true
    $installUserJs = Get-UserJsInstallOption -TempFolderPath $tempFolderPath
    $needToInstall = $true
}
else {
    # Step 7: Check if userChrome.css exists
    $userChromePath = Join-Path -Path $chromeFolderPath -ChildPath "userChrome.css"
    $userChromeExists = Test-Path -Path $userChromePath
    
    if (-not $userChromeExists) {
        Write-ColoredText "userChrome.css does not exist. Will install FlexFox." "Yellow"
        # Go to Options step
        $fromOptionsStep = $true
        $installUserJs = Get-UserJsInstallOption -TempFolderPath $tempFolderPath
        $needToInstall = $true
    }
    else {
        # Step 8: Compare versions
        # Get CSS file info from GitHub API
        $cssPath = "chrome/userChrome.css"
        $remoteCssInfo = Get-GitHubDownloadInfo -Owner $owner -Repo $repo -Branch $selectedBranch -RequestType "Content" -FilePath $cssPath
        
        if ($null -eq $remoteCssInfo) {
            Write-ColoredText "Failed to get remote CSS file info from GitHub API. Cannot proceed." "Red"
            Remove-TempFolder -TempFolderPath $tempFolderPath
            exit
        }
        
        # Download remote userChrome.css to check version
        $remoteCssPath = Join-Path -Path $tempFolderPath -ChildPath "remote_userChrome.css"
        $downloadSuccess = Download-FileWithProgress -Url $remoteCssInfo.DownloadUrl -OutFile $remoteCssPath -FileSize $remoteCssInfo.Size
        
        if (-not $downloadSuccess) {
            Write-ColoredText "Failed to download remote userChrome.css for version check. Cannot proceed." "Red"
            Remove-TempFolder -TempFolderPath $tempFolderPath
            exit
        }
        
        # Extract versions from local and remote files
        $localVersion = Get-FlexFoxVersion -FilePath $userChromePath
        $remoteVersion = Get-FlexFoxVersion -FilePath $remoteCssPath
        
        if ($null -eq $localVersion) {
            Write-ColoredText "Local userChrome.css does not contain FlexFox version information. Will install FlexFox." "Yellow"
            # Go to Options step
            $fromOptionsStep = $true
            $installUserJs = Get-UserJsInstallOption -TempFolderPath $tempFolderPath
            $needToInstall = $true
        }
        elseif ($null -eq $remoteVersion) {
            Write-ColoredText "Remote userChrome.css does not contain proper FlexFox version information. Cannot proceed." "Red"
            Remove-TempFolder -TempFolderPath $tempFolderPath
            exit
        }
        elseif ($localVersion -ne $remoteVersion) {
            Write-ColoredText "Local version ($localVersion) differs from remote version ($remoteVersion). Will update FlexFox." "Yellow"
            $needToInstall = $true
        }
        else {
            # Step 10: Versions are the same, no need to update
            Write-ColoredText "FlexFox is already at the latest version ($localVersion). No update needed." "Green"
            $needToInstall = $false
        }
    }
}

# Step 9: Download and install/update if needed
if ($needToInstall) {
    # Get archive info from GitHub API
    $archiveInfo = Get-GitHubDownloadInfo -Owner $owner -Repo $repo -Branch $selectedBranch -RequestType "Archive"
    
    if ($null -eq $archiveInfo) {
        Write-ColoredText "Failed to get archive info from GitHub API. Cannot proceed with installation." "Red"
        Remove-TempFolder -TempFolderPath $tempFolderPath
        exit
    }
    
    # Download ZIP file
    $zipFilePath = Join-Path -Path $tempFolderPath -ChildPath "FlexFox-$selectedBranch.zip"
    $downloadSuccess = Download-FileWithProgress -Url $archiveInfo.DownloadUrl -OutFile $zipFilePath -FileSize $archiveInfo.Size
    
    if (-not $downloadSuccess) {
        Write-ColoredText "Failed to download FlexFox ZIP file. Cannot proceed with installation." "Red"
        Remove-TempFolder -TempFolderPath $tempFolderPath
        exit
    }
    
    # Extract ZIP file
    $extractPath = Join-Path -Path $tempFolderPath -ChildPath "extracted"
    $extractSuccess = Extract-ZipWithProgress -ZipPath $zipFilePath -DestinationPath $extractPath
    
    if (-not $extractSuccess) {
        Write-ColoredText "Failed to extract FlexFox ZIP file. Cannot proceed with installation." "Red"
        Remove-TempFolder -TempFolderPath $tempFolderPath
        exit
    }
    
    # Find the chrome folder in the extracted content
    $extractedFolder = Get-ChildItem -Path $extractPath -Directory | Select-Object -First 1
    if (-not $extractedFolder) {
        Write-ColoredText "Could not find extracted content. Installation failed." "Red"
        Remove-TempFolder -TempFolderPath $tempFolderPath
        exit
    }
    
    $extractedChromePath = Join-Path -Path $extractedFolder.FullName -ChildPath "chrome"
    if (-not (Test-Path -Path $extractedChromePath)) {
        Write-ColoredText "Could not find 'chrome' folder in extracted content. Installation failed." "Red"
        Remove-TempFolder -TempFolderPath $tempFolderPath
        exit
    }
    
    # Copy chrome folder to working directory
    try {
        Write-ColoredText "Copying FlexFox files to Firefox profile..." "Yellow"
        
        # Create chrome folder if it doesn't exist
        if (-not (Test-Path -Path $chromeFolderPath)) {
            New-Item -Path $chromeFolderPath -ItemType Directory -Force | Out-Null
        }
        
        # Copy content
        Copy-Item -Path "$extractedChromePath\*" -Destination $chromeFolderPath -Recurse -Force
        
        # Check if we need to copy user.js file
        if ($fromOptionsStep -and $installUserJs) {
            $extractedScriptsPath = Join-Path -Path $extractedFolder.FullName -ChildPath "scripts"
            $extractedUserJsPath = Join-Path -Path $extractedScriptsPath -ChildPath "user.js"
            
            if (Test-Path -Path $extractedUserJsPath) {
                Write-ColoredText "Copying user.js file to Firefox profile..." "Yellow"
                Copy-Item -Path $extractedUserJsPath -Destination $workingDirectory -Force
                
                # Display warning message about removing user.js after restart
                Write-ColoredText "=!===========================================!=" "Yellow"
                Write-ColoredText "⚠️  IMPORTANT: After restarting Firefox," "Yellow"
                Write-ColoredText "    remember to delete the user.js file," "Yellow"
                Write-ColoredText "    so your changes in 'about:config'" "Yellow"
                Write-ColoredText "    will be permanently saved" "Yellow"
                Write-ColoredText "    and won't be reset by user.js on restart." "Yellow"
                Write-ColoredText "===============================================" "Yellow"
            }
            else {
                Write-ColoredText "Could not find user.js file in the extracted content." "Red"
            }
        }
        
        if ($fromOptionsStep) {
            Write-ColoredText "FlexFox installed successfully!" "Green"
        }
        else {
            Write-ColoredText "FlexFox updated successfully!" "Green"
        }
    }
    catch {
        Write-ColoredText "Error copying files: $_" "Red"
        Write-ColoredText "Installation failed." "Red"
    }
}

# Clean up temporary folder before exit
Remove-TempFolder -TempFolderPath $tempFolderPath

Write-ColoredText "===============================================" "Cyan"
Write-ColoredText "            FlexFox Deploy Complete        " "Cyan"
Write-ColoredText "===============================================" "Cyan"

# If in silent mode, close the PowerShell window
if ($env:FLEXFOX_INSTALL_MODE -eq 'silent') {
    Write-ColoredText "Silent Mode enabled. Closing window in 3 seconds..." "Yellow"
    # Wait a brief moment so the user can see the completion message
    Start-Sleep -Seconds 3
    # Close the PowerShell window
    Stop-Process -Id $PID
}