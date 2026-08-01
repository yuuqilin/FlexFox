# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox Changelog

[English](./CHANGELOG.md) | [日本語](./CHANGELOG_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md) | [简体中文](./CHANGELOG_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md)

## 🆕 What's New

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

<!-- END What's New -->

<a id="updates-top-start"></a>
<details>

<summary>💬 <b>Previous Updates</b></summary>

<!-- END Release Note -->

For more update logs from earlier versions,  
👉 see the [history archive on the Wiki](https://github.com/yuuqilin/FlexFox/wiki/Earlier-Update-History-(English))

<a href="#updates-top-start">⏫ Back to the beginning of updates</a>
</details>
