# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox

<div>
 <a href='https://www.mozilla.org'><img src="https://img.shields.io/badge/Last%20tested%20Firefox-v144-orange?logo=firefox"></a>
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

<!-- END What's New -->

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
<summary>🧩 <b>Major Update: Customizable Grid Layout for Pinned Tab Panel</b> <i>[Click to expand]</i> 👇</summary>

* Added `uc.flex.max-visible-horizontal-pinned-tabs` to set how many pinned tabs are shown per row (horizontal).  
  * Works with both Sidebery and native vertical tabs.  
  * Accepts values from `2` to `5` (default `5`).  

* Added `uc.flex.max-visible-vertical-pinned-tabs` to set how many pinned tabs are shown per column (vertical).  
  * Applies only to native vertical tabs and limits the panel height.  
  * When the number of pinned tabs exceeds the limit, the overflow can be scrolled.  
  * Accepts values from `4` to `6` (default `4`).  
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
<summary>🖌️ <b>Major Update: Sidebery Background Now Theme-Aware</b> <i>[Click to expand]</i> 👇</summary>

* FlexFox can now automatically adjust the background color of Sidebery based on the current Firefox theme.
* To enable this feature, go to Sidebery's **Settings → Appearance → Color scheme** and select `"firefox"`.
  <details><summary>Click to view Sidebery appearance settings screenshot</summary>
  <img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/sidebery-appearance-settings.webp"alt="Sidebery appearance settings" width="50%" />
  </details>

</details>

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

