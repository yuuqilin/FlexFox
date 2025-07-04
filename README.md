# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox

<div>
 <a href='https://www.mozilla.org'><img src="https://img.shields.io/badge/Last%20tested%20Firefox-v142-orange?logo=firefox"></a>
 <a href='https://github.com/yuuqilin/FlexFox/commits/main/'><img src="https://img.shields.io/github/last-commit/yuuqilin/FlexFox/main"></a>
 <a href='https://github.com/yuuqilin/FlexFox/commits/Beta/'><img src="https://img.shields.io/github/last-commit/yuuqilin/FlexFox/Beta?label=last%20Nightly%20commit&color=purple"></a>
 <a href='https://github.com/yuuqilin/FlexFox/stargazers'><img src='https://img.shields.io/github/stars/yuuqilin/FlexFox?style=social'></a>
</div>

<br>

[English](./README.md) | [日本語](./README_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md) | [简体中文](./README_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md) | [Wiki](https://github.com/yuuqilin/FlexFox/wiki)

FlexFox makes Firefox faster, smarter, and easier to use.  
It cuts out visual noise, keeps the UI steady, and stays fast.  
Designed as a flexible base, it lets you shape your ideal interface without bloat.  
It's not just a new look, it's a better way to browse.  

![FlexFox Dark-Light Theme](https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/FlexFox-light-dark.webp)   

## 🆕 What's New

**🦊 v3.7.0**
* Improved the expand/collapse animation of Sidebery to eliminate flickering during hover.
  (Previously, inconsistent transitions in `padding` and auto-calculated `width` caused tabs to shift in multiple steps instead of moving smoothly, resulting in a jittery or shaky visual effect.)
* Fixed a timing mismatch between the sidebar and Sidebery animations when `uc.flex.sidebery-slow-hover-expand` is enabled.
* Variables controlling sidebar transition speed are now also defined in `uc-sidebery.css` to allow Sidebery's internal animations to stay in sync with the outer container.
  If you've customized the animation speed by copying variables from `uc-variables.css` to `uc-user-settings.css`, you must also copy the corresponding definitions (including the correct `@media` query and `#root` selector) from `uc-sidebery.css` to `uc-custom-content.css`, using the same values. This ensures consistent timing across both userChrome and userContent stylesheets.

<!-- END What's New -->

Preview of auto-hide navbar icons and theme-based background switching in Sidebery:  
<video src="https://github.com/user-attachments/assets/070f798d-2925-4681-ac50-7cd4b36936e7" controls></video>

🖌️ <b>Major Improvement: Sidebery Background Now Theme-Aware</b>
> [!NOTE]
> * FlexFox can now automatically adjust the background color of Sidebery based on the current Firefox theme.
> * To enable this feature, go to Sidebery's **Settings → Appearance → Color scheme** and select `"firefox"`.
> <details><summary>Click to view Sidebery appearance settings screenshot</summary>
> <img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/sidebery-appearance-settings.webp" alt="Sidebery appearance settings" width="50%" />
> </details>

🔧 <b>v3.6.x Performance Fix for v3.5.1 Regression</b>
> [!NOTE]
> * The performance regression introduced in v3.5.1 has been fixed starting from **v3.6.0**.
> * One of the most noticeable improvements is the speed when opening the **“List All Tabs”** panel. Compared to **v3.5.8**, the latest version opens it up to **18× faster**.
> * In addition to addressing the performance regression, parts of the code have been refactored to further improve speed. The difference is now less than **2ms** compared to Firefox's native UI.
> * If you're using any version from the **v3.5.x** series, we recommend updating to the latest release.

<details>  
<summary>👻 <b>Major Update: Auto-Hide Toolbar Icons</b> <i>[Click to expand]</i> 👇</summary>

* Added the `uc.flex.auto-hide-navbar-icons` option to hide navigation bar buttons by default and reveal them on hover.
* The following items remain visible at all times:
  * Window control buttons (minimize, maximize, close)
  * The URL bar
  * The Sidebar toggle button (FlexFox logo)
* If the Sidebar button is moved away from the far left or right edge of the toolbar, or if `uc.flex.revert-to-original-sidebar-icon` is enabled, it will also follow the auto-hide behavior.
* You can adjust the animation timing and easing by copying the following variables from `uc-variables.css` into `uc-user-settings.css`:

  ```css
  --uc-autohide-navbar-icons-duration
  --uc-hover-navbar-icons-duration
  --uc-autohide-navbar-icons-type
  --uc-collapse-navbar-icons-duration
  ```

Preview of auto-hide behavior and theme-based Sidebery background switching: <video src="https://github.com/user-attachments/assets/070f798d-2925-4681-ac50-7cd4b36936e7" controls></video>

</details>

<details>  
<summary>🧩 <b>Major Update: Adjustable Menu Item Spacing</b> <i>[Click to expand]</i> 👇</summary>

* Added the `uc.flex.menu-item-spacing` option to control spacing between menu items.  
  Accepts the following string values:  
  `"1"` or `"small"` = compact spacing (default; same as earlier versions)  
  `"2"` or `"medium"` = moderately spaced  
  `"3"` or `"large"` = Firefox default (widest spacing)  

* You can fine-tune the spacing for individual menus by copying these variables from `uc-variables.css` and editing them in `uc-user-settings.css`:

  ```css
  --uc-app-menu-item-padding-block
  --uc-menu-item-padding-block
  --uc-content-area-context-menu-item-padding-block
  --uc-appMenu-zoom-controls-x-offset
  ```

</details>

<details>  
<summary>🪄 <b>Major Update: Rounded & Floating Web Content</b> <i>[Click to expand]</i> 👇</summary>

A new visual option has been added: `uc.flex.enable-rounded-web-content`.

When enabled, this adds padding around the main content area and applies rounded corners and drop shadows, giving web pages a floating, card-like appearance. This style is inspired by the visual aesthetics of Zen and Microsoft Edge.

The option accepts values from `0` (off) to `2`; higher values increase the padding around the page content.

You can further adjust the appearance by copying the following variables from `uc-variables.css` into `uc-user-settings.css`:

  ```css
  --uc-web-content-margin-small
  --uc-web-content-margin-large
  --uc-web-content-radius-box
  ```

Below is a preview of FlexFox with this feature enabled (`uc.flex.enable-rounded-web-content = 1`):

<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/flexfox-rounded-web-content.webp" alt="Rounded web content preview in FlexFox" width="96%" />

</details>

<details>  
<summary>🪄 <b>Major Update: Optional Flat Corner Style</b> <i>[Click to expand]</i> 👇</summary>

You can now restore Firefox's original flat corner style by enabling the `uc.flex.revert-to-original-flat-corner-style` option. This replaces FlexFox's rounded design with the default, sharper look.

For further customization, you can fine-tune the corner radius of the address bar, search bar, and find bar by copying the following variables from `uc-variables.css` into `uc-user-settings.css`:

```css
--uc-urlbar-border-radius
--uc-urlbar-popup-border-radius
--uc-urlbar-icon-radius
--uc-urlbar-icon-inner-radius
--uc-searchbar-popup-border-radius
--uc-findbar-border-radius
```

<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/firefox-original-flat-corner-style.webp" alt="Firefox original flat corner style preview" width="72%" />

</details>

<details>
<summary>🎨 <b>Major Update: Firefox Color Support</b> <i>[Click to expand]</i> 👇</summary>

FlexFox now supports [Firefox Color](https://color.firefox.com/), so you can freely customize your browser's appearance with live previews.

To make Firefox Color work with FlexFox, choose any background image from the **Custom backgrounds** tab on the Firefox Color site, or enable the `uc.flex.allow-addons-to-change-toolbar-color` setting. Without either of these, your color changes won't take effect.

<p>Here's how FlexFox looks with the <a href="https://github.com/rose-pine/firefox">Rosé Pine Moon</a> theme applied via Firefox Color:</p>
<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/firefox-color-rose-pine-moon.webp" alt="FlexFox with Rosé Pine Moon theme" width="96%" />

</details>

<details>
<summary>🌈 <b>Major Update: Custom Bookmark Folder Icons</b> <i>[Click to expand]</i> 👇</summary>

A new numeric option `uc.flex.enable-colored-bookmarks-folder-icons` has been added:

  - `0`: Disabled
  - `1`: Enables the first set of colored folder icons
  - `2`: Enables the second set of icons and automatically hides folder labels for a cleaner look

**Visual Examples:**
Below is the default Firefox bookmark folder icon:  
<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/colored-bookmarks-folder-1.webp" alt="colored-bookmarks-folder-1" width="65%" />

Enabling `uc.flex.remove-bookmarks-folder-icons` will hide the folder icon and show only text labels:  
<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/colored-bookmarks-folder-2.webp" alt="colored-bookmarks-folder-2" width="65%" />

Setting `uc.flex.enable-colored-bookmarks-folder-icons` to `1` applies the first set of colored icons:  
<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/colored-bookmarks-folder-3.webp" alt="colored-bookmarks-folder-3" width="65%" />

Using `1` together with `uc.flex.remove-bookmarks-labels` removes text labels and shows only icons:  
<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/colored-bookmarks-folder-4.webp" alt="colored-bookmarks-folder-4" width="65%" />

Setting it to `2` automatically hides labels and enables the second set of icons:  
<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/colored-bookmarks-folder-5.webp" alt="colored-bookmarks-folder-5" width="65%" />

You can customize the icon's color, size, and position by editing the `--uc-bookmark-folder-*` variables, and replace the `folder*.svg` files in the `../icons/bookmark/` directory to use your own icons.

</details>

<details>  
<summary>🚀 <b>Major Update: Native Vertical Tabs Integrated with Sidebery</b> <i>[Click to expand]</i> 👇</summary>

* FlexFox now integrates native vertical tabs with Sidebery. When Sidebery is active, the native vertical tabs are automatically hidden, and the sidebar toolbar is collapsed into a colored stripe positioned above Sidebery.
* When Sidebery becomes inactive, such as when a sidebar tool or extension is opened, the native vertical tabs are automatically restored. This provides a usable fallback when Sidebery is not available.
* Native vertical tabs now share the same layout and behavior as Sidebery. They support the same variables for width, transition speed, and trigger area. Features such as locking the sidebar open, fully hiding it, and auto-hiding in fullscreen mode (<kbd>F11</kbd>) are also supported. Transitions between the two are seamless, providing a consistent user experience.

</details>

<details>
<summary>🚀 <b>Major Update: Layout Switching via Hotkeys</b> <i>[Click to expand]</i> 👇</summary>

FlexFox now supports the [UserChrome Toggle Extended](https://addons.mozilla.org/firefox/addon/userchrome-toggle-extended/) extension.
After installing and configuring the extension as shown below:  
<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/userchrome-toggle-extended.webp" alt="userchrome-toggle-extended.webp" width="65%" />  
Make sure to click the `Apply changes` button in the upper-left corner. The settings won't take effect until you do.

Once set up, you can switch between four UI layout modes using keyboard shortcuts:

| Shortcut | Label | Action |
| -------- | ----- | ------ |
| <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>1</kbd> | Lock Sidebery | Toggle between auto-collapsing and keeping open, for both Sidebery and native vertical tabs. Layout behaves like the `uc.flex.disable-sidebery-autohide` option. |
| <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>2</kbd> | Hide Topbar | Toggle full hiding of all top toolbars (tabs, navigation bar, bookmarks bar). When hidden, moving your mouse to the top edge will reveal them. Matches `uc.flex.fully-hide-toolbox`. |
| <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>3</kbd> | Hide Sidebery | Toggle fully hiding Sidebery and native vertical tabs. When hidden, they reappear when the mouse reaches the screen edge. Matches `uc.flex.fully-hide-sidebery`. |
| <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>4</kbd> | Hide All | Toggle hiding all toolbars and the sidebar (Sidebery or native vertical tabs), leaving only the webpage visible. When hidden, move the mouse to the screen edge to show them. Equivalent to `uc.flex.fully-hide-toolbox` + `uc.flex.fully-hide-sidebery`. |

> [!IMPORTANT]
> Options set in `about:config` take priority. If a related option is enabled there, it will override the toggle behavior and lock the layout state. To enable hotkey switching, make sure the corresponding option is set to `false`.

In addition to using keyboard shortcuts, you can also switch layouts using the toggle button provided by the UserChrome Toggle Extended extension.  
<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/userchrome-toggle-button.webp" alt="userchrome-toggle-button" width="28.3%" />  
To change the default hotkeys, click the gear icon in the top-right corner and select **Manage Extension Shortcuts** from the menu.  
<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/shortcut-settings.webp" alt="shortcut-settings" width="50%" />

</details>

<a id="updates-top-start"></a>
<details>

<summary>💬 <b>Previous Updates</b></summary>

<!-- END Release Note -->

**v3.6.10**
* Fixed a regression introduced in v3.6.8 where the expanded sidebar toolbar failed to appear when Sidebery was active and "Expand sidebar on hover" was enabled.

**v3.6.9**
* Fixed a regression in v3.6.8 where the Sidebar Header Stripe color was missing in native horizontal tab mode.
* Fixed a regression in v3.6.8 where opening the Sidebar Header would no longer keep Sidebery expanded in native horizontal tab mode.

**v3.6.8**
* Fixed incorrect hover highlight sizing on the sidebar toggle button caused by Nightly 142.
* Improved `uc.flex.enable-rounded-web-content`: page containers now display shadows and rounded corners correctly without clipping. The underlying styles were completely rewritten for better performance and reduced complexity.
* Changed how z-index is handled for the sidebar and navigation bar — now they elevate dynamically on hover instead of using static values.
* Fixed an issue where the sidebar toolbar could not fully expand when "Expand sidebar on hover" was enabled and Sidebery was active.
* Improved compatibility between the Sidebar Header and theme backgrounds when using the native horizontal tabs layout.

**v3.6.7**
* Improved the visibility behavior of `uc.flex.auto-hide-navbar-icons`. Buttons that open popups now remain visible along with their menus, even when not hovered.
* Standardized animation for hiding buttons in the URL bar, navigation bar, and bookmarks toolbar. You can adjust the transition by copying the following variables from `uc-variables.css` and overriding them in `uc-user-settings.css`:

  ```css
  --uc-autohide-navbar-icons-duration
  --uc-hover-navbar-icons-duration
  --uc-autohide-navbar-icons-type
  --uc-collapse-navbar-icons-duration
  ```

**v3.6.6**
* Fixed an issue caused by Nightly v141 that prevented macOS-style window control buttons from appearing.
  * [Bug 1789579](https://bugzilla.mozilla.org/show_bug.cgi?id=1789579)
* Added more missing menu icons to improve visual consistency.
* Introduced a new option: `uc.flex.auto-hide-navbar-icons`. When enabled, toolbar button icons in the navigation bar will be hidden by default and shown on hover. Window controls, the URL bar, and the Sidebar toggle (FlexFox logo) remain visible by default. If the Sidebar button is moved away from the far left or far right edge, or if `uc.flex.revert-to-original-sidebar-icon` is enabled, it will also follow the auto-hide behavior.
* Major improvement: FlexFox can now automatically adapt the Sidebery background color based on the current Firefox theme. To enable this feature, set the **Color scheme** in Sidebery's **Appearance** settings to `"firefox"`.

**v3.6.5**
* Improved compatibility with themes. When using any non-default Firefox theme, toolbar colors now follow the theme automatically. The `uc.flex.allow-addons-to-change-toolbar-color` option is only needed when using Firefox Color without a background image.
* Fixed an issue where side margins were incorrectly applied when `uc.flex.enable-rounded-web-content` was enabled, the sidebar was set to "Hide tabs and sidebar", and vertical tabs were disabled.
* Improved the unified extensions panel appearance, making extension buttons easier to view and click.  

    <img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/unified-extensions-panel.webp" alt="Improved layout and spacing in the unified extensions panel" width="175px" />
* Added `uc.flex.menu-item-spacing` option to control spacing between menu items.  
  Accepts string values:  
  `"1"` or `"small"` = compact spacing (default; same as in earlier versions)  
  `"2"` or `"medium"` = moderately spaced  
  `"3"` or `"large"` = Firefox default (widest spacing)  

  You can also use the following variables for more granular control:

  ```
  --uc-app-menu-item-padding-block            // App menu item spacing
  --uc-menu-item-padding-block                // Bookmarks & system menus
  --uc-content-area-context-menu-item-padding-block // Page context menu
  --uc-appMenu-zoom-controls-x-offset         // Adjusts zoom control alignment
  ```
* Updated the accepted range for `uc.flex.findbar-position` to match the structure used by `uc-aboutconfig.css` and `uc.flex.menu-item-spacing`.  
  Accepts string values:  
  `"1"` or `"top-center-left"` = top left  
  `"2"` or `"top-right"` = top right  
  `"3"` or `"bottom-right"` = bottom right  
* Fixed alignment issues in menus involving checkbox items, and added fallback icons for more menu entries.

**v3.6.4**
* Fixed layout issues in the sidebar caused by Nightly v141.
  * [Bug 1954155](https://bugzilla.mozilla.org/show_bug.cgi?id=1954155)
  * [Bug 1972060](https://bugzilla.mozilla.org/show_bug.cgi?id=1972060)
* Improved the visual effect of `uc.flex.dim-urlbar-popup-backdrop` by adding a fade animation to the darkened background.
* Added `uc.flex.show-flexfox-version-info-in-about-config`, which displays the current FlexFox version in `about:config` for easier version tracking.
* Refined the appearance of the `about:config` page. Modified preferences are now more clearly highlighted. Additionally, if 'Expand sidebar on hover' is enabled, a 12-second notice will appear in `about:config` indicating that FlexFox's vertical tab optimizations are disabled.

**v3.6.3**
* Added compatibility for `uc.flex.enable-rounded-web-content` when "Hide tabs and sidebar" is enabled in the sidebar settings, ensuring proper spacing around the web content when using the Developer Tools docked to the side.
* Fixed a long-standing issue where Sidebery would shift upward and cause layout jitter when hovering over the Navigation Bar, especially when the number of panels was less than one full row.

  * This behavior was unintended and has now been resolved.
  * I hadn't noticed this before because, in my own setup, the number of panels always exceeded a full row.
  * The expansion animation for the Navigation Bar has also been refined to support both auto-hide and the `Lock Sidebery` shortcut.
  * This fix is applied via `userContent.css`, so you don't need to modify the internal Sidebery styles. Just update FlexFox as usual.

**v3.6.2**
* Improved compatibility for `uc.flex.disable-bookmarks-autohide` in various scenarios.
* Improved compatibility for `uc.flex.enable-rounded-web-content` when using Developer Tools in horizontal tab mode.
* Removed outdated rules and variables, replacing them with more efficient selectors.
* Reduced conditional overhead during variable assignment for Sidebery and native vertical tabs.
* Performance improved by about **7%** compared to v3.6.1, with less than a 2ms difference from the default Firefox UI.

**v3.6.1**
* Removed outdated `:has()` and `:is()` selectors by taking advantage of new Firefox features. Replaced attribute checks with `@media` queries and simplified selectors using newer built-in attributes.
* Performance impact is negligible (less than 2% in tests), with no noticeable speedup.
* Added compatibility between `uc.flex.disable-bookmarks-autohide` and the "Only Show Bookmarks Toolbar on New Tab" setting.
* Improved support for the "Expand sidebar on hover" feature in more scenarios.

**🔥 v3.6.0 Major Performance Update**
> [!WARNING]
> * Fixed a serious performance regression introduced in v3.5.1.
>   * The issue was caused by the new “Rounded & Floating Web Content” feature added in v3.5.1.
>   * One of the most noticeable symptoms was the sluggish response when opening the “List All Tabs” panel — it could take over 0.5 seconds to appear.
>   * The browser UI also became noticeably unresponsive when using DevTools or the Browser Toolbox.
>   * As some long-time users may have guessed, the culprit was once again a `:root:has()` selector affecting rendering performance.
> * This regression has now been resolved, and performance has also been slightly optimized.
> * Compared to v3.5.8, the response time is now approximately **17× faster**.
> * ⬆️ We recommend updating to this version as soon as possible.

For more update logs from earlier versions,  
👉 see the [history archive on the Wiki](https://github.com/yuuqilin/FlexFox/wiki/Earlier-Update-History-(English))

<a href="#updates-top-start">⏫ Back to the beginning of updates</a>
</details>

> [!IMPORTANT]
> When using FlexFox with Firefox's native vertical tabs, make sure to **uncheck** `Expand sidebar on hover` in the `Customize Sidebar` settings.
>
> * If this option is enabled, FlexFox will revert to Firefox's default vertical tab layout instead of using its own optimized design.
> * To enjoy the best appearance and behavior with FlexFox, we recommend **keeping this option unchecked** during normal use.
> * If you need native features like adjustable tab width, you can flexibly enable this option based on your preferences or workflow.

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

> [!IMPORTANT]
> If this is your first time installing FlexFox, please proceed to [Method 2](https://github.com/yuuqilin/FlexFox?tab=readme-ov-file#-method-2-manual-installation) and follow the steps starting from Step 5 **after** running the script.  
> For future updates, simply re-running the script will be enough, and you won't need to repeat the manual steps.

<h4>💻 PowerShell Script</h4>
<details>
<summary><i>[Click to expand]</i> 👇</summary>

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

<h4>🔃 Git Pull</h4>
<details>
<summary><i>[Click to expand]</i> 👇</summary>

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
>    - *Note:* If the settings don't apply correctly, try re-importing them.
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

#### 🪄 Add or Enable Features

| Preference | Description |
|-----------|-------------|
| `uc.flex.add-ui-text-stroke` | Adds a bold outline to UI text for improved legibility, especially at low screen resolutions. |
| `uc.flex.fully-hide-sidebery` | Fully hides Sidebery and native vertical tabs. They reappear when the cursor moves to the screen edge. |
| `uc.flex.fully-hide-toolbox` | Completely hides all top toolbars (native horizontal tabs, navigation bar, bookmarks toolbar); they reappear when the cursor reaches the top edge of the screen. |
| `uc.flex.auto-hide-navbar-icons` | Hides navigation bar icons by default. They reappear when hovering over the toolbar. Window control buttons, the URL bar, and the sidebar button (FlexFox logo) remain visible, unless the sidebar button is not placed at the edge of the navigation bar or `uc.flex.revert-to-original-sidebar-icon` is enabled. |
| `uc.flex.allow-addons-to-change-toolbar-color` | Allows toolbar colors set by extensions like Firefox Color to take effect, especially when no background image is selected. |
| `uc.flex.enable-gradient-highlight` | Enables gradient styling for the highlight color used across key UI elements such as the FlexFox logo, sidebar stripe, and bookmark star icon. This numeric setting accepts 0 to disable gradients, or values 1 to X to switch between different gradient styles. |
| `uc.flex.enable-colored-bookmarks-folder-icons` | Enables colored icons for bookmark folders. This numeric setting accepts `0` (disabled), `1` (uses the first icon set), or `2` (uses the second icon set, with labels automatically hidden). |
| `uc.flex.remove-bookmarks-folder-icons` | Removes folder icons from bookmarks. |
| `uc.flex.remove-bookmarks-labels` | Removes text labels from bookmark folders. |
| `uc.flex.show-flexfox-version-info-in-about-config` | Shows a confirmation message in the `about:config` page indicating that FlexFox is installed, along with the current version number. |
| `uc.flex.show-pin-tabs-separator-in-expanded-state` | Shows a separator between pinned and regular tabs in the native vertical tabs when in expanded state. Firefox hides this separator by default in this mode. |
| `uc.flex.dim-urlbar-popup-backdrop` | Darkens the background when the URL bar dropdown is open. This numeric setting accepts values from `0` (disabled) to `2`, where higher values apply stronger dimming. |
| `uc.flex.move-pip-volume-to-top` | Moves the volume control button in Picture-in-Picture (PiP) windows to the top. |
| `uc.flex.enable-rounded-web-content` | Adds margin, shadow, and rounded corners to the web content area. This numeric setting accepts values from `0` (disabled) to `2`, where higher values increase margin. |

#### 🚫 Disable or Revert Features

| Preference | Description |
|-----------|-------------|
| `uc.flex.disable-flexfox` | Disables all FlexFox styles and features without needing to restart Firefox. |
| `uc.flex.skip-loading-uc-*.css` | Skips loading specific `uc-*.css` files under `./components/` and `./content/`. For example, enabling `uc.flex.skip-loading-uc-newtab.css` will skip loading `./content/uc-newtab.css`. |
| `uc.flex.disable-bookmarks-autohide` | Disables auto-hide for the bookmarks toolbar. |
| `uc.flex.disable-tabs-toolbar-autohide` | Prevents the native horizontal tabs from auto-hiding when Sidebery is inactive. |
| `uc.flex.disable-findbar-autohide` | Prevents the Findbar from automatically hiding when it loses focus. |
| `sidebar.visibility` (`always-show`) | A native Firefox preference. When set to `always-show`, Firefox's built-in auto-collapse for the vertical tab bar is disabled, and FlexFox's enhanced auto-collapse takes over. FlexFox offers smoother animations, a cleaner collapsed layout, and improved handling of pinned tabs. This behavior can also be toggled by unchecking **“Expand sidebar on hover”** in the sidebar settings. |
| `sidebar.visibility` (`expand-on-hover`) | When set to `expand-on-hover`, Firefox's native vertical tab auto-collapse behavior is restored, and FlexFox's own auto-collapse is disabled. This can also be enabled via **“Expand sidebar on hover”** in the sidebar settings. In this mode, both the native vertical tabs and Sidebery can toggle between expanded and collapsed states using <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>Z</kbd> or the sidebar toggle button. |
| `sidebar.animation.expand-on-hover.duration-ms` | A native Firefox setting that defines the animation speed for expanding and collapsing the vertical tabs when `sidebar.visibility` is set to `expand-on-hover`. |
| `uc.flex.disable-sidebery-autohide` | Disables auto-collapse for Sidebery and native vertical tabs. |
| `uc.flex.disable-nav-bar-first-item-right-padding` | By default, FlexFox adds right-side padding after the first item in the navigation bar to improve visual separation and alignment between the vertical tabs and nearby items. This option disables that padding. |
| `uc.flex.disable-menu-icons` | Disables custom icons in menus added by FlexFox. |
| `uc.flex.revert-to-original-window-controls` | Reverts to Firefox's default window control buttons (minimize, maximize, close), replacing the macOS-style icons used by FlexFox. |
| `uc.flex.revert-to-original-flat-corner-style` | Reverts the rounded corner radius of the urlbar, searchbar, and findbar to Firefox's original flatter style. |
| `uc.flex.revert-to-original-bookmark-star-icon` | Reverts the bookmark star icon to Firefox's default design, replacing the custom icon used by FlexFox. |
| `uc.flex.revert-to-original-sidebar-icon` | Reverts the sidebar button icon to Firefox's default design, replacing the FlexFox logo. |

#### 🪛 Modify or Adjust Features

| Preference | Description |
|-----------|-------------|
| `uc.flex.increase-sidebery-expanded-width` | Increases the expanded width of Sidebery and, when `uc.flex.disable-sidebery-autohide` is enabled or `Lock Sidebery` is active, also applies the increased width to the native vertical tab panel. |
| `uc.flex.increase-navbar-height` | Restores the thicker navbar height used in earlier FlexFox versions. This change overrides the current default, which matches Firefox's original compact height. |
| `uc.flex.switch-to-alternate-condensed-panel` | By default, FlexFox replaces the native unified extensions panel with an icon-only view. In this case, right-click an icon to access extension options. This option switches to an alternate condensed panel that includes extension names and option buttons for a more descriptive view. |
| `uc.flex.sidebery-fast-hover-expand` | Speeds up auto-expand/collapse for Sidebery and native vertical tabs. |
| `uc.flex.sidebery-slow-hover-expand` | Slows down auto-expand/collapse for Sidebery and native vertical tabs. |
| `uc.flex.max-visible-vertical-pinned-tabs` | Sets the maximum number of pinned tabs visible per column in the native vertical tabs (numeric value, typically 4–6). Content beyond this limit will scroll, so adjust this to avoid scrollbars based on your usage. |
| `uc.flex.findbar-position` | Sets the Findbar's position. Accepts string values: `"top-center-left"` or `"1"` = center-left top, `"top-right"` or `"2"` = top right, `"bottom-right"` or `"3"` = bottom right. |
| `uc.flex.menu-item-spacing` | Sets the vertical spacing between items in the Firefox app menu, bookmarks menu, and context menus. Accepts string values: `"1"` or `"small"` = narrow spacing, `"2"` or `"medium"` = medium spacing, `"3"` or `"large"` = wide spacing. |

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
