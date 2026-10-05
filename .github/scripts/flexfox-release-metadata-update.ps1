[CmdletBinding()]
param(
    [switch]$PreCommit,
    [string]$Version
)

$ErrorActionPreference = "Stop"

function Get-GitText {
    param(
        [Parameter(Mandatory = $true)]
        [string[]]$Arguments,
        [switch]$AllowFailure
    )

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

function Get-FirefoxManagerRegistryPath {
    if (-not [string]::IsNullOrWhiteSpace($env:FLEXFOX_FIREFOX_CONFIG)) {
        if (-not (Test-Path -LiteralPath $env:FLEXFOX_FIREFOX_CONFIG -PathType Leaf)) {
            throw "FLEXFOX_FIREFOX_CONFIG does not point to an existing Firefox instance registry."
        }

        return (Resolve-Path -LiteralPath $env:FLEXFOX_FIREFOX_CONFIG).Path
    }

    $applicationDataRoot = [Environment]::GetFolderPath(
        [Environment+SpecialFolder]::ApplicationData
    )

    if ([string]::IsNullOrWhiteSpace($applicationDataRoot)) {
        throw "Could not determine the platform application-data directory for FlexFox Manager."
    }

    $managerDataRoot = Join-Path $applicationDataRoot "FlexFox Manager"
    $registryPath = Join-Path $managerDataRoot "firefox-instances.json"
    if (-not (Test-Path -LiteralPath $registryPath -PathType Leaf)) {
        throw "FlexFox Manager Firefox instance registry was not found. Configure a Nightly instance in FlexFox Manager first."
    }

    return (Resolve-Path -LiteralPath $registryPath).Path
}

function Get-NightlyFirefoxExecutable {
    param(
        [Parameter(Mandatory = $true)]
        [string]$RegistryPath
    )

    $registryFile = Read-Utf8File -Path $RegistryPath
    $registry = $registryFile.Content | ConvertFrom-Json

    if ($null -eq $registry.browsers) {
        throw "FlexFox Manager Firefox instance registry does not contain browser definitions."
    }

    $nightly = $registry.browsers.nightly
    if ($null -eq $nightly) {
        $nightlyCandidates = @(
            $registry.browsers.PSObject.Properties |
                ForEach-Object { $_.Value } |
                Where-Object {
                    $_.channel -eq "nightly" -or
                    $_.sourceTree -eq "firefox-main"
                }
        )

        if ($nightlyCandidates.Count -gt 0) {
            $nightly = $nightlyCandidates[0]
        }
    }

    if ($null -eq $nightly) {
        throw "No Nightly Firefox instance is configured in FlexFox Manager."
    }

    $executableValue = [string]$nightly.executable
    if (
        [string]::IsNullOrWhiteSpace($executableValue) -or
        $executableValue -eq "auto"
    ) {
        throw "The FlexFox Manager Nightly instance does not have a direct executable path."
    }

    if ([System.IO.Path]::IsPathRooted($executableValue)) {
        $executablePath = $executableValue
    } else {
        $registryDirectory = Split-Path -Parent $RegistryPath
        $executablePath = Join-Path $registryDirectory $executableValue
    }

    if (-not (Test-Path -LiteralPath $executablePath -PathType Leaf)) {
        throw "The Nightly Firefox executable configured in FlexFox Manager does not exist."
    }

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

    if ($PreCommit) {
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
        $firefoxMajorVersion = Get-FirefoxMajorVersion -ExecutablePath $nightlyExecutable
        Write-Host "Detected Nightly Firefox major version: $firefoxMajorVersion" -ForegroundColor Green
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
    Write-Error "FlexFox version update failed: $($_.Exception.Message)"
    exit 1
}
