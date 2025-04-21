# FlexFox

<div>
 <a href='https://www.mozilla.org'><img src="https://img.shields.io/badge/Last%20tested%20Firefox-v139-orange?logo=firefox"></a>
 <a href='https://github.com/yuuqilin/FlexFox/commits/main/'><img src="https://img.shields.io/github/last-commit/yuuqilin/FlexFox/main"></a>
 <a href='https://github.com/yuuqilin/FlexFox/commits/Beta/'><img src="https://img.shields.io/github/last-commit/yuuqilin/FlexFox/Beta?label=last%20Nightly%20commit&color=purple"></a>
 <a href='https://github.com/yuuqilin/FlexFox/stargazers'><img src='https://img.shields.io/github/stars/yuuqilin/FlexFox?style=social'></a>
</div>

<br>

A customizable Firefox theme inspired by [VerticalFox](https://github.com/christorange/VerticalFox), [EdgyArc-fr](https://github.com/artsyfriedchicken/EdgyArc-fr), [Edge-Frfox](https://github.com/bmFtZQ/edge-frfox), [ArcWTF](https://github.com/KiKaraage/ArcWTF), [shimmer](https://github.com/nuclearcodecat/shimmer) and [firefox-csshacks](https://github.com/MrOtherGuy/firefox-csshacks). FlexFox offers extensive flexibility and feature options to enhance your browsing experience.

## 🆕 What's New

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

<details>
  <summary>🔧 <b>Various Fixes (v3.0.1–v3.0.7)</b></summary>

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

</details>

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


<details>

<summary>💬 <b>Previous Updates</b></summary>

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

## 🖼️ Previews

![FlexFox Light Theme](./assets/FlexFox-light.webp)  
![FlexFox Dark Theme](./assets/FlexFox-dark.webp)  
*Above: Light and Dark theme previews of FlexFox in action.*

## ✨ Features

- **Minimal interface and lightweight performance**
  - Simplifies the UI and minimizes resource usage.

- **Auto-hide toolbars**
  - Automatically hides the horizontal tab bar, bookmarks toolbar, all top toolbars, and Sidebery's sidebar.
  - Expands them when hovered.

- **Customizable toolbar visibility**
  - Choose which toolbars and Sidebery sidebar to show or hide.
  - With all toolbars and sidebar hidden, the browser displays only webpage content, offering a full-screen experience without full-screen mode.

- **Trigger zones for hidden toolbars**
  - Easily expand hidden toolbars or Sidebery sidebar from window edges.
  - Works even when the window is not maximized.
  - Adjust trigger sensitivity to your preference.

- **Sidebery compatibility**
  - Works seamlessly with or without Sidebery installed.
  - Automatically hides the horizontal tab bar when Sidebery is active, and restores it when Sidebery is inactive.
  - Supports placing Sidebery's sidebar on either the left or right, adapting to your preferred layout.

- **Integration with Title Bar and Menu Bar**
  - FlexFox adjusts its layout for compatibility when these elements are enabled.

- **Overlay toolbars**
  - Expanded toolbars overlay webpage content without causing layout shifts.
  - Works smoothly even in full-screen mode.

- **Redesigned Findbar**
  - Relocated to the top of the browser with a compact, floating design.
  - Customize its position (left or right).
  - Auto-hides when unfocused by default (can be disabled in options).

- **Compact extension panel**
  - Displays only extension icons.
  - Right-click for extension options.
  - Alternatively, switch to a condensed panel retaining extension labels.

- **Improved Sidebery folding**
  - Auto-collapses Sidebery's navigation and pinned tab sections.
  - Expanded sections maintain vertical alignment to prevent layout jumps and minimize cursor adjustments.

## 💿 Installation

> [!IMPORTANT]
> 1. Install [Sidebery](https://addons.mozilla.org/firefox/addon/sidebery/) (optional but recommended).
> 2. Download the appropriate FlexFox version:
>    - [FlexFox](https://github.com/yuuqilin/FlexFox/archive/refs/heads/main.zip) for standard Firefox.
>    - [FlexFox Beta](https://github.com/yuuqilin/FlexFox/archive/refs/heads/Beta.zip) for Firefox Beta/Nightly.
>    - [FlexFox ESR](https://github.com/yuuqilin/FlexFox/archive/refs/heads/ESR.zip) for Firefox ESR.
> 3. Navigate to `about:support`, find `Profile Folder`, and click **Open** to access your Firefox profile folder.
> 4. Copy the `chrome` folder and `user.js` file from the downloaded `Profiles` directory into your Firefox profile folder.
> 5. *(Optional)* Edit `user.js` with a text editor to enable additional features by removing the `//` comment markers.
>    - Ensure `toolkit.legacyUserProfileCustomizations.stylesheets` and `svg.context-properties.content.enabled` remain enabled (`true`).
> 6. Restart Firefox, then delete `user.js` to allow changes made in `about:config` to persist.
> 7. Configure Sidebery:
>    - Open Sidebery settings via the gear icon in the sidebar.
>    - Go to `Help` > `Import addon data` and import `sidebery-settings.json` and `sidebery-styles.json` from the `Sidebery` folder in the downloaded archive.
>    - *Note:* If Sidebery settings don’t work as expected, re-import the files.
> 8. *(Optional)* Use `about:config` to search for `uc.flex.` and enable/disable FlexFox features as needed.

## ⚙️ Options

### 📁 User-Customizable Styles (`uc-user-settings.css`)

> [!TIP]
> You can safely override default style variables and rules without modifying the core files.
> 
> To do this:
> 
> 1. Create a new file named `uc-user-settings.css` inside the `components` folder.
> 2. Copy any variables or rules you want to change (e.g., from `uc-variables.css`).
> 3. Paste them into `uc-user-settings.css` and modify them as needed.
> 
> This file will be loaded *after* all built-in styles and will take precedence, ensuring your customizations remain intact even after future updates to FlexFox. 

> 💡 If you're copying variables defined inside specific selectors (like `:root` or `:root:has(...)`), be sure to copy the entire block to keep the context intact.

### 🧩 Configurable Preferences (`about:config`)

| Preference                                  | Description                                                                  |
|---------------------------------------------|------------------------------------------------------------------------------|
| `uc.flex.add-ui-text-stroke`                | Add a bold outline to interface text.                                        |
| `uc.flex.add-bookmarks-left-margin`         | Align bookmarks with toolbar icons by adding margin.                         |
| `uc.flex.fully-hide-sidebery`               | Completely hide Sidebery.                                                    |
| `uc.flex.fully-hide-toolbox`                | Hide all top toolbars (tabs, navigation, bookmarks).                         |
| `uc.flex.increase-sidebery-expanded-width`  | Increase the expanded width of Sidebery.                                     |
| `uc.flex.allow-addons-to-change-toolbar-color` | Allows themes and addons to customize toolbar background image and color. |
| `uc.flex.disable-bookmarks-autohide`        | Disable bookmarks toolbar auto-hide.                                         |
| `uc.flex.disable-tabs-toolbar-autohide`     | Disable the native horizontal tab bar auto-hide when Sidebery is inactive.   |
| `uc.flex.disable-findbar-autohide`          | Disable Findbar auto-hide when it loses focus.                               |
| `uc.flex.disable-native-vertical-tabs-autohide` | Disable auto-collapse of native vertical tabs.                           |
| `uc.flex.disable-sidebery-autohide`         | Disable Sidebery auto-collapse.                                              |
| `uc.flex.remove-bookmarks-folder-icons`     | Remove icons from bookmark folders.                                          |
| `uc.flex.remove-bookmarks-labels`           | Remove bookmark text labels.                                                 |
| `uc.flex.switch-to-alternate-condensed-panel` | Switch to another condensed extension panel.                               |
| `uc.flex.revert-to-original-window-controls` | Restore the original window buttons (minimize, maximize, close).            |
| `uc.flex.sidebery-fast-hover-expand`        | Speed up Sidebery hover expand/collapse.                                     |
| `uc.flex.sidebery-slow-hover-expand`        | Slow down Sidebery hover expand/collapse.                                    |
| `uc.flex.show-pin-tabs-separator-in-expanded-state` | Shows a separator between pinned and regular tabs in vertical tabs.  |
| `uc.flex.max-visible-vertical-pinned-tabs`  | Sets max pinned tabs per column in native vertical tabs (numeric, 4–6).      |

## 🐞 Known Issues

- For Floorp users: Switch to `Firefox Proton UI` in Floorp’s interface options to reduce compatibility issues.
- Tested on Windows only: May require adjustments for other operating systems.

<details>
  <summary><h2 style="display: inline;">📄 LICENSE</h2></summary>
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
