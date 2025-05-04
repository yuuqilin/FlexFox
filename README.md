# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox

<div>
 <a href='https://www.mozilla.org'><img src="https://img.shields.io/badge/Last%20tested%20Firefox-v140-orange?logo=firefox"></a>
 <a href='https://github.com/yuuqilin/FlexFox/commits/main/'><img src="https://img.shields.io/github/last-commit/yuuqilin/FlexFox/main"></a>
 <a href='https://github.com/yuuqilin/FlexFox/commits/Beta/'><img src="https://img.shields.io/github/last-commit/yuuqilin/FlexFox/Beta?label=last%20Nightly%20commit&color=purple"></a>
 <a href='https://github.com/yuuqilin/FlexFox/stargazers'><img src='https://img.shields.io/github/stars/yuuqilin/FlexFox?style=social'></a>
</div>

<br>

FlexFox makes Firefox faster, smarter, and easier to use.  
It cuts out visual noise, keeps the UI steady, and stays fast.  
Designed as a flexible base, it lets you shape your ideal interface without bloat.  
It's not just a new look, it's a better way to browse.  

![FlexFox Dark-Light Theme](./assets/FlexFox-light-dark.webp)   

## 🆕 What's New

**v3.2.3**  
- Continued fixes for display glitches in expand-on-hover mode (native vertical tabs).  

<details>

<summary>💬 <b>Previous Updates</b></summary>

**v3.2.2**  
- Fixed various display issues when using Firefox's native vertical tabs in expand-on-hover mode.  

**v3.2.1**  
- Fixed an issue where native vertical tabs were obscured by the sidebar when expanded.  

**v3.2.0**  
- Fixed a bug where the sidebar toggle button lost its background on hover.  
- Full support for Firefox v138’s native vertical tabs in *expand-on-hover* mode.  
  When the new sidebar setting **“Expand sidebar on hover”** is enabled, FlexFox’s own auto-collapse feature for vertical tabs is disabled in favor of the native behavior.  
  In this mode, the width of the vertical tab bar can be freely adjusted.  

**v3.1.9**  
- Fixed an issue where the sidebar toggle button would disappear when a theme was applied.  
- Fixed incorrect layout offsets for the bookmarks toolbar and navigation bar when Sidebery’s auto-hide was disabled. 

**v3.1.8**  
- Removed the sidebar header that now appears in *web extension panel windows* (introduced in Nightly v140), restoring the intended compact layout for extensions like Sidebery.  
- Adjusted alignment between the navigation bar and vertical tabs.  

**v3.1.7**  
- Fixed a timing issue in the native vertical tabs animation. Tab label appearance now syncs properly with the tab width expansion.  
- Improved the file size estimation in the PowerShell installer script to more accurately reflect the actual download size.  

**v3.1.6**  
- Users can now create a `uc-custom-content.css` file in the `content` folder to apply custom styles for web content. It is imported at the end of `userContent.css`, allowing it to override previous styles. Since this file is not part of the FlexFox repository, its contents will remain untouched during future updates.  
- Restructured the project directory to simplify the update process for users who update via Git clone and pull. This change also lays the foundation for the upcoming install/update script.  

**v3.1.5**  
- Reduced unnecessary style rules when the new sidebar is enabled.  
- Fixed a long-standing bug in the classic sidebar where the sidebar would collapse when hovering over the switcher menu.  
_Note: This bug had existed for quite some time. Since its impact was minor and fixing it required a slight performance cost, it was previously left unaddressed. Now that FlexFox has fully transitioned to the new sidebar, this patch closes the chapter on the legacy version with a proper fix._

**v3.1.4**  
- Fine-tuned the positioning of the findbar.

**v3.1.3**  
- Fixed an issue where the findbar failed to display match count when positioned in the bottom-right corner.

**v3.1.2**

- The default position of the findbar has been changed from *top-center-left* to *top-right*. A new string-based preference `uc.flex.findbar-position` has been added:
  - `"top-center-left"` or `"0"` moves the findbar to the previous default location near the top center-left.
  - `"top-right"` or `"1"` places it in the new default location at the top right.
  - `"bottom-right"` or `"2"` sets it to Firefox's original position at the bottom right.
- The `--uc-findbar-top` variable has been removed. Findbar placement is now controlled using `--uc-findbar-x-position` and `--uc-findbar-y-position`, allowing full customization.
- The hardcoded minimum width of the sidebar has been removed. The value is now fully controlled via the `--uc-sidebar-width` variable.

**v3.1.1**

