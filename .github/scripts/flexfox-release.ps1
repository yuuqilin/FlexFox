[CmdletBinding(DefaultParameterSetName = "Update")]
param(
    [Parameter(ParameterSetName = "Update")]
    [switch]$PreCommit,
    [Parameter(Mandatory = $true, ParameterSetName = "CommitMessage")]
    [string]$CommitMessagePath,
    [Parameter(ParameterSetName = "Update")]
    [string]$Version
)

$ErrorActionPreference = "Stop"

function Get-GitText {
    param(
        [Parameter(Mandatory = $true)]
        [string[]]$Arguments,
        [switch]$AllowFailure
    )

    # Windows PowerShell 5.1 treats redirected native stderr as an error.
    $ErrorActionPreference = "Continue"
    $output = & git @Arguments 2>$null
    $exitCode = $LASTEXITCODE
    if ($exitCode -ne 0) {
        if ($AllowFailure) {
            return $null
        }
        throw "git $($Arguments -join ' ') failed with exit code $exitCode."
    }

    return [string]::Join([Environment]::NewLine, $output)
}

function Get-ReleaseVersion {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Content,
        [Parameter(Mandatory = $true)]
        [string]$SourceDescription
    )

    $pattern = '(?s)## 🆕 What''s New(?:(?!<!-- END What''s New -->).)*?🦊\s*v(\d+\.\d+\.\d+)'
    $match = [regex]::Match($Content, $pattern)
    if (-not $match.Success) {
        throw "Could not find the FlexFox release version in $SourceDescription."
    }

    return $match.Groups[1].Value
}

function Test-VersionFormat {
    param([string]$Value)
    return $Value -match '^\d+\.\d+\.\d+$'
}

function Read-Utf8File {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path
    )

    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
        throw "Required file does not exist: $Path"
    }

    $bytes = [System.IO.File]::ReadAllBytes($Path)
    $hasBom = (
        $bytes.Length -ge 3 -and
        $bytes[0] -eq 0xEF -and
        $bytes[1] -eq 0xBB -and
        $bytes[2] -eq 0xBF
    )

    $offset = if ($hasBom) { 3 } else { 0 }
    $length = $bytes.Length - $offset
    $content = [System.Text.Encoding]::UTF8.GetString($bytes, $offset, $length)

    return [PSCustomObject]@{
        Content = $content
        HasBom = $hasBom
    }
}

function Write-Utf8File {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path,
        [Parameter(Mandatory = $true)]
        [string]$Content,
        [Parameter(Mandatory = $true)]
        [bool]$HasBom
    )

    $encoding = New-Object System.Text.UTF8Encoding($HasBom)
    [System.IO.File]::WriteAllText($Path, $Content, $encoding)
}

function Replace-RequiredPattern {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Content,
        [Parameter(Mandatory = $true)]
        [string]$Description,
        [Parameter(Mandatory = $true)]
        [string]$Pattern,
        [Parameter(Mandatory = $true)]
        [string]$Replacement,
        [Parameter(Mandatory = $true)]
        [int]$ExpectedMatches
    )

    $matches = [regex]::Matches($Content, $Pattern)
    if ($matches.Count -ne $ExpectedMatches) {
        throw "$Description expected $ExpectedMatches version match(es), but found $($matches.Count)."
    }

    return [regex]::Replace($Content, $Pattern, $Replacement)
}

