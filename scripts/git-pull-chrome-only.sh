#!/usr/bin/env bash

set -e

print_yellow() { printf '\033[33m%s\033[0m\n' "$1"; }
print_green()  { printf '\033[32m%s\033[0m\n' "$1"; }
print_red()    { printf '\033[31m%s\033[0m\n' "$1"; }
print_dim()    { printf '\033[90m%s\033[0m\n' "$1"; }

usage() {
    printf 'Usage: %s [-ProfilePath|--profile-path <directory>] [-Silent|--silent]\n' "$(basename "$0")"
}

profile_path=""
silent_mode=false
while [ "$#" -gt 0 ]; do
    case "$1" in
        -ProfilePath|--profile-path)
            if [ "$#" -lt 2 ] || [ -z "$2" ]; then
                print_red "A directory must be provided after $1."
                exit 1
            fi
            profile_path="$2"
            shift 2
            ;;
        -Silent|--silent)
            silent_mode=true
            shift
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        *)
            print_red "Unknown parameter: $1"
            usage
            exit 1
            ;;
    esac
done

if ! command -v git >/dev/null 2>&1; then
    print_red "Git is not installed or is not available in PATH."
    exit 1
fi

git_version_text=$(git --version 2>/dev/null || true)
if [[ "$git_version_text" =~ ([0-9]+)\.([0-9]+) ]]; then
    git_major=${BASH_REMATCH[1]}
    git_minor=${BASH_REMATCH[2]}
else
    print_red "Could not determine the installed Git version."
    exit 1
fi
if [ "$git_major" -lt 2 ] || { [ "$git_major" -eq 2 ] && [ "$git_minor" -lt 25 ]; }; then
    print_red "Git 2.25 or later is required for sparse-checkout support. Installed version: $git_version_text"
    exit 1
fi

original_location=$(pwd)
trap 'cd "$original_location"' EXIT

classify_profile() {
    local name="$1"
    if [[ "$name" =~ \.default-beta(-[0-9]+)?$ ]]; then printf 'Beta'; return; fi
    if [[ "$name" =~ \.default-nightly(-[0-9]+)?$ ]]; then printf 'Nightly'; return; fi
    if [[ "$name" =~ \.default-release(-[0-9]+)?$ ]]; then printf 'Release'; return; fi
    printf 'Custom'
}

contains_path() {
    local target="$1"
    shift
    local item
    for item in "$@"; do
        [ "$item" = "$target" ] && return 0
    done
    return 1
}

is_flexfox_origin() {
    local normalized
    normalized=$(printf '%s' "$1" | tr '[:upper:]' '[:lower:]')
    case "$normalized" in
        https://github.com/yuuqilin/flexfox|https://github.com/yuuqilin/flexfox.git|\
        git@github.com:yuuqilin/flexfox|git@github.com:yuuqilin/flexfox.git|\
        ssh://git@github.com/yuuqilin/flexfox|ssh://git@github.com/yuuqilin/flexfox.git)
            return 0
            ;;
    esac
    return 1
}

is_flexfox_git_profile() {
    local path="$1"
    local repository_root profile_root origin marker

    [ -e "$path/.git" ] || return 1
    repository_root=$(git -C "$path" rev-parse --show-toplevel 2>/dev/null) || return 1
    repository_root=$(cd "$repository_root" 2>/dev/null && pwd -P) || return 1
    profile_root=$(cd "$path" 2>/dev/null && pwd -P) || return 1
    [ "$repository_root" = "$profile_root" ] || return 1

    origin=$(git -C "$path" remote get-url origin 2>/dev/null) || return 1
    is_flexfox_origin "$origin" || return 1

    marker=$(git -C "$path" config --bool --get flexfox.managed 2>/dev/null || true)
    if [ "$marker" != "true" ]; then
        git -C "$path" config flexfox.managed true >/dev/null 2>&1 || return 1
    fi
    return 0
}

