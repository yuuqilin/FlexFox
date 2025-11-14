# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox

<div>
 <a href='https://www.mozilla.org'><img src="https://img.shields.io/badge/Last%20tested%20Firefox-v147-orange?logo=firefox"></a>
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

https://github.com/user-attachments/assets/23d73b36-d2d4-4660-af5b-cde686d0934a  

## 🆕 What's New

**🦊 v5.6.0**
* Expanded the behavior of `uc.flex.auto-hide-horizontal-tabs-and-keep-navbar`.
  A new third mode is now available when this option is set to `3` in horizontal tab mode.
  This mode uses the same layout as mode `2`, but hovering over the navigation bar will no longer reveal the tab bar. The tab bar only appears when the cursor reaches the very top edge of the screen. This avoids accidental tab bar activation when using the bookmarks toolbar or interacting with the navigation bar.
  The trigger height can be customized with `--uc-tabstoolbar-hover-trigger-width`.
* Added support for the new **Tab Group Preview Panel** introduced in Firefox v145 when using horizontal tabs.
  The preview panel now works consistently in both vertical and horizontal tab modes, allowing tab selection and switching from within the panel.
* The above improvements are based on work from [firefox-csshacks](https://github.com/MrOtherGuy/firefox-csshacks). Special thanks to **@MrOtherGuy** for the help.
* Fixed an issue where notification banners in the navigation bar failed to keep the bookmarks toolbar visible when Mica or a custom wallpaper was enabled. This caused unnecessary clipping of the content area.
* Fixed a regression in Firefox v146 that left a gap below Sidebery's New Tab Button.
* Fixed a regression in Firefox v147 where rounded corners and shadows for the web content area stopped working. Related to [Bug 1941635](https://bugzilla.mozilla.org/show_bug.cgi?id=1941635).

<!-- END What's New -->

The video below demonstrates the visual result achieved by combining several new UI options introduced in the v5.5.x series.

https://github.com/user-attachments/assets/76110885-18c4-4667-87b3-bb7f7764d452

**✨ FlexFox v5.5.0 – UI and UX Enhancements**

* Added `uc.flex.style-sidebar-button` to switch the sidebar toggle icon (`1`–`4`):
  * `1` = Firefox Master Brand Logo (default, same as before)
  * `2` = Firefox Browser Logo
  * `3` = Firefox System 1 Logo
  * `4` = Mozilla Flag Symbol
* Added `uc.flex.style-toolbar-bgcolor` to change the background color of the navbar and sidebar (`1`–`2`):
  * `1` = Tokyo Night theme (default, same as before)
  * `2` = Firefox Acorn Design
* Added `uc.flex.style-urlbar` to customize the URL bar appearance (`1`–`4`):
  * `1` = Flat (default, same as before)
  * `2` = Inset (embedded look with centered text)
  * `3` = Debossed (pressed-in look with centered text)
  * `4` = Seamless (fully merged into the navbar, centered text)
* Added `uc.flex.move-urlbar-popup-to-center` to reposition the URL bar popup (`0`–`2`):
  * `0` = Disabled (default)
  * `1` = Center when focused
  * `2` = Center only when typing
* Updated `uc.flex.dim-urlbar-popup-backdrop` to match the new popup behavior (`0`–`2`):
  * `0` = No dimming (default)
  * `1` = 35% dim when open
  * `2` = 50% dim when open
* Added `uc.flex.style-window-controls` to switch the window control icons (`1`–`3`):
  * `1` = Traffic Light Buttons (default, same as before)
  * `2` = Yosemite Window Buttons
  * `3` = Yosemite GTK Theme
* Added `uc.flex.style-window-controls-shift-up` to slightly raise the window controls (default: `False`).
* Added `uc.flex.style-window-controls-shrink-size` to reduce the size of window controls (default: `False`).
* Added `uc.flex.move-window-controls-to-left` to move window controls to the left edge of the navbar or horizontal tab bar (default: `False`).
* Improved the shadow rendering of the URL bar popup.
* Refined the Findbar's design for better proportions, smoother corner transitions, added depth shadows, and more fluid open/close animations.
* Improved `uc.flex.enable-colored-bookmarks-folder-icons` with support for the “Other Bookmarks” folder.
* Enhanced `uc.flex.style-tab-group` with rotation animations for group indicators when animation is enabled.
* Fixed an issue where folded tabs would not display when `uc.flex.style-tab-group` = `2` or `4`.
* Fixed a counting issue when both `uc.flex.remove-sidebar-stripe` and `uc.flex.show-tab-count-in-alltabs-button` were enabled.
* Fixed an issue where tab favicons failed to hide when `uc.flex.auto-hide-horizontal-tabs-and-keep-navbar` = `2` with `uc.flex.show-tab-close-button-on-favicon-hover`.
* Fixed the broken style of the search engine switch button in the URL bar caused by Firefox v143 ([Bug 1980913](https://bugzilla.mozilla.org/show_bug.cgi?id=1980913)).
* Various minor bug fixes and improvements.
* `uc.flex.show-flexfox-version-info-in-about-config` is now enabled by default. Set it to `False` to disable.

## 🎉 Major Feature Update

<details>  
<summary>🧊 <b>Major Update: Translucent Mica & Custom Wallpaper Backgrounds</b> <i>[Click to expand]</i> 👇</summary>

* Added support for the **Mica visual effect** on Windows 11.
  * To enable Mica, configure the following settings in `about:config`:
    ```
    widget.windows.mica = true
    widget.windows.mica.popups = 2
    widget.windows.mica.toplevel-backdrop = 2
    browser.tabs.allow_transparent_browser = true
    uc.flex.browser-mica-transparency-level = 2
    ```
  * Be sure to set the theme to `System theme — auto`; Mica won't take effect under other themes.
  * **Requires restarting Firefox.**
  * For details, see: [🧊 Visual Background & Mica Effects](https://github.com/yuuqilin/FlexFox#-visual-background--mica-effects)
  * If the Mica background appears obstructed by inactive windows, you can use the shortcut <kbd>Win</kbd> + <kbd>Home</kbd> to minimize all other windows. For convenience, consider assigning this action to a mouse gesture or automation script.  

  Displays the native Mica background effect. Web content transparency (as shown on YouTube) is achieved using the [Transparent Zen](https://addons.mozilla.org/firefox/addon/transparent-zen/) extension.  
  
  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/seashore-mica.webp" alt="Example showing the native Mica background effect behind Firefox tabs and toolbars." width="96%" />

* For systems that don't support Mica or prefer a fixed wallpaper, FlexFox now supports **custom background wallpapers** for the browser.
  * Enable it via the following settings in `about:config`:
    ```
    uc.flex.browser-wallpaper-enabled = true
    uc.flex.browser-wallpaper-index = 1
    uc.flex.browser-wallpaper-acrylic-disabled = false
    browser.tabs.allow_transparent_browser = true
    uc.flex.browser-wallpaper-transparency-level = 2
    uc.flex.browser-wallpaper-contrast-level = 2
    ```
  * **Requires restarting Firefox.**
  * Supports up to 9 images named `main-image-1.jpg` to `main-image-9.jpg`, placed in `../icons/wallpaper/`.
  * Wallpapers use an **Acrylic blur effect** by default. While not identical to native Mica, it offers a similar visual style.
  * Enabling the **custom background wallpapers** feature overrides the native Mica background. If both Mica and wallpaper are enabled, the wallpaper will be shown.  

  Shows the custom background wallpaper feature with Acrylic blur enabled. Compared to native Mica, the blur, tone, and texture are distinct.  

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/seashore-acrylic.webp" alt="Example showing a custom wallpaper with Acrylic blur, mimicking the Mica look without relying on Windows support." width="96%" />

  A custom wallpaper with Acrylic blur disabled. The wallpaper appears sharp and clear; use the transparency level setting to maintain text readability.  

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/churning-in-the-chukchi-sea-no-acrylic.webp" alt="Example showing a custom wallpaper with Acrylic blur disabled, revealing the wallpaper in full clarity." width="96%" />

* Sample wallpaper sources and credits:
  * [a blue and purple background with wavy shapes (Unsplash)](https://unsplash.com/photos/a-blue-and-purple-background-with-wavy-shapes-1hg6NpO0kIk) – Provided as one of the built-in background options in Firefox's new tab customization.
  * [Seashore Waves (Unsplash)](https://unsplash.com/photos/seashore-DA_tplYgTow) – Provided as one of the built-in background options in Firefox's new tab customization.
  * [Churning in the Chukchi Sea (NASA)](https://www.visibleearth.nasa.gov/images/92412/churning-in-the-chukchi-sea/92412t) ([Download](https://www.bing.com/th/id/OBTQ.BTF2993094BEFFA1DE53FBFEA6FF54B81C71E858DDE1458F62454AF39BE5112D33?qlt=100&w=3840&h=2160&rs=1&c=4))

* To display Mica or wallpaper backgrounds behind Sidebery and web content, `browser.tabs.allow_transparent_browser` must be enabled.
  * Web content transparency requires the [Transparent Zen](https://addons.mozilla.org/firefox/addon/transparent-zen/) or [Zen Internet](https://addons.mozilla.org/firefox/addon/zen-internet/) extension.
  * If some pages become unreadable due to full transparency, pairing it with [Dark Reader](https://addons.mozilla.org/firefox/addon/darkreader/) is recommended.

* New option: `uc.flex.sidebery-apply-expand-speed-to-toolbars`
  * Applies the expand/collapse animation speed used by Sidebery and native vertical tabs to the navigation bar and bookmarks toolbar, unifying all animation speeds.
  * Once unified, you can use `uc.flex.sidebery-fast-hover-expand` or `uc.flex.sidebery-slow-hover-expand` to adjust the animation speed of the navigation bar and bookmarks toolbar.
  * When Mica or custom wallpaper is enabled, FlexFox will automatically unify animation speeds internally, so manual adjustment of this option is not needed in those cases.

</details>

<details>  
<summary>🧩 <b>Major Update: New Layout Modes for Sidebery & Horizontal Tabs</b> <i>[Click to expand]</i> 👇</summary>

* Added two new layout modes for Sidebery
  * Added `uc.flex.sidebery-allow-resizable-width`: allows adjusting Sidebery width by dragging the sidebar splitter.
  * Enabling this option disables Sidebery's auto-collapse, but you can still toggle its expanded/collapsed state with the sidebar toggle button (Firefox Logo).
  * To temporarily restore auto-collapse, use the `Hide Sidebery` shortcut or press <kbd>F1</kbd> to switch to native vertical tabs.
* Added three new layout modes and optimizations for horizontal tabs
  * Deprecated the old option `uc.flex.disable-tabs-toolbar-autohide`. Horizontal tabs are now visible by default when Sidebery is not active.
  * Added `uc.flex.auto-hide-horizontal-tabs-and-keep-navbar`: hides horizontal tabs when Sidebery is not active and shows them on hover. Values: `0` = Off, `1` = Tabs below navbar, `2` = Tabs above navbar, `3` = Same layout as `2`, but the tab bar appears only when the cursor reaches the top edge of the screen to avoid accidental activation when accessing bookmarks or the navbar.
  * Added `uc.flex.auto-hide-navbar-and-keep-horizontal-tabs`: hides the navbar when Sidebery is not active and shows it on hover. Values: `0` = Off, `1` = On. This option overrides the previous auto-hide-horizontal-tabs setting.
  * Added `uc.flex.disable-tab-close-button-on-inactive-horizontal-tabs`: in horizontal tab mode, by default FlexFox shows the close button on hover for inactive tabs. As tabs become narrower due to more tabs opening, the button automatically shrinks and moves to the top-right to prevent accidental clicks. Enable this option to completely remove the close button.
  * Added `uc.flex.show-tab-close-button-on-favicon-hover`: in horizontal tab mode, merges the close button with the favicon to save space. The close button is shown only when hovering over the favicon. Enabling this option disables the close button's auto-shrink-and-reposition behavior described above.
  * Added `uc.flex.increase-active-horizontal-tab-min-width`: keeps the active tab wider when horizontal tabs shrink, so its label remains distinguishable and easier to identify among other tabs. Values:
    * `0` = Off
    * `1` = Minimum width 1.8×, no animation
    * `2` = Minimum width 1.8×, with animation
    * `3` = Minimum width 2×, no animation
    * `4` = Minimum width 2×, with animation
    * Default: `1` (enabled). Set to `0` if you prefer all tabs to keep a fixed width.
  * Pinned horizontal tabs now automatically collapse when exceeding the visible limit. Default visible pinned tabs is 10. Use `uc.flex.max-visible-horizontal-pinned-tabs` to adjust the setting (range `1`–`5`, corresponding to 2–10 visible pinned tabs).

</details>

<details>  
<summary>🧩 <b>Major Update: Customizable Grid Layout for Pinned Tab Panel</b> <i>[Click to expand]</i> 👇</summary>

* Added `uc.flex.max-visible-horizontal-pinned-tabs` to set how many pinned tabs are shown per row (horizontal).
  * Accepts values from `1` to `5` (default `5`).
  * In vertical tabs, extra pinned tabs wrap to the next row.
  * In horizontal tabs, extra pinned tabs are automatically collapsed (value corresponds to 2–10 visible pinned tabs).

* Added `uc.flex.max-visible-vertical-pinned-tabs` to set how many pinned tabs are shown per column (vertical).
  * Accepts values from `2` to `8` (default `4`).
  * Applies to both native vertical tabs and Sidebery, limiting the panel height.
  * When the number of pinned tabs exceeds the limit, the overflow can be scrolled.
  * Setting it to `0` disables the height limit, allowing the panel to expand freely.

* Added `uc.flex.show-pin-tabs-separator-in-expanded-state` to always display a separator for the pinned tab panel.    
  * Applies only to native vertical tabs.  
  * Enabling this option disables the height limit, allowing the panel height to be freely adjusted with the separator.  

  <p>
    <img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/new-vt-splitter-resize.webp"
         alt="New native vertical tabs design, splitter in hover state for resizing the panel"
         height="510" hspace=15 />
    <img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/new-vt-splitter-collapsed.webp"
         alt="New native vertical tabs design, splitter appearance with the panel collapsed"
         height="510" hspace=15 />
    <img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/new-vt-splitter-expanded.webp"
         alt="New native vertical tabs design, splitter appearance with the panel expanded"
         height="510" hspace=15 />
  </p>

</details>

<details>  
<summary>🔢 <b>Major Update: Tab Counters & Tab Indexes</b> <i>[Click to expand]</i> 👇</summary>

* Added the `uc.flex.show-tab-count-in-alltabs-button` option to display the total number of open tabs on the "List All Tabs" button. Values:
  * `0` = Off
  * `1` = Icon + number (all tabs)
  * `2` = Icon + number (loaded tabs only)
  * `3` = Number only (all tabs)
  * `4` = Number only (loaded tabs only)
* Added the `uc.flex.show-tab-number-in-tab-label` option to display the index number of each tab on its native tab label. This helps quickly identify tabs when the label is too narrow to show the full title.

</details>

<details>  
<summary>👻 <b>Major Update: Auto-Hide Toolbar Icons & Window Controls</b> <i>[Click to expand]</i> 👇</summary>

* Added the `uc.flex.auto-hide-navbar-icons` option to hide toolbar item icons (including icons on the navigation bar, bookmarks toolbar, and menu bar) by default and reveal them on hover. This option does not affect the URL bar or window control buttons.
* Added the `uc.flex.auto-hide-window-controls` option to hide window control buttons (minimize, maximize, close) by default and show them only when hovering at the edge of the toolbar.
* The Sidebar toggle button (FlexFox logo) is normally always visible. If it is not placed at the far left or right edge of the navigation bar, or if `uc.flex.revert-to-original-sidebar-icon` is enabled, it will follow the auto-hide behavior.
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
<summary>🖌️ <b>Major Update: Sidebery Background Now Theme-Aware</b> <i>[Click to expand]</i> 👇</summary>

* FlexFox can now automatically adjust the background color of Sidebery based on the current Firefox theme.
* To enable this feature, go to Sidebery's **Settings → Appearance → Color scheme** and select `"firefox"`.
  <details><summary>Click to view Sidebery appearance settings screenshot</summary>
  <img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/sidebery-appearance-settings.webp"alt="Sidebery appearance settings" width="50%" />
  </details>

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
  --uc-web-content-margin
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

> [!IMPORTANT]
> When using FlexFox in vertical tab mode, make sure the `Expand sidebar on hover` option in `Customize Sidebar` is **unchecked**. Most FlexFox features require this setting to work properly.

<a id="updates-top-start"></a>
<details>

<summary>💬 <b>Previous Updates</b></summary>

<!-- END Release Note -->

**v5.5.4**
* Added support for the new **tab group preview panel** introduced in Firefox v145.
  * You can turn off this Firefox feature with the built-in preference `browser.tabs.groups.hoverPreview.enabled`.
* Fixed an issue on Windows 11 where the Snap Layouts fly-out menu would not appear when `uc.flex.style-window-controls-shrink-size` was enabled.
* Adjusted the spacing of pinned tabs, regular tabs, and tab groups in native vertical tabs to achieve a more refined and polished appearance.
* Added support for the **tab split view** feature introduced in Firefox v146.

**v5.5.3**
* Fixed `uc.flex.move-window-controls-to-left` not working when the navbar was auto-hidden.
* Adjusted toolbar icon spacing when combining multiple options like window control and rounded content settings.
* Improved layout for taskbar tabs with rounded content or horizontal tab mode.
* Added icons for AI items in the native tab context menu.

**v5.5.2**
* Fixed the issue where the URL bar transition animation disappeared when `uc.flex.move-urlbar-popup-to-center` was enabled in fullscreen or `Hide Topbar` mode.
* Fixed the sidebar header border color mismatch with Sidebery in horizontal tab layout mode.
* The video below demonstrates the visual result achieved by combining several new UI options introduced in the v5.5.x series.

https://github.com/user-attachments/assets/76110885-18c4-4667-87b3-bb7f7764d452

**v5.5.1**
* Fixed inconsistent top and bottom border colors in the Sidebery panel when `uc.flex.remove-sidebar-stripe` is enabled.
* Fixed a missing animation issue with the URL bar transition when using horizontal tabs with `uc.flex.move-urlbar-popup-to-center` enabled.
* Fixed mismatched corner rounding on tab group labels in vertical tabs introduced by Nightly v145. [Bug 1989112](https://bugzilla.mozilla.org/show_bug.cgi?id=1989112)
* Fixed missing rounded corners on URL bar icons introduced by Nightly v145. [Bug 1992450](https://bugzilla.mozilla.org/show_bug.cgi?id=1992450)
* Added a new option `uc.flex.enable-rounded-web-content-at-sidebery-corner`, which also applies a rounded corner to the web content area on the side adjacent to the Sidebery colored stripe when `uc.flex.enable-rounded-web-content` is enabled.

**✨ FlexFox v5.5.0 – UI and UX Enhancements**

* Added `uc.flex.style-sidebar-button` to switch the sidebar toggle icon (`1`–`4`):
  * `1` = Firefox Master Brand Logo (default, same as before)
  * `2` = Firefox Browser Logo
  * `3` = Firefox System 1 Logo
  * `4` = Mozilla Flag Symbol
* Added `uc.flex.style-toolbar-bgcolor` to change the background color of the navbar and sidebar (`1`–`2`):
  * `1` = Tokyo Night theme (default, same as before)
  * `2` = Firefox Acorn Design
* Added `uc.flex.style-urlbar` to customize the URL bar appearance (`1`–`4`):
  * `1` = Flat (default, same as before)
  * `2` = Inset (embedded look with centered text)
  * `3` = Debossed (pressed-in look with centered text)
  * `4` = Seamless (fully merged into the navbar, centered text)
* Added `uc.flex.move-urlbar-popup-to-center` to reposition the URL bar popup (`0`–`2`):
  * `0` = Disabled (default)
  * `1` = Center when focused
  * `2` = Center only when typing
* Updated `uc.flex.dim-urlbar-popup-backdrop` to match the new popup behavior (`0`–`2`):
  * `0` = No dimming (default)
  * `1` = 35% dim when open
  * `2` = 50% dim when open
* Added `uc.flex.style-window-controls` to switch the window control icons (`1`–`3`):
  * `1` = Traffic Light Buttons (default, same as before)
  * `2` = Yosemite Window Buttons
  * `3` = Yosemite GTK Theme
* Added `uc.flex.style-window-controls-shift-up` to slightly raise the window controls (default: `False`).
* Added `uc.flex.style-window-controls-shrink-size` to reduce the size of window controls (default: `False`).
* Added `uc.flex.move-window-controls-to-left` to move window controls to the left edge of the navbar or horizontal tab bar (default: `False`).

  * Note: This option has no effect when `uc.flex.auto-hide-navbar-and-keep-horizontal-tabs` is enabled without `uc.flex.restore-window-controls-on-tabbar`.
* Improved the shadow rendering of the URL bar popup.
* Refined the Findbar's design for better proportions, smoother corner transitions, added depth shadows, and more fluid open/close animations.
* Improved `uc.flex.enable-colored-bookmarks-folder-icons` with support for the “Other Bookmarks” folder.
* Enhanced `uc.flex.style-tab-group` with rotation animations for group indicators when animation is enabled.
* Fixed an issue where folded tabs would not display when `uc.flex.style-tab-group` = `2` or `4`.
* Fixed a counting issue when both `uc.flex.remove-sidebar-stripe` and `uc.flex.show-tab-count-in-alltabs-button` were enabled.
* Fixed an issue where tab favicons failed to hide when `uc.flex.auto-hide-horizontal-tabs-and-keep-navbar` = `2` with `uc.flex.show-tab-close-button-on-favicon-hover`.
* Fixed the broken style of the search engine switch button in the URL bar caused by Firefox v143 ([Bug 1980913](https://bugzilla.mozilla.org/show_bug.cgi?id=1980913)).
* Various minor bug fixes and improvements.
* `uc.flex.show-flexfox-version-info-in-about-config` is now enabled by default. Set it to `False` to disable.

**v5.0.3**

* Improved auto-hide of the horizontal tab bar so it stays visible when the URL bar is focused.
* Added controls to adjust the animation speed of active tab width changes with `uc.flex.sidebery-fast-hover-expand` and `uc.flex.sidebery-slow-hover-expand`.
* Adjusted the volume icon position in collapsed mode when `uc.flex.sidebery-allow-resizable-width` is enabled.
* Fixed native vertical tabs not expanding when “Expand sidebar on hover” and `uc.flex.fully-hide-sidebery` were both enabled. (#21)
* Fixed tab icon misalignment in native vertical tabs after entering and exiting DOM fullscreen from a pinned tab.
* Fixed missing text on the “Done” and “Cancel” buttons when creating a tab group.
* Fixed a regression in v5.0.2 where native vertical tabs would not expand with both `Lock Sidebery` and `Hide Sidebery` enabled.
* Fixed a flicker issue when hovering to expand the tab bar with `uc.flex.auto-hide-navbar-and-keep-horizontal-tabs` enabled, caused by moving the mouse across the tab bar and navbar.
* Added two new context menu icons: “Copilot” and “Add Tab to New Group”.
* Added option `uc.flex.style-tab-group` to customize tab group appearance in native vertical tabs:
  * `1` (default): expand/collapse indicator, no animation
  * `2`: indicator with expand/collapse animation
  * `3`: centered label, no indicator, no animation
  * `4`: centered label, no indicator, with animation

**v5.0.2**

* **Performance**: Refactored parts of the code. CPU usage of the expand/collapse animation for native vertical tabs is now 40% lower compared to v4.0.5. Performance is on par with Firefox's built-in *Expand sidebar on hover* option, though still about twice as heavy as Sidebery. Sidebery is faster, more feature-rich, and more stable than native vertical tabs, and is recommended.
* **Visuals**: Fixed ghosting artifacts in collapse animations when Mica or custom wallpapers are enabled.
* **New option**: Added `uc.flex.restore-window-controls-on-tabbar`, which restores the window control buttons to the tab bar in horizontal tabs mode.
* **Other**: Various minor bug fixes.

**v5.0.1**

* Improved usability of `uc.flex.sidebery-allow-resizable-width`
  * Prevented Sidebery from shifting left and right when toggled into collapsed mode using the sidebar button (Firefox Logo).
  * Pinned tabs now wrap automatically when the sidebar width becomes narrow, ensuring they remain accessible instead of overflowing.
* Extended `uc.flex.max-visible-vertical-pinned-tabs` to also control the maximum height of pinned tabs in Sidebery.
  * Default remains `4` (up to 4 rows visible, with scroll available for overflow).
  * Value range expanded to `2`–`8`.
  * Setting `0` removes the height limit, allowing unlimited expansion.
* Fixed an issue where the window control buttons disappeared when not hovered while Firefox was in Customize Toolbar mode with `uc.flex.auto-hide-navbar-and-keep-horizontal-tabs` enabled.
* Fixed the broken appearance of tag group labels caused by Nightly v144 changes. [Bug 1981197](https://bugzilla.mozilla.org/show_bug.cgi?id=1981197)
* Fixed a width collapse issue in native vertical tabs when toggling to collapsed mode, caused by Nightly v144 changes. [Bug 1985296](https://bugzilla.mozilla.org/show_bug.cgi?id=1985296)
* Fixed the counter malfunction in `uc.flex.show-tab-count-in-alltabs-button` due to Nightly v144 changes. [Bug 1985296](https://bugzilla.mozilla.org/show_bug.cgi?id=1985296)

**✨ v5.0.0 – Major Feature Update**

* Added two new layout modes for Sidebery
  * Added `uc.flex.sidebery-allow-resizable-width`: allows adjusting Sidebery width by dragging the sidebar splitter.
  * Enabling this option disables Sidebery's auto-collapse, but you can still toggle its expanded/collapsed state with the sidebar toggle button (Firefox Logo).
  * To temporarily restore auto-collapse, use the `Hide Sidebery` shortcut or press <kbd>F1</kbd> to switch to native vertical tabs.
* Added three new layout modes and optimizations for horizontal tabs
  * Deprecated the old option `uc.flex.disable-tabs-toolbar-autohide`. Horizontal tabs are now visible by default when Sidebery is not active.
  * Added `uc.flex.auto-hide-horizontal-tabs-and-keep-navbar`: hides horizontal tabs when Sidebery is not active and shows them on hover. Values: `0` = Off, `1` = Tabs below navbar, `2` = Tabs above navbar.
  * Added `uc.flex.auto-hide-navbar-and-keep-horizontal-tabs`: hides the navbar when Sidebery is not active and shows it on hover. Values: `0` = Off, `1` = On. This option overrides the previous auto-hide-horizontal-tabs setting.
  * Added `uc.flex.disable-tab-close-button-on-inactive-horizontal-tabs`: in horizontal tab mode, by default FlexFox shows the close button on hover for inactive tabs. As tabs become narrower due to more tabs opening, the button automatically shrinks and moves to the top-right to prevent accidental clicks. Enable this option to completely remove the close button.
  * Added `uc.flex.show-tab-close-button-on-favicon-hover`: in horizontal tab mode, merges the close button with the favicon to save space. The close button is shown only when hovering over the favicon. Enabling this option disables the close button's auto-shrink-and-reposition behavior described above.
  * Added `uc.flex.increase-active-horizontal-tab-min-width`: keeps the active tab wider when horizontal tabs shrink, so its label remains distinguishable and easier to identify among other tabs. Values:
    * `0` = Off
    * `1` = Minimum width 1.8×, no animation
    * `2` = Minimum width 1.8×, with animation
    * `3` = Minimum width 2×, no animation
    * `4` = Minimum width 2×, with animation
    * Default: `1` (enabled). Set to `0` if you prefer all tabs to keep a fixed width.
  * Pinned horizontal tabs now automatically collapse when exceeding the visible limit. Default visible pinned tabs is 10. Use `uc.flex.max-visible-horizontal-pinned-tabs` to adjust the setting (range `1`–`5`, corresponding to 2–10 visible pinned tabs).
* Added `uc.flex.auto-hide-window-controls`: automatically hides window control buttons on the navbar, showing them only when hovering at the edge.
* Added `uc.flex.show-tab-count-in-alltabs-button`: displays the total number of open tabs on the "List All Tabs" button. Values:
  * `0` = Off
  * `1` = Icon + number (all tabs)
  * `2` = Icon + number (loaded tabs only)
  * `3` = Number only (all tabs)
  * `4` = Number only (loaded tabs only)
* Added `uc.flex.show-tab-number-in-tab-label`: shows index numbers on native tab labels so you can quickly identify tabs when labels are too narrow to show full titles.
* Improved Firefox logo behavior in horizontal tabs: it now only shifts and scales when Sidebery is enabled.
* Improved the volume icon's appearance in native vertical tabs to make it look less abrupt.
* Fixed a transparency issue with the Mica background that occurred when both `uc.flex.disable-sidebery-autohide` and `Hide Sidebery` were used.
* Fixed fullscreen web content corner rounding not being removed correctly when UI theme and page theme were opposite.
* Refactored Mica backdrop and custom wallpaper code, slightly improving performance (\~4%).

For more update logs from earlier versions,  
👉 see the [history archive on the Wiki](https://github.com/yuuqilin/FlexFox/wiki/Earlier-Update-History-(English))

<a href="#updates-top-start">⏫ Back to the beginning of updates</a>
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

### 👷 Method 1: Manual Installation

> [!IMPORTANT]
> 1. Install [Sidebery](https://addons.mozilla.org/firefox/addon/sidebery/) (optional but recommended).
> 2. Download the appropriate FlexFox version:
>    * [FlexFox](https://github.com/yuuqilin/FlexFox/archive/refs/heads/main.zip) for standard Firefox.
>    * [FlexFox Beta](https://github.com/yuuqilin/FlexFox/archive/refs/heads/Beta.zip) for Firefox Beta/Nightly.
>    * [FlexFox ESR](https://github.com/yuuqilin/FlexFox/archive/refs/heads/ESR.zip) for Firefox ESR.
> 3. Open `about:support`, find **Profile Folder**, and click **Open Folder** to access your Firefox profile directory.
> 4. Copy the `chrome` folder and the `user.js` file from the `scripts` directory into your Firefox profile folder.
> 5. Open `user.js` in a text editor and remove `//` comment markers to enable additional features.
>    * Make sure the following settings are set as shown:
>      * `toolkit.legacyUserProfileCustomizations.stylesheets` = `true`
>      * `svg.context-properties.content.enabled` = `true`
>      * `sidebar.visibility` = `always-show`
> 6. Restart Firefox, then delete `user.js` so that any manual changes made in `about:config` can persist.
> 7. Configure Sidebery:
>    * Open Sidebery settings (gear icon in the sidebar).
>    * Clear any existing styles in the `Styles editor` to avoid conflicts.
>    * Navigate to `Help` > `Import addon data`, then import both `sidebery-settings.json` and `sidebery-styles.json` from the `Sidebery` folder in the downloaded archive.
>    * *Note:* If the imported styles don't seem to work as expected, try re-importing them.
> 8. Open `about:config` and search for `uc.flex.` to toggle FlexFox features.

---

### 🚀 Method 2: Automatic Installation and Updates

> [!IMPORTANT]
> If this is your first time installing FlexFox, please proceed to [Method 1](https://github.com/yuuqilin/FlexFox?tab=readme-ov-file#-method-1-manual-installation) and follow the steps starting from Step 5 **after** running the script.  
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

## ⚙️ Options

### 📜 User-Customizable Styles

> [!TIP]  
> You can customize FlexFox styles without worrying about future updates overwriting your changes.
>
> * To modify **interface (chrome)** styles, create `uc-user-settings.css` in the `components` folder
> * To modify **webpage (content)** styles, create `uc-custom-content.css` in the `content` folder
>
> Copy the styles or variables you want to change (e.g. from `uc-variables.css`) into these files. Rules defined here will override FlexFox's defaults.
> These files are not touched during updates, so your changes will remain intact.
>
> 💡 When copying styles, make sure to include the full selector to preserve context.

---

### 🧩 Configurable Preferences (`about:config`)

#### ✅ Required for FlexFox Styles

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `toolkit.legacyUserProfileCustomizations.stylesheets` | `true` | Enables userChrome.css for custom styles. |
| `svg.context-properties.content.enabled` | `true` | Enables icon color to auto-adjust between light and dark themes. |
| `sidebar.visibility` | `always-show` | Enables FlexFox's **optimized** vertical tabs auto-collapse and layout in vertical tabs mode. Many FlexFox features rely on this setting. This can also be applied by unchecking **“Expand sidebar on hover”** in the sidebar settings. |

#### 🪄 Add or Enable Features

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.add-ui-text-stroke` | `true` | Adds a bold outline to UI text for improved legibility, especially at low screen resolutions. |
| `uc.flex.fully-hide-sidebery` | `true` | Fully hides Sidebery and native vertical tabs. They reappear when the cursor moves to the screen edge. |
| `uc.flex.fully-hide-toolbox` | `true` | Completely hides all top toolbars (native horizontal tabs, navigation bar, bookmarks toolbar); they reappear when the cursor reaches the top edge of the screen. |
| `uc.flex.auto-hide-horizontal-tabs-and-keep-navbar` | `0`-`3` | Automatically hide horizontal tabs in horizontal tab mode when Sidebery is inactive. Hovering over the navbar shows the tabs. Values: `0` = disabled, `1` = tabs shown below the navbar, `2` = tabs shown above the navbar, `3` = same as `2` but shows only when the cursor reaches the top edge of the screen to avoid accidental triggers. |
| `uc.flex.auto-hide-navbar-and-keep-horizontal-tabs` | `0`-`1` | Automatically hide the navbar in horizontal tab mode when Sidebery is inactive. Hovering over the horizontal tabs shows the navbar. Values: `0` = disabled, `1` = enabled. This option has higher priority; if enabled together with `uc.flex.auto-hide-horizontal-tabs-and-keep-navbar`, it overrides that option. |
| `uc.flex.auto-hide-navbar-icons` | `true` | Hides toolbar item icons (including icons on the navigation bar, bookmarks toolbar, and menu bar) by default. They reappear when hovering over the toolbar. This option does not affect the URL bar or window control buttons. The sidebar button (FlexFox logo) is normally always visible, but if it is not placed at the edge of the navigation bar or `uc.flex.revert-to-original-sidebar-icon` is enabled, it will also follow the auto-hide behavior. |
| `uc.flex.auto-hide-window-controls` | `true` | Hides the window control buttons (minimize, maximize, close) by default. They reappear when hovering over the edge of the toolbar. |
| `uc.flex.allow-addons-to-change-toolbar-color` | `true` | Allows toolbar colors set by extensions like Firefox Color to take effect, especially when no background image is selected. |
| `uc.flex.enable-gradient-highlight` | `0`-`X` | Enables gradient styling for the highlight color used across key UI elements such as the FlexFox logo, sidebar stripe, and bookmark star icon. This numeric setting accepts 0 to disable gradients, or values 1 to X to switch between different gradient styles. |
| `uc.flex.enable-colored-bookmarks-folder-icons` | `0`-`2` | Enables colored icons for bookmark folders. This numeric setting accepts `0` (disabled), `1` (uses the first icon set), or `2` (uses the second icon set, with labels automatically hidden). |
| `uc.flex.remove-bookmarks-folder-icons` | `true` | Removes folder icons from bookmarks. |
| `uc.flex.remove-bookmarks-labels` | `true` | Removes text labels from bookmark folders. |
| `uc.flex.show-flexfox-version-info-in-about-config` | `true` | Shows a confirmation message in the `about:config` page indicating that FlexFox is installed, along with the current version number. |
| `uc.flex.show-pin-tabs-separator-in-expanded-state` | `true` | Restores the separator between pinned and regular tabs in the native vertical tabs when expanded. Unlike Firefox, which hides it until hovered, FlexFox always keeps it visible. The separator can be dragged to resize the pinned tabs panel. |
| `uc.flex.show-tab-close-button-on-favicon-hover` | `true` | Merges the close button with the favicon in horizontal tabs to save space. The button appears when hovering over the favicon. Enabling this option automatically disables the close button's auto-shrink-and-reposition feature when tabs become narrow. |
| `uc.flex.show-tab-count-in-alltabs-button` | `0`-`4` | Shows the total number of open tabs on the "List All Tabs" button. Values: 0 = Off, 1 = Icon + number (all tabs), 2 = Icon + number (loaded tabs only), 3 = Number only (all tabs), 4 = Number only (loaded tabs only). |
| `uc.flex.show-tab-number-in-tab-label` | `true` | Shows a numeric index before each tab's label text. This can make it easier to distinguish tabs when the label text is truncated due to limited space. |

#### 🚫 Disable or Revert Features

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.disable-flexfox` | `true` | Disables all FlexFox styles and features without needing to restart Firefox. |
| `uc.flex.skip-loading-uc-*.css` | `true` | Skips loading specific `uc-*.css` files under `./components/` and `./content/`. For example, enabling `uc.flex.skip-loading-uc-newtab.css` will skip loading `./content/uc-newtab.css`. |
| `uc.flex.disable-bookmarks-autohide` | `true` | Disables auto-hide for the bookmarks toolbar. |
| `uc.flex.disable-findbar-autohide` | `true` | Prevents the Findbar from automatically hiding when it loses focus. |
| `uc.flex.disable-sidebery-autohide` | `true` | Disables auto-collapse for Sidebery and native vertical tabs. |
| `uc.flex.disable-tab-close-button-on-inactive-horizontal-tabs` | `true` | When hovering over inactive horizontal tabs, FlexFox normally shows the close button. If the tab is very narrow, the button is shrunk and moved to the top-right corner to reduce accidental clicks. Enabling this option disables the close button entirely. |
| `uc.flex.disable-nav-bar-first-item-right-padding` | `true` | By default, FlexFox adds right-side padding after the first item in the navigation bar to improve visual separation and alignment between the vertical tabs and nearby items. This option disables that padding. |
| `uc.flex.disable-menu-icons` | `true` | Disables custom icons in menus added by FlexFox. |
| `uc.flex.restore-window-controls-on-tabbar` | `true` | Restores the window control buttons (minimize, maximize, close) to the tab bar in horizontal tabs mode. |
| `uc.flex.revert-to-original-window-controls` | `true` | Reverts to Firefox's default window control buttons (minimize, maximize, close), replacing the macOS-style icons used by FlexFox. |
| `uc.flex.revert-to-original-flat-corner-style` | `true` | Reverts the rounded corner radius of the urlbar, searchbar, and findbar to Firefox's original flatter style. |
| `uc.flex.revert-to-original-bookmark-star-icon` | `true` | Reverts the bookmark star icon to Firefox's default design, replacing the custom icon used by FlexFox. |
| `uc.flex.revert-to-original-sidebar-icon` | `true` | Reverts the sidebar button icon to Firefox's default design, replacing the FlexFox logo. |
| `uc.flex.remove-sidebar-stripe` | `true` | Removes the sidebar stripe when Sidebery is active. To switch sidebar tools, press <kbd>F1</kbd> in vertical tabs mode to show the sidebar tool buttons, or <kbd>Ctrl</kbd> + <kbd>B</kbd> in horizontal tabs mode to restore the sidebar header. |

#### 🪛 Modify or Adjust Features

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.increase-sidebery-expanded-width` | `true` | Makes Sidebery and the native vertical tabs wider when expanded. |
| `uc.flex.increase-navbar-height` | `true` | Restores the thicker navbar height used in earlier FlexFox versions. This change overrides the current default, which matches Firefox's original compact height. |
| `uc.flex.increase-active-horizontal-tab-min-width` | `0`-`4`<br>(`1`) | Keeps the active tab wider when horizontal tabs shrink, making it easier to distinguish from other tabs. Values: `0` = disabled, `1` = 1.8× without animation, `2` = 1.8× with animation, `3` = 2× without animation, `4` = 2× with animation. Enabled by default; set to `0` to keep all tabs the same width. |
| `uc.flex.switch-to-alternate-condensed-panel` | `true` | By default, FlexFox replaces the native unified extensions panel with an icon-only view. In this case, right-click an icon to access extension options. This option switches to an alternate condensed panel that includes extension names and option buttons for a more descriptive view. |
| `uc.flex.sidebery-allow-resizable-width` | `true` | Allows freely resizing Sidebery by dragging the sidebar splitter. When enabled, Sidebery no longer auto-collapses, but you can still toggle its expanded/collapsed state using the sidebar toggle button (Firefox Logo). For automatic collapse, use the `Hide Sidebery` shortcut or switch to native vertical tabs (<kbd>F1</kbd>) to let tabs auto-collapse. |
| `uc.flex.sidebery-fast-hover-expand` | `true` | Speeds up auto-expand/collapse for Sidebery and native vertical tabs. |
| `uc.flex.sidebery-slow-hover-expand` | `true` | Slows down auto-expand/collapse for Sidebery and native vertical tabs. |
| `uc.flex.sidebery-apply-expand-speed-to-toolbars` | `true` | Unifies toolbar animation speed with Sidebery/vertical tabs. Auto-applied with Mica or custom wallpaper. |
| `uc.flex.max-visible-horizontal-pinned-tabs` | `1`-`5`<br>(`5`) | Sets the maximum number of visible pinned tabs per row. In vertical tabs, extra pinned tabs wrap to the next row. In horizontal tabs, extra pinned tabs are automatically collapsed, with the setting corresponding to 2–10 visible pinned tabs. |
| `uc.flex.max-visible-vertical-pinned-tabs` | `0` \|<br>`2`-`8`<br>(`4`) | Sets the maximum number of visible pinned tabs per column in both native vertical tabs and Sidebery. When the limit is reached, the pinned tabs panel becomes scrollable. Set to `0` to remove the limit and let the panel expand freely. |
| `uc.flex.findbar-position` | `'top-center-left'`\|<br>`'top-right'`\|<br>`'bottom-right'` | Sets the Findbar's position. Accepts string values: `'top-center-left'` or `'1'` = center-left top, `'top-right'` or `'2'` = top right, `'bottom-right'` or `'3'` = bottom right. |
| `uc.flex.menu-item-spacing` | `'small'`\|<br>`'medium'`\|<br>`'large'` | Sets the vertical spacing between items in the Firefox app menu, bookmarks menu, and context menus. Accepts string values: `'1'` or `'small'` = narrow spacing, `'2'` or `'medium'` = medium spacing, `'3'` or `'large'` = wide spacing. |

#### ⚙️ Native Firefox Settings
| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `browser.sessionstore.restore_pinned_tabs_on_demand` | `true` | Loads pinned tabs only when selected, allowing you to have many pinned tabs without slowing down Firefox startup. With FlexFox, pinned tab layouts and auto-collapse features make it convenient to use many pinned tabs for quick access, so enabling this option is recommended when using FlexFox. |
| `browser.tabs.fadeOutExplicitlyUnloadedTabs` | `true` | A native Firefox setting that fades out discarded tabs (manually unloaded) in the native vertical tabs. |
| `browser.tabs.fadeOutUnloadedTabs` | `true` | A native Firefox setting that fades out pending tabs (waiting to be restored at startup) in the native vertical tabs. |
| `sidebar.visibility` | `expand-on-hover` | Disables FlexFox's **optimized** vertical tabs auto-collapse and layout. This can also be applied by checking **“Expand sidebar on hover”** in the sidebar settings. In this mode, you can freely adjust the sidebar width and toggle between expanded and collapsed states using <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>Z</kbd> or the sidebar toggle button. **Not recommended for everyday use with FlexFox.** |
| `sidebar.animation.expand-on-hover.duration-ms` | `120` | A native Firefox setting that defines the animation speed for expanding and collapsing the vertical tabs when `sidebar.visibility` is set to `expand-on-hover`. |

#### 🎨 UI Style & Appearance
| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.style-sidebar-button` | `1`-`4`<br>(`1`) | Switches the sidebar toggle icon. Values: `1` = Firefox Master Brand Logo (default, same as before), `2` = Firefox Browser Logo, `3` = Firefox System 1 Logo, `4` = Mozilla Flag Symbol. |
| `uc.flex.style-toolbar-bgcolor` | `1`-`2`<br>(`1`) | Changes the background color of the navbar and sidebar. Values: `1` = Tokyo Night theme (default, same as before), `2` = Firefox Acorn Design. |
| `uc.flex.style-urlbar` | `1`-`4`<br>(`1`) | Customizes the appearance of the URL bar. Values: `1` = Flat (default, same as before), `2` = Inset (embedded look with centered text), `3` = Debossed (pressed-in look with centered text), `4` = Seamless (fully merged into the navbar, centered text). |
| `uc.flex.move-urlbar-popup-to-center` | `0`-`2`<br>(`0`) | Repositions the URL bar popup. Values: `0` = Disabled (default), `1` = Center when focused, `2` = Center only when typing. |
| `uc.flex.dim-urlbar-popup-backdrop` | `0`-`2` | Darkens the background when the URL bar dropdown is open. This numeric setting accepts values from `0` (disabled) to `2`, where higher values apply stronger dimming. |
| `uc.flex.style-window-controls` | `1`-`3`<br>(`1`) | Switches the window control icons. Values: `1` = Traffic Light Buttons (default, same as before), `2` = Yosemite Window Buttons, `3` = Yosemite GTK Theme. |
| `uc.flex.style-window-controls-shift-up` | `true` | Slightly raises the position of the window controls. |
| `uc.flex.style-window-controls-shrink-size` | `true` | Reduces the overall size of the window controls. |
| `uc.flex.move-window-controls-to-left` | `true` | Moves the window controls to the left edge of the navbar or horizontal tab bar. |
| `uc.flex.move-pip-volume-to-top` | `true` | Moves the volume control button in Picture-in-Picture (PiP) windows to the top. |
| `uc.flex.style-tab-group` | `1`-`4`<br>(`1`) | Adjusts the appearance of tab groups in native vertical tabs. Values: `1` = show expand/collapse indicator without animation, `2` = show indicator with animation, `3` = center tab labels with no indicator and no animation, `4` = center labels with no indicator and with animation. Default is `1`. |
| `uc.flex.enable-rounded-web-content` | `0`-`2` | Adds margin, shadow, and rounded corners to the web content area. This numeric setting accepts values from `0` (disabled) to `2`, where higher values increase margin. |
| `uc.flex.enable-rounded-web-content-at-sidebery-corner` | `true` | When `uc.flex.enable-rounded-web-content` is enabled, also applies a rounded corner to the web content area on the side adjacent to the Sidebery colored stripe. |

#### 🧊 Visual Background & Mica Effects

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `widget.windows.mica` | `true` | Enables the native Mica backdrop in Firefox. Requires the theme to be set to `System theme — auto` to take effect. This feature is only available on Windows 11. If your system does not support Mica, you can use `uc.flex.browser-wallpaper-enabled` to simulate a similar effect. |
| `widget.windows.mica.popups` | `1`\|`2`<br>(`2`) | Enables the Mica backdrop for popup menus. Accepts `0` (off), `1` (on), or `2` (auto). |
| `widget.windows.mica.toplevel-backdrop` | `2` | Specifies the type of Mica backdrop to use: `0` (auto or none), `1`: Mica, `2`: Acrylic, `3`: Mica Alt. FlexFox is designed with the assumption that this option is set to `2`: Acrylic. |
| `browser.tabs.allow_transparent_browser` | `true` | Enables background transparency for Sidebery and web content, allowing Mica or wallpaper to be displayed. **Takes effect after restarting Firefox.** Web content transparency requires the [Transparent Zen](https://addons.mozilla.org/firefox/addon/transparent-zen/) or [Zen Internet](https://addons.mozilla.org/firefox/addon/zen-internet/) extension. If some pages become hard to read, using [Dark Reader](https://addons.mozilla.org/firefox/addon/darkreader/) is recommended. |
| `uc.flex.browser-mica-transparency-level` | `0`-`4`<br>(`2`) | Adjusts the transparency level of the browser Mica backdrop mask. This numeric setting accepts values from 0 to 4, where higher values increase clarity and reduce the mask effect. The default level in Firefox is 0, while FlexFox uses 2 as its default. |
| `uc.flex.browser-wallpaper-enabled` | `true` | Enables a custom wallpaper as the Firefox browser background. This feature applies an acrylic-style blur to simulate the native Mica effect. It is useful when Mica is not available or when you prefer a consistent, always-visible background. Note that the visual effect may not be identical to native Mica. |
| `uc.flex.browser-wallpaper-index` | `1`-`9`<br>(`1`) | Sets which numbered wallpaper image to use as the browser background. This numeric setting accepts values from 1 to 9. Each value corresponds to an image file named `main-image-1.jpg` through `main-image-9.jpg`, located in the `../icons/wallpaper/` folder. |
| `uc.flex.browser-wallpaper-acrylic-disabled` | `true` | Disables the acrylic-style blur effect applied to the custom wallpaper background. |
| `uc.flex.browser-wallpaper-transparency-level` | `0`-`4`<br>(`2`) | Adjusts the transparency level of the browser wallpaper mask. This numeric setting accepts values from 0 to 4, where higher values increase clarity and reduce the mask effect. This option is designed to visually match the Mica transparency levels. The default value in FlexFox is 2. |
| `uc.flex.browser-wallpaper-contrast-level` | `0`-`4`<br>(`2`) | Adjusts the contrast level of the browser wallpaper when using the acrylic-style blur effect in dark mode. This numeric setting accepts values from 0 to 4, where higher values increase contrast. The default value in FlexFox is 2. |

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

  <p>This project includes additional graphical assets with the following licenses:</p>
  
  <ul>
    <li><strong>Custom Brand Icons</strong> — licensed under <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/">CC BY-NC-SA 4.0</a></ li>
    <li><strong>Newaita</strong> — licensed under <a href="https://creativecommons.org/licenses/by-nc-sa/3.0/">CC BY-NC-SA 3.0</a></li>
    <li><strong>Yosemite Buttons</strong> — licensed under <a href="https://creativecommons.org/licenses/by/3.0/">CC BY 3.0</a></li>
  </ul>
</details>
