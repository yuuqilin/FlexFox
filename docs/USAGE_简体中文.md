# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox 使用指南

[English](./USAGE.md) | [日本語](./USAGE_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md) | [简体中文](./USAGE_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md)

本文档提供 FlexFox 的使用方法、配置说明以及常见使用场景的解决方案。

如需查看完整的选项说明和支持的设置值，请参阅“[可配置选项列表](OPTIONS_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md)”。

## 📚 目录

- [Firefox 侧栏设置](#️-firefox-侧栏设置)
- [从 v6 之前的版本升级](#-从-v6-之前的版本升级)
- [还原演示视频中的界面效果](#-还原演示视频中的界面效果)
- [布局切换](#-布局切换)
- [Firefox 主题与 Sidebery](#-firefox-主题与-sidebery)
- [透明网页、Mica 与壁纸](#️-透明网页mica-与自定义壁纸)
- [改善透明网页中的文字可读性](#-改善透明网页的可读性)

---

## 🖱️ Firefox 侧栏设置

### 为什么启用 Firefox 的“悬停时展开侧栏”选项后，FlexFox 无法正常工作？

FlexFox 使用自己的侧栏自动隐藏和布局切换机制。Firefox 内置的“**悬停时展开侧栏**”选项会改变侧栏的行为，因此可能与 FlexFox 的部分功能发生冲突。

此选项默认处于关闭状态。为了获得最佳体验，建议保持未勾选。

要检查此设置，请右键点击导航栏中的 **侧栏切换按钮**（Firefox 标志），选择“**定制侧栏**”，然后确认“**悬停时展开侧栏**”处于未勾选状态。

---

## 🧹 从 v6 之前的版本升级

### 为什么需要删除 Sidebery 样式编辑器中的旧版 FlexFox 样式？

在 v6 之前，FlexFox 使用 `sidebery-styles.json` 通过 Sidebery 的样式编辑器注入自定义 CSS。

从 v6 开始，所有内置的 Sidebery 样式都已迁移到 `uc-sidebery.css`。此前导入到样式编辑器中的旧样式现已不再使用。

虽然这些旧样式目前仍然兼容，但为了避免重复处理样式以及与未来版本发生冲突，仍然强烈建议将其删除。

打开 Sidebery 导航栏 → **设置（齿轮图标）→ 样式编辑器**，然后删除“**侧边栏**”和“**分组页面**”两个页面中的所有 FlexFox 旧样式。

由于 FlexFox 的 Sidebery 样式现已统一由 `uc-sidebery.css` 管理，因此只需启用 `uc.flex.skip-loading-uc-sidebery.css`，即可完全禁用 FlexFox 对 Sidebery 的样式修改，更方便与自定义样式或其他样式包搭配使用。

---

## 🎬 还原演示视频中的界面效果

### 为什么我的界面和演示视频不一样？

FlexFox 默认仅启用最基础的界面调整。

如果想快速还原演示视频中的界面效果，请直接应用以下设置。

<details>
<summary><b>应用演示视频中的设置</b> 👇</summary>

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

如需查看完整的选项说明、可用设置值及其作用，请参阅“[可配置选项列表](OPTIONS_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md)”。

---

## 🔄 布局切换

### 如何使用快捷键或工具栏按钮隐藏工具栏和侧边栏

1. 安装 [UserChrome Toggle Extended](https://addons.mozilla.org/firefox/addon/userchrome-toggle-extended/) 扩展。

2. 打开扩展设置页面：

   **汉堡菜单 → 设置 → 扩展和主题 → UserChrome Toggle Extended → 选项**

3. 按照下图完成设置：

   <img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/userchrome-toggle-extended-solid-page.webp" alt="UserChrome Toggle Extended settings" width="45%" />

   * 勾选 `Allow multiple styles to be active together` 和 `Close popup after clicking toggle`

   * 在下拉菜单中选择 `Toggles from last active window` 和 `Toggles from previous session`

   * 启用 `Style 1` 至 `Style 4` 以及 `Style 6`

   * 将各个样式名称修改为：

     | Style   | Label           |
     | ------- | --------------- |
     | Style 1 | `Lock Sidebery` |
     | Style 2 | `Hide Topbar`   |
     | Style 3 | `Hide Sidebery` |
     | Style 4 | `Hide All`      |
     | Style 6 | `Solid Page`    |

   * 点击左上角的 `Apply changes` 保存设置。

4. 默认快捷键为 <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>1</kbd> 至 <kbd>6</kbd>。如需修改，可点击页面顶部的齿轮图标，然后选择 `管理扩展快捷键`。

5. 可切换的布局模式如下：

   | 快捷键 | 标签 | Preference | 说明 |
   | -------- | ----- | ---------- | ------ |
   | <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>1</kbd> | `Lock Sidebery` | `uc.flex.disable-sidebery-autohide` | 保持 Sidebery 和原生垂直标签页始终展开，不再自动折叠。 |
   | <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>2</kbd> | `Hide Topbar` | `uc.flex.fully-hide-toolbox` | 完全隐藏所有顶部工具栏。当鼠标靠近屏幕顶部边缘时重新显示。 |
   | <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>3</kbd> | `Hide Sidebery` | `uc.flex.fully-hide-sidebery` | 完全隐藏 Sidebery 和原生垂直标签页。当鼠标靠近屏幕边缘时重新显示。 |
   | <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>4</kbd> | `Hide All` | `uc.flex.fully-hide-toolbox` +<br>`uc.flex.fully-hide-sidebery` | 同时隐藏顶部工具栏和侧边栏，仅保留网页内容。当鼠标靠近屏幕边缘时重新显示。 |

> [!IMPORTANT]
>
> Preference 设置会覆盖对应的快捷键。如果在 `about:config` 中手动启用了这些选项，对应布局将被锁定，无法再通过快捷键或工具栏按钮切换。
>
> 日常使用建议保持这些选项为 `false`，并通过快捷键或工具栏按钮切换布局。

---

## 🎨 Firefox 主题与 Sidebery

### 为什么 Sidebery 无法显示 Firefox 主题背景？

如需让 Sidebery 显示当前 Firefox 主题背景，请打开：

`设置`（齿轮图标）→ `外观` → `配色模式`

将 `配色模式` 设置为 `Firefox`。

<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/sidebery-appearance-settings.webp" alt="Sidebery appearance settings" width="50%" />

---

## 🖼️ 透明网页、Mica 与自定义壁纸

### 如何为 Sidebery 和网页内容启用 Mica 背景或自定义壁纸

1. 要在 Sidebery 和网页内容中显示 Mica 背景或自定义壁纸，需要启用 `browser.tabs.allow_transparent_browser`。

   * 使用 Mica 背景时，请在 `about:config` 中启用以下选项：

     ```
     browser.tabs.allow_transparent_browser = true
     widget.windows.mica = true
     widget.windows.mica.popups = 2
     widget.windows.mica.toplevel-backdrop = 2
     uc.flex.browser-mica-force-enabled-on-all-themes = true
     uc.flex.browser-mica-transparency-level = 2
     ```

   * 使用自定义壁纸时，请在 `about:config` 中启用以下选项：

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

2. 启用 `browser.tabs.allow_transparent_browser` 后，需要重新启动 Firefox，设置才会生效。

3. 各项设置的详细说明、可用值及其作用，请参阅“[可配置选项列表](OPTIONS_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md)”。

4. FlexFox 支持所有 Firefox 内置 `about:*` 页面显示透明背景，完整列表可在 `about:about` 中查看。

5. 普通网页需要额外安装 [Transparent Zen](https://addons.mozilla.org/firefox/addon/transparent-zen/) 或 [Zen Internet](https://addons.mozilla.org/firefox/addon/zen-internet/)，才能显示 Mica 背景或自定义壁纸。

6. 动态壁纸可从 [Motion Backgrounds](https://motionbgs.com/) 下载 MP4 视频，再使用 [FFmpeg](https://ffmpeg.org/) 或 [ScreenToGif](https://github.com/NickeManarin/ScreenToGif/) 转换为 Animated WebP。

---

## 👓 改善透明网页的可读性

### 启用透明网页后，如何改善文字可读性

启用透明网页后，部分网站可能会因为背景完全透明而难以阅读。可以通过以下两种方式解决：

1. 安装 [UltimaDark](https://addons.mozilla.org/firefox/addon/ultimadark/) 或 [Dark Reader](https://addons.mozilla.org/firefox/addon/darkreader/)。

   * 自动应用到支持的网站
   * 可记忆各网站的独立设置
   * 可能影响网页渲染性能

2. 使用 FlexFox 内置的 `Solid Page` 功能。

   * 可通过快捷键或工具栏按钮快速切换
   * 不支持保存网站专属设置
   * 不会影响网页加载性能
   * 使用方法请参阅“[布局切换](#-布局切换)”
   * 默认填充白色背景，可通过 `uc.flex.browser-solid-page-color-scheme` 进行调整
