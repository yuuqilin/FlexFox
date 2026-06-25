# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox Preferences List

[English](./OPTIONS.md) | [日本語](./OPTIONS_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md) | [简体中文](./OPTIONS_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md)

This document provides a complete reference for all FlexFox preferences and supported values.

If you imported the included `user.js` during installation, FlexFox preferences will automatically appear in `about:config` and can be found by searching for `uc.flex`.

If a preference introduced in a later release does not appear in the list, there is no need to re-import `user.js`. Simply create the preference manually using the name shown in this document.

Preferences are organized by the browser component or interface area they affect. Expand the relevant category below to view available preferences, supported values, and descriptions.

<details>
<summary>🔧 Required Setup</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `toolkit.legacyUserProfileCustomizations.stylesheets` | `true` | This built-in Firefox preference must be enabled for `userChrome.css` customizations to work. |
| `svg.context-properties.content.enabled` | `true` | Allows FlexFox SVG icons to automatically adapt to Firefox's light and dark themes. This preference is enabled by default unless it has been changed manually. |
| `sidebar.visibility` | `always-show` | Required for the full FlexFox experience in vertical tabs mode. This setting is equivalent to disabling **“Expand sidebar on hover”** in the sidebar settings. Many FlexFox features rely on this behavior, and using other modes may lead to unexpected results. This is the default Firefox setting unless it has been changed manually. |

</details>

<details>
<summary>🚫 FlexFox Control</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.disable-flexfox` | `false` | Instantly disables all FlexFox styles without restarting Firefox. Useful for quickly comparing FlexFox with the native Firefox interface and for troubleshooting. |
| `uc.flex.skip-loading-uc-*.css` | `false` | Skips loading specific `uc-*.css` files from `./components/` and `./content/`. This can be used to completely disable styles for individual components or isolate the effects of specific CSS files during troubleshooting. For example, enabling `uc.flex.skip-loading-uc-newtab.css` prevents `./content/uc-newtab.css` from being loaded. |

</details>

<details>
<summary>🦊 Sidebar Button (Firefox Logo)</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.style-sidebar-button` | `0`-`4`<br>(`1`) | Changes the Firefox logo shown in the navigation bar (sidebar toggle button). Values: `0` = Firefox default icon, `1` = Firefox Master Brand Logo (default), `2` = Firefox Browser Logo, `3` = Firefox System 1 Logo, `4` = Mozilla Flag Symbol. |

</details>