function Replace-RequiredPatternInSection {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Content,
        [Parameter(Mandatory = $true)]
        [string]$Description,
        [Parameter(Mandatory = $true)]
        [string]$SectionStart,
        [Parameter(Mandatory = $true)]
        [string]$SectionEnd,
        [Parameter(Mandatory = $true)]
        [string]$Pattern,
        [Parameter(Mandatory = $true)]
        [string]$Replacement,
        [Parameter(Mandatory = $true)]
        [int]$ExpectedMatches
    )

    $startIndex = $Content.IndexOf($SectionStart, [System.StringComparison]::Ordinal)
    if ($startIndex -lt 0) {
        throw "$Description is missing the section start marker: $SectionStart"
    }

    $endIndex = $Content.IndexOf($SectionEnd, $startIndex, [System.StringComparison]::Ordinal)
    if ($endIndex -lt 0) {
        throw "$Description is missing the section end marker: $SectionEnd"
    }

    $sectionContent = $Content.Substring($startIndex, $endIndex - $startIndex)
    $updatedSection = Replace-RequiredPattern -Content $sectionContent -Description $Description -Pattern $Pattern -Replacement $Replacement -ExpectedMatches $ExpectedMatches

    return (
        $Content.Substring(0, $startIndex) +
        $updatedSection +
        $Content.Substring($endIndex)
    )
}

function Assert-NoUnstagedChanges {
    param(
        [Parameter(Mandatory = $true)]
        [string[]]$Paths
    )

    $dirtyPaths = @()
    foreach ($path in $Paths) {
        & git diff --quiet -- $path
        $exitCode = $LASTEXITCODE
        if ($exitCode -eq 1) {
            $dirtyPaths += $path
        } elseif ($exitCode -ne 0) {
            throw "Failed to inspect unstaged changes for $path."
        }
    }

    if ($dirtyPaths.Count -gt 0) {
        throw (
            "Release version update would stage existing unstaged changes in: " +
            ($dirtyPaths -join ", ") +
            ". Stage, commit, or revert those changes first."
        )
    }
}

