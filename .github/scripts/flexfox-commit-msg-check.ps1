[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$CommitMessagePath
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

try {
    $repoRoot = (Get-GitText -Arguments @("rev-parse", "--show-toplevel")).Trim()
    Set-Location $repoRoot

    $changelogPath = "docs/CHANGELOG.md"
    & git diff --cached --quiet -- $changelogPath
    $diffExitCode = $LASTEXITCODE
    if ($diffExitCode -eq 0) {
        exit 0
    }
    if ($diffExitCode -ne 1) {
        throw "Failed to inspect the staged CHANGELOG."
    }

    $stagedChangelog = Get-GitText -Arguments @("show", ":$changelogPath")
    $stagedVersion = Get-ReleaseVersion -Content $stagedChangelog -SourceDescription "the staged docs/CHANGELOG.md"

    $headChangelog = Get-GitText -Arguments @("show", "HEAD:$changelogPath") -AllowFailure
    $headVersion = $null
    if ($null -ne $headChangelog) {
        $headVersion = Get-ReleaseVersion -Content $headChangelog -SourceDescription "HEAD:docs/CHANGELOG.md"
    }

    if ($stagedVersion -eq $headVersion) {
        exit 0
    }

    $messagePath = (Resolve-Path -LiteralPath $CommitMessagePath).Path
    $messageLines = [System.IO.File]::ReadAllLines($messagePath, [System.Text.Encoding]::UTF8)
    $subject = if ($messageLines.Count -gt 0) { $messageLines[0].Trim() } else { "" }
    $expectedSubject = "v$stagedVersion"

    if ($subject -ne $expectedSubject) {
        throw "Release commit subject must be '$expectedSubject' (got '$subject')."
    }

    Write-Host "FlexFox release commit subject verified: $expectedSubject" -ForegroundColor Green
    exit 0
} catch {
    Write-Error "FlexFox commit-message validation failed: $($_.Exception.Message)"
    exit 1
}
