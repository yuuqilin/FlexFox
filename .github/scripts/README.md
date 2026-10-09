# Release Git hooks

Enable the hooks from the repository root:

```sh
git config --local core.hooksPath .github/hooks
```

The hooks are tracked as executable files. If a ZIP extraction or filesystem has
removed their executable permissions on macOS or Linux, restore them:

```sh
chmod +x .github/hooks/pre-commit .github/hooks/commit-msg
```

Windows users can also run `setup-git-hooks.ps1` with PowerShell.

## Commit behavior

Both hooks first inspect the staged `docs/CHANGELOG.md` in POSIX Shell. Ordinary
CSS or documentation commits, including CHANGELOG edits that leave the release
version unchanged, require no PowerShell or Python runtime. If the Shell parser
cannot establish that the version is unchanged, the full parser checks it.

For release commits, Windows uses `pwsh`, falling back to `powershell.exe`.
macOS and Linux use `python3` (Python 3.9 or newer), with no third-party packages.
These release runtimes must be available on `PATH`. A usable Python installation
is not guaranteed on every macOS or Linux system.

When the staged release version changes, `pre-commit` updates the version in
`chrome/userChrome.css`, `chrome/content/uc-aboutconfig.css` and all three READMEs,
then stages those five files. Existing unstaged changes in any of those files
block the update to prevent accidental inclusion in the commit. All expected
markers and match counts are checked before writing any file; UTF-8 BOMs and
existing line endings are retained.

`commit-msg` requires the release subject `vX.Y.Z` matching the staged CHANGELOG.
As with the existing PowerShell check, surrounding whitespace and uppercase `V`
are accepted. Ordinary commits have no subject restriction.

## Optional Nightly badge update

The updater reads FlexFox Manager's current `firefox-instances.json`. It does not
change Manager settings or migrate legacy configuration. Registry selection uses
this priority:

1. `FLEXFOX_FIREFOX_CONFIG`: an explicit registry file.
2. `FLEXFOX_MANAGER_DATA_DIR`: the directory containing the registry.
3. The platform's default Manager directory:

| Platform | Default directory |
| --- | --- |
| Windows | `%APPDATA%\FlexFox Manager` |
| macOS | `~/Library/Application Support/FlexFox Manager` |
| Linux | `$XDG_DATA_HOME/FlexFox Manager`, or `~/.local/share/FlexFox Manager` if unset |

Windows uses the ordinary roaming directory if an inherited MSIX environment
reports a packaged roaming path. Relative registry overrides resolve from the
repository root; relative executable paths resolve from the registry directory.
On macOS, a configured `.app` bundle resolves to `Contents/MacOS/firefox`, matching
Manager's executable resolver.

The updater selects `browsers.nightly`, falling back to the first browser with
`channel: nightly` or `sourceTree: firefox-main`. It supports `executable` and
`launcher: { type: executable, path: ... }` entries. The Windows script reads
the executable's version metadata, falling back to `--version`; Python uses
`--version`. The resulting major version updates all three Firefox badges.

If the registry is missing, Nightly is unconfigured, the launcher has no direct
executable path, or the executable is missing, the badges stay unchanged and the
FlexFox release update continues. Invalid JSON, invalid browser definitions and
failure to read an existing executable's version remain errors.

## Manual updates

On Windows:

```powershell
.\.github\scripts\flexfox-release.ps1
.\.github\scripts\flexfox-release.ps1 -Version 5.7.9
```

On macOS or Linux:

```sh
python3 .github/scripts/flexfox-release.py
python3 .github/scripts/flexfox-release.py --version 5.7.9
```

Without an explicit version, the updater reads the working CHANGELOG and checks
Nightly only when its version differs from HEAD. An explicit version updates
FlexFox references without changing Firefox badges. Manual updates do not stage
files.
