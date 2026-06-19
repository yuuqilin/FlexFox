# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox Usage Guide

[English](./USAGE.md) | [日本語](./USAGE_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md) | [简体中文](./USAGE_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md)

This document provides practical guides, setup instructions, and solutions for common FlexFox workflows.

For a complete reference of preferences and supported values, see [Preferences List](OPTIONS.md).

## 📚 Table of Contents

- [Recreating the Preview Interface](#-recreating-the-preview-interface)
- [Layout Switching](#-layout-switching)
- [Firefox Themes and Sidebery](#-firefox-themes-and-sidebery)
- [Transparent Web Content, Mica, and Wallpapers](#️-transparent-web-content-mica-and-wallpapers)
- [Improving Readability in Transparent Web Content](#-improving-readability-in-transparent-web-content)

---

## 🎬 Recreating the Preview Interface

### Why doesn't my interface look like the preview video?

FlexFox uses a minimal configuration by default.

To quickly recreate the interface shown in the preview video, apply the settings below.

<details>
<summary><b>Preview video settings</b> 👇</summary>

```
uc.flex.browser-wallpaper-acrylic-disabled = false (some scenes: true)
uc.flex.browser-wallpaper-enabled = true
uc.flex.browser-wallpaper-index = 0 (some scenes: custom wallpaper index)
uc.flex.browser-wallpaper-transparency-level = 2 (some scenes: 4)
uc.flex.enable-colored-bookmarks-folder-icons = 2
uc.flex.enable-rounded-web-content = 2
uc.flex.enable-rounded-web-content-at-sidebery-corner = true
uc.flex.enable-translucent-urlbar-popup-and-menus = true
uc.flex.move-urlbar-popup-to-center = 1
uc.flex.move-window-controls-to-left = true
uc.flex.show-tab-count-in-alltabs-button = 2
uc.flex.style-all-tabs-button = 2
uc.flex.style-sidebar-button = 2
uc.flex.style-sidebar-stripe-color = 9
uc.flex.style-sidebar-stripe-color-apply-to-all-icons = true
uc.flex.style-sidebar-stripe-color-use-gradient = true
uc.flex.style-tab-groups = 2
uc.flex.style-tab-items = 2
uc.flex.style-urlbar = 2
uc.flex.style-urlbar-center-text = true
uc.flex.style-web-content-outline = 2
uc.flex.style-window-controls = 2
uc.flex.style-window-controls-shrink-size = true
```

</details>

For a complete reference of available preferences, supported values, and detailed descriptions, see the [Preferences List](OPTIONS.md).

---

## 🔄 Layout Switching

### How to hide toolbars and sidebars using keyboard shortcuts or toolbar buttons

1. Install [UserChrome Toggle Extended](https://addons.mozilla.org/firefox/addon/userchrome-toggle-extended/).

2. Open the extension settings:

   **Hamburger menu → Settings → Extensions and Themes → UserChrome Toggle Extended → Options**

3. Configure the extension as shown below:

   <img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/userchrome-toggle-extended-solid-page.webp" alt="UserChrome Toggle Extended settings" width="45%" />

   * Enable `Allow multiple styles to be active together` and `Close popup after clicking toggle`

   * Select `Toggles from last active window` and `Toggles from previous session` from the dropdown menus

   * Enable `Style 1` through `Style 4`, and `Style 6`

   * Rename the styles as follows:

     | Style   | Label           |
     | ------- | --------------- |
     | Style 1 | `Lock Sidebery` |
     | Style 2 | `Hide Topbar`   |
     | Style 3 | `Hide Sidebery` |
     | Style 4 | `Hide All`      |
     | Style 6 | `Solid Page`    |

   * Click `Apply changes` in the upper-left corner to save your settings.

4. By default, the extension assigns shortcuts to <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>1</kbd> through <kbd>6</kbd>. To change them, click the gear icon at the top of the page and select `Manage Extension Shortcuts`.

5. The following layouts are available:

   | Shortcut | Label | Preference | Action |
   | -------- | ----- | ---------- | ------ |
   | <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>1</kbd> | `Lock Sidebery` | `uc.flex.disable-sidebery-autohide` | Keeps Sidebery and native vertical tabs permanently expanded instead of auto-collapsing. |
   | <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>2</kbd> | `Hide Topbar` | `uc.flex.fully-hide-toolbox` | Completely hides all top toolbars until the cursor approaches the top edge of the screen. |
   | <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>3</kbd> | `Hide Sidebery` | `uc.flex.fully-hide-sidebery` | Completely hides Sidebery and native vertical tabs until the cursor approaches the screen edge. |
   | <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>4</kbd> | `Hide All` | `uc.flex.fully-hide-toolbox` +<br>`uc.flex.fully-hide-sidebery` | Hides both the top toolbars and the sidebar until the cursor approaches the screen edge. |

> [!IMPORTANT]
>
> Preference settings override the corresponding shortcuts. If these preferences are enabled manually in `about:config`, the related layout will remain locked and cannot be toggled using keyboard shortcuts or toolbar buttons.
>
> For normal use, keep these preferences set to `false` and switch layouts using shortcuts or toolbar buttons instead.

---

## 🎨 Firefox Themes and Sidebery

### Why doesn't Sidebery use my Firefox theme background?

To allow Sidebery to follow your current Firefox theme, open:

`Settings` (gear icon) → `Appearance` → `Color scheme`

Then set `Color scheme` to `Firefox`.

<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/sidebery-appearance-settings.webp" alt="Sidebery appearance settings" width="50%" />

---

## 🖼️ Transparent Web Content, Mica, and Wallpapers

### How to enable Mica or custom wallpapers in Sidebery and web content

1. To display Mica backgrounds or custom wallpapers in Sidebery and web content, you must enable `browser.tabs.allow_transparent_browser`.

   * For Mica, enable the following preferences in `about:config`:

     ```
     browser.tabs.allow_transparent_browser = true
     widget.windows.mica = true
     widget.windows.mica.popups = 2
     widget.windows.mica.toplevel-backdrop = 2
     uc.flex.browser-mica-force-enabled-on-all-themes = true
     uc.flex.browser-mica-transparency-level = 2
     ```

   * For custom wallpapers, enable the following preferences in `about:config`:

     ```
     browser.tabs.allow_transparent_browser = true
     uc.flex.browser-wallpaper-enabled = true
     uc.flex.browser-wallpaper-index = 1
     uc.flex.browser-wallpaper-svg-enabled = false
     uc.flex.browser-wallpaper-acrylic-disabled = true
     uc.flex.browser-wallpaper-align-horizontal = auto
     uc.flex.browser-wallpaper-transparency-level = 2
     uc.flex.browser-wallpaper-contrast-level = 2
     ```

2. After enabling `browser.tabs.allow_transparent_browser`, you must restart Firefox for the change to take effect.

3. For a complete reference of available preferences, supported values, and detailed descriptions, see the [Preferences List](OPTIONS.md).

4. FlexFox supports transparent backgrounds on all built-in Firefox `about:*` pages. For a complete list, visit `about:about`.

5. To display Mica backgrounds or wallpapers on regular websites, install either [Transparent Zen](https://addons.mozilla.org/firefox/addon/transparent-zen/) or [Zen Internet](https://addons.mozilla.org/firefox/addon/zen-internet/).

6. Animated wallpapers can be created by downloading MP4 videos from [Motion Backgrounds](https://motionbgs.com/) and converting them to Animated WebP using [FFmpeg](https://ffmpeg.org/) or [ScreenToGif](https://github.com/NickeManarin/ScreenToGif/).

---

## 👓 Improving Readability in Transparent Web Content

### What should I do if some websites become difficult to read after enabling transparent web content?

After enabling transparent web content, some websites may become difficult to read because their backgrounds are fully transparent. You can address this in one of two ways:

1. Install [UltimaDark](https://addons.mozilla.org/firefox/addon/ultimadark/) or [Dark Reader](https://addons.mozilla.org/firefox/addon/darkreader/).

   * Applies automatically to supported websites
   * Remembers settings for individual websites
   * May affect page rendering performance

2. Use FlexFox's built-in `Solid Page` feature.

   * Toggle it instantly using a keyboard shortcut or toolbar button
   * Does not save settings for individual websites
   * Has no impact on page loading performance
   * See [Layout Switching](#-layout-switching) for setup instructions
   * The default background color is white and can be changed using `uc.flex.browser-solid-page-color-scheme`
   