- Updated the default animation for collapsing/expanding Sidebery to `ease-in-out` to match Firefox's native vertical tabs (previously Sidebery used `linear`). Users can customize the transition type via the `--uc-autohide-transition-type` variable in `uc-user-settings.css`.
- The animation type for Firefox's native vertical tabs is now also controlled by `--uc-autohide-transition-type`, allowing user customization.
- Fixed an issue where enabling the `uc.flex.fully-hide-sidebery` option in a non-maximized window would leave unwanted blank space at the edge and cause incorrect Sidebery height.

With this update, all previously missing features from the horizontal tab mode are now fully compatible with Firefox's native vertical tabs. FlexFox v3.1.1 brings complete feature parity, making it seamless for users to switch from the old setup.

**v3.1.0**
- Refactored the structure of `uc-variables.css`. Frequently used and user-customizable variables are now grouped at the top of the file with clearer descriptions.
- Overhauled the logic for overriding the toolbar background color in FlexFox. This update should fully resolve issues with theme background image alignment, transparency handling, and incorrect display when the window is inactive.
- Improved animation smoothness when expanding or collapsing vertical tabs.
- Adjusted the navbar positioning so that its buttons align better with vertical tabs.
- Toggling `uc.flex.allow-addons-to-change-toolbar-color` no longer causes the sidebar to shift vertically.

**v3.0.7**
- Fixed incorrect background highlight for the active tab when using Firefox's native tabs (both horizontal and vertical layouts).  
- Fixed a visual glitch in themes where the background image did not align properly between the navigation bar and bookmarks bar, when the menubar was shown and the bookmarks bar was set to auto-hide.  
- Fixed an issue where the menubar background color did not update correctly when the Firefox window was inactive.

**3.0.6**
- Updated multiple imported styles to their latest versions.  
  - Added a closing animation to the find bar when it loses focus.  
  - Improved behavior to keep the navigation bar visible when various panels are open.  
- Fixed a non-standard syntax to prevent potential bugs and ease future debugging.

**v3.0.5**  
- Fixed the position offset of the sidebar stripe when `uc.flex.allow-addons-to-change-toolbar-color` is enabled.

**v3.0.4**  
- Fixed a typing mistake.  
- Fixed the horizontal offset of the bookmarks toolbar when the new sidebar option `Hide tabs and sidebar` is enabled.

**v3.0.3**  
- Fixed an issue where the sidebar stripe could not expand when `uc.flex.fully-hide-sidebery` was enabled or in fullscreen mode. This update also resolves a transition desync between the sidebar stripe and Sidebery under the same conditions.  
- Corrected a theme color issue where the menu bar displayed an inconsistent background color compared to the navigation toolbar.

**v3.0.2**
- Fixed animation issue when the new sidebar is placed on the right side.  
- Native vertical tabs now use the same expand/collapse speed as Sidebery. You can adjust the speed using the `uc.flex.sidebery-fast-hover-expand` or `uc.flex.sidebery-slow-hover-expand` options, or by directly modifying the `--uc-autohide-*` and `--uc-hover-*` variables to suit your preference.

**v3.0.1**  
- Fixed an issue where the position of the sidebar stripe was incorrect when both `uc.flex.disable-bookmarks-autohide` and the new sidebar were enabled.  
- Fixed an issue where the width of the sidebar stripe displayed incorrectly when both `uc.flex.disable-sidebery-autohide` and the new sidebar were enabled.

**v3.0.0**
- Integrated Firefox's native vertical tabs with Sidebery.
  - When Sidebery is active, the native vertical tabs are automatically hidden. The new sidebar collapses into a slim colored stripe at the top of Sidebery. Hovering over the stripe reveals the sidebar toolbar buttons.
  - When Sidebery is inactive (e.g., when another sidebar tool or extension is opened), the native vertical tabs are shown instead.
  - When using the F1 key to quickly toggle Sidebery, since Sidebery and native vertical tabs share the same width and layout, the switch appears seamless.
  - Supports automatic layout adjustment for both left- and right-sided sidebars, adapting to different UI placements.
- Added a new numeric option `uc.flex.max-visible-vertical-pinned-tabs` (accepted values: 4–6). This controls how many pinned tabs can be displayed vertically in each column of the native vertical tabs panel. The default is 4. If the number of vertically stacked pinned tabs exceeds this, a scrollbar will appear. 