<details>
<summary>🌈 Sidebar Stripe & Accent Color</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.remove-sidebar-stripe` | `false` | Removes the sidebar stripe. The sidebar tools collapse into the sidebar stripe by default, so enabling this option removes quick access to sidebar tools. To access them again, use keyboard shortcuts such as <kbd>F1</kbd> to toggle Sidebery or <kbd>Ctrl</kbd> + <kbd>B</kbd> to open the Firefox sidebar. |
| `uc.flex.style-sidebar-stripe-color` | `0`-`10`<br>(`0`) | Sets FlexFox's accent color for key interface elements such as the sidebar stripe and sidebar button (Firefox logo). Values: `0` = Classic (default), `1` = Red, `2` = Orange, `3` = Yellow, `4` = Green, `5` = Cyan, `6` = Blue, `7` = Violet, `8` = Purple, `9` = Pink, `10` = Gray. The selected color also applies to elements such as the bookmark star icon, tab highlights, and Sidebery navigation icons. |
| `uc.flex.style-sidebar-stripe-color-apply-to-all-icons` | `false` | Applies the selected accent color to all icons. In Dark Mode, it also affects interface borders. This option overrides Firefox's default bookmark star color, allowing the selected accent color to be applied even when `uc.flex.revert-to-original-bookmark-star-icon` is enabled. |
| `uc.flex.style-sidebar-stripe-color-use-gradient` | `false` | Applies a gradient variant of the selected accent color to the sidebar stripe and sidebar button (Firefox logo). The gradient effect also extends to elements such as bookmark star icons and bookmark folders. |

</details>

<details>
<summary>📚 Sidebery & Vertical Tabs</summary>

### Shared Settings

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.fully-hide-sidebery` | `false` | Completely hides Sidebery and native vertical tabs until the cursor approaches the screen edge. The activation area can be adjusted using `--uc-sidebar-hover-trigger-width`. Enabling this option overrides the `Hide Sidebery` shortcut, preventing it from toggling between hidden and visible states. For normal use, keep this option disabled and switch layouts using keyboard shortcuts instead. See the [Layout Switching](USAGE.md#-layout-switching) section for setup instructions. |
| `uc.flex.disable-sidebery-autohide` | `false` | Keeps Sidebery and native vertical tabs permanently expanded instead of auto-collapsing. Enabling this option overrides the `Lock Sidebery` shortcut, preventing it from toggling between collapsed and expanded states. For normal use, keep this option disabled and switch layouts using keyboard shortcuts instead. See the [Layout Switching](USAGE.md#-layout-switching) section for setup instructions. |
| `uc.flex.increase-sidebery-expanded-width` | `false` | Increases the width of Sidebery and native vertical tabs when expanded. |
| `uc.flex.sidebery-fast-hover-expand` | `false` | Speeds up the expand and collapse animations for Sidebery and native vertical tabs. |
| `uc.flex.sidebery-slow-hover-expand` | `false` | Slows down the expand and collapse animations for Sidebery and native vertical tabs. |
| `uc.flex.sidebery-apply-expand-speed-to-toolbars` | `false` | By default, the sidebar and toolbars use different animation speeds. This option applies the sidebar expand/collapse speed to the navigation bar and toolbars, allowing the speed settings above to affect the entire interface. This option has no effect when Mica or custom wallpapers are enabled, as a unified animation speed is applied automatically. |

### Sidebery Only

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.sidebery-disable-icon-scaling` | `false` | Removes the subtle icon enlargement effect for Sidebery pinned tabs and navigation panels when expanded. |
| `uc.flex.sidebery-allow-resizable-width` | `false` | Disables Sidebery auto-collapse and allows its width to be adjusted by dragging the sidebar splitter. You can still quickly switch between expanded and collapsed states using the sidebar toggle button (Firefox logo). To temporarily restore the auto-hide behavior and save screen space, use the `Hide Sidebery` shortcut to switch between resizable and auto-hide modes. This option is available only when Firefox is set to vertical tabs mode and has no effect in horizontal tabs mode. |
| `uc.flex.style-sidebery-nav-icon` | `0`-`2`<br>(`0`) | Sets the navigation icon shown when Sidebery is collapsed. Values: `0` = Use active panel icon (new default), `1` = Sidebery Logo, `2` = Chevron (previous default). |
| `uc.flex.style-sidebery-nav-icon-use-active-panel-color` | `false` | Applies the color of the currently active panel to the navigation icon. |

### Native Vertical Tabs Only

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.show-pin-tabs-separator-in-expanded-state` | `false` | Displays the resize separator below the pinned tabs container. FlexFox uses a fixed pinned tabs container height by default. Enabling this option allows the container height to be adjusted freely by dragging the separator. |

</details>

<details>
<summary>📑 Horizontal Tabs</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.auto-hide-horizontal-tabs-and-keep-navbar` | `0`-`3`<br>(`0`) | Automatically hides horizontal tabs while keeping the navigation bar visible. Values: `0` = tabs remain visible (default), `1` = tabs appear below the navigation bar when hovering over it, `2` = tabs appear above the navigation bar when hovering over it, `3` = tabs appear above the navigation bar only when the cursor reaches the top edge of the screen. Hovering over the navigation bar alone will not trigger them. The activation area can be adjusted using `--uc-tabstoolbar-hover-trigger-width`. |
| `uc.flex.auto-hide-navbar-and-keep-horizontal-tabs` | `0`-`1`<br>(`0`) | Automatically hides the navigation bar while keeping horizontal tabs visible. Values: `0` = navigation bar remains visible (default), `1` = the navigation bar appears when hovering over the tabs. This option takes priority over `uc.flex.auto-hide-horizontal-tabs-and-keep-navbar` when both are enabled. |
| `uc.flex.show-tab-close-button-on-favicon-hover` | `false` | Merges the close button into the favicon and shows it when hovering over the favicon. This option increases the available space for tab titles. |
| `uc.flex.disable-tab-close-button-on-inactive-horizontal-tabs` | `false` | To make tabs easier to close, FlexFox displays a close button on all tabs by default. When tabs become narrow, the button is automatically reduced in size and moved to the corner to help prevent accidental clicks. Enable this option to hide close buttons on inactive tabs completely. |
| `uc.flex.increase-active-horizontal-tab-min-width` | `0`-`4`<br>(`1`) | Automatically increases the width of the active tab, making tab titles easier to read and helping the active tab stand out for quicker identification. Values: `0` = disabled (all tabs use the same width), `1` = 1.8× width without animation, `2` = 1.8× width with animation, `3` = 2× width without animation, `4` = 2× width with animation. This effect is enabled by default. Set the value to `0` to keep all tabs the same width. |

</details>

<details>
<summary>📌 Pinned Tabs</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.max-visible-horizontal-pinned-tabs` | `0`-`5`<br>(`5`) | Sets the maximum number of pinned tabs displayed per row. In vertical tabs mode, additional pinned tabs wrap to the next row. Values `1`-`5` display 1-5 pinned tabs per row. In horizontal tabs mode, additional pinned tabs collapse automatically. `0` disables auto-collapse, while values `1`-`5` correspond to 2-10 visible pinned tabs. |
| `uc.flex.max-visible-vertical-pinned-tabs` | `0` \|<br>`2`-`8`<br>(`4`) | Sets the maximum number of pinned tabs displayed per column. When the limit is reached, the pinned tabs container becomes scrollable. Set to `0` to remove the limit and allow the container to expand indefinitely. This option has no effect in horizontal tabs mode. |


</details>

<details>
<summary>🗂️ Tab Groups</summary>

### Native Vertical Tabs Only

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.style-tab-groups` | `0`-`2`<br>(`1`) | Sets the appearance of tab groups. Values: `0` = Tree layout without a collapse state indicator, `1` = Tree layout with a triangle indicator (default), `2` = Box layout with a folder icon. The indicator changes automatically to reflect the expanded or collapsed state. |
| `uc.flex.style-tab-groups-add-transition` | `0`-`2`<br>(`2`) | Sets the expand/collapse animations for tab groups and their state indicators. Values: `0` = No animation, `1` = Expand/collapse animation, `2` = Expand/collapse animation with animated state indicators (default). |
| `uc.flex.style-tab-groups-center-label-text` | `false` | Centers the label text of tab groups. |

</details>

<details>
<summary>🧩 Tab Appearance</summary>

### Sidebery & Native Vertical Tabs Only

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.style-tab-items` | `1`-`2`<br>(`1`) | Sets the appearance of tab items. The active tab always uses both a border and background highlight for easier identification. Regular tabs have no border or background highlight. Values: `1` = Pinned tabs use borders only (default), `2` = Pinned tabs use background highlights only. Background highlights use the sidebar stripe accent color. In Dark Mode with value `2`, borders also use the accent color. |
| `uc.flex.style-tab-items-add-hover-trail` | `true` | Adds a trailing highlight effect when moving the cursor across tabs. The background highlight fades out gradually, creating a visual trail behind the cursor. This effect is enabled by default and can be disabled by setting this option to `false`. |

</details>

<details>
<summary>🔖 Bookmarks</summary>

### Bookmark Items

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.enable-colored-bookmarks-folder-icons` | `0`-`2`<br>(`0`) | Enables colored bookmark folder icons. Values: `0` = Use Firefox default icons (default), `1` = Use solid-color folder icons, `2` = Use patterned folder icons. When set to `2`, bookmark folder labels are hidden automatically. |
| `uc.flex.remove-bookmarks-folder-icons` | `false` | Hides bookmark folder icons. |
| `uc.flex.remove-bookmarks-labels` | `false` | Hides bookmark folder labels. |

### Bookmark Star

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.revert-to-original-bookmark-star-icon` | `false` | FlexFox uses a heart-shaped bookmark icon by default. Enable this option to restore Firefox's default bookmark star icon and its original color. To apply the sidebar stripe accent color instead, enable `uc.flex.style-sidebar-stripe-color-apply-to-all-icons`. |

</details>

<details>
<summary>🧭 Navigation Bar & Toolbars</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.fully-hide-toolbox` | `false` | Completely hides all top toolbars. They reappear when the cursor approaches the top edge of the screen. The activation area can be adjusted using `--uc-toolbox-rotation`. Enabling this option overrides the `Hide Topbar` shortcut, preventing it from toggling between hidden and visible states. For normal use, keep this option disabled and switch layouts using keyboard shortcuts instead. See the [Layout Switching](USAGE.md#-layout-switching) section for setup instructions. |
| `uc.flex.disable-bookmarks-autohide` | `false` | Disables the auto-hide behavior of the bookmarks toolbar. By default, FlexFox shows the bookmarks toolbar only when hovering over the navigation bar, so it does not take up screen space even when Firefox is set to always display bookmarks. |
| `uc.flex.disable-nav-bar-first-item-right-padding` | `false` | By default, FlexFox adds extra spacing after the first item in the navigation bar (the Firefox logo by default) to visually connect it with the vertical tabs below. Enable this option to remove that spacing. The spacing adjusts automatically based on whether vertical tabs are enabled, so changing the default value is usually unnecessary. |
| `uc.flex.increase-navbar-height` | `false` | Slightly increases the height of the navigation bar by 3px. This option is kept for compatibility with older FlexFox and VerticalFox styles and usually does not need to be changed. |

</details>

<details>
<summary>🛠️ Toolbar Buttons</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.auto-hide-navbar-icons` | `false` | Automatically fades out icons in the navigation bar and other top toolbars, and fades them back in when hovering over the navigation bar. Icons inside the URL bar and window control buttons are controlled by separate options and are not affected. The sidebar button (Firefox logo) remains visible by default. It only follows the auto-hide behavior when it is no longer the first item in the navigation bar, or when `uc.flex.style-sidebar-button` is set to `0`. |
| `uc.flex.style-all-tabs-button` | `0`-`2`<br>(`1`) | Sets the icon for the “List All Tabs” button. Values: `0` = Firefox default icon, `1` = Filter (default), `2` = Chevron. |

</details>

<details>
<summary>🔎 Address Bar</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.auto-hide-urlbar-icons` | `true` | Hides URL bar icons and reveals them with a slide-in animation when hovering over the URL bar. This option is enabled by default; set it to `false` to keep the icons always visible. |
| `uc.flex.style-urlbar` | `1`-`4`<br>(`1`) | Sets the appearance of the URL bar. Values: `1` = Flat (default), `2` = Inset, `3` = Debossed, `4` = Seamless (fully integrated into the navigation bar). |
| `uc.flex.style-urlbar-center-text` | `false` | Centers the text in the URL bar. |
| `uc.flex.move-urlbar-popup-to-center` | `0`-`2`<br>(`0`) | Repositions the URL bar popup to the center of the browser window. Values: `0` = Disabled (default), `1` = Center when focused, `2` = Center only while typing. |
| `uc.flex.dim-urlbar-popup-backdrop` | `0`-`2`<br>(`0`) | Dims the rest of the browser interface while the URL bar popup is open. Values: `0` = Disabled, `1`-`2` = Increasing dimming intensity. |

</details>

<details>
<summary>🧩 Extensions Panel</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.switch-to-alternate-condensed-panel` | `false` | By default, FlexFox displays the extensions panel as a space-saving icon grid, allowing direct access to a large number of extensions without scrolling. In this mode, the extension menu button is removed, but extension options remain accessible by right-clicking an icon. Enable this option to switch to a more compact list view that displays extension names while remaining more space-efficient than Firefox's default layout. |

</details>

<details>
<summary>🪟 Window Controls</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.auto-hide-window-controls` | `false` | Automatically hides the window controls and slides them into view when the cursor reaches the edge of the screen. |
| `uc.flex.restore-window-controls-on-tabbar` | `false` | By default, FlexFox keeps the window controls in the navigation bar in both horizontal and vertical tabs modes. Enable this option to restore Firefox's default behavior and place the window controls on the tab bar when using horizontal tabs. |
| `uc.flex.revert-to-original-window-controls` | `false` | Restores Firefox's default window control icons. |
| `uc.flex.style-window-controls` | `1`-`3`<br>(`1`) | Sets the window control icons. Values: `1` = Traffic Light Buttons (default), `2` = Yosemite Window Buttons, `3` = Yosemite GTK Theme. |
| `uc.flex.style-window-controls-shift-up` | `false` | By default, FlexFox lowers the window controls to align them with other toolbar icons. Enable this option to restore Firefox's original higher position. |
| `uc.flex.style-window-controls-shrink-size` | `false` | Reduces the size of the window controls. |
| `uc.flex.move-window-controls-to-left` | `false` | Moves the window controls to the left side of the window. Do not enable this option on macOS, as it may cause layout issues. |

</details>

<details>
<summary>📋 Menus</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.disable-menu-icons` | `false` | Removes icons from menus and panels, restoring Firefox's default appearance. |
| `uc.flex.menu-item-spacing` | `'small'`\|<br>`'medium'`\|<br>`'large'` | Sets the vertical spacing between items in menus and panels. Accepted values: `'1'` or `'small'` = compact spacing, `'2'` or `'medium'` = default spacing, `'3'` or `'large'` = spacious spacing. |

</details>

<details>
<summary>🌐 Web Content Area</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.enable-rounded-web-content` | `0`-`2`<br>(`0`) | Adds margins, shadows, and rounded corners to the web content area, creating a floating card-like effect. Higher values increase the margins and surrounding space. |
| `uc.flex.enable-rounded-web-content-at-sidebery-corner` | `false` | By default, FlexFox keeps the corner adjacent to the sidebar stripe square so the web content area aligns seamlessly with the stripe. Enable this option to apply rounded corners to all four corners, even when the sidebar stripe is visible. |
| `uc.flex.style-web-content-outline` | `0`-`2`<br>(`0`) | Shows an outline around the web content area. This option is most noticeable when used with `uc.flex.enable-rounded-web-content`. Values: `0` = No outline (default), `1` = Highlight only the focused panel in Tab Split View, `2` = Show outlines around all web content areas. |

</details>

<details>
<summary>🔍 Findbar</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.disable-findbar-autohide` | `false` | Prevents the Findbar from automatically hiding when it loses focus. Press <kbd>Esc</kbd> to close the Findbar quickly. |
| `uc.flex.findbar-position` | `'top-center-left'`\|<br>`'top-right'`\|<br>`'bottom-right'` | Sets the position of the Findbar. Accepted values: `'top-center-left'` or `'1'` = top center-left, `'top-right'` or `'2'` = top right, `'bottom-right'` or `'3'` = bottom right. |

</details>

<details>
<summary>🎨 Browser Appearance</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.add-ui-text-stroke` | `false` | Adds an outline to UI text to improve readability, especially on low-resolution displays. |
| `uc.flex.allow-addons-to-change-toolbar-color` | `false` | FlexFox automatically applies colors from themes that include a background image. If a theme does not define a background image, its toolbar colors may not be applied correctly. Enable this option to force toolbar colors from extensions or themes to take effect. To avoid potential conflicts, using a background image is recommended instead. For example, when using [Firefox Color](https://color.firefox.com/), simply assign any solid-color image as the theme background and FlexFox will automatically apply the configured colors. |
| `uc.flex.style-toolbar-bgcolor` | `1`-`2`<br>(`1`) | When using Firefox's built-in Light or Dark themes, applies one of the following toolbar color schemes: `1` = Tokyo Night theme (default), `2` = Firefox Acorn Design. |
| `uc.flex.revert-to-original-flat-corner-style` | `0`-`3`<br>(`0`) | Sets the corner style used throughout the interface. Values: `0` = Small rounded corners (FlexFox default), `1` = Large rounded corners (Firefox default), `2` = Square corners (legacy Firefox style), `3` = Small rounded corners for the address bar with square corners elsewhere. |

</details>

<details>
<summary>🧰 Utilities & Extras</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.show-flexfox-version-info-in-about-config` | `0`-`2`<br>(`2`) | Controls the FlexFox version entry shown in `about:config`. `0` = Hide version information, `1` = Show version only, `2` = Show version and preference descriptions (default). Preference descriptions align with the full `uc.flex` list, so import `user.js` or add all FlexFox preferences manually to keep them matched. |
| `uc.flex.show-tab-count-in-alltabs-button` | `0`-`2`<br>(`0`) | Shows the number of open tabs on the “List All Tabs” button. Values: `0` = Off, `1` = Show all tabs, `2` = Show loaded tabs only. |
| `uc.flex.show-tab-number-in-tab-label` | `false` | Displays a numeric index before each tab label. This option applies only to native tabs and helps you locate specific tabs more easily, especially when tab labels are too narrow to display meaningful text. |
| `uc.flex.move-pip-volume-to-top` | `false` | Moves the volume control button to the top of Picture-in-Picture (PiP) windows. |

</details>

<details>
<summary>⚙️ Firefox Native Settings</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `browser.sessionstore.restore_pinned_tabs_on_demand` | `false` | A native Firefox setting that delays loading pinned tabs until they are selected. This can significantly improve startup performance when using a large number of pinned tabs. FlexFox supports dense pinned tab layouts, making it practical to use pinned tabs as quick-access shortcuts for frequently used pages. Enabling this option is recommended to reduce startup time. |
| `browser.tabs.fadeOutExplicitlyUnloadedTabs` | `true` | A native Firefox setting that fades manually unloaded tabs in native tabs. |
| `browser.tabs.fadeOutUnloadedTabs` | `false` | A native Firefox setting that fades tabs that have not yet been restored after startup in native tabs. Enabling both options makes it easier to distinguish between tabs that have and have not been used in the current session. |

</details>

<details>
<summary>🧊 Windows Mica</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `widget.windows.mica` | `false` | Enables the native Windows Mica backdrop in Firefox. This feature is available only on Windows 11. To display the Mica effect, Firefox must be using the `System theme — auto` theme. You can leave this option enabled and use the Firefox theme setting as an on/off switch for Mica. To use Mica with any Firefox theme, enable `uc.flex.browser-mica-force-enabled-on-all-themes` below. Custom browser wallpapers take priority and will override the Mica backdrop. |
| `uc.flex.browser-mica-force-enabled-on-all-themes` | `false` | Forces the Windows Mica backdrop to work with any Firefox theme. This decouples Mica from the Windows system color mode, allowing it to follow the active Firefox theme instead. For example, Windows can remain in light mode while Firefox uses a dark Mica appearance. Requires `widget.windows.mica` to be enabled. |
| `widget.windows.mica.popups` | `0`\|`1`\|<br>`2`<br>(`2`) | Controls whether popup menus use the Windows Mica backdrop. Values: `0` = Off, `1` = On, `2` = Auto (default). |
| `widget.windows.mica.toplevel-backdrop` | `2` | Sets the Windows backdrop type used by Firefox. Values: `0` = Auto or none, `1` = Mica, `2` = Acrylic, `3` = Mica Alt. FlexFox is designed around `2` = Acrylic. |
| `uc.flex.browser-mica-transparency-level` | `0`-`4`<br>(`2`) | Adjusts the transparency of the overlay applied above the Mica backdrop. The overlay is white in light mode and black in dark mode. Higher values make the overlay more transparent, revealing more of the background. Firefox uses `0` by default, while FlexFox uses the brighter `2` setting. |

</details>

<details>
<summary>✨ Transparent Browser</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `browser.tabs.allow_transparent_browser` | `false` | Allows web content and Sidebery to become transparent so Mica or custom wallpapers can be displayed behind them. **Changes take effect after restarting Firefox.** FlexFox supports transparency on all built-in `about:*` pages. Enter `about:about` to view the full list. Transparency for regular websites requires extensions such as [Transparent Zen](https://addons.mozilla.org/firefox/addon/transparent-zen/) or [Zen Internet](https://addons.mozilla.org/firefox/addon/zen-internet/). If transparent pages reduce text readability, you can use extensions like [UltimaDark](https://addons.mozilla.org/firefox/addon/ultimadark/) or [Dark Reader](https://addons.mozilla.org/firefox/addon/darkreader/), or switch to FlexFox's built-in `Solid Page` mode using a toolbar button or keyboard shortcut. See [Improving Readability in Transparent Web Content](USAGE.md#-improving-readability-in-transparent-web-content). |
| `uc.flex.browser-solid-page-color-scheme` | `0`-`2`<br>(`1`) | Sets the solid background color used by `Solid Page`. Values: `0` = Black, `1` = White (default), `2` = Follow Firefox's `Website appearance` setting. |
| `uc.flex.enable-translucent-urlbar-popup-and-menus` | `false` | Enables translucent backgrounds for menus, panels, and URL bar popups without requiring Mica or custom wallpapers. The transparency level can be adjusted using `uc.flex.browser-mica-transparency-level`. When Mica or custom wallpapers are enabled, this effect is applied automatically and this option has no effect. |

</details>

<details>
<summary>🖼️ Browser Wallpapers</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.browser-wallpaper-enabled` | `false` | Enables custom browser wallpapers, allowing the entire Firefox interface to display a persistent static or animated background. **Enabling this option overrides the Mica backdrop settings above.** |
| `uc.flex.browser-wallpaper-index` | `0`-`9`<br>(`0`) | Selects the wallpaper source. `0` uses the current Firefox theme background as the wallpaper for the entire browser interface. Values `1`-`9` use custom files from `../icons/wallpaper/`, named `main-image-1.jpg` through `main-image-9.jpg`. Wallpaper files must be renamed with a `.jpg` extension regardless of their original format. Supported formats include JPG, WebP, Animated WebP, PNG, APNG, AVIF, and GIF. |
| `uc.flex.browser-wallpaper-svg-enabled` | `false` | Enables SVG wallpaper support. When enabled, SVG wallpapers can be used by placing files named `main-image-1.svg` through `main-image-9.svg` in `../icons/wallpaper/`. Unlike other wallpaper formats, SVG files must retain the `.svg` extension. |
| `uc.flex.browser-wallpaper-acrylic-disabled` | `false` | Disables the acrylic-style blur effect applied to browser wallpapers. By default, wallpapers use an acrylic blur to mimic the look of Mica. Enable this option to display wallpapers in their original sharp appearance. |
| `uc.flex.browser-wallpaper-align-horizontal` | `'auto'`\|<br>`'left'`\|<br>`'center'`\|<br>`'right'` | Sets the horizontal alignment used when wallpaper images are cropped to fit the browser window. Accepted values: `'auto'` or `'0'` = automatic alignment (default), `'left'` or `'1'` = align left, `'center'` or `'2'` = center, `'right'` or `'3'` = align right. |
| `uc.flex.browser-wallpaper-transparency-level` | `0`-`4`<br>(`2`) | Adjusts the transparency of the overlay applied above the wallpaper. The overlay is white in light mode and black in dark mode. Higher values make the overlay more transparent, revealing more of the background. This setting is designed to visually match `uc.flex.browser-mica-transparency-level`, so the default value `2` appears close to Mica transparency level `2`. This helps avoid sudden brightness changes when switching between custom wallpapers and Mica. |
| `uc.flex.browser-wallpaper-contrast-level` | `0`-`4`<br>(`2`) | Adjusts the contrast of the overlay applied above the wallpaper. This option only takes effect in dark mode when the acrylic blur effect is enabled. Higher values increase contrast and make colors more vivid. The default value is `2`. |

</details>
