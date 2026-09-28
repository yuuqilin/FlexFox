# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox Changelog

[English](./CHANGELOG.md) | [日本語](./CHANGELOG_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md) | [简体中文](./CHANGELOG_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md)

## 🆕 What's New

## 🦊 v7.1.0

> [!IMPORTANT]
> v7.0.0 introduced several new features and breaking changes. If you missed its release notes, you can read them here:
>
> [English](./CHANGELOG.md#-v700---nova-ui-edition) | [日本語](./CHANGELOG_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md#-v700---nova-ui-edition) | [简体中文](./CHANGELOG_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md#-v700---nova-ui-edition)

> [!IMPORTANT]
> Firefox 157 will enable Nova UI by default.
>
> In the next FlexFox release, support for Firefox ESR 140 will end in line with Firefox's support schedule. FlexFox will then support ESR 153 and later. The last ESR 140-compatible source code will be frozen and moved to the `ESR-v140` branch.
>
> The next release will also drop compatibility with legacy pre-v6 FlexFox styles remaining in Sidebery's Styles editor. If you still have these styles installed, please remove them before upgrading to the next FlexFox release. See [Upgrading from Pre-v6 Versions](./USAGE.md#-upgrading-from-pre-v6-versions) for instructions.

### New

- **QoL:** Added `uc.flex.show-native-vertical-tabs-on-sidebar-stripe-hover` to open the full native vertical tabs panel when hovering over the sidebar stripe while using Sidebery.

  - By default, FlexFox reveals only the sidebar tool buttons on hover to avoid duplicating Sidebery's tab list.
  - Firefox does not yet expose extension APIs for features such as Split View and Tab Notes, so Sidebery cannot use them directly. Normally, you must press <kbd>F1</kbd> to switch to native vertical tabs, then press <kbd>F1</kbd> again to return to Sidebery.
  - The sidebar toggle button (Firefox logo) shows a colored icon in **expanded mode** and a grayscale icon in **collapsed mode**.
  - With this option enabled, hovering over the sidebar stripe in expanded mode opens the full native vertical tabs panel without switching away from Sidebery. It has no effect in collapsed mode or when `uc.flex.remove-sidebar-stripe` is enabled.
  - When Mica or a custom wallpaper is enabled alongside `uc.flex.sidebery-allow-resizable-width`, Sidebery cannot be resized narrower than the width set by `uc.flex.sidebery-expand-width` while the sidebar toggle button is in expanded mode. This restriction does not apply without Mica or wallpapers.

- **Compatibility:** Added support for Sidebery Nightly (v5.6.1.5). This unreleased version introduces breaking changes that would otherwise disrupt several FlexFox styles and features. [Commit 6228919](https://github.com/mbnuqw/sidebery/commit/622891943b4ace519b827bf67eed9da07b8b6f4b) [Commit 43944c7](https://github.com/mbnuqw/sidebery/commit/43944c74e965d5ee9687696d2698da55bfd684a1)

### Improvements

- The corner radius of URL bar icon buttons now follows `uc.flex.style-toolbar-items-border-radius`.
- In horizontal tabs mode, `Hide Sidebery` can now hide sidebar tool buttons. They also hide automatically with `Hide All` or in <kbd>F11</kbd> fullscreen mode, and reappear when the cursor approaches the screen edge.
- Refactored the layout rules for sidebar tool buttons.
- Refactored sidebar stacking order (`z-index`) handling.

### Fixes

- Fixed Sidebery tab drag-and-drop issues that prevented tabs from moving or placed them in the wrong position. [Issue #49](https://github.com/yuuqilin/FlexFox/issues/49)
- Fixed a Firefox 154 regression that prevented native vertical tabs from expanding in <kbd>F11</kbd> fullscreen mode. [Bug 2052711](https://bugzilla.mozilla.org/show_bug.cgi?id=2052711) [Bug 2054085](https://bugzilla.mozilla.org/show_bug.cgi?id=2054085)
- Fixed misaligned sidebar tool buttons in horizontal tabs mode after Firefox 156 changes. [Bug 2049659](https://bugzilla.mozilla.org/show_bug.cgi?id=2049659)
- Fixed sidebar tool buttons appearing in the wrong position after Firefox 158 changes. [Bug 2041030](https://bugzilla.mozilla.org/show_bug.cgi?id=2041030)
- Fixed misaligned Split View tabs after Firefox 158 changes. [Bug 2068234](https://bugzilla.mozilla.org/show_bug.cgi?id=2068234)

<!-- END What's New -->

## 🦊 v7.0.1

> [!IMPORTANT]
> v7.0.0 introduced several new features and breaking changes. If you missed its release notes, you can read them here:
>
> [English](./CHANGELOG.md#-v700---nova-ui-edition) | [日本語](./CHANGELOG_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md#-v700---nova-ui-edition) | [简体中文](./CHANGELOG_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md#-v700---nova-ui-edition)

### Fixes

- **Critical:** Fixed Firefox 157 compatibility regressions that broke the URL bar and could make the browser unusable. [Bug 2065901](https://bugzilla.mozilla.org/show_bug.cgi?id=2065901)

  - Fixed `uc.flex.move-urlbar-popup-to-center` causing the input field to disappear and shifting the navigation toolbar and web content out of place.
  - Fixed `uc.flex.enable-translucent-urlbar-popup-and-menus` making the URL bar fully transparent and disabling background blur.
  - Fixed `uc.flex.dim-urlbar-popup-backdrop` failing to dim the entire viewport.

- **Critical:** Fixed a Firefox 157 compatibility regression that prevented the bookmarks toolbar from expanding. [Bug 2069885](https://bugzilla.mozilla.org/show_bug.cgi?id=2069885)
- **Critical:** Fixed native tab layout issues caused by Firefox 158 changes. [Bug 2037111](https://bugzilla.mozilla.org/show_bug.cgi?id=2037111)
- Restored rounded corners on tab group and Split View items after Firefox 157 changes. [Bug 2033008](https://bugzilla.mozilla.org/show_bug.cgi?id=2033008)
- Fixed the separator above the sidebar's bottom tool buttons in collapsed mode when `Expand sidebar on hover` was disabled, following Firefox 156 changes. [Bug 2056278](https://bugzilla.mozilla.org/show_bug.cgi?id=2056278)
- Fixed `uc.flex.style-toolbar-items-border-radius = 1` failing to force Proton UI corners on the App Menu and panels when Nova UI was enabled.
- Fixed a v7.0.0 regression that inset native tab borders and separated them from their shadows when `uc.flex.style-tab-items-gradient-border = 0` and `uc.flex.style-tab-items-border-width = 2`.
- Fixed incorrect color opacity on Sidebery tab close buttons in Light Mode.
- Centered Sidebery's bottom-bar buttons when **Density** was set to **Compact** or **Relaxed**.

## 🦊 v7.0.0 - Nova UI Edition

> [!IMPORTANT]
> v6.6.0 introduced several new preferences and breaking changes. If you missed its release notes, you can read them here:
>
> [English](./CHANGELOG.md#-v660) | [日本語](./CHANGELOG_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md#-v660) | [简体中文](./CHANGELOG_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md#-v660)

### New and Changed

- Added `uc.flex.style-urlbar-gradient` to apply the sidebar stripe gradient to URL bar elements:

  ```
  0 = Disabled (default)
  1 = Gradient icons
  2 = Gradient icons and an animated gradient border on hover
  3 = Gradient icons, an animated gradient border on hover, and gradient URL text
  ```

  The gradient colors follow `uc.flex.style-sidebar-stripe-color`. Text dimming differs between Firefox 155 and 156 because of [Bug 2063127](https://bugzilla.mozilla.org/show_bug.cgi?id=2063127). For a fully undimmed gradient text effect, create the native `browser.urlbar.formatting.enabled` preference and set it to `false`.

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/urlbar-gradient.webp" width="680px">

  Preview settings:

  ```
  uc.flex.style-urlbar-gradient            = 3
  uc.flex.style-sidebar-stripe-color       = 9
  ```

- Added `uc.flex.style-tab-items-border-width` to set the active-tab border width:

  ```
  0 = No border
  1 = 1px border (previous default)
  2 = 2px border (default)
  ```

- Added `uc.flex.style-tab-items-gradient-border` to control the gradient border on the active tab:

  ```
  0 = Disabled (previous default)
  1 = Static gradient (default)
  2 = Animated gradient
  ```

  The gradient colors follow `uc.flex.style-sidebar-stripe-color`. A static gradient is the Nova UI default and is enabled by default in FlexFox ahead of the rollout because of [Issue #41](https://github.com/yuuqilin/FlexFox/issues/41). This option has no effect when `uc.flex.style-tab-items-border-width` is set to `0`.

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/gradient-border.webp" width="300px">

  Preview settings:

  ```
  uc.flex.style-tab-items-gradient-border = 2
  uc.flex.style-tab-items-background-fill = 0
  ```

- Expanded the value range of `uc.flex.style-tab-items` to `0`-`2` to control the appearance of pinned tabs:

  ```
  0 = No border or background fill
  1 = Border only (default)
  2 = Background fill only
  ```

  Borders and fills use neutral colors in Light Mode and the sidebar stripe accent color in Dark Mode. With value `2`, selected-tab borders always use the accent color.

- Added `uc.flex.style-tab-items-background-fill` to control tab background fills:

  ```
  0 = Transparent active-tab background
  1 = Accent-colored active-tab background (default)
  2 = Add a neutral base background fill to all tabs
  ```

  Enabling `uc.flex.style-tab-items` overrides the base background of pinned tabs. When this option and `uc.flex.style-tab-items-border-width` are both set to `0`, a 1px border is retained.

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/background-fill.webp" width="965px">

  Preview setting: `uc.flex.style-tab-items-background-fill = 2`

- Added `uc.flex.style-tab-items-gradient-background` to control the gradient background on the active tab:

  ```
  0 = Disabled (default)
  1 = Static gradient
  2 = Animated gradient
  ```

  It can be used together with a gradient border. This setting overrides `uc.flex.style-tab-items-background-fill`.

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/gradient-background.webp" width="298px">

  Preview settings:

  ```
  uc.flex.style-tab-items-gradient-background = 2
  uc.flex.style-tab-items-border-width        = 0
  ```

- Expanded `uc.flex.show-tab-close-button-on-favicon-hover` to support Native Vertical Tabs and Sidebery in addition to native horizontal tabs. It merges the close button into the favicon and shows it when hovering over the favicon.

- Added `uc.flex.style-tab-close-button-warning-zone-size` to control the visibility and size of the warning zone inside tab close buttons:

  ```
  0 = Hidden (native appearance)
  1 = Small (default)
  2 = Large
  ```

  When `uc.flex.show-tab-close-button-on-favicon-hover` is enabled, value `2` has no effect and the warning zone uses the default size (`1`).

- Added `uc.flex.style-tab-items-border-radius` to control whether tab items use Proton UI or the larger Nova UI corners:

  ```
  0 = Automatic (default). Uses Nova UI corners when browser.nova.enabled = true
  1 = Force Proton UI corners
  2 = Force Nova UI corners
  ```

  The "List All Tabs" button placed on the horizontal tab bar also follows this setting.

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/border-radius.webp" width="298px">

  Preview settings:

  ```
  uc.flex.style-tab-items                          = 0
  uc.flex.style-tab-close-button-warning-zone-size = 1
  ```

- Added `uc.flex.style-toolbar-items-border-radius` to control whether toolbar buttons, panel items, menu items, bookmark menu items, the upper outer corner of an expanded sidebar, the sidebar stripe, and the findbar use Proton UI or the larger Nova UI corners:

  ```
  0 = Automatic (default). Uses Nova UI corners when browser.nova.enabled = true
  1 = Force Proton UI corners
  2 = Force Nova UI corners
  ```

  `uc.flex.revert-to-original-flat-corner-style` overrides both border-radius preferences.

### Improvements

- Refined the whitespace and spacing in the pinned-tab grid for a less crowded and more balanced appearance.

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/grid-gap.webp" width="300px">

- Added a rounded outline to the findbar, giving it a floating appearance that separates it from the web content background.

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/findbar-border.webp" width="923px">

- Added the placeholder "Type `uc.flex` to show all FlexFox preferences" to the empty `about:config` search field.

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/preference-search-hint.webp" width="630px">

- Extended the sidebar stripe accent colors to horizontal tabs, which can now use the same border and background colors as vertical tabs.
- Improved the gradient rendering of title text on Sidebery Group Pages so the full text uses the gradient regardless of its length.

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/group-page-gradient.webp" width="214px">

### Breaking Changes

- Renamed the `uc.flex.skip-loading-uc-*.css` preferences to `uc.flex.~dev-skip-loading-uc-*.css`.

  These preferences skip loading specific CSS files to help isolate components during troubleshooting. The old names were sorted among regular options in `about:config`, which could misalign their descriptions. The new namespace sorts them after the regular options, allowing new development preferences to be added without disrupting the layout.

### Fixes

- Fixed multiple styling and layout regressions caused by Firefox updates: [Bug 2049244](https://bugzilla.mozilla.org/show_bug.cgi?id=2049244), [Bug 2055840](https://bugzilla.mozilla.org/show_bug.cgi?id=2055840), [Bug 2046942](https://bugzilla.mozilla.org/show_bug.cgi?id=2046942), [Bug 2033583](https://bugzilla.mozilla.org/show_bug.cgi?id=2033583), [Bug 2044711](https://bugzilla.mozilla.org/show_bug.cgi?id=2044711), [Bug 2045752](https://bugzilla.mozilla.org/show_bug.cgi?id=2045752), [Bug 2054481](https://bugzilla.mozilla.org/show_bug.cgi?id=2054481), [Bug 2023711](https://bugzilla.mozilla.org/show_bug.cgi?id=2023711), [Bug 2022975](https://bugzilla.mozilla.org/show_bug.cgi?id=2022975), [Bug 2052608](https://bugzilla.mozilla.org/show_bug.cgi?id=2052608), [Bug 2034495](https://bugzilla.mozilla.org/show_bug.cgi?id=2034495), [Bug 2029183](https://bugzilla.mozilla.org/show_bug.cgi?id=2029183), [Bug 2046646](https://bugzilla.mozilla.org/show_bug.cgi?id=2046646), [Bug 2039721](https://bugzilla.mozilla.org/show_bug.cgi?id=2039721), [Bug 2047784](https://bugzilla.mozilla.org/show_bug.cgi?id=2047784), [Bug 1998985](https://bugzilla.mozilla.org/show_bug.cgi?id=1998985), and [Bug 2063294](https://bugzilla.mozilla.org/show_bug.cgi?id=2063294).

## 🦊 v6.6.0

### New

https://github.com/user-attachments/assets/84a3ddf1-02f8-4c02-9957-4afcba52bf78

* Added `uc.flex.sidebery-expand-style` to customize the expand and collapse animation of Sidebery and Native Vertical Tabs:

  ```
  1 = Balanced (`ease-in-out`; smooth and even, default)
  2 = Unfolding (`ease-out` / `ease-in`; content is revealed progressively)
  3 = Swift (`easeOutQuart` / `easeInQuart`; expands quickly and settles gently)
  4 = Snappy (`easeOutExpo` / `ease-in-expo`; expands abruptly and collapses with a firm finish)
  ```

* Added `uc.flex.sidebery-expand-duration` to set the animation duration:

  ```
  1 = `115ms` expand / `55ms` collapse (default)
  2 = `160ms` / `80ms`
  3 = `200ms` / `100ms`
  4 = `340ms` / `220ms`
  ```

  Longer durations make the differences between animation styles easier to see.

* Added `uc.flex.sidebery-expand-delay` to set the hover delay before Sidebery and Native Vertical Tabs expand:

  ```
  0 = No delay
  1 = `80ms` (default)
  2 = `160ms`
  3 = `350ms`
  4 = `460ms`
  ```

  This setting also controls the expand delay of horizontal tabs and toolbars.

* Added `uc.flex.sidebery-expand-width` to set the expanded width of Sidebery and Native Vertical Tabs:

  ```
  1 = `220px` (default)
  2 = `240px`
  3 = `260px`
  4 = `280px`
  ```

* When Mica, wallpapers, or `uc.flex.sidebery-apply-expand-speed-to-toolbars` is enabled, these animation settings are also applied to horizontal tabs and toolbars.

* All four preferences default to `1`, which preserves the same behavior as versions before v6.6. Change the values manually to use the new styles, timings, or widths.

* Settings used in the preview:

  ```
  uc.flex.sidebery-expand-delay    = 2
  uc.flex.sidebery-expand-duration = 2
  uc.flex.sidebery-expand-style    = 2
  uc.flex.sidebery-expand-width    = 2
  ```

### Breaking Changes

* The following preferences are deprecated and no longer work. Remove them from `about:config` to keep the FlexFox preference descriptions aligned:

  ```
  uc.flex.sidebery-fast-hover-expand
  → Replaced by uc.flex.sidebery-expand-delay

  uc.flex.sidebery-slow-hover-expand
  → Replaced by uc.flex.sidebery-expand-delay

  uc.flex.increase-sidebery-expanded-width
  → Replaced by uc.flex.sidebery-expand-width
  ```

* Updated the available values for `uc.flex.findbar-position`:

  ```
  top-left or 1       = Top left
  top-right or 2      = Top right
  bottom-right or 3   = Bottom right
  ```

  The previous `top-center-left` value no longer works.

### Improvements

<img src="https://raw.githubusercontent.com/yuuqilin/media-assets/FlexFox/assets/v6.6-findbar.png" width="582px">

* Improved the findbar appearance:

  * Smoother and more consistent edges.
  * Better blur and shadow effects with Mica and wallpapers.
  * `uc.flex.style-sidebar-stripe-color-apply-to-all-icons` now also colors findbar icons.

<img src="https://raw.githubusercontent.com/yuuqilin/media-assets/FlexFox/assets/v6.6-bookmark-folders.png" width="364px">

* Centered bookmark folder icons when folder labels are hidden, including their Nova UI hover background.

<img src="https://raw.githubusercontent.com/yuuqilin/media-assets/FlexFox/assets/v6.6-gradient-tab-borders.png" width="330px">

* Added support for Nova UI gradient tab borders. Set the colors with `uc.flex.style-sidebar-stripe-color`:

  ```
  0      = Nova UI default gradient
  1–10   = FlexFox accent color gradients
  ```
* Added translucent background support for the Link Preview Panel.
* Added Nova UI styling for `about:config`.

### Fixes

#### Sidebery UI

* Rounded the bottom corners of the last button in Sidebery’s vertical navigation bar.
* Fixed a v6.5.6 regression that showed the wrong active panel icon when Sidebery was collapsed.
* Fixed incorrect tab badge colors with Sidebery v5.6.0 and later. [Commit ec84311](https://github.com/mbnuqw/sidebery/commit/ec8431190c3e42aa4f8357ca2c7aabc97db87fff)

#### Firefox UI

* Fixed several missing or incorrectly displayed icons.
* Fixed the sidebar stripe position when `sidebar.visibility = expand-on-hover`.
* Fixed Nova UI layout issues on `about:addons` in Firefox 154. [Bug 2051559](https://bugzilla.mozilla.org/show_bug.cgi?id=2051559)
* Fixed Sidebery and Native Vertical Tabs not expanding in fullscreen in Firefox 154. [Bug 1927457](https://bugzilla.mozilla.org/show_bug.cgi?id=1927457)
* Fixed inverted context-menu icon colors in Firefox 154. [Bug 2048186](https://bugzilla.mozilla.org/show_bug.cgi?id=2048186)
* Fixed findbar layout issues in Firefox 154. [Bug 2048907](https://bugzilla.mozilla.org/show_bug.cgi?id=2048907), [Bug 2056829](https://bugzilla.mozilla.org/show_bug.cgi?id=2056829)
* Fixed `uc.flex.enable-rounded-web-content` in horizontal tab layouts in Firefox 154. [Bug 2047653](https://bugzilla.mozilla.org/show_bug.cgi?id=2047653)
* Fixed incorrect tab group backgrounds in Firefox 154. [Bug 2046942](https://bugzilla.mozilla.org/show_bug.cgi?id=2046942)
* Restored tab group hover backgrounds in Firefox 155. [Bug 2023691](https://bugzilla.mozilla.org/show_bug.cgi?id=2023691)
* Restored pinned tab borders and backgrounds in Firefox 155. [Bug 2023619](https://bugzilla.mozilla.org/show_bug.cgi?id=2023619)
* Fixed mismatched panel corners in Firefox 155. [Bug 2054953](https://bugzilla.mozilla.org/show_bug.cgi?id=2054953)
* Added a temporary workaround for Native Vertical Tabs layout issues above 125% display scaling in Firefox 155. [Bug 2044082](https://bugzilla.mozilla.org/show_bug.cgi?id=2044082)
* Fixed numerous layout and functionality issues caused by Nova UI becoming enabled by default in Firefox 155. [Bug 2056188](https://bugzilla.mozilla.org/show_bug.cgi?id=2056188)

<a id="updates-top-start"></a>
<details>

<summary>💬 <b>Previous Updates</b></summary>

<!-- END Release Note -->

For more update logs from earlier versions,  
👉 see the [history archive on the Wiki](https://github.com/yuuqilin/FlexFox/wiki/Earlier-Update-History-(English))

<a href="#updates-top-start">⏫ Back to the beginning of updates</a>
</details>
