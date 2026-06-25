<#
.SYNOPSIS
    FlexFox Installer - Checks, downloads and installs/updates the latest FlexFox release for Firefox.
.DESCRIPTION
    This script checks if the latest FlexFox release needs to be installed or updated in Firefox profile directories.
    It compares the local version with the latest GitHub release and handles the installation/update process.
    
.PARAMETER ProfilePath
    Uses the specified Firefox profile directory without showing the profile menu.
.PARAMETER Silent
    Uses ProfilePath or the first detected Firefox profile, skips user.js, and does not prompt for input.
#>

param (
    [string]$ProfilePath,
    [switch]$Silent
)

# Ensure script stops on error
$ErrorActionPreference = "Stop"

# Windows PowerShell does not natively bind POSIX-style double-dash options.
# Normalize the documented --profile-path and --silent forms while preserving
# PowerShell's native -ProfilePath and -Silent parameters.
$compatibilityArguments = @($args)
if (-not [string]::IsNullOrWhiteSpace($ProfilePath) -and $ProfilePath.StartsWith("--")) {
    $compatibilityArguments = @($ProfilePath) + $compatibilityArguments
    $ProfilePath = $null
}

for ($argumentIndex = 0; $argumentIndex -lt $compatibilityArguments.Count; $argumentIndex++) {
    $argument = [string]$compatibilityArguments[$argumentIndex]
    if ($argument -ieq "--silent") {
        $Silent = [switch]::Present
    }
    elseif ($argument -ieq "--profile-path") {
        if ($argumentIndex + 1 -ge $compatibilityArguments.Count -or
            [string]::IsNullOrWhiteSpace([string]$compatibilityArguments[$argumentIndex + 1])) {
            Write-Host "A directory must be provided after --profile-path." -ForegroundColor Red
            exit 1
        }
        if (-not [string]::IsNullOrWhiteSpace($ProfilePath)) {
            Write-Host "Specify the profile directory only once." -ForegroundColor Red
            exit 1
        }
        $argumentIndex++
        $ProfilePath = [string]$compatibilityArguments[$argumentIndex]
    }
    else {
        Write-Host "Unknown parameter: $argument" -ForegroundColor Red
        exit 1
    }
}

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

# Function to get the current visible terminal width
function Get-TerminalWidth {
    $terminalWidth = [int]::MaxValue
    try {
        if ($Host.UI.RawUI.WindowSize.Width -gt 0) {
            $terminalWidth = [Math]::Min($terminalWidth, $Host.UI.RawUI.WindowSize.Width)
        }
    }
    catch {}
    try {
        if ([Console]::WindowWidth -gt 0) {
            $terminalWidth = [Math]::Min($terminalWidth, [Console]::WindowWidth)
        }
    }
    catch {}

    if ($terminalWidth -ne [int]::MaxValue) {
        return [int]$terminalWidth
    }
    return 80
}

