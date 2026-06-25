<#
.SYNOPSIS
    Updates the FlexFox 'chrome' folder in a Firefox profile using Git sparse-checkout.
.DESCRIPTION
    Initializes or updates a FlexFox-managed Git working directory while preserving
    untracked custom files and protecting local changes from destructive updates.
.PARAMETER ProfilePath
    Uses the specified Firefox profile directory without showing the profile menu.
.PARAMETER Silent
    Runs without prompting and exits when user intervention is required.
#>

param (
    [string]$ProfilePath,
    [switch]$Silent
)

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

function Write-ColoredText {
    param ([string]$Text = "", [string]$ForegroundColor = "White")
    Write-Host $Text -ForegroundColor $ForegroundColor
}

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
    if ($terminalWidth -eq [int]::MaxValue) { return 80 }
    return [Math]::Max(1, $terminalWidth)
}

function Show-SelectionMenu {
    param (
        [string]$Prompt,
        [string[]]$Options,
        [int]$DefaultIndex = 0
    )

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
    $availableWidth = [Math]::Max(3, (Get-TerminalWidth) - 1)
    $textWidth = [Math]::Max(1, $availableWidth - 2)
    $entries = @()
    $totalLines = 0

    for ($optionIndex = 0; $optionIndex -lt $Options.Count; $optionIndex++) {
        $lines = @()
        foreach ($sourceLine in @($Options[$optionIndex] -split "`r?`n")) {
            $remaining = $sourceLine
            if ([string]::IsNullOrEmpty($remaining)) {
                $lines += ""
                continue
            }
            while ($remaining.Length -gt $textWidth) {
                $breakIndex = $remaining.LastIndexOf(' ', $textWidth - 1)
                if ($breakIndex -le 0) { $breakIndex = $textWidth }
                $lines += $remaining.Substring(0, $breakIndex).TrimEnd()
                $remaining = $remaining.Substring($breakIndex).TrimStart()
            }
            $lines += $remaining
        }
        if ($optionIndex -lt ($Options.Count - 1)) { $lines += "" }
        $entries += [PSCustomObject]@{ OptionIndex = $optionIndex; Lines = @($lines) }
        $totalLines += $lines.Count
    }

    Write-ColoredText $Prompt
    Write-ColoredText ""

    foreach ($entry in $entries) {
        for ($lineIndex = 0; $lineIndex -lt $entry.Lines.Count; $lineIndex++) {
            $prefix = if ($lineIndex -eq 0 -and $entry.OptionIndex -eq $selectedIndex) { "> " } else { "  " }
            $line = "$prefix$($entry.Lines[$lineIndex])"
            if ($lineIndex -gt 0) {
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

    $footerTop = $Host.UI.RawUI.CursorPosition.Y - 1
    $spacerTop = $footerTop - 1
    $menuTop = $spacerTop - $totalLines

    while ($true) {
        $key = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
        switch ($key.VirtualKeyCode) {
            38 { $selectedIndex = ($selectedIndex - 1 + $Options.Count) % $Options.Count }
            40 { $selectedIndex = ($selectedIndex + 1) % $Options.Count }
            13 {
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
                Write-ColoredText "Update cancelled by user." "Yellow"
                return $null
            }
        }

        if ($key.VirtualKeyCode -eq 38 -or $key.VirtualKeyCode -eq 40) {
            $displayLine = 0
            foreach ($entry in $entries) {
                for ($lineIndex = 0; $lineIndex -lt $entry.Lines.Count; $lineIndex++) {
                    $Host.UI.RawUI.CursorPosition = New-Object System.Management.Automation.Host.Coordinates 0, ($menuTop + $displayLine)
                    $prefix = if ($lineIndex -eq 0 -and $entry.OptionIndex -eq $selectedIndex) { "> " } else { "  " }
                    $line = "$prefix$($entry.Lines[$lineIndex])"
                    $padding = ' ' * [Math]::Max(0, $availableWidth - $line.Length)
                    if ($lineIndex -gt 0) {
                        Write-Host "$line$padding" -ForegroundColor DarkGray -NoNewline
                    }
                    elseif ($entry.OptionIndex -eq $selectedIndex) {
                        Write-Host "$line$padding" -ForegroundColor Cyan -NoNewline
                    }
                    else {
                        Write-Host "$line$padding" -NoNewline
                    }
                    $displayLine++
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

function Get-FirefoxProfileChannel {
    param ([string]$ProfileName)
    if ($ProfileName -match '\.default-beta(?:-\d+)?$') { return "Beta" }
    if ($ProfileName -match '\.default-nightly(?:-\d+)?$') { return "Nightly" }
    if ($ProfileName -match '\.default-release(?:-\d+)?$') { return "Release" }
    return "Custom"
}

function Get-ActiveFirefoxProfiles {
    param ([string]$ProfilesIniPath, [string]$FirefoxRootPath)

    $profiles = @()
    if (-not (Test-Path -LiteralPath $ProfilesIniPath -PathType Leaf)) { return $profiles }

    $section = ""
    foreach ($line in Get-Content -LiteralPath $ProfilesIniPath) {
        $trimmed = $line.Trim()
        if ($trimmed -match '^\[(.+)\]$') {
            $section = $matches[1]
            continue
        }
        if ($section -match '^Install[0-9A-F]+$' -and $trimmed -match '^Default=(.+)$') {
            $configuredPath = $matches[1].Trim() -replace '/', '\'
            $fullPath = if ([System.IO.Path]::IsPathRooted($configuredPath)) {
                [System.IO.Path]::GetFullPath($configuredPath)
            }
            else {
                [System.IO.Path]::GetFullPath((Join-Path $FirefoxRootPath $configuredPath))
            }
            if (Test-Path -LiteralPath $fullPath -PathType Container) {
                $name = Split-Path $fullPath -Leaf
                $profiles += [PSCustomObject]@{
                    Path = $fullPath
                    Name = $name
                    Channel = Get-FirefoxProfileChannel $name
                }
            }
        }
    }
    return $profiles
}

function Read-CancellablePath {
    Write-Host "Enter the Firefox profile directory (press Esc to cancel): " -NoNewline
    $inputText = ""
    while ($true) {
        $key = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
        switch ($key.VirtualKeyCode) {
            13 { Write-Host ""; return $inputText }
            27 { Write-Host ""; return $null }
            8 {
                if ($inputText.Length -gt 0) {
                    $inputText = $inputText.Substring(0, $inputText.Length - 1)
                    Write-Host "`b `b" -NoNewline
                }
            }
            default {
                if ([int]$key.Character -ge 32) {
                    $inputText += $key.Character
                    Write-Host $key.Character -NoNewline
                }
            }
        }
    }
}

function Resolve-ProfileDirectory {
    param ([string]$Path, [switch]$PromptUntilValid)
    do {
        $candidate = if ($PromptUntilValid) { Read-CancellablePath } else { $Path }
        if ($null -eq $candidate) { return $null }
        if ([string]::IsNullOrWhiteSpace($candidate)) {
            Write-ColoredText "The profile directory cannot be empty." "Red"
        }
        else {
            try {
                $resolved = (Resolve-Path -LiteralPath $candidate.Trim() -ErrorAction Stop).Path
                if (Test-Path -LiteralPath $resolved -PathType Container) { return $resolved }
            }
            catch { }
            Write-ColoredText "The profile directory does not exist or is not accessible: $candidate" "Red"
        }
        if (-not $PromptUntilValid) { return $null }
    } while ($true)
}

function Invoke-GitCommand {
    param ([Parameter(ValueFromRemainingArguments = $true)][string[]]$Arguments)

    $previousErrorActionPreference = $ErrorActionPreference
    try {
        $ErrorActionPreference = "Continue"
        $output = @(& git @Arguments 2>&1)
        $exitCode = $LASTEXITCODE
    }
    finally {
        $ErrorActionPreference = $previousErrorActionPreference
    }

    if ($exitCode -ne 0) {
        foreach ($line in $output) {
            Write-ColoredText ([string]$line) "DarkGray"
        }
        throw "Git command failed: git $($Arguments -join ' ')"
    }
}

function Invoke-GitQuery {
    param ([string[]]$Arguments)

    $previousErrorActionPreference = $ErrorActionPreference
    try {
        $ErrorActionPreference = "Continue"
        $output = @(& git @Arguments 2>&1 | ForEach-Object { [string]$_ })
        $exitCode = $LASTEXITCODE
    }
    catch {
        $output = @([string]$_)
        $exitCode = 1
    }
    finally {
        $ErrorActionPreference = $previousErrorActionPreference
    }

    return [PSCustomObject]@{ ExitCode = $exitCode; Output = $output }
}

function Test-GitPathExists {
    param ([string]$GitPath)

    $pathResult = Invoke-GitQuery -Arguments @("rev-parse", "--git-path", $GitPath)
    if ($pathResult.ExitCode -ne 0 -or $pathResult.Output.Count -eq 0) { return $false }
    return Test-Path -LiteralPath $pathResult.Output[-1].Trim()
}

function Get-InProgressGitOperation {
    foreach ($operation in @(
        @{ Path = "MERGE_HEAD"; Name = "merge" },
        @{ Path = "rebase-merge"; Name = "rebase" },
        @{ Path = "rebase-apply"; Name = "rebase" },
        @{ Path = "CHERRY_PICK_HEAD"; Name = "cherry-pick" },
        @{ Path = "REVERT_HEAD"; Name = "revert" },
        @{ Path = "sequencer"; Name = "sequenced Git" },
        @{ Path = "BISECT_LOG"; Name = "bisect" }
    )) {
        if (Test-GitPathExists $operation.Path) { return $operation.Name }
    }
    return $null
}

function Test-TrackedGitChanges {
    $workingTreeResult = Invoke-GitQuery -Arguments @("diff", "--quiet", "--ignore-submodules", "--")
    $indexResult = Invoke-GitQuery -Arguments @("diff", "--cached", "--quiet", "--ignore-submodules", "--")

    if ($workingTreeResult.ExitCode -gt 1 -or $indexResult.ExitCode -gt 1) {
        throw "Could not inspect the Git working tree for local changes."
    }
    return $workingTreeResult.ExitCode -eq 1 -or $indexResult.ExitCode -eq 1
}

function Write-GitResultOutput {
    param ($Result)
    foreach ($line in $Result.Output) {
        if (-not [string]::IsNullOrWhiteSpace([string]$line)) {
            Write-ColoredText ([string]$line) "DarkGray"
        }
    }
}

function Invoke-SafeGitMerge {
    param ([switch]$SilentMode)

    $mergeResult = Invoke-GitQuery -Arguments @("merge", "--quiet", "--no-edit", "origin/main")
    if ($mergeResult.ExitCode -eq 0) { return }

    Write-GitResultOutput $mergeResult
    if (-not (Test-GitPathExists "MERGE_HEAD")) {
        throw "Git could not merge origin/main. The working tree was left unchanged."
    }

    if ($SilentMode) {
        $abortResult = Invoke-GitQuery -Arguments @("merge", "--abort")
        if ($abortResult.ExitCode -ne 0) {
            Write-GitResultOutput $abortResult
            throw "A merge conflict occurred, and Git could not restore the pre-merge state automatically."
        }
        throw "A merge conflict occurred. Silent Mode aborted the merge and restored the previous state."
    }

    $conflictOptions = @(
        "Abort the merge and restore the previous state.",
        "Keep the conflict state for manual resolution."
    )
    Write-ColoredText ""
    $conflictIndex = Show-SelectionMenu -Prompt "A merge conflict occurred while updating FlexFox:" -Options $conflictOptions

    if ($null -eq $conflictIndex -or $conflictIndex -eq 0) {
        $abortResult = Invoke-GitQuery -Arguments @("merge", "--abort")
        if ($abortResult.ExitCode -ne 0) {
            Write-GitResultOutput $abortResult
            throw "Git could not abort the conflicted merge. Manual recovery is required."
        }
        throw "The merge was aborted, and the previous state was restored."
    }

    $conflictedFiles = Invoke-GitQuery -Arguments @("diff", "--name-only", "--diff-filter=U")
    Write-ColoredText "The merge conflict was left in place for manual resolution." "Yellow"
    if ($conflictedFiles.ExitCode -eq 0 -and $conflictedFiles.Output.Count -gt 0) {
        Write-ColoredText "Conflicted files:" "Yellow"
        foreach ($file in $conflictedFiles.Output) {
            if (-not [string]::IsNullOrWhiteSpace([string]$file)) {
                Write-ColoredText "  $file" "DarkGray"
            }
        }
    }
    Write-ColoredText "Resolve the files, then run: git add <files>" "Yellow"
    Write-ColoredText "Complete the merge with: git commit" "Yellow"
    Write-ColoredText "Or cancel it with: git merge --abort" "Yellow"
    Write-ColoredText "Run these commands from the following directory: $(Get-Location)" "DarkGray"
    throw "Manual conflict resolution is required."
}

function Test-FlexFoxOriginUrl {
    param ([string]$Url)
    return -not [string]::IsNullOrWhiteSpace($Url) -and
        $Url.Trim() -match '(?i)^(?:https://github\.com/|git@github\.com:|ssh://git@github\.com/)yuuqilin/FlexFox(?:\.git)?/?$'
}

function Test-FlexFoxGitProfile {
    param ([string]$Path)

    if (-not (Test-Path -LiteralPath (Join-Path $Path ".git"))) { return $false }

    $rootResult = Invoke-GitQuery -Arguments @("-C", $Path, "rev-parse", "--show-toplevel")
    if ($rootResult.ExitCode -ne 0 -or $rootResult.Output.Count -eq 0) { return $false }

    try {
        $repositoryRoot = (Resolve-Path -LiteralPath $rootResult.Output[-1].Trim() -ErrorAction Stop).Path
        $profileRoot = (Resolve-Path -LiteralPath $Path -ErrorAction Stop).Path
    }
    catch { return $false }
    if ($repositoryRoot -ine $profileRoot) { return $false }

    $originResult = Invoke-GitQuery -Arguments @("-C", $Path, "remote", "get-url", "origin")
    if ($originResult.ExitCode -ne 0 -or $originResult.Output.Count -eq 0 -or
        -not (Test-FlexFoxOriginUrl $originResult.Output[-1])) {
        return $false
    }

    $markerResult = Invoke-GitQuery -Arguments @("-C", $Path, "config", "--bool", "--get", "flexfox.managed")
    if ($markerResult.ExitCode -ne 0 -or $markerResult.Output.Count -eq 0 -or
        $markerResult.Output[-1].Trim() -ine "true") {
        $setMarkerResult = Invoke-GitQuery -Arguments @("-C", $Path, "config", "flexfox.managed", "true")
        if ($setMarkerResult.ExitCode -ne 0) { return $false }
    }

    return $true
}

if ($null -eq (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-ColoredText "Git is not installed or is not available in PATH." "Red"
    exit 1
}

$gitVersionResult = Invoke-GitQuery -Arguments @("--version")
if ($gitVersionResult.ExitCode -ne 0 -or $gitVersionResult.Output.Count -eq 0 -or
    $gitVersionResult.Output[-1] -notmatch '(\d+)\.(\d+)(?:\.(\d+))?') {
    Write-ColoredText "Could not determine the installed Git version." "Red"
    exit 1
}
$gitVersion = [version]::new([int]$matches[1], [int]$matches[2], [int]$(if ($matches[3]) { $matches[3] } else { 0 }))
if ($gitVersion -lt [version]"2.25.0") {
    Write-ColoredText "Git 2.25 or later is required for sparse-checkout support. Installed version: $gitVersion" "Red"
    exit 1
}

$firefoxRoot = Join-Path $env:APPDATA "Mozilla\Firefox"
$profilesDirectory = Join-Path $firefoxRoot "Profiles"
$profilesIni = Join-Path $firefoxRoot "profiles.ini"
$profileChoices = @()

if ([string]::IsNullOrWhiteSpace($ProfilePath) -and (Test-Path -LiteralPath $profilesDirectory -PathType Container)) {
    $channelOrder = @{ Release = 0; Beta = 1; Nightly = 2; Custom = 3 }
    $activeProfiles = @(Get-ActiveFirefoxProfiles $profilesIni $firefoxRoot |
        Group-Object Path | ForEach-Object { $_.Group[0] } |
        Sort-Object @{ Expression = { $channelOrder[$_.Channel] } }, Name)

    foreach ($channel in @("Release", "Beta", "Nightly", "Custom")) {
        $channelProfiles = @($activeProfiles | Where-Object Channel -eq $channel)
        for ($index = 0; $index -lt $channelProfiles.Count; $index++) {
            $label = if ($channelProfiles.Count -gt 1) { "$channel $($index + 1)" } else { $channel }
            $profileChoices += [PSCustomObject]@{
                Label = "$label · Currently in use"
                Detail = $channelProfiles[$index].Name
                Path = $channelProfiles[$index].Path
            }
        }
    }

    $activePaths = @($activeProfiles.Path)
    $otherProfiles = @(Get-ChildItem -LiteralPath $profilesDirectory -Directory | Where-Object {
        $path = $_.FullName
        -not ($activePaths | Where-Object { $_ -ieq $path })
    } | Sort-Object @{ Expression = { $channelOrder[(Get-FirefoxProfileChannel $_.Name)] } }, Name)

    foreach ($profile in $otherProfiles) {
        $profileChoices += [PSCustomObject]@{
            Label = Get-FirefoxProfileChannel $profile.Name
            Detail = $profile.Name
            Path = $profile.FullName
        }
    }
}

if (-not [string]::IsNullOrWhiteSpace($ProfilePath)) {
    $profileDirectory = Resolve-ProfileDirectory $ProfilePath
    if ($null -eq $profileDirectory) { exit 1 }
}
else {
    $managedProfiles = @($profileChoices | Where-Object { Test-FlexFoxGitProfile $_.Path })
    if ($managedProfiles.Count -eq 1) {
        $profileDirectory = $managedProfiles[0].Path
        Write-ColoredText "Detected an existing FlexFox Git profile: $profileDirectory" "DarkGray"
    }
    elseif ($Silent.IsPresent) {
        Write-ColoredText "Silent Mode could not identify exactly one managed FlexFox Git profile. Specify the target with -ProfilePath or --profile-path." "Red"
        exit 1
    }
    else {
        $options = @($profileChoices | ForEach-Object { "$($_.Label)`n  $($_.Detail)" }) + "Enter a custom profile directory..."
        $selectedIndex = Show-SelectionMenu "Select the Firefox profile to update:" $options
        if ($null -eq $selectedIndex) { exit 0 }
        if ($selectedIndex -eq $profileChoices.Count) {
            $profileDirectory = Resolve-ProfileDirectory -PromptUntilValid
            if ($null -eq $profileDirectory) {
                Write-ColoredText "Update cancelled by user." "Yellow"
                exit 0
            }
        }
        else {
            $profileDirectory = $profileChoices[$selectedIndex].Path
        }
    }
}

Write-ColoredText "Using Firefox profile: $profileDirectory" "Green"
$originalLocation = Get-Location

try {
    Set-Location -LiteralPath $profileDirectory
    if (-not (Test-Path -LiteralPath ".git")) {
        Write-ColoredText "Initializing Git repository..." "Yellow"
        Invoke-GitCommand init --quiet
        Invoke-GitCommand remote add origin https://github.com/yuuqilin/FlexFox.git
        Invoke-GitCommand config flexfox.managed true
        Invoke-GitCommand remote set-branches origin main
        Invoke-GitCommand config remote.origin.tagOpt --no-tags
        Invoke-GitCommand sparse-checkout init --no-cone
        Invoke-GitCommand sparse-checkout set /chrome
        Write-ColoredText "Fetching the latest 'chrome' folder..." "Yellow"
        Invoke-GitCommand fetch --quiet --no-tags origin
        Invoke-GitCommand checkout --quiet --force -B main origin/main
        Invoke-GitCommand branch --set-upstream-to=origin/main main
        Invoke-GitCommand sparse-checkout reapply
        Write-ColoredText "Git repository initialized and the 'chrome' folder checked out." "Green"
    }
    else {
        Write-ColoredText "Git repository already initialized." "Green"
        $originResult = Invoke-GitQuery -Arguments @("remote", "get-url", "origin")
        if ($originResult.ExitCode -ne 0 -or $originResult.Output.Count -eq 0) {
            throw "The selected profile is already a Git repository but does not have a FlexFox origin."
        }
        elseif (-not (Test-FlexFoxOriginUrl $originResult.Output[-1])) {
            throw "The selected profile is already a Git repository whose origin is not FlexFox."
        }
        $inProgressOperation = Get-InProgressGitOperation
        if ($null -ne $inProgressOperation) {
            throw "An unfinished Git $inProgressOperation operation already exists. Complete or abort it before running this script again."
        }
        if (Test-TrackedGitChanges) {
            throw "Tracked FlexFox files contain local modifications. Commit or restore them before running the update. Untracked custom files are not affected."
        }

        Invoke-GitCommand config flexfox.managed true
        Invoke-GitCommand remote set-branches origin main
        Invoke-GitCommand config remote.origin.tagOpt --no-tags
        Invoke-GitCommand sparse-checkout init --no-cone
        Invoke-GitCommand sparse-checkout set /chrome
        Write-ColoredText "Fetching the latest 'chrome' folder..." "Yellow"
        Invoke-GitCommand fetch --quiet --no-tags --prune origin
        Invoke-GitCommand checkout --quiet main
        Invoke-SafeGitMerge -SilentMode:$Silent.IsPresent
        Invoke-GitCommand sparse-checkout reapply
        Write-ColoredText "The 'chrome' folder was updated." "Green"
    }
}
catch {
    Write-ColoredText "Update failed: $_" "Red"
    exit 1
}
finally {
    Set-Location $originalLocation
}

Write-ColoredText "Script completed." "Green"
