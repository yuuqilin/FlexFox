# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox

<div>
 <a href='https://www.mozilla.org'><img src="https://img.shields.io/badge/Last%20tested%20Firefox-v154-orange?logo=firefox"></a>
 <a href='https://github.com/yuuqilin/FlexFox/commits/main/'><img src="https://img.shields.io/github/last-commit/yuuqilin/FlexFox/main"></a>
 <a href='https://github.com/yuuqilin/FlexFox/commits/Beta/'><img src="https://img.shields.io/github/last-commit/yuuqilin/FlexFox/Beta?label=last%20Nightly%20commit&color=purple"></a>
 <a href='https://github.com/yuuqilin/FlexFox/stargazers'><img src='https://img.shields.io/github/stars/yuuqilin/FlexFox?style=social'></a>
</div>

<br>

[English](./README.md) | [日本語](./README_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md) | [简体中文](./README_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md) | [Wiki](https://github.com/yuuqilin/FlexFox/wiki) 

FlexFox is a Firefox userChrome theme focused on maximizing usable screen space while preserving accessibility. Toolbars and sidebars automatically collapse when not in use and expand as overlays without shifting page layout. When Sidebery is enabled, native tabs are automatically hidden to maintain a single tab system, avoiding redundant interface elements. It supports extensive customization through preferences and is designed as a flexible foundation for different browsing workflows.

![FlexFox v6.5](https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/FlexFox-v6.5.0.webp)  

> [!IMPORTANT]
>
> * **Changed Firefox's `Expand sidebar on hover` setting?** Disable it. FlexFox requires this option to remain unchecked. ([Guide](docs/USAGE.md#️-firefox-sidebar-settings))
> * **Upgrading from a version earlier than v6?** Remove all legacy styles from the Sidebery Styles Editor. ([Guide](docs/USAGE.md#-upgrading-from-pre-v6-versions))
> * **Recommended setup:** Use Firefox's vertical tabs mode, ideally together with Sidebery, for the most complete feature set and best overall experience.

## 🎬 Feature Showcase Video

Watch the v6.5 feature showcase:

https://github.com/user-attachments/assets/64be5a0e-f97e-4257-aac8-63245791d07b

For better video quality, watch on YouTube:

[YouTube Link](https://www.youtube.com/watch?v=lhf1mpXDIOM)

## 🆕 What's New

**🦊 Latest: v6.5.6** — See [Full Changelog](./docs/CHANGELOG.md) for details.

<!-- END What's New -->

## ✨ Features

* Auto-collapsing tabs, toolbars, and sidebars.
* Expands as an overlay without shifting webpage content or causing layout jumps.
* Quickly hide or show tabs and toolbars using keyboard shortcuts or toolbar buttons.
* Automatically hides native tabs when Sidebery is enabled to maximize screen space.
* Optional translucent blur effects for menus, panels, and address bar popups.
* Support for Windows Mica and custom browser wallpapers.
* 11 built-in accent colors with full light and dark mode support, compatible with any Firefox theme.
* Customizable icons for sidebar buttons, bookmark folders, bookmark stars, window controls, and more.
* Optional auto-hide for toolbar buttons and window controls, keeping the interface minimal while remaining easily accessible.
* Extensive appearance customization through Firefox preferences, including:
  * Rounded or squared UI element corners
  * Menu spacing
  * Webpage content margins and borders
  * Flat or embossed address bar styles
  * Tab borders and background colors
  * Animation and transition effects
* Customizable pinned tab layout and area height.
* Floating search box.
* Support for custom style overrides to personalize or extend the default theme.
* Additional quality-of-life enhancements, including:
  * Preventing white flashes while pages are loading
  * Displaying the total number of open tabs on the "List All Tabs" button
* Browsing experience improvements, including:
  * Enhanced active tab visibility for easier navigation between related tabs
  * Grid-based pinned tabs that save space, support large pinned tab collections, and prevent tab shifting when sidebars expand, reducing mouse repositioning
* Minimal performance overhead.

## ⚙️ Options

FlexFox leaves the native Firefox interface largely undisturbed by default, enabling only the core layout features and essential styles upon installation.

To reproduce many of the layouts and interface customizations shown in the previews, or to modify and revert specific design changes, you can use the following two independent systems.

### 🧩 Configurable Preferences (`about:config`)

Most of FlexFox's features, layout toggles, and appearance adjustments are integrated directly into Firefox's preferences system. This allows you to customize browser behavior, enable optional interface enhancements, or restore specific elements back to their native Firefox appearance without modifying any code.

To access these preferences, enter `about:config` in the address bar and press Enter. If you imported the provided `user.js` during installation, searching for `uc.flex` will display all available FlexFox preferences. You can also manually create preferences using the option names listed in the documentation.

> [!TIP]
> For the complete list of available options, supported values, and detailed descriptions, see:
>
> **📄 [Preferences List](docs/OPTIONS.md)**

### 📜 User-Customizable Styles

For modifications beyond the built-in preference system, FlexFox provides dedicated user customization files for both interface and webpage styling.

* To modify **interface (chrome)** styles, create `uc-user-settings.css` in the `components` folder
* To modify **webpage (content)** styles, create `uc-custom-content.css` in the `content` folder

Styles and variables copied into these files will override FlexFox's defaults. Since these files are user-managed and not included in the project source, they remain unaffected by future updates.

When reusing styles from existing FlexFox files (such as `uc-variables.css`), copy the complete selector or rule block to preserve the original context and dependencies.

## 📖 Usage Guides

* [How to recreate the interface shown in the preview video](docs/USAGE.md#-recreating-the-preview-interface)

* [How to hide toolbars and sidebars using keyboard shortcuts or toolbar buttons](docs/USAGE.md#-layout-switching)

* [How to make Sidebery follow your Firefox theme background](docs/USAGE.md#-firefox-themes-and-sidebery)

* [How to enable Mica or custom wallpapers in Sidebery and web content](docs/USAGE.md#️-transparent-web-content-mica-and-wallpapers)

* [How to improve readability after enabling transparent web content](docs/USAGE.md#-improving-readability-in-transparent-web-content)

## 💿 Installation and Updates

### 👷 Manual Installation

1. Install [Sidebery](https://addons.mozilla.org/firefox/addon/sidebery/) (optional but recommended).

2. Download the latest FlexFox release from the project's **[Releases](https://github.com/yuuqilin/FlexFox/releases)** page.

3. Open `about:support`, locate **Profile Folder**, and click **Open Folder** to access your Firefox profile directory.

4. Copy the `chrome` folder and `user.js` file from the archive root into your Firefox profile folder.

5. (Optional) Open `user.js` in a text editor.

   The file contains both FlexFox preferences (`uc.flex.*`) and optional native Firefox preferences. FlexFox preferences are imported automatically, while native Firefox preferences are provided as commented entries. Remove the leading `//` only for the native Firefox preferences you wish to change, then verify that the following required preferences remain configured as shown:

   ```text
   toolkit.legacyUserProfileCustomizations.stylesheets = true
   svg.context-properties.content.enabled = true
   sidebar.visibility = always-show
   ```

6. Restart Firefox, then delete `user.js`.

   Do not skip this step. If `user.js` remains in your profile folder, its settings will be reapplied every time Firefox starts, resetting your preferences and preventing changes made in `about:config` from taking effect.

7. Configure Sidebery:

   * Open **Settings** (gear icon).
   * Clear any existing styles from **Styles Editor**.
   * Go to **Help → Import addon data**.
   * Import `sidebery-settings.json` from the `Sidebery` folder in the downloaded archive.

8. Open `about:config` and search for `uc.flex` to view and adjust FlexFox preferences.

### 🚀 Automated Installation and Updates

FlexFox can be installed and updated automatically using either PowerShell scripts or Git.

If this is your first installation, run one of the methods below and then continue with **Manual Installation** starting from Step 5.

For future updates, simply re-run the same method. No additional manual steps are required.

#### 💻 PowerShell Script

<details>
<summary><i>[Click to expand]</i> 👇</summary>

Run one of the commands below in a PowerShell window.

These commands support the following command-line options:

* `-ProfilePath 'path'` / `--profile-path 'path'`
  * Specifies the Firefox profile folder for installation, bypassing the path selection prompt.

* `-Silent` / `--silent`
  * Performs a silent installation using the specified profile. If `-ProfilePath` is omitted, the first detected Firefox profile is used. This option skips all prompts and will not copy `user.js`.
  * Suitable for scheduled tasks or unattended updates.

**Online installation**

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass; & ([scriptblock]::Create((((New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/yuuqilin/FlexFox/refs/heads/main/scripts/install-flexfox.ps1')) -replace '^\uFEFF', '')))
```

**Local installation**

Download [`install-flexfox.ps1`](https://raw.githubusercontent.com/yuuqilin/FlexFox/refs/heads/main/scripts/install-flexfox.ps1) and run:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass; & 'C:\Path\To\install-flexfox.ps1'
```

**Local scheduled silent update**

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "C:\Path\To\install-flexfox.ps1" -ProfilePath "C:\Path\To\Firefox\Profile" -Silent
```

</details>

#### 🔃 Git Pull

<details>
<summary><i>[Click to expand]</i> 👇</summary>

Choose the appropriate script for your operating system to initialize your Firefox profile folder as a Git working directory or update an existing one. These scripts track the FlexFox repository and update only the `chrome` folder, ignoring other project files.

* Windows: [`git-pull-chrome-only.ps1`](https://raw.githubusercontent.com/yuuqilin/FlexFox/refs/heads/main/scripts/git-pull-chrome-only.ps1)
* macOS / Linux: [`git-pull-chrome-only.sh`](https://raw.githubusercontent.com/yuuqilin/FlexFox/refs/heads/main/scripts/git-pull-chrome-only.sh)

On the first run, the script prompts you to select or enter your Firefox profile folder. Subsequent runs automatically update the previously configured directory. If multiple working directories are detected, you will be prompted to choose one.

The scripts support the following command-line options:

* `-ProfilePath 'path'` / `--profile-path 'path'`
  * Specifies the target Firefox profile folder, bypassing the interactive prompt.

* `-Silent` / `--silent`
  * Performs a silent update using the specified profile. If `-ProfilePath` is omitted, the previously configured directory is used. If no managed working directory is found or multiple managed working directories are detected, the script displays an error message and exits without updating.
  * Suitable for scheduled tasks or unattended updates. Use it alongside the profile path option to keep the target explicit.

Untracked custom files, including `components/uc-user-settings.css` and `content/uc-custom-content.css`, are preserved during updates. If tracked FlexFox files contain uncommitted changes, the update stops without modifying them.

If a Git merge conflict occurs, interactive mode allows you to abort and restore the previous state, or retain the conflict for manual resolution. Silent mode automatically aborts the merge, restores the previous state, reports the conflict, and exits.

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass; & 'C:\Path\To\git-pull-chrome-only.ps1' -ProfilePath 'C:\Path\To\Firefox\Profile' -Silent
```

```bash
bash "/path/to/git-pull-chrome-only.sh" --profile-path "/path/to/firefox/profile" --silent
```

Alternatively, you can manually initialize and configure the working directory using standard Git commands:

**First-time setup**

```bash
git init
git remote add origin https://github.com/yuuqilin/FlexFox.git
git remote set-branches origin main
git config remote.origin.tagOpt --no-tags
git sparse-checkout init --no-cone
git sparse-checkout set /chrome
git fetch --no-tags origin
git checkout -b main origin/main
```

**Manual update**

```bash
git fetch --no-tags --prune origin
git checkout main
git sparse-checkout set /chrome
git merge --no-edit origin/main
git sparse-checkout reapply
```

</details>

## 🐞 Known Issues

- For Floorp users: Switch to `Firefox Proton UI` in Floorp's interface options to reduce compatibility issues.
- Tested on Windows only: May require adjustments for other operating systems.

## 🎖️ Credits

FlexFox builds upon the work of the following excellent projects:

- **[VerticalFox](https://github.com/christorange/VerticalFox)** — provided the foundation for the vertical tab layout and several core layout concepts.  
- **[firefox-csshacks](https://github.com/MrOtherGuy/firefox-csshacks)** — many essential tweaks and layout fixes used in FlexFox are derived from this invaluable collection.

FlexFox is also inspired by the ideas and aesthetics of these projects:

- [EdgyArc-fr](https://github.com/artsyfriedchicken/EdgyArc-fr)  
- [Edge-Frfox](https://github.com/bmFtZQ/edge-frfox)  
- [ArcWTF](https://github.com/KiKaraage/ArcWTF)  
- [shimmer](https://github.com/nuclearcodecat/shimmer)
- [firefox-gx](https://github.com/Godiesc/firefox-gx)

Additional icon assets used in FlexFox:

- **Custom Brand Icons** — modified from elax46's [custom-brand-icons](https://github.com/elax46/custom-brand-icons).  
- **Newaita** — modified from cbrnix's [Newaita](https://github.com/cbrnix/Newaita).  
- **Yosemite Buttons** — modified from Doublefire-Chen's [macos-traffic-light-buttons-as-SVG](https://github.com/Doublefire-Chen/macos-traffic-light-buttons-as-SVG).  
- **Yosemite GTK Theme** — modified from kxmylo's [Yosemite GTK 3.14/3.16 Theme Alpha4](https://www.deviantart.com/kxmylo/art/Yosemite-GTK-3-14-3-16-Theme-Alpha4-575639716).

Special thanks to all these creators for sharing their work with the community.

<details>
  <summary><h2 style="display: inline;">📄 LICENSE</h2></summary>
  <hr style="border: none; border-top: 1px solid #d0d7de; margin: 16px 0;">
  <p>This project is primarily licensed under the MIT License.<br>
  However, parts of the source code (see below) include code originally licensed under the Mozilla Public License 2.0 (MPL-2.0).</p>

  <p>Specifically, some integrated code sections in <code>uc-sidebar.css</code> are derived from the following project:</p>

  <ul>
    <li><strong>Project</strong>: firefox-gx</li>
    <li><strong>Author</strong>: @Godiesc</li>
    <li><strong>Repository</strong>: <a href="https://github.com/Godiesc/firefox-gx">https://github.com/Godiesc/firefox-gx</a></li>
    <li><strong>License</strong>: MPL-2.0</li>
  </ul>

  <p>All such sections retain the original MPL-2.0 license notice and comply with its terms.<br>
  For the full text of the MPL-2.0, please see <code>LICENSES/MPL-2.0.txt</code>.</p>

  <p>This project includes additional graphical assets with the following licenses:</p>
  
  <ul>
    <li><strong>Custom Brand Icons</strong> — licensed under <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/">CC BY-NC-SA 4.0</a></li>
    <li><strong>Newaita</strong> — licensed under <a href="https://creativecommons.org/licenses/by-nc-sa/3.0/">CC BY-NC-SA 3.0</a></li>
    <li><strong>Yosemite Buttons</strong> — licensed under <a href="https://creativecommons.org/licenses/by/3.0/">CC BY 3.0</a></li>
  </ul>
</details>
