#!/usr/bin/env python3
"""Release metadata and commit-subject checks using only Python's standard library."""

import argparse
import json
import os
from pathlib import Path
import platform
import re
import subprocess
import sys


CHANGELOG = "docs/CHANGELOG.md"
READMES = (
    ("README.md", "## 🆕 What's New", r"(\*\*🦊 Latest:\s*v)(\d+\.\d+\.\d+)(\*\*\s*—)"),
    ("README_日本語版.md", "## 🆕 最新情報", r"(\*\*🦊 最新バージョン:\s*v)(\d+\.\d+\.\d+)(\*\*\s*—)"),
    ("README_简体中文.md", "## 🆕 更新内容", r"(\*\*🦊 最新版本：v)(\d+\.\d+\.\d+)(\*\*\s*—)"),
)
TARGETS = ("chrome/userChrome.css", "chrome/content/uc-aboutconfig.css") + tuple(row[0] for row in READMES)
RELEASE_PATTERN = r"(?s)## 🆕 What's New(?:(?!<!-- END What's New -->).)*?🦊\s*v(\d+\.\d+\.\d+)"
BADGE_PATTERN = r"(Last%20tested%20Firefox-v)(\d+)(-orange\?logo=firefox)"


def git(*args, allow_failure=False):
    result = subprocess.run(["git", *args], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    if result.returncode and not allow_failure:
        raise ValueError("git {} failed with exit code {}".format(" ".join(args), result.returncode))
    return result


def release_version(content, source):
    match = re.search(RELEASE_PATTERN, content)
    if not match:
        raise ValueError("Could not find the FlexFox release version in " + source)
    return match[1]


def head_version():
    result = git("show", "HEAD:" + CHANGELOG, allow_failure=True)
    return release_version(result.stdout.decode("utf-8-sig"), "HEAD:" + CHANGELOG) if not result.returncode else None


def staged_release():
    result = git("diff", "--cached", "--quiet", "--no-ext-diff", "--no-textconv", "--", CHANGELOG, allow_failure=True)
    if result.returncode == 0:
        return None
    if result.returncode != 1:
        raise ValueError("Failed to inspect the staged CHANGELOG")
    version = release_version(git("show", ":" + CHANGELOG).stdout.decode("utf-8-sig"), "staged " + CHANGELOG)
    return version if version != head_version() else None


def expanded_path(value):
    return Path(os.path.expandvars(value)).expanduser()


def manager_registry_path():
    if os.environ.get("FLEXFOX_FIREFOX_CONFIG"):
        return expanded_path(os.environ["FLEXFOX_FIREFOX_CONFIG"])
    if os.environ.get("FLEXFOX_MANAGER_DATA_DIR"):
        directory = expanded_path(os.environ["FLEXFOX_MANAGER_DATA_DIR"])
    else:
        system = platform.system()
        if system == "Windows":
            if not os.environ.get("APPDATA"):
                return None
            root = Path(os.environ["APPDATA"])
            normalized = str(root).replace("/", "\\").casefold()
            if "\\appdata\\local\\packages\\" in normalized and normalized.endswith("\\localcache\\roaming"):
                app_data = next((p for p in (root, *root.parents) if p.name.casefold() == "appdata"), None)
                if app_data:
                    root = app_data.parent / "AppData/Roaming"
        elif system == "Darwin":
            root = Path.home() / "Library/Application Support"
        else:
            root = Path(os.environ["XDG_DATA_HOME"]).expanduser() if os.environ.get("XDG_DATA_HOME") else Path.home() / ".local/share"
        directory = root / "FlexFox Manager"
    return directory / "firefox-instances.json"


def nightly_executable(registry_path):
    if registry_path is None or not registry_path.is_file():
        return None
    registry = json.loads(registry_path.read_bytes().decode("utf-8-sig"))
    if not isinstance(registry, dict):
        raise ValueError("Firefox instance registry must be an object")
    browsers = registry.get("browsers")
    if browsers is None:
        return None
    if not isinstance(browsers, dict) or any(not isinstance(b, dict) for b in browsers.values()):
        raise ValueError("Firefox instance registry browser definitions must be objects")
    nightly = browsers.get("nightly")
    if nightly is None:
        nightly = next((b for b in browsers.values() if str(b.get("channel", "")).lower() == "nightly" or str(b.get("sourceTree", "")).lower() == "firefox-main"), None)
    if nightly is None:
        return None
    launcher = nightly.get("launcher")
    if launcher is not None:
        if not isinstance(launcher, dict):
            raise ValueError("Nightly launcher must be an object")
        if launcher.get("type") != "executable":
            return None
        value = launcher.get("path")
    else:
        value = nightly.get("executable")
    if value is None:
        return None
    if not isinstance(value, str):
        raise ValueError("Nightly executable path must be a string")
    if not value.strip() or value.lower() == "auto":
        return None
    path = expanded_path(value)
    if not path.is_absolute():
        path = registry_path.parent / path
    if platform.system() == "Darwin" and path.suffix.lower() == ".app":
        path = path / "Contents/MacOS/firefox"
    return path.resolve() if path.is_file() else None


def firefox_major(executable):
    result = subprocess.run([str(executable), "--version"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=30)
    if result.returncode:
        raise ValueError("Could not read the configured Nightly Firefox version")
    match = re.search(r"(?<!\d)(\d+)(?:\.\d+)*(?:[A-Za-z]\d+)?", result.stdout.decode("utf-8", errors="replace"))
    if not match:
        raise ValueError("Could not determine the Nightly Firefox major version")
    return match[1]


def replace_required(content, pattern, version, count, description):
    if len(re.findall(pattern, content)) != count:
        raise ValueError(description + " has an unexpected number of version matches")
    return re.sub(pattern, lambda m: m[1] + version + m[3], content)


def replace_section(content, start, end, pattern, version, count, description):
    left = content.find(start)
    right = content.find(end, left) if left >= 0 else -1
    if right < 0:
        raise ValueError(description + " is missing a section marker")
    return content[:left] + replace_required(content[left:right], pattern, version, count, description) + content[right:]


def update_metadata(version, update_badge, pre_commit):
    if not re.fullmatch(r"\d+\.\d+\.\d+", version):
        raise ValueError("Invalid version format. Expected X.Y.Z")
    if pre_commit:
        dirty = []
        for path in TARGETS:
            result = git("diff", "--quiet", "--no-ext-diff", "--no-textconv", "--", path, allow_failure=True)
            if result.returncode == 1:
                dirty.append(path)
            elif result.returncode:
                raise ValueError("Failed to inspect unstaged changes for " + path)
        if dirty:
            raise ValueError("Release version update would stage existing unstaged changes in: " + ", ".join(dirty))
    major = None
    if update_badge:
        executable = nightly_executable(manager_registry_path())
        if executable is None:
            print("FlexFox: Nightly is not configured or its executable is missing; Firefox badges unchanged.", file=sys.stderr)
        else:
            major = firefox_major(executable)

    # Prepare every replacement before writing, retaining each file's BOM and newlines.
    updates = []
    for path in TARGETS:
        data = Path(path).read_bytes()
        bom = data.startswith(b"\xef\xbb\xbf")
        content = data.decode("utf-8-sig")
        if path == TARGETS[0]:
            content = replace_required(content, r"(/\*\s*FlexFox v)(\d+\.\d+\.\d+)(\s*\*/)", version, 1, path)
        elif path == TARGETS[1]:
            content = replace_section(content, "/* !-- Start of version info 1 -- */", "/* !-- End of version info 1 -- */", r'(content:\s*"🎉\s*FlexFox v)(\d+\.\d+\.\d+)(\s)', version, 4, path)
            content = replace_section(content, "/* !-- Start of version info 2 -- */", "/* !-- End of version info 2 -- */", r"(\\A\\Av)(\d+\.\d+\.\d+)(\\A\\A)", version, 1, path)
        else:
            _, start, pattern = next(row for row in READMES if row[0] == path)
            content = replace_section(content, start, "<!-- END What's New -->", pattern, version, 1, path)
            if major is not None:
                content = replace_required(content, BADGE_PATTERN, major, 1, path + " Firefox badge")
        updates.append((path, (b"\xef\xbb\xbf" if bom else b"") + content.encode("utf-8")))
    for path, data in updates:
        Path(path).write_bytes(data)
    if pre_commit:
        git("add", "--", *TARGETS)
    print("FlexFox version update completed: v" + version)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    actions = parser.add_mutually_exclusive_group()
    actions.add_argument("--pre-commit", action="store_true")
    actions.add_argument("--commit-message", type=Path)
    parser.add_argument("--version")
    args = parser.parse_args()
    # Resolve the message before changing directories, including Git's relative paths.
    message = args.commit_message.resolve() if args.commit_message else None
    os.chdir(git("rev-parse", "--show-toplevel").stdout.decode("utf-8").strip())
    if args.pre_commit or message is not None:
        version = staged_release()
        if version is None:
            return 0
        if message is not None:
            lines = message.read_bytes().decode("utf-8-sig").splitlines()
            subject = lines[0].strip() if lines else ""
            expected = "v" + version
            if subject.lower() != expected.lower():
                raise ValueError("Release commit subject must be '{}' (got '{}')".format(expected, subject))
            return 0
        if args.version and args.version != version:
            raise ValueError("Requested version does not match staged CHANGELOG version")
        update_metadata(version, True, True)
    else:
        version = args.version or release_version(Path(CHANGELOG).read_bytes().decode("utf-8-sig"), CHANGELOG)
        update_metadata(version, not args.version and version != head_version(), False)
    return 0


if __name__ == "__main__":
    try:
        sys.exit(main())
    except (ValueError, OSError, subprocess.SubprocessError) as error:
        print("FlexFox release check failed: " + str(error), file=sys.stderr)
        sys.exit(1)