function Expand-ManagerPath {
    param([string]$Value)
    $path = [Environment]::ExpandEnvironmentVariables($Value)
    if ($path -eq "~" -or $path.StartsWith("~/") -or $path.StartsWith("~\")) {
        $path = Join-Path ([Environment]::GetFolderPath([Environment+SpecialFolder]::UserProfile)) $path.Substring(1).TrimStart('\', '/')
    }
    return $path
}

function Get-FirefoxManagerRegistryPath {
    if (-not [string]::IsNullOrWhiteSpace($env:FLEXFOX_FIREFOX_CONFIG)) {
        $registryPath = Expand-ManagerPath $env:FLEXFOX_FIREFOX_CONFIG
    } else {
        if (-not [string]::IsNullOrWhiteSpace($env:FLEXFOX_MANAGER_DATA_DIR)) {
            $managerDataRoot = Expand-ManagerPath $env:FLEXFOX_MANAGER_DATA_DIR
        } else {
            $applicationDataRoot = $env:APPDATA
            if ([string]::IsNullOrWhiteSpace($applicationDataRoot)) {
                $applicationDataRoot = [Environment]::GetFolderPath([Environment+SpecialFolder]::ApplicationData)
            }
            if ([string]::IsNullOrWhiteSpace($applicationDataRoot)) { return $null }
            # Match Manager's normalization of inherited MSIX roaming paths.
            $packaged = [regex]::Match($applicationDataRoot.Replace('/', '\'), '(?i)^(.*\\AppData)\\Local\\Packages\\.*\\LocalCache\\Roaming$')
            if ($packaged.Success) {
                $applicationDataRoot = Join-Path $packaged.Groups[1].Value "Roaming"
            }
            $managerDataRoot = Join-Path $applicationDataRoot "FlexFox Manager"
        }
        $registryPath = Join-Path $managerDataRoot "firefox-instances.json"
    }
    if (-not (Test-Path -LiteralPath $registryPath -PathType Leaf)) { return $null }
    return (Resolve-Path -LiteralPath $registryPath).Path
}

function Get-NightlyFirefoxExecutable {
    param([string]$RegistryPath)
    if ([string]::IsNullOrWhiteSpace($RegistryPath)) { return $null }
    $registryFile = Read-Utf8File -Path $RegistryPath
    $registry = $registryFile.Content | ConvertFrom-Json
    if ($registry -isnot [PSCustomObject]) { throw "Firefox instance registry must be an object." }
    if ($null -eq $registry.browsers) { return $null }
    if ($registry.browsers -isnot [PSCustomObject]) {
        throw "Firefox instance registry browser definitions must be objects."
    }
    foreach ($browser in $registry.browsers.PSObject.Properties) {
        if ($browser.Value -isnot [PSCustomObject]) {
            throw "Firefox instance registry browser definitions must be objects."
        }
    }
    $nightly = $registry.browsers.nightly
    if ($null -eq $nightly) {
        $nightly = $registry.browsers.PSObject.Properties | ForEach-Object { $_.Value } |
            Where-Object { $_.channel -eq "nightly" -or $_.sourceTree -eq "firefox-main" } |
            Select-Object -First 1
    }
    if ($null -eq $nightly) { return $null }
    if ($null -ne $nightly.launcher) {
        if ($nightly.launcher -isnot [PSCustomObject]) { throw "Nightly launcher must be an object." }
        if ($nightly.launcher.type -ne "executable") { return $null }
        $executableValue = $nightly.launcher.path
    } else {
        $executableValue = $nightly.executable
    }
    if ($null -eq $executableValue) { return $null }
    if ($executableValue -isnot [string]) { throw "Nightly executable path must be a string." }
    if ([string]::IsNullOrWhiteSpace($executableValue) -or $executableValue -eq "auto") { return $null }
    $executablePath = Expand-ManagerPath $executableValue
    if (-not [System.IO.Path]::IsPathRooted($executablePath)) {
        $executablePath = Join-Path (Split-Path -Parent $RegistryPath) $executablePath
    }
    if (-not (Test-Path -LiteralPath $executablePath -PathType Leaf)) { return $null }
    return (Resolve-Path -LiteralPath $executablePath).Path
}

function Get-FirefoxMajorVersion {
    param(
        [Parameter(Mandatory = $true)]
        [string]$ExecutablePath
    )

    $versionText = $null

    try {
        $versionInfo = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($ExecutablePath)
        if (-not [string]::IsNullOrWhiteSpace($versionInfo.ProductVersion)) {
            $versionText = $versionInfo.ProductVersion
        } elseif (-not [string]::IsNullOrWhiteSpace($versionInfo.FileVersion)) {
            $versionText = $versionInfo.FileVersion
        }
    } catch {
        $versionText = $null
    }

    if ([string]::IsNullOrWhiteSpace($versionText)) {
        $versionOutput = & $ExecutablePath --version 2>$null
        if ($LASTEXITCODE -ne 0) {
            throw "Could not read the configured Nightly Firefox version."
        }
        $versionText = [string]::Join(" ", $versionOutput)
    }

    $versionMatch = [regex]::Match($versionText, '(?<!\d)(\d+)(?:\.\d+)*(?:[A-Za-z]\d+)?')
    if (-not $versionMatch.Success) {
        throw "Could not determine the Nightly Firefox major version."
    }

    return $versionMatch.Groups[1].Value
}

try {
    $repoRoot = (Get-GitText -Arguments @("rev-parse", "--show-toplevel")).Trim()
    Set-Location $repoRoot

    $changelogRelativePath = "docs/CHANGELOG.md"
    $targetRelativePaths = @(
        "chrome/userChrome.css",
        "chrome/content/uc-aboutconfig.css",
        "README.md",
        "README_日本語版.md",
        "README_简体中文.md"
    )
    $shouldUpdateFirefoxBadge = $false

    if ($PreCommit -or $PSCmdlet.ParameterSetName -eq "CommitMessage") {
        & git diff --cached --quiet -- $changelogRelativePath
        $diffExitCode = $LASTEXITCODE
        if ($diffExitCode -eq 0) {
            exit 0
        }
        if ($diffExitCode -ne 1) {
            throw "Failed to inspect the staged CHANGELOG."
        }

        $stagedChangelog = Get-GitText -Arguments @("show", ":$changelogRelativePath")
        $stagedVersion = Get-ReleaseVersion -Content $stagedChangelog -SourceDescription "the staged docs/CHANGELOG.md"

        $headChangelog = Get-GitText -Arguments @("show", "HEAD:$changelogRelativePath") -AllowFailure
        $headVersion = $null
        if ($null -ne $headChangelog) {
            $headVersion = Get-ReleaseVersion -Content $headChangelog -SourceDescription "HEAD:docs/CHANGELOG.md"
        }

        if ($stagedVersion -eq $headVersion) {
            exit 0
        }

        if ($PSCmdlet.ParameterSetName -eq "CommitMessage") {
            $messagePath = (Resolve-Path -LiteralPath $CommitMessagePath).Path
            $messageLines = [System.IO.File]::ReadAllLines($messagePath, [System.Text.Encoding]::UTF8)
            $subject = if ($messageLines.Count -gt 0) { $messageLines[0].Trim() } else { "" }
            $expectedSubject = "v$stagedVersion"

            if ($subject -ne $expectedSubject) {
                throw "Release commit subject must be '$expectedSubject' (got '$subject')."
            }

            Write-Host "FlexFox release commit subject verified: $expectedSubject" -ForegroundColor Green
            exit 0
        }

        if (-not [string]::IsNullOrWhiteSpace($Version) -and $Version -ne $stagedVersion) {
            throw "Requested version $Version does not match staged CHANGELOG version $stagedVersion."
        }

        $Version = $stagedVersion
        $shouldUpdateFirefoxBadge = $true
        Assert-NoUnstagedChanges -Paths $targetRelativePaths
    } elseif ([string]::IsNullOrWhiteSpace($Version)) {
        $changelogFile = Read-Utf8File -Path (Join-Path $repoRoot $changelogRelativePath)
        $Version = Get-ReleaseVersion -Content $changelogFile.Content -SourceDescription "docs/CHANGELOG.md"

        $headChangelog = Get-GitText -Arguments @("show", "HEAD:$changelogRelativePath") -AllowFailure
        $headVersion = $null
        if ($null -ne $headChangelog) {
            $headVersion = Get-ReleaseVersion -Content $headChangelog -SourceDescription "HEAD:docs/CHANGELOG.md"
        }

        $shouldUpdateFirefoxBadge = ($Version -ne $headVersion)
    }

    if (-not (Test-VersionFormat $Version)) {
        throw "Invalid version format '$Version'. Expected X.Y.Z."
    }

    Write-Host "Updating FlexFox version references to $Version..." -ForegroundColor Green

    $firefoxMajorVersion = $null
    if ($shouldUpdateFirefoxBadge) {
        $registryPath = Get-FirefoxManagerRegistryPath
        $nightlyExecutable = Get-NightlyFirefoxExecutable -RegistryPath $registryPath
        if ([string]::IsNullOrWhiteSpace($nightlyExecutable)) {
            $shouldUpdateFirefoxBadge = $false
            Write-Warning "Nightly is not configured or its executable is missing; Firefox badges unchanged."
        } else {
            $firefoxMajorVersion = Get-FirefoxMajorVersion -ExecutablePath $nightlyExecutable
            Write-Host "Detected Nightly Firefox major version: $firefoxMajorVersion" -ForegroundColor Green
        }
    }

    # Validate and prepare every required update before writing any file.
    $updates = @()

    $userChromePath = Join-Path $repoRoot "chrome/userChrome.css"
    $userChromeFile = Read-Utf8File -Path $userChromePath
    $userChromeContent = Replace-RequiredPattern -Content $userChromeFile.Content -Description "chrome/userChrome.css" -Pattern '(/\*\s*FlexFox v)(\d+\.\d+\.\d+)(\s*\*/)' -Replacement ('${1}' + $Version + '${3}') -ExpectedMatches 1
    $updates += [PSCustomObject]@{
        Path = $userChromePath
        RelativePath = "chrome/userChrome.css"
        Content = $userChromeContent
        HasBom = $userChromeFile.HasBom
    }

    $aboutConfigPath = Join-Path $repoRoot "chrome/content/uc-aboutconfig.css"
    $aboutConfigFile = Read-Utf8File -Path $aboutConfigPath
    $aboutConfigContent = Replace-RequiredPatternInSection -Content $aboutConfigFile.Content -Description "uc-aboutconfig.css version info 1" -SectionStart "/* !-- Start of version info 1 -- */" -SectionEnd "/* !-- End of version info 1 -- */" -Pattern '(content:\s*"🎉\s*FlexFox v)(\d+\.\d+\.\d+)(\s)' -Replacement ('${1}' + $Version + '${3}') -ExpectedMatches 4
    $aboutConfigContent = Replace-RequiredPatternInSection -Content $aboutConfigContent -Description "uc-aboutconfig.css version info 2" -SectionStart "/* !-- Start of version info 2 -- */" -SectionEnd "/* !-- End of version info 2 -- */" -Pattern '(\\A\\Av)(\d+\.\d+\.\d+)(\\A\\A)' -Replacement ('${1}' + $Version + '${3}') -ExpectedMatches 1
    $updates += [PSCustomObject]@{
        Path = $aboutConfigPath
        RelativePath = "chrome/content/uc-aboutconfig.css"
        Content = $aboutConfigContent
        HasBom = $aboutConfigFile.HasBom
    }

    $readmeTargets = @(
        @{
            RelativePath = "README.md"
            Description = "README.md"
            SectionStart = "## 🆕 What's New"
            Pattern = '(\*\*🦊 Latest:\s*v)(\d+\.\d+\.\d+)(\*\*\s*—)'
        },
        @{
            RelativePath = "README_日本語版.md"
            Description = "README_日本語版.md"
            SectionStart = "## 🆕 最新情報"
            Pattern = '(\*\*🦊 最新バージョン:\s*v)(\d+\.\d+\.\d+)(\*\*\s*—)'
        },
        @{
            RelativePath = "README_简体中文.md"
            Description = "README_简体中文.md"
            SectionStart = "## 🆕 更新内容"
            Pattern = '(\*\*🦊 最新版本：v)(\d+\.\d+\.\d+)(\*\*\s*—)'
        }
    )

    foreach ($target in $readmeTargets) {
        $path = Join-Path $repoRoot $target.RelativePath
        $file = Read-Utf8File -Path $path
        $content = Replace-RequiredPatternInSection -Content $file.Content -Description $target.Description -SectionStart $target.SectionStart -SectionEnd "<!-- END What's New -->" -Pattern $target.Pattern -Replacement ('${1}' + $Version + '${3}') -ExpectedMatches 1

        if ($shouldUpdateFirefoxBadge) {
            $content = Replace-RequiredPattern -Content $content -Description "$($target.Description) Firefox badge" -Pattern '(Last%20tested%20Firefox-v)(\d+)(-orange\?logo=firefox)' -Replacement ('${1}' + $firefoxMajorVersion + '${3}') -ExpectedMatches 1
        }
        $updates += [PSCustomObject]@{
            Path = $path
            RelativePath = $target.RelativePath
            Content = $content
            HasBom = $file.HasBom
        }
    }

    foreach ($update in $updates) {
        Write-Utf8File -Path $update.Path -Content $update.Content -HasBom $update.HasBom
        Write-Host "Updated $($update.RelativePath)" -ForegroundColor Green
    }

    if ($PreCommit) {
        & git add -- @targetRelativePaths
        if ($LASTEXITCODE -ne 0) {
            throw "Failed to stage the updated FlexFox version files."
        }
        Write-Host "Staged FlexFox version updates for v$Version." -ForegroundColor Green
    }

    Write-Host "FlexFox version update completed successfully: v$Version" -ForegroundColor Green
    exit 0
} catch {
    Write-Error "FlexFox release check failed: $($_.Exception.Message)"
    exit 1
}