**v4.5.1**
* Fixed a regression introduced in Firefox v142 where enabling “Customize Sidebar” → “Expand sidebar on hover” caused the native vertical tabs to repeatedly expand and collapse. [Bug 1957008](https://bugzilla.mozilla.org/show_bug.cgi?id=1957008)  
  (Note: This option disables FlexFox optimizations, so it is not recommended for everyday use.)
* Corrected the width of the find bar, which could display too short or too long under different text zoom levels.
* Added new variables for customizing the background and border colors of pinned and active tabs:
  * For **native vertical tabs**, add these to `components\uc-user-settings.css`:
    ```css
    /* Border color for pinned tabs */
    --uc-vt-pinned-tab-border-color: light-dark(rgba(0, 0, 0, 0.22), rgba(172, 112, 255, 0.7));
    /* Border color for unloaded pinned tabs */
    --uc-vt-pinned-tab-unloaded-border-color: light-dark(rgba(0, 0, 0, 0.1), rgba(172, 112, 255, 0.28));
    /* Background color for the active tab */
    --uc-vt-active-tab-bgcolor: light-dark(#ea4c895e, #9651ff80);
    /* Inner border shadow (outline) for the active tab */
    --uc-vt-active-tab-border-shadow: 0 0 0 1px light-dark(rgba(0, 0, 0, 0.6), rgba(255, 255, 255, 0.467));
    /* Drop shadow beneath the active tab */
    --uc-vt-active-tab-drop-shadow: 0 1px 3px -1px light-dark(rgba(0, 0, 0, 0.196), rgba(0, 0, 0, 0.212));
    ```
  * For **Sidebery**, add these to `content\uc-custom-content.css`:
    ```css
    /* Border color for pinned tabs */
    --uc-sb-pinned-tab-border-color: light-dark(rgba(0, 0, 0, 0.22), rgba(172, 112, 255, 0.7));
    /* Border color for unloaded pinned tabs */
    --uc-sb-pinned-tab-unloaded-border-color: light-dark(rgba(0, 0, 0, 0.1), rgba(172, 112, 255, 0.28));
    /* Background color for the active tab */
    --uc-sb-active-tab-bgcolor: light-dark(#ea4c895e, #9651ff80);
    /* Inner border shadow (outline) for the active tab */
    --uc-sb-active-tab-border-shadow: 0 0 0 1px light-dark(rgba(0, 0, 0, 0.6), rgba(255, 255, 255, 0.467));
    /* Drop shadow beneath the active tab */
    --uc-sb-active-tab-drop-shadow: 0 1px 3px -1px light-dark(rgba(0, 0, 0, 0.196), rgba(0, 0, 0, 0.212));
    ```
* Adjusted the appearance of unloaded tabs in native vertical tabs to match Sidebery's behavior:
  * Firefox has two built-in preferences controlling unloaded tabs:
    * `browser.tabs.fadeOutExplicitlyUnloadedTabs` — controls discarded tabs (default: enabled)
    * `browser.tabs.fadeOutUnloadedTabs` — controls pending tabs restored at startup (default: disabled)
  * In Firefox's default behavior, discarded and pending tab icons are grayscaled and faded, but the tab labels remain fully opaque.
  * FlexFox changes this to match Sidebery: both icons and labels fade together, while icons remain in color. This provides a more consistent and recognizable look.
  * To get the same effect as Sidebery, enable both preferences. If you prefer not to use this feature, disable them instead.

**v4.5.0**
* Rebuilt Sidebery expand/collapse animation for smoother transitions without jitter.
* Centered and aligned Sidebery with sidebar buttons.
* Improved appearance of native vertical tabs:
  * Unified style with Sidebery for seamless switching.
  * Softer tab group labels to reduce distraction.
  * Merged sound indicator with site icon to save space.
  * Clearer highlight for the active tab to make navigation easier.
  * Changed pinned tabs from bright backgrounds to subtle outlines for better clarity.
* Reworked pinned tab panel:
  * Added `uc.flex.max-visible-horizontal-pinned-tabs` to set how many pinned tabs are shown per row (2–5, default 5).
  * Works with both Sidebery and native vertical tabs.
  * Extended `uc.flex.max-visible-vertical-pinned-tabs` option to allow `0` (no limit), so the panel can expand with tab count.
* Improved separator between pinned and regular tabs:
  * Controlled by `uc.flex.show-pin-tabs-separator-in-expanded-state` (disabled by default).
  * Shortened and centered the handle to reduce visual distraction.
  * Expands to full length only when hovered, keeping resizing available without interfering with normal tab access.
* Improved logic for bookmark star hover and editing states to better match expected actions.
* Fixed background bleed issue on rounded corners when browser and website theme modes differ.
* Fixed a regression in Nightly v144 that broke sidebar tool expansion. [Bug 1972629](https://bugzilla.mozilla.org/show_bug.cgi?id=1972629)  
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

**v4.0.5**
* Added support for the new collapsed tab group overflow counter introduced in v142. [Bug 1949401](https://bugzilla.mozilla.org/show_bug.cgi?id=1949401)
* Updated the appearance of tab groups, including size and alignment adjustments.
* Unified the expanded width of native vertical tabs and Sidebery. Both now share the same width, and the option `uc.flex.increase-sidebery-expanded-width` can be used to extend the width for native vertical tabs.
* Fixed an issue where pinned tab width changed too early when hovering over native vertical tabs.
* Fixed a visual glitch in the translucent effect on built-in pages introduced in v4.0.4.
* Added translucent background support for the PDF viewer window and menus when Mica or a custom wallpaper is enabled with `browser.tabs.allow_transparent_browser`.
* Fixed misaligned menu icons at different display scaling levels.
* Fixed native vertical tabs not centering correctly under different display scaling levels.

**v4.0.4**
* Fixed an issue in Nightly v143 where translucent backgrounds for built-in pages stopped working. [Bug 1980414](https://bugzilla.mozilla.org/show_bug.cgi?id=1980414)
* Fixed a problem introduced in v141 where the theme background image was misaligned between the Bookmarks Toolbar and Navigation Bar, causing a visible break. [Bug 1971941](https://bugzilla.mozilla.org/show_bug.cgi?id=1971941)
* Fixed an alignment issue where the tab highlight in collapsed native vertical tabs was not centered. #17
* Adjusted the inner shadow effect when the address bar is focused. #17
* Added new variables for customizing the colors of macOS-style window control buttons. #17

  ```css
    --uc-osx-ctrls-close-fill
    --uc-osx-ctrls-maximize-fill
    --uc-osx-ctrls-minimize-fill
    --uc-osx-ctrls-close-stroke
    --uc-osx-ctrls-maximize-stroke
    --uc-osx-ctrls-maximize-restore-stroke
    --uc-osx-ctrls-minimize-stroke
  ```

**v4.0.3**
* Fixed layout issues caused by changes in Nightly v143, including misaligned theme background when the menu bar is enabled and incorrect sidebar stripe positioning when `uc.flex.disable-bookmarks-autohide` is set. [Bug 1979014](https://bugzilla.mozilla.org/show_bug.cgi?id=1979014)
* Restored sidebar stripe color in horizontal tab mode, which was lost due to changes in Firefox 141 Beta 2. [Bug 1973777](https://bugzilla.mozilla.org/show_bug.cgi?id=1973777)

**v4.0.2**
* Fixed an issue caused by changes in Nightly v143 that prevented colored bookmark subfolder icons from displaying properly. [Bug 1979338](https://bugzilla.mozilla.org/show_bug.cgi?id=1979338)
* Restored the bottom separator for collapsed vertical tabs, which was missing due to changes in Nightly v143. [Bug 1977243](https://bugzilla.mozilla.org/show_bug.cgi?id=1977243)
* Corrected a visual alignment issue with collapsed vertical tabs introduced in Nightly v143. Tabs and icons were slightly offset to the left and no longer centered. [Bug 1936927](https://bugzilla.mozilla.org/show_bug.cgi?id=1936927)

**v4.0.1**
* When using a Mica backdrop or custom wallpaper with `browser.tabs.allow_transparent_browser` enabled:
  * Added translucent backgrounds for built-in pages like **Settings**, **Add-ons Manager**, and **New Tab**.  

    <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/translucent-about-preferences.webp" alt="Translucent background effect applied to the Settings (`about:preferences`) page" width="96%" />
    
  * Enabled background blur for the address bar dropdown and the find bar.
  * In custom wallpaper mode, the blur effect for the dropdown is fully visible, including areas over the navigation bar.
* In custom wallpaper mode, menu transparency now follows the `uc.flex.browser-wallpaper-transparency-level` setting, keeping it consistent with the wallpaper's transparency level.
* Added icons to three previously unthemed items in the App Menu and context menus.
* Fixed a styling issue with the address bar caused by a selector change in Firefox Nightly v143 ([Bug 1980372](https://bugzilla.mozilla.org/show_bug.cgi?id=1980372)).

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
| `uc.flex.auto-hide-horizontal-tabs-and-keep-navbar` | `0`-`2` | Automatically hide horizontal tabs in horizontal tab mode when Sidebery is inactive. Hovering over the navbar shows the tabs. Values: `0` = disabled, `1` = tabs shown below the navbar, `2` = tabs shown above the navbar. |
| `uc.flex.auto-hide-navbar-and-keep-horizontal-tabs` | `0`-`1` | Automatically hide the navbar in horizontal tab mode when Sidebery is inactive. Hovering over the horizontal tabs shows the navbar. Values: `0` = disabled, `1` = enabled. This option has higher priority; if enabled together with `uc.flex.auto-hide-horizontal-tabs-and-keep-navbar`, it overrides that option. |
| `uc.flex.auto-hide-navbar-icons` | `true` | Hides navigation bar icons by default. They reappear when hovering over the toolbar. Window control buttons, the URL bar, and the sidebar button (FlexFox logo) remain visible, unless the sidebar button is not placed at the edge of the navigation bar or `uc.flex.revert-to-original-sidebar-icon` is enabled. |
| `uc.flex.auto-hide-window-controls` | `true` | Hides the navigation bar window control buttons (minimize, maximize, close) by default. They reappear when hovering over the navigation bar edge. |
| `uc.flex.allow-addons-to-change-toolbar-color` | `true` | Allows toolbar colors set by extensions like Firefox Color to take effect, especially when no background image is selected. |
| `uc.flex.enable-gradient-highlight` | `0`-`X` | Enables gradient styling for the highlight color used across key UI elements such as the FlexFox logo, sidebar stripe, and bookmark star icon. This numeric setting accepts 0 to disable gradients, or values 1 to X to switch between different gradient styles. |
| `uc.flex.enable-colored-bookmarks-folder-icons` | `0`-`2` | Enables colored icons for bookmark folders. This numeric setting accepts `0` (disabled), `1` (uses the first icon set), or `2` (uses the second icon set, with labels automatically hidden). |
| `uc.flex.remove-bookmarks-folder-icons` | `true` | Removes folder icons from bookmarks. |
| `uc.flex.remove-bookmarks-labels` | `true` | Removes text labels from bookmark folders. |
| `uc.flex.show-flexfox-version-info-in-about-config` | `true` | Shows a confirmation message in the `about:config` page indicating that FlexFox is installed, along with the current version number. |
| `uc.flex.show-pin-tabs-separator-in-expanded-state` | `true` | Restores the separator between pinned and regular tabs in the native vertical tabs when expanded. Unlike Firefox, which hides it until hovered, FlexFox always keeps it visible. The separator can be dragged to resize the pinned tabs panel. |
| `uc.flex.show-tab-close-button-on-favicon-hover` | `true` | Merges the close button with the favicon in horizontal tabs to save space. The button appears when hovering over the favicon. Enabling this option automatically disables the close button's auto-shrink-and-reposition feature when tabs become narrow. |
| `uc.flex.show-tab-count-in-alltabs-button` | `0`-`4` | Shows the total number of tabs in the "List All Tabs" button. This numeric setting accepts `0` (disabled), `1` (show icon and number, all tabs), `2` (show icon and number, only loaded tabs), `3` (show number only, all tabs), or `4` (show number only, only loaded tabs). |
| `uc.flex.show-tab-number-in-tab-label` | `true` | Shows a numeric index before each tab's label text. This can make it easier to distinguish tabs when the label text is truncated due to limited space. |
| `uc.flex.move-pip-volume-to-top` | `true` | Moves the volume control button in Picture-in-Picture (PiP) windows to the top. |
| `uc.flex.dim-urlbar-popup-backdrop` | `0`-`2` | Darkens the background when the URL bar dropdown is open. This numeric setting accepts values from `0` (disabled) to `2`, where higher values apply stronger dimming. |
| `uc.flex.enable-rounded-web-content` | `0`-`2` | Adds margin, shadow, and rounded corners to the web content area. This numeric setting accepts values from `0` (disabled) to `2`, where higher values increase margin. |

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
| `uc.flex.max-visible-horizontal-pinned-tabs` | `1`-`5`<br>(`5`) | Sets the number of pinned tabs per row. In vertical tabs, it defines how many tabs appear per row before wrapping. In horizontal tabs, it determines the number of visible pinned tabs (`value × 2`); extra tabs are automatically collapsed. |
| `uc.flex.max-visible-vertical-pinned-tabs` | `0` \|<br>`4`-`6`<br>(`4`) | Sets the maximum number of visible rows for pinned tabs in the native vertical tabs. When the limit is reached, the pinned tabs panel becomes scrollable. Set to `0` to remove the limit and let the panel expand freely. |
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
