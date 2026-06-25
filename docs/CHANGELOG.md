# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox Changelog

[English](./CHANGELOG.md) | [日本語](./CHANGELOG_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md) | [简体中文](./CHANGELOG_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md)

## 🆕 What's New

## **🦊 v6.5.5**

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

<!-- END What's New -->

<a id="updates-top-start"></a>
<details>

<summary>💬 <b>Previous Updates</b></summary>

<!-- END Release Note -->

**v6.5.4**

* Fixed cramped spacing around the URL bar zoom indicator when centered URL bar text is enabled.
* Removed obsolete legacy Sidebery style files from the project to avoid confusion with the current setup process.
* Reworked the documentation with a more focused README, clearer preference references, and practical usage guides.

For more update logs from earlier versions,  
👉 see the [history archive on the Wiki](https://github.com/yuuqilin/FlexFox/wiki/Earlier-Update-History-(English))

<a href="#updates-top-start">⏫ Back to the beginning of updates</a>
</details>
