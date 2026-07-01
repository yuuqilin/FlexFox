# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox Changelog

[English](./CHANGELOG.md) | [日本語](./CHANGELOG_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md) | [简体中文](./CHANGELOG_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md)

## 🆕 What's New

## **🦊 v6.5.6**

### Updated

* Improved Sidebery behavior and visual consistency.

  * Improved the smoothness of Sidebery expand and collapse animations while reducing layout cost.
  * Fixed the search box bounce during expand and collapse animations, and aligned its width with the tab list below.
  * Refined Split View support so only the web content area adjacent to Sidebery uses squared corners. The other split view pane now keeps rounded corners on all sides.
  * Adjusted the close button and tree branch expand button positions when `uc.flex.sidebery-allow-resizable-width` is enabled in collapsed mode, reducing accidental clicks near tab icons.
  * Fixed the tab panel in the navigation bar not expanding correctly in collapsed mode when `uc.flex.sidebery-allow-resizable-width` is enabled.
  * Restored the missing top and side margins in Sidebery’s panel settings dialog when rounded web content margins are enabled.

* Improved `uc.flex.enable-rounded-web-content` by synchronizing the bottom margin of sidebar panels with the web content area, keeping both areas visually aligned.

### Changed

* Native vertical tabs no longer show the resize splitter while collapsed. The splitter is now shown only when the sidebar is expanded, keeping the collapsed layout cleaner.

### Fixed

* Fixed a regression introduced in v6.5.0 where pinned tabs could not wrap automatically when `uc.flex.sidebery-allow-resizable-width` and `Lock Sidebery` were enabled at the same time.

* Fixed a regression introduced in v6.5.3 where the Sidebery new tab button showed shadow overflow on both sides.

* Fixed PDF toolbar auto-hide being broken by changes in Firefox Beta v153. [Bug 2045670](https://bugzilla.mozilla.org/show_bug.cgi?id=2045670)

* Fixed the distorted `view-opentabs.svg` icon caused by changes in Firefox Beta v153. [Bug 2032258](https://bugzilla.mozilla.org/show_bug.cgi?id=2032258)

* Fixed tab jitter when Sidebery expands, caused by changes in Firefox Nightly v154. [Bug 2048146](https://bugzilla.mozilla.org/show_bug.cgi?id=2048146)

* Added an icon for the new “Edit PDF...” item in the App Menu introduced in Firefox Nightly v154. [Bug 2047915](https://bugzilla.mozilla.org/show_bug.cgi?id=2047915)

<!-- END What's New -->

<a id="updates-top-start"></a>
<details>

<summary>💬 <b>Previous Updates</b></summary>

<!-- END Release Note -->

## **v6.5.5**

![Preview: about:config preference descriptions](https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/about-config-preference-descriptions.webp)

### New

- Improved the `about:config` experience.
  - Centered the FlexFox version entry and made the version number easier to identify.
  - Added short descriptions next to the FlexFox preference list.
  - Preference descriptions are aligned with the full `uc.flex` list. To keep them matched, import `user.js` or manually add all FlexFox preferences.

- Reworked the PowerShell installer.
  - The installer is now `scripts/install-flexfox.ps1`.
  - It detects the installed FlexFox version and downloads the latest release only when needed.
  - Added SHA-256 verification for downloaded packages.
  - Added an interactive menu for selecting a Firefox profile or entering a custom profile path.
  - Added command-line options for unattended installation: use `-ProfilePath 'path'` to specify the profile path and `-Silent` to run without prompts.
  - See [PowerShell Script](https://github.com/yuuqilin/FlexFox#-powershell-script) for details.

- Updated the Git Pull automation scripts.
  - Added an interactive menu for selecting a Firefox profile or entering a custom working directory.
  - Added command-line options for unattended updates: use `-ProfilePath 'path'` to specify the working directory and `-Silent` to run without prompts.
  - Improved handling of user-modified files and Git conflicts.
  - See [Git Pull](https://github.com/yuuqilin/FlexFox#-git-pull) for details.

### Breaking

- Changed `uc.flex.show-flexfox-version-info-in-about-config` from a Boolean preference to a Number preference.
  - `0`: Hide FlexFox version information.
  - `1`: Show version information only.
  - `2`: Show version information and preference descriptions. This is the default.
  - Delete the old preference, then create a new preference with the same name and select Number as the type.

### Updated

- Moved `user.js` from the `scripts` folder to the root folder to simplify installation.

### Removed

- Removed `deploy-userchrome.ps1` from the root folder.

**v6.5.4**

* Fixed cramped spacing around the URL bar zoom indicator when centered URL bar text is enabled.
* Removed obsolete legacy Sidebery style files from the project to avoid confusion with the current setup process.
* Reworked the documentation with a more focused README, clearer preference references, and practical usage guides.

For more update logs from earlier versions,  
👉 see the [history archive on the Wiki](https://github.com/yuuqilin/FlexFox/wiki/Earlier-Update-History-(English))

<a href="#updates-top-start">⏫ Back to the beginning of updates</a>
</details>
