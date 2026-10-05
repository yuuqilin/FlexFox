[CmdletBinding()]
param()

$ErrorActionPreference = "Stop"

try {
    $repoRoot = (& git rev-parse --show-toplevel 2>$null)
    if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($repoRoot)) {
        throw "This script must be run from inside the FlexFox Git repository."
    }

    $repoRoot = $repoRoot.Trim()
    Set-Location $repoRoot

    & git config --local core.hooksPath .github/hooks
    if ($LASTEXITCODE -ne 0) {
        throw "Failed to configure core.hooksPath."
    }

    if ($IsLinux -or $IsMacOS) {
        & chmod +x .github/hooks/pre-commit .github/hooks/commit-msg
        if ($LASTEXITCODE -ne 0) {
            throw "Failed to mark the Git hook scripts as executable."
        }
    }

    Write-Host "FlexFox Git hooks enabled: .github/hooks" -ForegroundColor Green
} catch {
    Write-Error $_.Exception.Message
    exit 1
}

exit 0