resolve_ini_path() {
    local root="$1"
    local configured="$2"
    configured=${configured//$'\r'/}
    configured=${configured//\\//}
    case "$configured" in
        /*) printf '%s\n' "$configured" ;;
        *)  printf '%s/%s\n' "$root" "$configured" ;;
    esac
}

read_install_defaults() {
    awk '
        /^\[/ {
            section = $0
            in_install = (section ~ /^\[Install[0-9A-Fa-f]+\][[:space:]]*$/)
            next
        }
        in_install && /^Default=/ {
            sub(/^Default=/, "")
            sub(/\r$/, "")
            print
        }
    ' "$1"
}

read_registered_profiles() {
    awk '
        /^\[/ {
            section = $0
            in_profile = (section ~ /^\[Profile[0-9]+\][[:space:]]*$/)
            next
        }
        in_profile && /^Path=/ {
            sub(/^Path=/, "")
            sub(/\r$/, "")
            print
        }
    ' "$1"
}

firefox_roots=()
profile_containers=()

case "$(uname -s)" in
    Darwin)
        firefox_roots+=("$HOME/Library/Application Support/Firefox")
        profile_containers+=("$HOME/Library/Application Support/Firefox/Profiles")
        ;;
    Linux)
        firefox_roots+=(
            "$HOME/.mozilla/firefox"
            "$HOME/snap/firefox/common/.mozilla/firefox"
            "$HOME/.var/app/org.mozilla.firefox/.mozilla/firefox"
        )
        profile_containers+=(
            "$HOME/.mozilla/firefox"
            "$HOME/snap/firefox/common/.mozilla/firefox"
            "$HOME/.var/app/org.mozilla.firefox/.mozilla/firefox"
        )
        ;;
    *)
        print_red "This script supports macOS and Linux only."
        exit 1
        ;;
esac

active_paths=()
other_paths=()

if [ -z "$profile_path" ]; then
    for ((root_index = 0; root_index < ${#firefox_roots[@]}; root_index++)); do
        root=${firefox_roots[$root_index]}
        container=${profile_containers[$root_index]}
        ini="$root/profiles.ini"

        if [ -f "$ini" ]; then
            while IFS= read -r configured; do
                [ -z "$configured" ] && continue
                candidate=$(resolve_ini_path "$root" "$configured")
                if [ -d "$candidate" ] && ! contains_path "$candidate" "${active_paths[@]}"; then
                    active_paths+=("$candidate")
                fi
            done < <(read_install_defaults "$ini")

            while IFS= read -r configured; do
                [ -z "$configured" ] && continue
                candidate=$(resolve_ini_path "$root" "$configured")
                if [ -d "$candidate" ] && \
                   ! contains_path "$candidate" "${active_paths[@]}" && \
                   ! contains_path "$candidate" "${other_paths[@]}"; then
                    other_paths+=("$candidate")
                fi
            done < <(read_registered_profiles "$ini")
        fi

        if [ -d "$container" ]; then
            for candidate in "$container"/*; do
                [ -d "$candidate" ] || continue
                name=$(basename "$candidate")
                [[ "$name" != *.* ]] && continue
                if ! contains_path "$candidate" "${active_paths[@]}" && \
                   ! contains_path "$candidate" "${other_paths[@]}"; then
                    other_paths+=("$candidate")
                fi
            done
        fi
    done

    choice_labels=()
    choice_details=()
    choice_paths=()

    for channel in Release Beta Nightly Custom; do
        channel_paths=()
        for candidate in "${active_paths[@]}"; do
            [ "$(classify_profile "$(basename "$candidate")")" = "$channel" ] && channel_paths+=("$candidate")
        done
        if [ "${#channel_paths[@]}" -gt 0 ]; then
            sorted_paths=()
            while IFS= read -r candidate; do sorted_paths+=("$candidate"); done < <(printf '%s\n' "${channel_paths[@]}" | sort)
            for ((index = 0; index < ${#sorted_paths[@]}; index++)); do
                label="$channel"
                [ "${#sorted_paths[@]}" -gt 1 ] && label="$channel $((index + 1))"
                choice_labels+=("$label · Currently in use")
                choice_details+=("$(basename "${sorted_paths[$index]}")")
                choice_paths+=("${sorted_paths[$index]}")
            done
        fi
    done

    for channel in Release Beta Nightly Custom; do
        channel_paths=()
        for candidate in "${other_paths[@]}"; do
            [ "$(classify_profile "$(basename "$candidate")")" = "$channel" ] && channel_paths+=("$candidate")
        done
        if [ "${#channel_paths[@]}" -gt 0 ]; then
            while IFS= read -r candidate; do
                choice_labels+=("$channel")
                choice_details+=("$(basename "$candidate")")
                choice_paths+=("$candidate")
            done < <(printf '%s\n' "${channel_paths[@]}" | sort)
        fi
    done

    managed_paths=()
    for candidate in "${choice_paths[@]}"; do
        is_flexfox_git_profile "$candidate" && managed_paths+=("$candidate")
    done

    if [ "${#managed_paths[@]}" -eq 1 ]; then
        profile_path=${managed_paths[0]}
        print_dim "Detected an existing FlexFox Git profile: $profile_path"
    elif [ "$silent_mode" = true ]; then
        print_red "Silent Mode could not identify exactly one managed FlexFox Git profile. Specify the target with -ProfilePath or --profile-path."
        exit 1
    else
        printf 'Select the Firefox profile to update:\n\n'
        for ((index = 0; index < ${#choice_paths[@]}; index++)); do
            printf '  %d) %s\n' "$((index + 1))" "${choice_labels[$index]}"
            print_dim "     ${choice_details[$index]}"
            printf '\n'
        done
        custom_number=$((${#choice_paths[@]} + 1))
        printf '  %d) Enter a custom profile directory...\n\n' "$custom_number"

        while true; do
            printf 'Enter a number, or type Esc to cancel: '
            IFS= read -r selection
            case "$selection" in
                Esc|esc|ESC) print_yellow "Update cancelled by user."; exit 0 ;;
            esac
            if [[ "$selection" =~ ^[0-9]+$ ]] && [ "$selection" -ge 1 ] && [ "$selection" -le "$custom_number" ]; then
                break
            fi
            print_red "Please enter a valid selection."
        done

        if [ "$selection" -eq "$custom_number" ]; then
            while true; do
                printf 'Enter the Firefox profile directory, or type Esc to cancel: '
                IFS= read -r profile_path
                case "$profile_path" in
                    Esc|esc|ESC) print_yellow "Update cancelled by user."; exit 0 ;;
                esac
                [ -d "$profile_path" ] && break
                print_red "The profile directory does not exist or is not accessible: $profile_path"
            done
        else
            profile_path=${choice_paths[$((selection - 1))]}
        fi
    fi
fi

if [ ! -d "$profile_path" ]; then
    print_red "The profile directory does not exist or is not accessible: $profile_path"
    exit 1
fi

print_green "Using Firefox profile: $profile_path"
cd "$profile_path"

run_git() {
    local output
    if ! output=$(git "$@" 2>&1); then
        [ -n "$output" ] && printf '%s\n' "$output" >&2
        print_red "Git command failed: git $*"
        exit 1
    fi
}

git_path_exists() {
    local git_path
    git_path=$(git rev-parse --git-path "$1" 2>/dev/null) || return 1
    [ -e "$git_path" ]
}

in_progress_git_operation() {
    if git_path_exists MERGE_HEAD; then printf 'merge'; return 0; fi
    if git_path_exists rebase-merge || git_path_exists rebase-apply; then printf 'rebase'; return 0; fi
    if git_path_exists CHERRY_PICK_HEAD; then printf 'cherry-pick'; return 0; fi
    if git_path_exists REVERT_HEAD; then printf 'revert'; return 0; fi
    if git_path_exists sequencer; then printf 'sequenced Git'; return 0; fi
    if git_path_exists BISECT_LOG; then printf 'bisect'; return 0; fi
    return 1
}

has_tracked_changes() {
    local status
    if git diff --quiet --ignore-submodules --; then
        :
    else
        status=$?
        [ "$status" -eq 1 ] || return 2
        return 0
    fi
    if git diff --cached --quiet --ignore-submodules --; then
        :
    else
        status=$?
        [ "$status" -eq 1 ] || return 2
        return 0
    fi
    return 1
}

abort_script_merge() {
    local output
    if ! output=$(git merge --abort 2>&1); then
        [ -n "$output" ] && printf '%s\n' "$output" >&2
        print_red "Git could not abort the conflicted merge. Manual recovery is required."
        exit 1
    fi
}

merge_with_conflict_handling() {
    local output selection conflicted_files

    if output=$(git merge --quiet --no-edit origin/main 2>&1); then
        return 0
    fi

    [ -n "$output" ] && printf '%s\n' "$output" >&2
    if ! git_path_exists MERGE_HEAD; then
        print_red "Git could not merge origin/main. The working tree was left unchanged."
        exit 1
    fi

    if [ "$silent_mode" = true ]; then
        abort_script_merge
        print_red "A merge conflict occurred. Silent Mode aborted the merge and restored the previous state."
        exit 1
    fi

    printf '\nA merge conflict occurred while updating FlexFox:\n\n'
    printf '  1) Abort the merge and restore the previous state.\n'
    printf '  2) Keep the conflict state for manual resolution.\n\n'
    while true; do
        printf 'Select an option [1], or type Esc to abort: '
        IFS= read -r selection
        case "$selection" in
            ''|1|Esc|esc|ESC)
                abort_script_merge
                print_red "The merge was aborted, and the previous state was restored."
                exit 1
                ;;
            2)
                break
                ;;
            *)
                print_red "Please enter 1 or 2."
                ;;
        esac
    done

    conflicted_files=$(git diff --name-only --diff-filter=U 2>/dev/null || true)
    print_yellow "The merge conflict was left in place for manual resolution."
    if [ -n "$conflicted_files" ]; then
        print_yellow "Conflicted files:"
        printf '%s\n' "$conflicted_files" | sed 's/^/  /'
    fi
    print_yellow "Resolve the files, then run: git add <files>"
    print_yellow "Complete the merge with: git commit"
    print_yellow "Or cancel it with: git merge --abort"
    print_dim "Run these commands from the following directory: $profile_path"
    exit 1
}

if [ ! -e ".git" ]; then
    print_yellow "Initializing Git repository..."
    run_git init --quiet
    run_git remote add origin https://github.com/yuuqilin/FlexFox.git
    run_git config flexfox.managed true
    run_git remote set-branches origin main
    run_git config remote.origin.tagOpt --no-tags
    run_git sparse-checkout init --no-cone
    run_git sparse-checkout set /chrome
    print_yellow "Fetching the latest 'chrome' folder..."
    run_git fetch --quiet --no-tags origin
    run_git checkout --quiet --force -B main origin/main
    run_git branch --set-upstream-to=origin/main main
    run_git sparse-checkout reapply
    print_green "Git repository initialized and the 'chrome' folder checked out."
else
    print_green "Git repository already initialized."
    if origin_url=$(git remote get-url origin 2>/dev/null); then
        if ! is_flexfox_origin "$origin_url"; then
            print_red "The selected profile is already a Git repository whose origin is not FlexFox."
            exit 1
        fi
    else
        print_red "The selected profile is already a Git repository but does not have a FlexFox origin."
        exit 1
    fi
    if operation=$(in_progress_git_operation); then
        print_red "An unfinished Git $operation operation already exists. Complete or abort it before running this script again."
        exit 1
    fi
    if has_tracked_changes; then
        print_red "Tracked FlexFox files contain local modifications. Commit or restore them before running the update. Untracked custom files are not affected."
        exit 1
    else
        status=$?
        if [ "$status" -eq 2 ]; then
            print_red "Could not inspect the Git working tree for local changes."
            exit 1
        fi
    fi

    run_git config flexfox.managed true
    run_git remote set-branches origin main
    run_git config remote.origin.tagOpt --no-tags
    run_git sparse-checkout init --no-cone
    run_git sparse-checkout set /chrome
    print_yellow "Fetching the latest 'chrome' folder..."
    run_git fetch --quiet --no-tags --prune origin
    run_git checkout --quiet main
    merge_with_conflict_handling
    run_git sparse-checkout reapply
    print_green "The 'chrome' folder was updated."
fi

print_green "Script completed."
