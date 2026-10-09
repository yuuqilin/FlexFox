# Only a proven unchanged release version may bypass the release checks.
flexfox_release_version() {
    # Keep Git's status in the stream so a failed read cannot look unchanged.
    # Map NUL to SOH: BSD awk cannot reliably preserve NUL in strings.
    {
        git -C "$repo_root" show "$1" 2>/dev/null
        printf '\n%s\n' "$?"
    } | LC_ALL=C tr '\000' '\001' | LC_ALL=C awk '
        { if (NR > 1) text = text previous "\n"; previous = $0 }
        END {
            if (previous != "0" || index(text, sprintf("%c", 1))) exit 1
            start = "## 🆕 What\047s New"
            stop = "<!-- END What\047s New -->"
            pos = index(text, start)
            if (!pos) exit 1
            text = substr(text, pos + length(start))
            pos = index(text, stop)
            if (pos) text = substr(text, 1, pos - 1)
            pos = index(text, "🦊")
            if (!pos) exit 1
            text = substr(text, pos + length("🦊"))
            # shortcut: unusual first-fox layouts use the full parser; extend with matching tests.
            if (!match(text, /^[[:space:]]*v[0-9]+\.[0-9]+\.[0-9]+([[:space:][:punct:]]|$)/)) exit 1
            version = substr(text, 1, RLENGTH)
            sub(/^[[:space:]]*v/, "", version)
            sub(/[[:space:][:punct:]]$/, "", version)
            print version
        }
    '
}

flexfox_release_unchanged() {
    git -C "$repo_root" diff --cached --quiet --no-ext-diff --no-textconv -- docs/CHANGELOG.md
    case $? in
        0) return 0 ;;
        1) ;;
        *) return 1 ;;
    esac

    staged_version=$(flexfox_release_version :docs/CHANGELOG.md) || return 1
    head_version=$(flexfox_release_version HEAD:docs/CHANGELOG.md) || return 1
    [ "$staged_version" = "$head_version" ]
}

flexfox_run_release_hook() {
    action="$1"
    shift
    case "$(uname -s)" in
        MINGW*|MSYS*|CYGWIN*)
            if command -v pwsh >/dev/null 2>&1; then
                powershell_cmd=pwsh
            elif command -v powershell.exe >/dev/null 2>&1; then
                powershell_cmd=powershell.exe
            else
                echo "FlexFox $action: PowerShell was not found." >&2
                return 1
            fi
            if [ "$action" = pre-commit ]; then
                "$powershell_cmd" -NoProfile -ExecutionPolicy Bypass -File "$repo_root/.github/scripts/flexfox-release.ps1" -PreCommit
            else
                "$powershell_cmd" -NoProfile -ExecutionPolicy Bypass -File "$repo_root/.github/scripts/flexfox-release.ps1" -CommitMessagePath "$1"
            fi
            ;;
        Darwin|Linux)
            if ! command -v python3 >/dev/null 2>&1; then
                echo "FlexFox $action: Python 3 is required for release commits." >&2
                return 1
            fi
            if [ "$action" = pre-commit ]; then
                python3 "$repo_root/.github/scripts/flexfox-release.py" --pre-commit
            else
                python3 "$repo_root/.github/scripts/flexfox-release.py" --commit-message "$1"
            fi
            ;;
        *) echo "FlexFox $action: unsupported operating system." >&2; return 1 ;;
    esac
}