# Function to display a framed message that fits the current terminal width
function Write-FramedMessage {
    param (
        [string]$Title,
        [string[]]$Lines,
        [string]$FrameColor = "Yellow",
        [string]$TextColor = "White"
    )

    $terminalWidth = Get-TerminalWidth

    # Very narrow terminals cannot display a useful frame. Let the host wrap
    # the message naturally instead of drawing a broken dialog box.
    if ($terminalWidth -lt 35) {
        Write-ColoredText $Title $FrameColor
        foreach ($line in $Lines) {
            Write-ColoredText $line $TextColor
        }
        return
    }

    # The complete frame is content width plus four border characters. Keep
    # one terminal column unused to prevent automatic wrapping at the edge.
    $maxContentWidth = $terminalWidth - 5
    $wrappedLines = @()

    foreach ($line in $Lines) {
        if ([string]::IsNullOrEmpty($line)) {
            $wrappedLines += ""
            continue
        }

        $remainingText = $line
        while ($remainingText.Length -gt $maxContentWidth) {
            $breakIndex = $remainingText.LastIndexOf(' ', $maxContentWidth - 1)
            if ($breakIndex -le 0) {
                $breakIndex = $maxContentWidth
            }
            $wrappedLines += $remainingText.Substring(0, $breakIndex).TrimEnd()
            $remainingText = $remainingText.Substring($breakIndex).TrimStart()
        }
        $wrappedLines += $remainingText
    }

    $longestLineLength = ($wrappedLines | ForEach-Object { $_.Length } | Measure-Object -Maximum).Maximum
    $contentWidth = [Math]::Min(
        $maxContentWidth,
        [Math]::Max($Title.Length + 1, [int]$longestLineLength)
    )
    $topLabel = "─ $Title "
    $topBorder = "┌$topLabel$('─' * ($contentWidth + 2 - $topLabel.Length))┐"
    $bottomBorder = "└$('─' * ($contentWidth + 2))┘"

    Write-Host $topBorder -ForegroundColor $FrameColor
    foreach ($line in $wrappedLines) {
        Write-Host "│ " -ForegroundColor $FrameColor -NoNewline
        Write-Host $line.PadRight($contentWidth) -ForegroundColor $TextColor -NoNewline
        Write-Host " │" -ForegroundColor $FrameColor
    }
    Write-Host $bottomBorder -ForegroundColor $FrameColor
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

# Function to display a keyboard-controlled selection menu
function Show-SelectionMenu {
    param (
        [string]$Prompt,
        [string[]]$Options,
        [int]$DefaultIndex = 0,
        [switch]$DimContinuationLines,
        [switch]$SeparateOptions
    )

    if ($Options.Count -eq 0) {
        return $null
    }

    $selectedIndex = [Math]::Max(0, [Math]::Min($DefaultIndex, $Options.Count - 1))
    $cursorVisibilityAvailable = $false
    $previousCursorVisibility = $true
    try {
        $previousCursorVisibility = [Console]::CursorVisible
        [Console]::CursorVisible = $false
        $cursorVisibilityAvailable = $true
    }
    catch {
        # Some PowerShell hosts do not expose console cursor visibility.
    }

    try {
    Write-ColoredText $Prompt "White"
    Write-ColoredText ""

    # Wrap long options without discarding text. Each option keeps its own
    # collection of display lines so arrow-key redraws remain aligned.
    $availableWidth = [Math]::Max(3, (Get-TerminalWidth) - 1)
    $optionTextWidth = $availableWidth - 2
    $menuEntries = @()
    $totalMenuLines = 0

    for ($index = 0; $index -lt $Options.Count; $index++) {
        $wrappedOptionLines = @()

        $sourceLines = @($Options[$index] -split "`r?`n")
        foreach ($sourceLine in $sourceLines) {
            $remainingText = $sourceLine
            if ([string]::IsNullOrEmpty($remainingText)) {
                $wrappedOptionLines += ""
            }
            else {
                while ($remainingText.Length -gt $optionTextWidth) {
                    $breakIndex = $remainingText.LastIndexOf(' ', $optionTextWidth - 1)
                    if ($breakIndex -le 0) {
                        $breakIndex = $optionTextWidth
                    }
                    $wrappedOptionLines += $remainingText.Substring(0, $breakIndex).TrimEnd()
                    $remainingText = $remainingText.Substring($breakIndex).TrimStart()
                }
                $wrappedOptionLines += $remainingText
            }
        }

        if ($SeparateOptions -and $index -lt ($Options.Count - 1)) {
            $wrappedOptionLines += ""
        }

        $menuEntries += [PSCustomObject]@{
            OptionIndex = $index
            Lines = @($wrappedOptionLines)
        }
        $totalMenuLines += $wrappedOptionLines.Count
    }

    foreach ($entry in $menuEntries) {
        for ($lineIndex = 0; $lineIndex -lt $entry.Lines.Count; $lineIndex++) {
            $prefix = if ($lineIndex -eq 0 -and $entry.OptionIndex -eq $selectedIndex) { "> " } else { "  " }
            $line = "$prefix$($entry.Lines[$lineIndex])"
            if ($DimContinuationLines -and $lineIndex -gt 0) {
                Write-Host $line -ForegroundColor DarkGray
            }
            elseif ($entry.OptionIndex -eq $selectedIndex) {
                Write-Host $line -ForegroundColor Cyan
            }
            else {
                Write-Host $line
            }
        }
    }

    Write-Host ""
    $fullFooter = "↑/↓ Select    Enter Confirm    Esc Cancel"
    $compactFooter = "↑/↓ Select  Enter  Esc"
    $minimalFooter = "↑/↓ Enter Esc"
    $footer = if ($fullFooter.Length -le $availableWidth) {
        $fullFooter
    }
    elseif ($compactFooter.Length -le $availableWidth) {
        $compactFooter
    }
    else {
        $minimalFooter.Substring(0, [Math]::Min($minimalFooter.Length, $availableWidth))
    }
    Write-Host $footer -ForegroundColor DarkGray

    # Calculate positions after rendering because Write-Host may have scrolled
    # the console buffer while allocating the menu lines.
    $footerTop = $Host.UI.RawUI.CursorPosition.Y - 1
    $spacerTop = $footerTop - 1
    $menuTop = $spacerTop - $totalMenuLines

    while ($true) {
        $key = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
        switch ($key.VirtualKeyCode) {
            38 {
                $selectedIndex = ($selectedIndex - 1 + $Options.Count) % $Options.Count
            }
            40 {
                $selectedIndex = ($selectedIndex + 1) % $Options.Count
            }
            13 {
                # Remove the keyboard hint and leave one blank line after the menu.
                $Host.UI.RawUI.CursorPosition = New-Object System.Management.Automation.Host.Coordinates 0, $footerTop
                Write-Host (' ' * $availableWidth) -NoNewline
                $Host.UI.RawUI.CursorPosition = New-Object System.Management.Automation.Host.Coordinates 0, $spacerTop
                Write-Host ""
                return $selectedIndex
            }
            27 {
                $Host.UI.RawUI.CursorPosition = New-Object System.Management.Automation.Host.Coordinates 0, $footerTop
                Write-Host (' ' * $availableWidth) -NoNewline
                $Host.UI.RawUI.CursorPosition = New-Object System.Management.Automation.Host.Coordinates 0, $spacerTop
                Write-Host ""
                Write-ColoredText "Installation cancelled by user." "Yellow"
                return $null
            }
        }

        if ($key.VirtualKeyCode -eq 38 -or $key.VirtualKeyCode -eq 40) {
            $displayLineIndex = 0
            foreach ($entry in $menuEntries) {
                for ($lineIndex = 0; $lineIndex -lt $entry.Lines.Count; $lineIndex++) {
                    $Host.UI.RawUI.CursorPosition = New-Object System.Management.Automation.Host.Coordinates 0, ($menuTop + $displayLineIndex)
                    $prefix = if ($lineIndex -eq 0 -and $entry.OptionIndex -eq $selectedIndex) { "> " } else { "  " }
                    $line = "$prefix$($entry.Lines[$lineIndex])"
                    $paddingLength = [Math]::Max(0, $availableWidth - $line.Length)
                    if ($DimContinuationLines -and $lineIndex -gt 0) {
                        Write-Host ($line + (' ' * $paddingLength)) -ForegroundColor DarkGray -NoNewline
                    }
                    elseif ($entry.OptionIndex -eq $selectedIndex) {
                        Write-Host ($line + (' ' * $paddingLength)) -ForegroundColor Cyan -NoNewline
                    }
                    else {
                        Write-Host ($line + (' ' * $paddingLength)) -NoNewline
                    }
                    $displayLineIndex++
                }
            }
        }
    }
    }
    finally {
        if ($cursorVisibilityAvailable) {
            try { [Console]::CursorVisible = $previousCursorVisibility } catch {}
        }
    }
}

# Function to classify a Firefox profile by its directory name
function Get-FirefoxProfileChannel {
    param ([string]$ProfileName)

    if ($ProfileName -match '\.default-beta(?:-\d+)?$') { return "Beta" }
    if ($ProfileName -match '\.default-nightly(?:-\d+)?$') { return "Nightly" }
    if ($ProfileName -match '\.default-release(?:-\d+)?$') { return "Release" }
    return "Custom"
}

# Function to read active profiles from [Install...] sections in profiles.ini
function Get-ActiveFirefoxProfiles {
    param (
        [string]$ProfilesIniPath,
        [string]$FirefoxRootPath
    )

    $profiles = @()
    if (-not (Test-Path -LiteralPath $ProfilesIniPath -PathType Leaf)) {
        return $profiles
    }

    $section = ""
    foreach ($line in Get-Content -LiteralPath $ProfilesIniPath) {
        $trimmedLine = $line.Trim()
        if ($trimmedLine -match '^\[(.+)\]$') {
            $section = $matches[1]
            continue
        }
        if ($section -match '^Install[0-9A-F]+$' -and $trimmedLine -match '^Default=(.+)$') {
            $configuredPath = $matches[1].Trim() -replace '/', '\'
            $fullPath = if ([System.IO.Path]::IsPathRooted($configuredPath)) {
                [System.IO.Path]::GetFullPath($configuredPath)
            }
            else {
                [System.IO.Path]::GetFullPath((Join-Path -Path $FirefoxRootPath -ChildPath $configuredPath))
            }
            if (Test-Path -LiteralPath $fullPath -PathType Container) {
                $profiles += [PSCustomObject]@{
                    Path = $fullPath
                    Name = Split-Path -Path $fullPath -Leaf
                    Channel = Get-FirefoxProfileChannel -ProfileName (Split-Path -Path $fullPath -Leaf)
                }
            }
        }
    }

    return $profiles
}

# Function to read text input while allowing the Esc key to cancel immediately
function Read-CancellableTextInput {
    param ([string]$Prompt)

    Write-Host "$Prompt`: " -NoNewline
    $inputString = ""

    while ($true) {
        $key = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
        switch ($key.VirtualKeyCode) {
            13 {
                Write-Host ""
                return [PSCustomObject]@{ Cancelled = $false; Value = $inputString }
            }
            27 {
                Write-Host ""
                return [PSCustomObject]@{ Cancelled = $true; Value = $null }
            }
            8 {
                if ($inputString.Length -gt 0) {
                    $inputString = $inputString.Substring(0, $inputString.Length - 1)
                    Write-Host "`b `b" -NoNewline
                }
            }
            default {
                if ([int]$key.Character -ge 32) {
                    $inputString += $key.Character
                    Write-Host $key.Character -NoNewline
                }
            }
        }
    }
}

# Function to request and validate a custom Firefox profile directory
function Get-CustomProfileDirectory {
    while ($true) {
        $inputResult = Read-CancellableTextInput -Prompt "Enter the Firefox profile directory where you want to install FlexFox (press Esc to cancel)"
        if ($inputResult.Cancelled) {
            Write-ColoredText "Installation cancelled by user." "Yellow"
            return $null
        }

        $customDirectory = $inputResult.Value
        if ([string]::IsNullOrWhiteSpace($customDirectory)) {
            Write-ColoredText "The directory cannot be empty. Please enter a valid Firefox profile directory." "Red"
            continue
        }

        try {
            $resolvedDirectory = (Resolve-Path -LiteralPath $customDirectory -ErrorAction Stop).Path
            if (-not (Test-Path -LiteralPath $resolvedDirectory -PathType Container)) {
                throw "The path is not a directory."
            }
            return $resolvedDirectory
        }
        catch {
            Write-ColoredText "The directory does not exist or is not accessible: $customDirectory" "Red"
        }
    }
}

# Function for Options step - Ask user if they want to copy user.js
function Get-UserJsInstallOption {
    Write-ColoredText ""
    $userJsOptions = @(
        "No  - Configure preferences manually in 'about:config'. See 'docs/OPTIONS.md'.",
        "Yes - Copy 'user.js'. Remove it after Firefox applies the preferences."
    )
    $userJsIndex = Show-SelectionMenu -Prompt "Copy 'user.js' to this Firefox profile to apply FlexFox's default preference values in 'about:config'?" -Options $userJsOptions

    if ($null -eq $userJsIndex) {
        exit 0
    }

    return ($userJsIndex -eq 1)
}

# Ask whether to remove styles from a non-FlexFox chrome folder
function Get-ChromeCleanupOption {
    $cleanupOptions = @(
        "No  - Keep the existing 'chrome' folder and install FlexFox into it.",
        "Yes - Delete the existing 'chrome' folder before installing FlexFox."
    )
    $cleanupIndex = Show-SelectionMenu -Prompt "Another userChrome.css already exists. Clear the existing styles before installing FlexFox?" -Options $cleanupOptions

    if ($null -eq $cleanupIndex) {
        exit 0
    }

    return ($cleanupIndex -eq 1)
}

# Extract the FlexFox version from the first line of userChrome.css
function Get-FlexFoxVersion {
    param (
        [string]$FilePath
    )
    
    if (Test-Path -LiteralPath $FilePath -PathType Leaf) {
        try {
            $firstLine = Get-Content -LiteralPath $FilePath -TotalCount 1 -ErrorAction Stop
            if ($firstLine -match '^\/\*\s+FlexFox v([\d\.]+)\s+\*\/\s*$') {
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

# Function to get the latest FlexFox release asset from GitHub
function Get-LatestGitHubReleaseInfo {
    param (
        [string]$Owner,
        [string]$Repo
    )

    try {
        $apiUrl = "https://api.github.com/repos/$Owner/$Repo/releases/latest"
        Write-ColoredText "Processing GitHub API URL: $apiUrl" "Gray"

        $release = Invoke-RestMethod -Uri $apiUrl -Method Get -TimeoutSec 30 -ErrorAction Stop -Headers @{
            "Accept" = "application/vnd.github+json"
            "User-Agent" = "PowerShell-FlexFoxInstaller"
            "X-GitHub-Api-Version" = "2022-11-28"
        }

        if (-not $release -or [string]::IsNullOrWhiteSpace($release.tag_name)) {
            Write-ColoredText "Error: The latest GitHub release does not contain a valid tag." "Red"
            return $null
        }

        $tagName = [string]$release.tag_name
        $version = $tagName -replace '^v', ''
        $expectedAssetName = "FlexFox-$tagName.zip"
        $asset = $release.assets | Where-Object { $_.name -eq $expectedAssetName } | Select-Object -First 1

        if (-not $asset -or [string]::IsNullOrWhiteSpace($asset.browser_download_url)) {
            Write-ColoredText "Error: Could not find release asset '$expectedAssetName'." "Red"
            return $null
        }

        $assetSize = [long]$asset.size
        if ($assetSize -le 0) {
            Write-ColoredText "Error: Release asset '$expectedAssetName' has an invalid file size." "Red"
            return $null
        }
        Write-ColoredText "Latest release: $tagName" "Gray"
        Write-ColoredText "Download URL: $($asset.browser_download_url)" "Gray"
        Write-ColoredText "File size: $([Math]::Round($assetSize / 1KB, 2)) KB" "Gray"

        return @{
            "TagName" = $tagName
            "Version" = $version
            "AssetName" = [string]$asset.name
            "DownloadUrl" = [string]$asset.browser_download_url
            "Size" = $assetSize
            "Digest" = [string]$asset.digest
        }
    }
    catch {
        Write-ColoredText "Error getting the latest FlexFox release from GitHub: $_" "Red"
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
    $lastProgressLength = 0
    
    try {
        Write-ColoredText "Starting download from $Url" "Yellow"
        
        # Create WebClient object
        $webClient = New-Object System.Net.WebClient
        $webClient.Headers.Add("User-Agent", "PowerShell-FlexFoxUpdater")
        
        # Set up variables to track download progress
        $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
        $Global:DownloadComplete = $false
        $Global:DownloadError = $null
        $Global:DownloadCancelled = $false
        $Global:BytesReceived = 0
        $Global:TotalBytesToReceive = 0
        $Global:ProgressPercentage = 0
        
        # Set up event handlers
        $eventDownloadDataComplete = Register-ObjectEvent -InputObject $webClient -EventName DownloadFileCompleted -Action {
            if ($null -ne $EventArgs.Error) {
                $Global:DownloadError = $EventArgs.Error.Message
            }
            $Global:DownloadCancelled = $EventArgs.Cancelled
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
            
            $terminalWidth = Get-TerminalWidth
            $usableWidth = [Math]::Max(1, $terminalWidth - 1)
            $progressText = ""

            if ($totalSize -gt 0) {
                $percentage = [Math]::Min(100, [Math]::Floor(($bytesReceived / $totalSize) * 100))
                $progressBarSize = 20
                $filledSize = [Math]::Floor($percentage / (100 / $progressBarSize))
                $progressBar = "[$('#' * $filledSize)$(' ' * ($progressBarSize - $filledSize))]"
                $bytesReadable = "{0:N2} KB" -f ($bytesReceived / 1KB)
                $totalBytesReadable = "{0:N2} KB" -f ($totalSize / 1KB)

                $fullProgressText = "$spinnerChar Downloading... $progressBar $percentage% ($bytesReadable of $totalBytesReadable)"
                $barProgressText = "$spinnerChar Downloading... $progressBar $percentage%"
                $compactProgressText = "$spinnerChar Downloading... $percentage%"
                $minimalProgressText = "Downloading $percentage%"

                if ($fullProgressText.Length -le $usableWidth) {
                    $progressText = $fullProgressText
                }
                elseif ($barProgressText.Length -le $usableWidth) {
                    $progressText = $barProgressText
                }
                elseif ($compactProgressText.Length -le $usableWidth) {
                    $progressText = $compactProgressText
                }
                elseif ($minimalProgressText.Length -le $usableWidth) {
                    $progressText = $minimalProgressText
                }
            }
            else {
                $bytesReadable = "{0:N2} KB" -f ($bytesReceived / 1KB)
                $fullProgressText = "$spinnerChar Downloading... ($bytesReadable downloaded)"
                $compactProgressText = "$spinnerChar Downloading..."
                $minimalProgressText = "Downloading..."

                if ($fullProgressText.Length -le $usableWidth) {
                    $progressText = $fullProgressText
                }
                elseif ($compactProgressText.Length -le $usableWidth) {
                    $progressText = $compactProgressText
                }
                elseif ($minimalProgressText.Length -le $usableWidth) {
                    $progressText = $minimalProgressText
                }
            }

            if ($progressText.Length -gt $usableWidth) {
                $progressText = $progressText.Substring(0, $usableWidth)
            }

            $clearLength = [Math]::Min([Math]::Max($lastProgressLength, $progressText.Length), $usableWidth)
            if ($clearLength -gt 0) {
                Write-Host "`r$(' ' * $clearLength)`r$progressText" -ForegroundColor Yellow -NoNewline
            }
            $lastProgressLength = $progressText.Length

            Start-Sleep -Milliseconds 100
        }
        
        $stopwatch.Stop()

        $clearLength = [Math]::Min($lastProgressLength, [Math]::Max(1, (Get-TerminalWidth) - 1))
        if ($clearLength -gt 0) {
            Write-Host "`r$(' ' * $clearLength)`r" -NoNewline
        }
        
        if ($Global:DownloadCancelled) {
            Write-ColoredText "`rDownload was cancelled." "Red"
            return $false
        }
        elseif (-not [string]::IsNullOrWhiteSpace($Global:DownloadError)) {
            Write-ColoredText "`rDownload failed: $($Global:DownloadError)" "Red"
            return $false
        }
        elseif (Test-Path -Path $OutFile) {
            $fileSize = (Get-Item -Path $OutFile).Length
            if ($FileSize -gt 0 -and $fileSize -ne $FileSize) {
                Write-ColoredText "`rDownload failed: File size mismatch (received $fileSize of $FileSize bytes)." "Red"
                return $false
            }
            elseif ($fileSize -gt 0) {
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
        $clearLength = [Math]::Min($lastProgressLength, [Math]::Max(1, (Get-TerminalWidth) - 1))
        if ($clearLength -gt 0) {
            Write-Host "`r$(' ' * $clearLength)`r" -NoNewline
        }
        Write-ColoredText "`rError downloading file: $_" "Red"
        return $false
    }
    finally {
        if ($null -ne $eventDownloadDataComplete) {
            Unregister-Event -SourceIdentifier $eventDownloadDataComplete.Name -ErrorAction SilentlyContinue
        }
        if ($null -ne $eventDownloadProgressChanged) {
            Unregister-Event -SourceIdentifier $eventDownloadProgressChanged.Name -ErrorAction SilentlyContinue
        }
        if ($null -ne $webClient) {
            $webClient.Dispose()
        }
        if ($null -ne $stopwatch -and $stopwatch.IsRunning) {
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
    $lastProgressLength = 0
    
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
            
            $usableWidth = [Math]::Max(1, (Get-TerminalWidth) - 1)
            $fullProgressText = "$spinnerChar Extracting... $percentage% complete"
            $compactProgressText = "$spinnerChar Extracting... $percentage%"
            $minimalProgressText = "$percentage%"

            if ($fullProgressText.Length -le $usableWidth) {
                $progressText = $fullProgressText
            }
            elseif ($compactProgressText.Length -le $usableWidth) {
                $progressText = $compactProgressText
            }
            elseif ($minimalProgressText.Length -le $usableWidth) {
                $progressText = $minimalProgressText
            }
            else {
                $progressText = $minimalProgressText.Substring(0, [Math]::Min($minimalProgressText.Length, $usableWidth))
            }

            $clearLength = [Math]::Min([Math]::Max($lastProgressLength, $progressText.Length), $usableWidth)
            Write-Host "`r$(' ' * $clearLength)`r$progressText" -ForegroundColor Yellow -NoNewline
            $lastProgressLength = $progressText.Length
            
            $destinationFile = Join-Path -Path $DestinationPath -ChildPath $entry.FullName
            $destinationDir = Split-Path -Path $destinationFile -Parent
            
            if (-not [string]::IsNullOrWhiteSpace($destinationDir) -and -not (Test-Path -Path $destinationDir)) {
                New-Item -Path $destinationDir -ItemType Directory -Force | Out-Null
            }
            
            if (-not $entry.FullName.EndsWith('/') -and -not [string]::IsNullOrWhiteSpace($destinationFile)) {
                [System.IO.Compression.ZipFileExtensions]::ExtractToFile($entry, $destinationFile, $true)
            }
        }
        
        $clearLength = [Math]::Min($lastProgressLength, [Math]::Max(1, (Get-TerminalWidth) - 1))
        Write-Host "`r$(' ' * $clearLength)`r" -NoNewline
        Write-ColoredText "`rExtraction completed." "Green"
        return $true
    }
    catch {
        $clearLength = [Math]::Min($lastProgressLength, [Math]::Max(1, (Get-TerminalWidth) - 1))
        Write-Host "`r$(' ' * $clearLength)`r" -NoNewline
        Write-ColoredText "`rError extracting ZIP file: $_" "Red"
        return $false
    }
    finally {
        if ($null -ne $zip) {
            $zip.Dispose()
        }
    }
}

# Main script execution starts here
Clear-Host
$logo = @"
 ____ _              ____
|  __| |  ___ __  __|  __| ___ __  __
| |_ | | / _ \\ \/ /| |_  / _ \\ \/ /
|  _|| ||  __/ >  < |  _|| (_) |>  <
|_|  |_| \___|/_/\_\|_|   \___//_/\_\

Maximize your view, shape it your way.
https://github.com/yuuqilin/FlexFox

"@
Write-ColoredText $logo "Cyan"

# Set execution mode flags
$isSilentMode = $Silent.IsPresent
$hasProfilePathOverride = -not [string]::IsNullOrWhiteSpace($ProfilePath)

# Display silent mode info if enabled
if ($isSilentMode) {
    Write-ColoredText "Running in Silent Mode." "Yellow"
}

# Set up variables
$tempFolderPath = Join-Path -Path $env:TEMP -ChildPath "FlexFoxTemp"
$owner = "yuuqilin"
$repo = "FlexFox"

# Step 1: Build the Firefox profile list from profiles.ini and the Profiles directory
$firefoxRootPath = Join-Path -Path $env:APPDATA -ChildPath "Mozilla\Firefox"
$defaultProfilePath = Join-Path -Path $env:APPDATA -ChildPath "Mozilla\Firefox\Profiles"
$profilesIniPath = Join-Path -Path $firefoxRootPath -ChildPath "profiles.ini"
$workingDirectory = $null
$profileChoices = @()

if (-not $hasProfilePathOverride -and (Test-Path -Path $defaultProfilePath)) {
    $activeProfiles = @(Get-ActiveFirefoxProfiles -ProfilesIniPath $profilesIniPath -FirefoxRootPath $firefoxRootPath)
    $channelOrder = @{ Release = 0; Beta = 1; Nightly = 2; Custom = 3 }
    $activeProfiles = @($activeProfiles |
        Group-Object Path |
        ForEach-Object { $_.Group[0] } |
        Sort-Object @{ Expression = { $channelOrder[$_.Channel] } }, Name)

    foreach ($channel in @("Release", "Beta", "Nightly", "Custom")) {
        $channelProfiles = @($activeProfiles | Where-Object { $_.Channel -eq $channel })
        for ($index = 0; $index -lt $channelProfiles.Count; $index++) {
            $channelLabel = if ($channelProfiles.Count -gt 1) { "$channel $($index + 1)" } else { $channel }
            $profileChoices += [PSCustomObject]@{
                Label = "$channelLabel · Currently in use"
                Detail = $channelProfiles[$index].Name
                Path = $channelProfiles[$index].Path
            }
        }
    }

    $activePaths = @($activeProfiles | ForEach-Object { $_.Path })
    $otherProfiles = @(Get-ChildItem -LiteralPath $defaultProfilePath -Directory | Where-Object {
        $candidatePath = $_.FullName
        -not ($activePaths | Where-Object { $_ -ieq $candidatePath })
    } | Sort-Object @{ Expression = { $channelOrder[(Get-FirefoxProfileChannel -ProfileName $_.Name)] } }, Name)

    foreach ($profile in $otherProfiles) {
        $channel = Get-FirefoxProfileChannel -ProfileName $profile.Name
        $profileChoices += [PSCustomObject]@{
            Label = $channel
            Detail = $profile.Name
            Path = $profile.FullName
        }
    }
}

# Step 2: Use an environment override, Silent Mode default, or interactive selection
if ($hasProfilePathOverride) {
    $configuredProfilePath = $ProfilePath.Trim()
    try {
        $workingDirectory = (Resolve-Path -LiteralPath $configuredProfilePath -ErrorAction Stop).Path
        if (-not (Test-Path -LiteralPath $workingDirectory -PathType Container)) {
            throw "The path is not a directory."
        }
    }
    catch {
        Write-ColoredText "The Firefox profile directory specified by -ProfilePath does not exist or is not accessible: $configuredProfilePath" "Red"
        exit 1
    }
    Write-ColoredText "Using Firefox profile from -ProfilePath: $workingDirectory" "DarkGray"
}
elseif ($isSilentMode) {
    if ($profileChoices.Count -eq 0) {
        Write-ColoredText "No Firefox profile directories were found. Specify a valid directory with -ProfilePath." "Red"
        exit 1
    }
    $workingDirectory = $profileChoices[0].Path
    Write-ColoredText "Selected Firefox profile: $workingDirectory" "DarkGray"
}
else {
    $profileMenuOptions = @($profileChoices | ForEach-Object { "$($_.Label)`n  $($_.Detail)" }) + "Enter a custom profile directory..."
    $profileIndex = Show-SelectionMenu -Prompt "Select the Firefox profile where FlexFox will be installed:" -Options $profileMenuOptions -DimContinuationLines -SeparateOptions
    if ($null -eq $profileIndex) {
        exit 0
    }

    if ($profileIndex -eq $profileChoices.Count) {
        $workingDirectory = Get-CustomProfileDirectory
        if ($null -eq $workingDirectory) {
            exit 0
        }
    }
    else {
        $workingDirectory = $profileChoices[$profileIndex].Path
    }
}

Write-ColoredText "Working directory set to: $workingDirectory" "Green"
Write-ColoredText ""

# Variables to track installation flow
$needToInstall = $false
$hasLocalVersion = $false
$hasNonFlexFoxUserChrome = $false
$removeExistingChrome = $false
$isUpdate = $false
$installUserJs = $false
$tempFolderCreated = $false
$installationFailed = $false
$latestReleaseInfo = $null
$localVersion = $null

# Check the installed version before requesting release information
$chromeFolderPath = Join-Path -Path $workingDirectory -ChildPath "chrome"
$chromeExists = Test-Path -Path $chromeFolderPath

if (-not $chromeExists) {
    Write-ColoredText "Chrome folder not found. FlexFox installation will begin." "Yellow"
    $needToInstall = $true
}
else {
    $userChromePath = Join-Path -Path $chromeFolderPath -ChildPath "userChrome.css"
    $userChromeExists = Test-Path -Path $userChromePath

    if (-not $userChromeExists) {
        Write-ColoredText "userChrome.css not found. FlexFox installation will begin." "Yellow"
        $needToInstall = $true
    }
    else {
        $localVersion = Get-FlexFoxVersion -FilePath $userChromePath

        if ($null -eq $localVersion) {
            $needToInstall = $true
            $hasNonFlexFoxUserChrome = $true
        }
        else {
            $hasLocalVersion = $true
        }
    }
}

# An existing userChrome.css without a FlexFox version belongs to another style
if ($hasNonFlexFoxUserChrome) {
    if ($isSilentMode) {
        $removeExistingChrome = $true
    }
    else {
        $removeExistingChrome = Get-ChromeCleanupOption
    }

    if ($removeExistingChrome) {
        Write-ColoredText "The existing 'chrome' folder will be cleared. FlexFox installation will begin." "Yellow"
    }
    else {
        Write-ColoredText "The existing 'chrome' folder will be kept. FlexFox installation will begin." "Yellow"
    }
}

# A local version can be compared before asking whether to copy user.js
if ($hasLocalVersion) {
    $latestReleaseInfo = Get-LatestGitHubReleaseInfo -Owner $owner -Repo $repo
    if ($null -eq $latestReleaseInfo) {
        Write-ColoredText "Failed to get the latest FlexFox release. Cannot proceed." "Red"
        exit 1
    }
    Write-ColoredText ""

    if ($localVersion -eq $latestReleaseInfo.Version) {
        Write-ColoredText "FlexFox is already up to date ($localVersion). No update is needed." "Green"
    }
    else {
        Write-ColoredText "Versions differ (installed: $localVersion, latest: $($latestReleaseInfo.Version)). FlexFox update will begin." "Yellow"
        $needToInstall = $true
        $isUpdate = $true
    }
}

# Download and install/update if needed
if ($needToInstall) {
    if ($isSilentMode) {
        $installUserJs = $false
        Write-ColoredText "Silent Mode: user.js will not be copied." "DarkGray"
    }
    else {
        $installUserJs = Get-UserJsInstallOption
    }

    # Profiles without a detectable version only need release information after this choice
    if ($null -eq $latestReleaseInfo) {
        $latestReleaseInfo = Get-LatestGitHubReleaseInfo -Owner $owner -Repo $repo
        if ($null -eq $latestReleaseInfo) {
            Write-ColoredText "Failed to get the latest FlexFox release. Cannot proceed." "Red"
            exit 1
        }
        Write-ColoredText ""
    }

    # Create the temporary folder only when a release needs to be downloaded
    try {
        if (Test-Path -Path $tempFolderPath) {
            Remove-TempFolder -TempFolderPath $tempFolderPath
        }
        New-Item -Path $tempFolderPath -ItemType Directory -Force | Out-Null
        $tempFolderCreated = $true
        Write-ColoredText "Created temporary folder: $tempFolderPath" "Gray"
    }
    catch {
        Write-ColoredText "Failed to create temporary folder: $_" "Red"
        exit 1
    }

    # Download ZIP file
    $zipFilePath = Join-Path -Path $tempFolderPath -ChildPath $latestReleaseInfo.AssetName
    $downloadSuccess = Download-FileWithProgress -Url $latestReleaseInfo.DownloadUrl -OutFile $zipFilePath -FileSize $latestReleaseInfo.Size
    
    if (-not $downloadSuccess) {
        Write-ColoredText "Failed to download FlexFox ZIP file. Cannot proceed with installation." "Red"
        Remove-TempFolder -TempFolderPath $tempFolderPath
        exit 1
    }

    # Verify the downloaded asset before extracting it
    if (-not [string]::IsNullOrWhiteSpace($latestReleaseInfo.Digest)) {
        if ($latestReleaseInfo.Digest -notmatch '^sha256:([0-9a-fA-F]{64})$') {
            Write-ColoredText "The release asset contains an invalid SHA-256 digest. Cannot verify the download." "Red"
            Remove-TempFolder -TempFolderPath $tempFolderPath
            exit 1
        }

        $expectedHash = $latestReleaseInfo.Digest.Substring(7)
        try {
            $actualHash = (Get-FileHash -LiteralPath $zipFilePath -Algorithm SHA256 -ErrorAction Stop).Hash
        }
        catch {
            Write-ColoredText "Failed to calculate the downloaded file's SHA-256 hash: $_" "Red"
            Remove-TempFolder -TempFolderPath $tempFolderPath
            exit 1
        }

        if ($actualHash -ine $expectedHash) {
            Write-ColoredText "SHA-256 verification failed. The downloaded file may be corrupted or altered." "Red"
            Remove-TempFolder -TempFolderPath $tempFolderPath
            exit 1
        }

        Write-ColoredText "SHA-256 verification completed successfully." "Green"
    }
    else {
        Write-ColoredText "Warning: This release does not provide a SHA-256 digest. The download was verified by file size only. Proceed with caution." "Yellow"
    }
    
    # Extract ZIP file
    $extractPath = Join-Path -Path $tempFolderPath -ChildPath "extracted"
    $extractSuccess = Extract-ZipWithProgress -ZipPath $zipFilePath -DestinationPath $extractPath
    
    if (-not $extractSuccess) {
        Write-ColoredText "Failed to extract FlexFox ZIP file. Cannot proceed with installation." "Red"
        Remove-TempFolder -TempFolderPath $tempFolderPath
        exit 1
    }
    
    # Release assets contain chrome and user.js at the ZIP root
    $extractedChromePath = Join-Path -Path $extractPath -ChildPath "chrome"
    if (-not (Test-Path -Path $extractedChromePath)) {
        Write-ColoredText "Could not find 'chrome' folder in extracted content. Installation failed." "Red"
        Remove-TempFolder -TempFolderPath $tempFolderPath
        exit 1
    }
    
    # Copy chrome folder to working directory
    try {
        if ($removeExistingChrome -and (Test-Path -LiteralPath $chromeFolderPath -PathType Container)) {
            Write-ColoredText "Removing the existing 'chrome' folder..." "Yellow"
            Remove-Item -LiteralPath $chromeFolderPath -Recurse -Force -ErrorAction Stop
        }

        Write-ColoredText "Copying the 'chrome' folder to the Firefox profile..." "Yellow"
        
        # Create chrome folder if it doesn't exist
        if (-not (Test-Path -Path $chromeFolderPath)) {
            New-Item -Path $chromeFolderPath -ItemType Directory -Force | Out-Null
        }
        
        # Copy content
        Copy-Item -Path "$extractedChromePath\*" -Destination $chromeFolderPath -Recurse -Force
        
        # Check if we need to copy user.js file
        if ($installUserJs) {
            $extractedUserJsPath = Join-Path -Path $extractPath -ChildPath "user.js"
            
            if (Test-Path -Path $extractedUserJsPath) {
                Write-ColoredText "Copying user.js file to Firefox profile..." "Yellow"
                Copy-Item -Path $extractedUserJsPath -Destination $workingDirectory -Force

                # Display a framed warning about removing user.js after Firefox applies it
                $installedUserJsPath = Join-Path -Path $workingDirectory -ChildPath "user.js"
                Write-ColoredText ""
                Write-FramedMessage -Title "! Action required" -Lines @(
                    "'user.js' was copied successfully.",
                    "",
                    "1. Start or restart Firefox once to apply the preferences.",
                    "2. Delete the following file afterward:",
                    $installedUserJsPath,
                    "",
                    "If the file remains, its values will be reapplied every time Firefox starts."
                )
                Write-ColoredText ""
            }
            else {
                throw "Could not find user.js file in the extracted content."
            }
        }
        
        if ($isUpdate) {
            Write-ColoredText "FlexFox updated successfully!" "Green"
        }
        else {
            Write-ColoredText "FlexFox installed successfully!" "Green"
        }
    }
    catch {
        Write-ColoredText "Error copying files: $_" "Red"
        Write-ColoredText "Installation failed." "Red"
        $installationFailed = $true
    }
}

# Clean up the temporary folder only if this run created it
if ($tempFolderCreated) {
    Remove-TempFolder -TempFolderPath $tempFolderPath
}

if ($installationFailed) {
    exit 1
}

Write-ColoredText ""