> [!IMPORTANT]
> Built-in vertical tabs now automatically collapse and expand on hover. Use the `Expand sidebar` button (Alt+Ctrl+Z) to enable this feature.  
> <details>
> <summary>🖼️ <b>Auto-collapse demo for native vertical tabs</b></summary>
> <p>Native vertical tabs expanded, with <code>uc.flex.show-pin-tabs-separator-in-expanded-state</code> set to false</p>
> <img src="./assets/vertical-tabs-expanded.webp" alt="vertical-tabs-expanded" width="50%" />
> <p>Native vertical tabs collapsed, with <code>uc.flex.show-pin-tabs-separator-in-expanded-state</code> set to false</p>
> <img src="./assets/vertical-tabs-collapsed.webp" alt="vertical-tabs-collapsed" width="50%" />
> </details>  

> [!TIP]
> **Users can now create a `uc-user-settings.css` file in the `components` folder to customize FlexFox styles. This file loads after FlexFox and overrides its styles, so custom changes remain intact even after future updates.**  
> **See this section: [User-Customizable Styles (`uc-user-settings.css`)](https://github.com/yuuqilin/FlexFox?tab=readme-ov-file#-user-customizable-styles-uc-user-settingscss)**

**v2.1.2**  
- Fixed an issue where the bookmarks bar would shift when both native vertical tabs and `uc.flex.disable-bookmarks-autohide` were enabled.  
- Fixed a delay in the URL bar transition when entering fullscreen mode.  

**v2.1.1**  
- Fixed an issue where the native vertical tabs background became transparent in Firefox v137.  
- Added the `uc.flex.disable-native-vertical-tabs-autohide` option to disable auto-collapsing of native vertical tabs when set to true.  

**v2.1.0**  
- Built-in vertical tabs now automatically collapse and expand on hover. Use the `Expand sidebar` button (Alt+Ctrl+Z) to enable this feature.  
- Added a new option `uc.flex.show-pin-tabs-separator-in-expanded-state` to display a separator line in the pinned tabs panel when using native vertical tabs.  
- Fixed an issue where themes couldn't be applied when using built-in vertical tabs, and a bug where the theme background image broke when auto-hiding the bookmarks bar.  
- **Users can now create a `uc-user-settings.css` file in the `components` folder to customize FlexFox styles. This file loads after FlexFox and overrides its styles, so custom changes remain intact even after future updates.**  
- Native vertical tabs and Sidebery are not yet integrated. Only one can be used at a time.  

The sidebar tool button design is based on [firefox-gx](https://github.com/Godiesc/firefox-gx) by @Godiesc. Thanks to @Godiesc for the excellent implementation.  

**v2.0.3**  
- Added `sidebar-positionend` attribute for compatibility with Firefox v138+, with a slight tweak to the width of the new sidebar.  

**v2.0.2**  
- Updated `@media` rule for Firefox v137+ compatibility.  

**v2.0.1**  
- Added a 1px border to the top when the window is not maximized.  
- Cleaned up the styles by removing unnecessary rules and comments.  

**v2.0.0**:  
- Completely rewritten core functionality, achieving a 28x speed improvement over the previous version.  
   - The first right-click menu opening after launch now takes just 13ms, matching Firefox's native theme performance.  
   - Opening the "List All Tabs" menu with 205 tabs takes 26ms, also on par with the native theme.  
   - In other words, after this rewrite, v2.0.0 has almost no impact on Firefox's performance.  
- Fixed display issues with the address bar and native vertical tabs in Nightly (v135).  

<details>
<summary>🖼️ <b>Experience the new feature in action</b></summary>
<p>FlexFox with the dark theme and <code>uc.flex.disable-sidebery-autohide</code> enabled:</p>
<img src="./assets/disable-sidebery-autohide.webp" alt="disable-sidebery-autohide" width="96%" />
<p>Combined with <code>uc.flex.fully-hide-toolbox</code>:</p>
<img src="./assets/disable-sidebery-autohide-with-fully-hide-toolbox.webp" alt="disable-sidebery-autohide-with-fully-hide-toolbox" width="96%" />
</details>

**v1.1.1**:
- Resolved an issue where the Findbar's background color did not display correctly when a theme was applied.

**v1.1.0**:
- Fixed background image clipping on hover with bookmarks toolbar auto-hide enabled and theme background active.
- Adjusted zoom level text brightness.
- Corrected window controls positioning in Nightly (v135). Resolved compatibility with `customtitlebar` after `tabsintitlebar` deprecation.
- Added preference `uc.flex.disable-sidebery-autohide` to disable Sidebery auto-collapse.

> [!IMPORTANT]
> Before importing the v1.1.0 version of `sidebery-styles.json`, clear the old styles first. Open Sidebery settings (via the gear icon) > `Styles editor` > clear all styles under both the `Sidebar` and `Group page` sections, then import the new styles.  
> Importing `sidebery-settings.json` may occasionally cause panel data loss. Be sure to create a snapshot backup of your panel data beforehand.

**v1.0.4**:
- The zoom level icon is now always visible when the webpage is not at the default zoom level.
- The bookmark star icon is now always visible when the webpage has already been bookmarked.  
   <img src="./assets/urlbar-star-light.webp" alt="urlbar-star-light" width="380" />  
   <img src="./assets/urlbar-star-dark.webp" alt="urlbar-star-dar" width="380" />

**v1.0.3**:
- Optimized performance when the `uc.flex.allow-addons-to-change-toolbar-color` option is enabled, improving speed by 1.4x compared to v1.0.2.

**v1.0.2**:
- Improve URL bar switcher and chicklet visuals.  
- Add option `uc.flex.allow-addons-to-change-toolbar-color` to allow themes and addons to customize toolbar background image and color.  
   <img src="./assets/allow-addons-to-change-toolbar-color.webp" alt="allow-addons-to-change-toolbar-color" width="96%" />

**v1.0.1**:
- Fixed the issue where the tracking protection icon in the URL bar was not hidden.
- Added `uc-pdf.js.css`.
- Added LICENSE file.

**v1.0.0**:
- Performance has improved dramatically, running 100x faster than previous versions. Opening the context menu now only adds **16ms** of latency compared to the default interface.

> [!IMPORTANT]
> If you previously used FlexFox on Firefox versions earlier than v133, reset all settings by navigating to `about:config`, searching for `uc.flex.`, and removing all entries before updating.

</details>

## ✨ Features

### 🌟 Minimalism

> *Maximize your view.*

- Freely collapse or hide the toolbar and sidebar independently.  
  > *You can freely choose to hide the sidebar, the navigation bar, or both, depending on how you want to organize your workspace.*

- Focus entirely on content when everything is hidden.  
  > *Turn pages into sticky-note-like windows on your desktop, making it easy to compare pages side by side without unnecessary browser UI. You can also maximize the page area without entering fullscreen, keeping the desktop environment accessible.*

### 🌟 Stability

> *Stay steady.*

- UI elements expand without shifting the page layout.  
  > *Collapsed toolbars or sidebars float over the page instead of pushing it aside, avoiding disruptive visual jumps.*

- Tabs stay exactly where they were after unfolding.  
  > *When vertical tabs expand, they smoothly stretch without shifting their positions, so there is no jumping and no need to reposition your mouse.*

### 🌟 Adaptability

> *Adapts on its own.*

- Automatically hides native tabs when Sidebery is active.  
  > *Prevents redundant UI elements by showing only what is needed.*

- Compatible with different Firefox setups.  
  > *Whether your sidebar is on the left or right, and whether you show the title bar, menu bar, or bookmarks bar, FlexFox adapts without breaking the layout.*

### 🌟 Flexibility

> *Shape it your way.*

- Quickly enable or disable features through `about:config`.  
  > *You can customize FlexFox to fit your needs by disabling any feature you don't want, while keeping Firefox's original behavior intact.*

- Deep customization through your own user styles.  
  > *FlexFox loads user styles after its own, so you can safely override any setting and keep your changes across future updates.*

## 💿 Deployment

### 🚀 Method 1: Automatic Installation and Updates

If this is your first time installing FlexFox, please proceed to [Method 2](https://github.com/yuuqilin/FlexFox?tab=readme-ov-file#-method-2-manual-installation) and follow the steps starting from Step 5 **after** running the script.  
For future updates, simply re-running the script will be enough, and you won't need to repeat the manual steps.

<details>
<summary><h4>💻 PowerShell Script [Click to expand] 👇</h4></summary>

- **Online deployment** – Run this command in a PowerShell window:
  ```powershell
   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass; iex ((New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/yuuqilin/FlexFox/refs/heads/main/deploy-userchrome.ps1') -replace '(?s)<#.*?#>', '')
  ```
  **Silent online deployment**:
  ```powershell
   $env:FLEXFOX_INSTALL_MODE = 'silent'; Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass; iex ((New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/yuuqilin/FlexFox/refs/heads/main/deploy-userchrome.ps1') -replace '(?s)<#.*?#>', '')
  ```

- **Local deployment** – Download the [`deploy-userchrome.ps1`](https://github.com/yuuqilin/FlexFox/raw/refs/heads/main/deploy-userchrome.ps1) script and run it in PowerShell:
  ```powershell
   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass; .\deploy-userchrome.ps1
  ```
  **Silent local deployment**:
  ```powershell
   $env:FLEXFOX_INSTALL_MODE = 'silent'; Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass; .\deploy-userchrome.ps1
  ```

- **Scheduled or Run dialog deployment** – Use the following for silent deployment:
  ```powershell
   powershell -ExecutionPolicy Bypass -Command "$env:FLEXFOX_INSTALL_MODE = 'silent'; .\deploy-userchrome.ps1"
  ```

</details>

<details>
<summary><h4>🔃 Git Pull [Click to expand] 👇</h4></summary>

- Use one of the `git-pull-chrome-only` scripts inside the `scripts` folder, depending on your environment. These scripts will:
  - Automatically set your Firefox profile folder as a Git working directory
  - Track the FlexFox repository as a remote
  - Download and update only the `chrome` folder (excluding all other files)

- Alternatively, you can manually add the remote repository to your Firefox profile folder:

  **First-time setup (initialize the profile folder):**
  ```bash
  git init
  git remote add origin https://github.com/yuuqilin/FlexFox.git
  git sparse-checkout init --no-cone
  git sparse-checkout set /chrome
  git fetch origin
  git checkout -b main origin/main
  ```

  **Manual update (after setup):**
  ```bash
  git fetch origin
  git checkout main
  git merge origin/main --allow-unrelated-histories
  ```

</details>

---

### 👷 Method 2: Manual Installation

> [!IMPORTANT]
> 1. Install [Sidebery](https://addons.mozilla.org/firefox/addon/sidebery/) (optional but recommended).
> 2. Download the appropriate FlexFox version:
>    - [FlexFox](https://github.com/yuuqilin/FlexFox/archive/refs/heads/main.zip) for standard Firefox.
>    - [FlexFox Beta](https://github.com/yuuqilin/FlexFox/archive/refs/heads/Beta.zip) for Firefox Beta/Nightly.
>    - [FlexFox ESR](https://github.com/yuuqilin/FlexFox/archive/refs/heads/ESR.zip) for Firefox ESR.
> 3. Open `about:support`, find **Profile Folder**, and click **Open Folder** to access your Firefox profile directory.
> 4. Copy the `chrome` folder and the `user.js` file from the `scripts` directory into your Firefox profile folder.
> 5. *(Optional)* Open `user.js` in a text editor and remove `//` comment markers to enable additional features.
>    - Make sure the following settings remain `true`:
>      - `toolkit.legacyUserProfileCustomizations.stylesheets`
>      - `svg.context-properties.content.enabled`
> 6. Restart Firefox, then delete `user.js` so that any manual changes made in `about:config` can persist.
> 7. Configure Sidebery:
>    - Open Sidebery settings (gear icon in the sidebar).
>    - Navigate to `Help` > `Import addon data`, then import both `sidebery-settings.json` and `sidebery-styles.json` from the `Sidebery` folder in the downloaded archive.
>    - *Note:* If the settings don’t apply correctly, try re-importing them.
> 8. *(Optional)* Open `about:config` and search for `uc.flex.` to toggle FlexFox features.

## ⚙️ Options

### 📜 User-Customizable Styles (`uc-user-settings.css`, `uc-custom-content.css`)

> [!TIP]  
> You can safely customize both the Firefox interface and webpage content without modifying any core files.  
>  
> To apply your own styles:  
> - For **interface (chrome) styles**, create a file named `uc-user-settings.css` inside the `components` folder.  
> - For **webpage (content) styles**, create a file named `uc-custom-content.css` inside the `content` folder.  
>  
> You can copy and override any style rules or variables from the built-in files (e.g., from `uc-variables.css`) and adjust them as needed. These user-defined files are loaded **after** the default styles, so your customizations will take precedence.  
>  
> These files are **not part of the FlexFox project by default**, which means they will **not be affected by future updates**. Your changes will remain intact even after upgrading FlexFox.  
>  
> 💡 If you're copying rules defined inside a specific selector like `:root` or `:root:has(...)`, be sure to copy the entire selector block to keep the context intact.

### 🧩 Configurable Preferences (`about:config`)

| Preference | Description |
|-----------|-------------|
| `uc.flex.add-ui-text-stroke` | Adds a bold outline to UI text for improved legibility, especially at low screen resolutions. |
| `uc.flex.add-bookmarks-left-margin` | Adds spacing between bookmarks and the vertical tabs when bookmarks are placed second from the left on the navigation bar, ensuring better visual separation and alignment. |
| `uc.flex.fully-hide-sidebery` | Fully hides Sidebery; it reappears when the cursor moves to the screen edge. |
| `uc.flex.fully-hide-toolbox` | Completely hides all top toolbars (native horizontal tabs, navigation bar, bookmarks toolbar); they reappear when the cursor reaches the top edge of the screen. |
| `uc.flex.increase-sidebery-expanded-width` | Increases the width of Sidebery when expanded. |
| `uc.flex.allow-addons-to-change-toolbar-color` | Allows themes and extensions to override toolbar background color and image. |
| `uc.flex.disable-bookmarks-autohide` | Disables auto-hide for the bookmarks toolbar. |
| `uc.flex.disable-tabs-toolbar-autohide` | Prevents the native horizontal tabs from auto-hiding when Sidebery is inactive. |
| `uc.flex.disable-findbar-autohide` | Prevents the Findbar from automatically hiding when it loses focus. |
| `uc.flex.disable-native-vertical-tabs-autohide` | Disables auto-collapse for the native vertical tabs. |
| `sidebar.visibility` | When set to `expand-on-hover`, enables Firefox's built-in auto-collapse for vertical tabs. FlexFox will defer to the native behavior and disable its own auto-collapse. This can also be toggled via **“Expand sidebar on hover”** in the sidebar settings. While the native version offers less polish than FlexFox (e.g. in smoothness, layout cleanliness, and pinned tab handling), it allows toggling collapse state with <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>Z</kbd>. |
| `uc.flex.disable-sidebery-autohide` | Disables auto-collapse for Sidebery. |
| `uc.flex.remove-bookmarks-folder-icons` | Removes folder icons from bookmarks. |
| `uc.flex.remove-bookmarks-labels` | Removes text labels from bookmark folders. |
| `uc.flex.switch-to-alternate-condensed-panel` | By default, FlexFox replaces the native unified extensions panel with an icon-only view. In this case, right-click an icon to access extension options. This option switches to an alternate condensed panel that includes extension names and option buttons for a more descriptive view. |
| `uc.flex.revert-to-original-window-controls` | Reverts to Firefox's default window control buttons (minimize, maximize, close), replacing the macOS-style icons used by FlexFox. |
| `uc.flex.sidebery-fast-hover-expand` | Speeds up auto-expand/collapse for Sidebery and native vertical tabs. |
| `uc.flex.sidebery-slow-hover-expand` | Slows down auto-expand/collapse for Sidebery and native vertical tabs. |
| `uc.flex.show-pin-tabs-separator-in-expanded-state` | Shows a separator between pinned and regular tabs in the native vertical tabs when in expanded state. Firefox hides this separator by default in this mode. |
| `uc.flex.max-visible-vertical-pinned-tabs` | Sets the maximum number of pinned tabs visible per column in the native vertical tabs (numeric value, typically 4–6). Content beyond this limit will scroll, so adjust this to avoid scrollbars based on your usage. |
| `uc.flex.findbar-position` | Sets the Findbar's position. Accepts string values: `"top-center-left"` or `"0"` = center-left top, `"top-right"` or `"1"` = top right, `"bottom-right"` or `"2"` = bottom right. |

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

Much appreciation goes to all these creators for sharing their work with the community.

<details>
  <summary><h2 style="display: inline;">📄 LICENSE</h2></summary>
  <hr style="border: none; border-top: 1px solid #d0d7de; margin: 16px 0;">
  <p>This project is primarily licensed under the MIT License.<br>
  However, parts of the source code (see below) incorporate code originally licensed under the Mozilla Public License 2.0 (MPL-2.0).</p>

  <p>Specifically, some integrated code sections in <code>uc-sidebar.css</code> are derived from the following project:</p>

  <ul>
    <li><strong>Project</strong>: firefox-gx</li>
    <li><strong>Author</strong>: @Godiesc</li>
    <li><strong>Repository</strong>: <a href="https://github.com/Godiesc/firefox-gx">https://github.com/Godiesc/firefox-gx</a></li>
    <li><strong>License</strong>: MPL-2.0</li>
  </ul>

  <p>All such sections retain the original MPL-2.0 license notice and comply with its terms.<br>
  For the full text of the MPL-2.0, please see <code>LICENSES/MPL-2.0.txt</code>.</p>
</details>
