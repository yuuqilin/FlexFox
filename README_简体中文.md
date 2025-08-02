# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox（简体中文版）

<div>
 <a href='https://www.mozilla.org'><img src="https://img.shields.io/badge/Last%20tested%20Firefox-v143-orange?logo=firefox"></a>
 <a href='https://github.com/yuuqilin/FlexFox/commits/main/'><img src="https://img.shields.io/github/last-commit/yuuqilin/FlexFox/main"></a>
 <a href='https://github.com/yuuqilin/FlexFox/commits/Beta/'><img src="https://img.shields.io/github/last-commit/yuuqilin/FlexFox/Beta?label=last%20Nightly%20commit&color=purple"></a>
 <a href='https://github.com/yuuqilin/FlexFox/stargazers'><img src='https://img.shields.io/github/stars/yuuqilin/FlexFox?style=social'></a>
</div>

<br>

[English](./README.md) | [日本語](./README_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md) | [简体中文](./README_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md) | [Wiki](https://github.com/yuuqilin/FlexFox/wiki)

FlexFox 让 Firefox 变得更快、更智能，也更顺手。  
它去除视觉干扰，保持界面稳定，同时运行依旧流畅。  
作为一个灵活的基础框架，FlexFox 让你自由定制浏览器界面，无需担心冗余或卡顿。  
这不仅是一个外观主题，更是提升浏览效率的新方式。  

![启用 Mica 效果并显示卡片式网页内容的 FlexFox](https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/a-blue-and-purple-background-with-wavy-shapes.webp) 

## **🧊 v4.0.0 – 主要功能更新**
* 支持 Windows 11 的 **Mica 背景效果**。
  * 要启用 Mica，必须在 `about:config` 中设置以下项目：
    ```
    widget.windows.mica = true
    widget.windows.mica.popups = 2
    widget.windows.mica.toplevel-backdrop = 2
    browser.tabs.allow_transparent_browser = true
    uc.flex.browser-mica-transparency-level = 2
    ```
  * 请将主题设置为 `系统主题 — 自动`，否则 Mica 效果将无法生效。
  * **需要重启 Firefox 浏览器。**
  * 详细说明请参考：[🧊 Visual Background & Mica Effects](https://github.com/yuuqilin/FlexFox#-visual-background--mica-effects)
  * 若背景被其他窗口遮挡，可使用快捷键 <kbd>Win</kbd> + <kbd>Home</kbd> 最小化所有非活动窗口，也可以设置为鼠标手势或使用脚本自动执行。  

  使用原生 Mica 背景的效果展示。（YouTube 网页内容的透明效果是通过搭配 [Transparent Zen](https://addons.mozilla.org/firefox/addon/transparent-zen/) 扩展实现的） 
  
  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/seashore-mica.webp" alt="示例展示了 Firefox 标签页和工具栏背后的 Mica 背景效果。" width="96%" />

* 若系统不支持 Mica，或希望使用不受窗口遮挡影响的固定壁纸，可以启用 FlexFox 提供的 **自定义浏览器壁纸** 功能。
  * 在 `about:config` 中启用以下选项：
    ```
    uc.flex.browser-wallpaper-enabled = true
    uc.flex.browser-wallpaper-index = 1
    uc.flex.browser-wallpaper-acrylic-disabled = false
    browser.tabs.allow_transparent_browser = true
    uc.flex.browser-wallpaper-transparency-level = 2
    uc.flex.browser-wallpaper-contrast-level = 2
    ```
  * **需要重启 Firefox 浏览器。**
  * 壁纸文件需命名为 `main-image-1.jpg` 至 `main-image-9.jpg`，存放于 `../icons/wallpaper/` 文件夹中。
  * 默认启用 **Acrylic 模糊效果**，外观类似原生 Mica，但并非完全相同。
  * 启用 **自定义浏览器壁纸** 功能后将覆盖系统原生的 Mica 背景。如果同时启用 Mica 和壁纸，显示的是壁纸。  

  启用自定义壁纸后可见，与原生 Mica 相比，模糊程度、色调和背景材质都有所不同。  

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/seashore-acrylic.webp" alt="示例展示了启用 Acrylic 模糊效果的自定义壁纸，模拟了 Mica 效果的视觉风格。" width="96%" />

  关闭自定义壁纸的 Acrylic 模糊效果后，背景图会变得非常清晰。可通过调整遮罩透明度来平衡网页文字的可读性。  

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/churning-in-the-chukchi-sea-no-acrylic.webp" alt="启用自定义壁纸但关闭 Acrylic 模糊效果的示例，壁纸清晰可见。" width="96%" />

* 示例壁纸的来源与鸣谢：
  * [a blue and purple background with wavy shapes (Unsplash)](https://unsplash.com/photos/a-blue-and-purple-background-with-wavy-shapes-1hg6NpO0kIk) – 作为 Firefox 新标签页自定义功能中的内建背景之一提供。
  * [Seashore Waves (Unsplash)](https://unsplash.com/photos/seashore-DA_tplYgTow) – 作为 Firefox 新标签页自定义功能中的内建背景之一提供。
  * [Churning in the Chukchi Sea (NASA)](https://www.visibleearth.nasa.gov/images/92412/churning-in-the-chukchi-sea/92412t) ([下载](https://www.bing.com/th/id/OBTQ.BTF2993094BEFFA1DE53FBFEA6FF54B81C71E858DDE1458F62454AF39BE5112D33?qlt=100&w=3840&h=2160&rs=1&c=4))

* 要让 Sidebery 和网页内容显示 Mica 背景或壁纸，需要启用 `browser.tabs.allow_transparent_browser`。
  * 页面透明效果需安装 [Transparent Zen](https://addons.mozilla.org/firefox/addon/transparent-zen/) 扩展。
  * 若部分页面显示为全透明导致难以阅读，建议搭配 [Dark Reader](https://addons.mozilla.org/firefox/addon/darkreader/) 使用。

* 新增选项：`uc.flex.sidebery-apply-expand-speed-to-toolbars`
  * 启用后，会将 Sidebery 与原生垂直标签页使用的展开/折叠动画速度应用到导航栏和书签工具栏，统一所有动画速度。
  * 动画速度统一后，也可以使用 `uc.flex.sidebery-fast-hover-expand` 或 `uc.flex.sidebery-slow-hover-expand` 来调整导航栏和书签工具栏的动画速度。
  * 启用 Mica 或自定义壁纸时，FlexFox 会在内部自动统一动画速度，此时无需手动设置这个选项。

## 🆕 更新内容

**🦊 v4.0.1**
* 使用 Mica 背景或自定义壁纸，并启用 `browser.tabs.allow_transparent_browser` 选项时：
  * 为“设置”、“附加组件管理器”和“新标签页”等内建页面添加了半透明背景。  

    <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/translucent-about-preferences.webp" alt="“设置”页面（`about:preferences`）应用了半透明背景效果" width="96%" />

  * 启用了地址栏下拉菜单和查找栏的背景模糊效果。
  * 在自定义壁纸模式下，下拉菜单在整个区域（包括导航栏上方）都能正确显示模糊效果。
* 自定义壁纸模式下，菜单的透明度现在会根据 `uc.flex.browser-wallpaper-transparency-level` 的设置进行变化，与壁纸保持一致的透明效果。
* 为应用菜单和右键菜单中原本缺少图标的3个项目补充了图标。
* 修复 Firefox Nightly v143 中由于选择器变更导致地址栏样式失效的问题（[Bug 1980372](https://bugzilla.mozilla.org/show_bug.cgi?id=1980372)）。

<a id="updates-top-start"></a>
<details>

<summary>💬 <b>历史更新</b></summary>

更多旧版本的更新记录请参见  
👉 [Wiki 上的历史归档页面](https://github.com/yuuqilin/FlexFox/wiki/Earlier-Update-History-(Simplified-Chinese))

<a href="#updates-top-start">⏫ 返回更新记录顶部</a>
</details>

<details>  
<summary>🖌️ <b>重大更新：Sidebery 背景颜色可自动跟随主题</b> <i>《点击展开》</i> 👇</summary>

* FlexFox 现在可以根据当前的 Firefox 主题自动调整 Sidebery 的背景颜色。
* 要启用此功能，请在 Sidebery 的 **设置 → 外观 → 配色模式** 中选择 `"firefox"`。
  <details><summary>点击展开 Sidebery 外观设置截图</summary>
  <img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/sidebery-appearance-settings.  webp"alt="Sidebery 外观设置" width="50%" />
  </details>

</details>

<details>  
<summary>✨ <b>重大更新：自动隐藏导航栏图标</b> <i>《点击展开》</i> 👇</summary>

* 新增选项 `uc.flex.auto-hide-navbar-icons`，可将导航栏中的按钮默认隐藏，鼠标悬停时再显示。
* 以下项目将始终保持可见：
  * 窗口控制按钮（最小化、最大化、关闭）
  * 地址栏
  * 侧栏切换按钮（FlexFox 图标）
* 如果将侧栏按钮移动到导航栏中间（不在最左或最右位置），或启用了 `uc.flex.revert-to-original-sidebar-icon`，该按钮也会跟随自动隐藏。
* 你可以将以下变量从 `uc-variables.css` 复制到 `uc-user-settings.css` 中修改，以自定义动画的速度和效果：

  ```css
  --uc-autohide-navbar-icons-duration
  --uc-hover-navbar-icons-duration
  --uc-autohide-navbar-icons-type
  --uc-collapse-navbar-icons-duration
  ```

自动隐藏图标与主题背景切换效果预览： <video src="https://github.com/user-attachments/assets/070f798d-2925-4681-ac50-7cd4b36936e7" controls></video>

</details>

<details>  
<summary>🧩 <b>重大更新：可调节菜单项间距</b> <i>《点击展开》</i> 👇</summary>

* 新增 `uc.flex.menu-item-spacing` 选项，用于控制菜单项之间的间距。  
  可用字符串值如下：  
  `"1"` 或 `"small"` = 较小间距（默认，与旧版相同）  
  `"2"` 或 `"medium"` = 中等间距  
  `"3"` 或 `"large"` = Firefox 默认的最宽间距  

* 如果需要分别调整各类菜单的间距，可以将以下变量从 `uc-variables.css` 复制到 `uc-user-settings.css` 中进行修改：

  ```css
  --uc-app-menu-item-padding-block
  --uc-menu-item-padding-block
  --uc-content-area-context-menu-item-padding-block
  --uc-appMenu-zoom-controls-x-offset
  ```

</details>

<details>  
<summary>🪄 <b>重大更新：圆角与悬浮式网页内容样式</b> <i>《点击展开》</i> 👇</summary>

新增了视觉选项 `uc.flex.enable-rounded-web-content`，可以为网页内容区域添加边距、圆角和阴影效果，让页面呈现出卡片式、浮起的柔和视觉风格，灵感来源于 Zen 和 Microsoft Edge 的界面设计。

该选项支持从 `0`（关闭）到 `2` 的数值，数值越高，页面周围的边距越宽。

你可以通过将以下变量从 `uc-variables.css` 复制到 `uc-user-settings.css`，进一步调整显示效果：

  ```css
  --uc-web-content-margin
  --uc-web-content-radius-box
  ```

以下是启用该功能后（`uc.flex.enable-rounded-web-content = 1`）的效果预览图：

<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/flexfox-rounded-web-content.webp" alt="Rounded web content preview in FlexFox" width="96%" />

</details>

<details>  
<summary>🪄 <b>重大更新：支持还原原生平角风格</b> <i>《点击展开》</i> 👇</summary>

现在可以通过启用 `uc.flex.revert-to-original-flat-corner-style` 选项，将界面样式切换回 Firefox 默认的平直角风格，替代 FlexFox 的圆角设计。如果你偏好更加简洁、锐利的视觉效果，这个选项非常适合。

如需进一步自定义，你可以将下列变量从 `uc-variables.css` 复制到 `uc-user-settings.css` 中，精细调整地址栏、搜索栏和查找栏的圆角大小：

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
<summary>🎨 <b>重大更新：支持 Firefox Color</b> <i>《点击展开》</i> 👇</summary>

FlexFox 现已支持 [Firefox Color](https://color.firefox.com/)，你可以通过实时预览，自由自定义浏览器的配色外观。

要让 Firefox Color 在 FlexFox 中生效，请前往 Firefox Color 网站，在 **Custom backgrounds** 标签页中选择任意一张背景图片，或启用 `uc.flex.allow-addons-to-change-toolbar-color` 设置。若这两者都未设置，颜色修改将不会生效。

<p>以下是通过 Firefox Color 应用 <a href="https://github.com/rose-pine/firefox">Rosé Pine Moon</a> 主题后的 FlexFox 效果：</p>
<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/firefox-color-rose-pine-moon.webp" alt="FlexFox with Rosé Pine Moon theme" width="96%" />

</details>

<details>
<summary>🌈 <b>重大更新：自定义书签文件夹图标</b> <i>《点击展开》</i> 👇</summary>

新增数值型选项 `uc.flex.enable-colored-bookmarks-folder-icons`：

  - `0`：关闭
  - `1`：启用第一套彩色文件夹图标
  - `2`：自动隐藏文件夹文字，并启用第二套图标风格

**显示示例：**
下图为 Firefox 默认的书签文件夹图标：  
<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/colored-bookmarks-folder-1.webp" alt="colored-bookmarks-folder-1" width="65%" />

启用 `uc.flex.remove-bookmarks-folder-icons` 会隐藏文件夹图标，仅显示文字标签：  
<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/colored-bookmarks-folder-2.webp" alt="colored-bookmarks-folder-2" width="65%" />

将 `uc.flex.enable-colored-bookmarks-folder-icons` 设为 `1` 时，会启用第一组彩色图标：  
<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/colored-bookmarks-folder-3.webp" alt="colored-bookmarks-folder-3" width="65%" />

若同时启用 `uc.flex.remove-bookmarks-labels`，则会隐藏文件夹名称，仅显示图标：  
<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/colored-bookmarks-folder-4.webp" alt="colored-bookmarks-folder-4" width="65%" />

将该选项设为 `2` 时，会自动隐藏文字标签，并启用第二组图标：  
<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/colored-bookmarks-folder-5.webp" alt="colored-bookmarks-folder-5" width="65%" />

用户可以通过修改 CSS 变量 `--uc-bookmark-folder-*` 来调整图标的颜色、大小和位置，也可以替换 `../icons/bookmark/` 目录下的 `folder*.svg` 文件来自定义喜欢的图标。

</details>

<details>  
<summary>🚀 <b>重大更新：原生垂直标签页与 Sidebery 行为整合</b> <i>《点击展开》</i> 👇</summary>

* FlexFox 现已将原生垂直标签页与 Sidebery 的行为进行整合。当 Sidebery 处于活动状态时，原生垂直标签页会自动隐藏，侧边工具栏会折叠为一条显示在 Sidebery 上方的彩色条带。
* 当 Sidebery 处于非活动状态，例如打开侧边栏工具或扩展时，原生垂直标签页会自动恢复，确保在无法使用 Sidebery 的情况下，依然有一个相似的原生界面可供使用。
* 原生垂直标签页现在采用与 Sidebery 相同的布局和交互逻辑，支持相同的变量设置，包括展开宽度、动画速度和触发区域。同时也支持保持展开、完全隐藏、以及在全屏模式（<kbd>F11</kbd>）下自动隐藏等功能。在两者之间切换时可以实现平滑过渡，带来一致且连贯的使用体验。

</details>

<details>
<summary>🚀 <b>重大更新：支持通过快捷键切换 UI 布局</b> <i>《点击展开》</i> 👇</summary>

FlexFox 现在支持扩展 [UserChrome Toggle Extended](https://addons.mozilla.org/firefox/addon/userchrome-toggle-extended/)。
安装并按下图设置：  
<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/userchrome-toggle-extended.webp" alt="userchrome-toggle-extended.webp" width="65%" />  
设置后，别忘了点击左上角的 `Apply changes` 按钮，否则设置不会生效。

完成设置后，可通过快捷键切换四种 UI 布局模式：

| 快捷键 | 标签 | 功能说明 |
| ------ | ---- | ------- |
| <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>1</kbd> | Lock Sidebery | 切换 Sidebery 和原生垂直标签页的自动折叠与保持展开状态，保持展开的布局效果与选项 `uc.flex.disable-sidebery-autohide` 相同。 |
| <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>2</kbd> | Hide Topbar | 切换是否完全隐藏顶部工具栏（标签页、导航栏、书签栏），隐藏时鼠标移到屏幕上方边缘可自动显示。对应选项 `uc.flex.fully-hide-toolbox`。 |
| <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>3</kbd> | Hide Sidebery | 切换是否完全隐藏 Sidebery 和原生垂直标签页。隐藏时鼠标移到屏幕边缘可自动显示。对应选项 `uc.flex.fully-hide-sidebery`。                                                      |
| <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>4</kbd> | Hide All      | 切换是否隐藏所有工具栏和侧边栏（Sidebery 或原生垂直标签页），只显示网页内容。隐藏时将鼠标移到屏幕边缘可自动显示。相当于 `uc.flex.fully-hide-toolbox` + `uc.flex.fully-hide-sidebery` 的组合效果。 |

> [!IMPORTANT]
> 在 `about:config` 中设置的选项优先级更高。如果相关选项已启用，将会固定布局状态，快捷键将失效。若需使用快捷键切换，请将对应选项设为 `false`。

除了使用快捷键，也可以通过 UserChrome Toggle Extended 扩展提供的按钮切换界面布局。  
<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/userchrome-toggle-button.webp" alt="userchrome-toggle-button" width="28.3%" />  
如果需要修改默认快捷键，点击右上角的齿轮图标，在菜单中选择 **管理扩展快捷键**。  
<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/shortcut-settings.webp" alt="shortcut-settings" width="50%" />

</details>

> [!IMPORTANT]
> 日常使用 FlexFox 的垂直标签页模式时，请确保「定制侧栏」中的「悬停时展开侧栏」选项已**取消勾选**。大多数功能依赖此设置才能正常工作。

## ✨ 功能亮点

### 🌟 极简设计

> *最大化你的网页视野。*

- 工具栏和侧边栏可独立折叠或隐藏。  
  > *可自由选择隐藏侧边栏或导航栏，甚至两者都隐藏，根据自己的使用习惯灵活组合界面。*

- 隐藏所有界面时，仅显示网页内容。  
  > *无需进入全屏模式，即可获得近乎全屏的阅读体验；也可创建如便签般的极简窗口，贴在桌面上阅读或对比多个网页。*

### 🌟 稳定不跳动

> *界面切换平稳，页面位置不乱动。*

- 展开折叠的界面元素时不会推动网页内容。  
  > *工具栏和侧边栏以悬浮方式显示，不会挤压页面，从而避免页面发生跳动。*

- 展开后的标签页保持原位。  
  > *垂直标签页展开时，会在原位横向伸展，垂直位置保持不变，鼠标无需重新定位目标标签页。*

### 🌟 自适应布局

> *自动适配各种界面配置。*

- Sidebery启用时会自动隐藏原生标签页栏。  
  > *避免界面重复，保持界面整洁有序。*

- 兼容多种 Firefox 界面设置。  
  > *无论是否启用标题栏、菜单栏、书签栏，或将侧边栏放置于左侧或右侧，FlexFox 均可保持正常排版，适配不同的界面组合。*

### 🌟 高度灵活

> *外观与功能皆可自由掌控。*

- 可通过 `about:config` 快速启用或关闭各项功能。  
  > *不需要的功能可以关闭，仅保留所需部分，其余则恢复为 Firefox 原始样式。*

- 支持通过用户样式进行深度自定义。  
  > *FlexFox 支持加载用户自定义样式，且优先于内建设置，即使升级版本也不会影响个人配置。*

---

## 💿 部署指南

### 👷 方法一：手动安装

> [!IMPORTANT]
> 1. 安装 [Sidebery](https://addons.mozilla.org/firefox/addon/sidebery/)（可选，但推荐）。
> 2. 下载对应版本的 FlexFox：
>    * [FlexFox](https://github.com/yuuqilin/FlexFox/archive/refs/heads/main.zip)：标准版 Firefox 使用
>    * [FlexFox Beta](https://github.com/yuuqilin/FlexFox/archive/refs/heads/Beta.zip)：Firefox Beta / Nightly 使用
>    * [FlexFox ESR](https://github.com/yuuqilin/FlexFox/archive/refs/heads/ESR.zip)：Firefox ESR 使用
> 3. 打开 `about:support`，找到 **配置文件夹**，点击 **打开文件夹**。
> 4. 将 `chrome` 文件夹和 `scripts` 文件夹中的 `user.js` 文件复制到配置文件夹中。
> 5. 使用文本编辑器打开 `user.js`，删除注释 `//` 以启用额外功能。
>    * 确保以下选项设置为对应的值：
>      * `toolkit.legacyUserProfileCustomizations.stylesheets` = `true`
>      * `svg.context-properties.content.enabled` = `true`
>      * `sidebar.visibility` = `always-show`
> 6. 重启 Firefox，然后删除 `user.js` 文件，以便后续对 `about:config` 的更改能被正常保存。
> 7. 配置 Sidebery：
>    * 点击侧边栏齿轮图标进入设置
>    * 清除 `Styles editor` 中已有的样式，以避免冲突
>    * 前往 `帮助` > `导入插件数据`，导入下载包中 `Sidebery` 文件夹内的 `sidebery-settings.json` 和 `sidebery-styles.json`
>    * *注意*：如果导入的样式没有正常生效，请尝试重新导入一次
> 8. 打开 `about:config`，搜索 `uc.flex.`，按需启用或关闭功能。

---

### 🚀 方法二：自动安装与更新

> [!IMPORTANT]
> 如果是首次安装 FlexFox，请在运行脚本后继续执行 [方法一](https://github.com/yuuqilin/FlexFox?tab=readme-ov-file#-method-1-manual-installation) 中第 5 步开始的手动步骤。  
> 之后更新时，只需重新运行脚本即可，无需再次手动操作。

<h4>💻 PowerShell 脚本</h4>
<details>
<summary><i>《点击展开》</i> 👇</summary>

- **在线部署** – 在 PowerShell 中输入以下命令：
  ```powershell
   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass; iex ((New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/yuuqilin/FlexFox/refs/heads/main/deploy-userchrome.ps1') -replace '(?s)<#.*?#>', '')
  ```

  **静默部署（在线）**：
  ```powershell
   $env:FLEXFOX_INSTALL_MODE = 'silent'; Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass; iex ((New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/yuuqilin/FlexFox/refs/heads/main/deploy-userchrome.ps1') -replace '(?s)<#.*?#>', '')
  ```

- **本地部署** – 下载 [`deploy-userchrome.ps1`](https://github.com/yuuqilin/FlexFox/raw/refs/heads/main/deploy-userchrome.ps1) 脚本并运行：
  ```powershell
   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass; .\deploy-userchrome.ps1
  ```

  **静默部署（本地）**：
  ```powershell
   $env:FLEXFOX_INSTALL_MODE = 'silent'; Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass; .\deploy-userchrome.ps1
  ```

- **计划任务或 Win+R 执行静默部署**：
  ```powershell
   powershell -ExecutionPolicy Bypass -Command "$env:FLEXFOX_INSTALL_MODE = 'silent'; .\deploy-userchrome.ps1"
  ```

</details>

<h4>🔃 Git Pull</h4>
<details>
<summary><i>《点击展开》</i> 👇</summary>

- 可根据使用环境，选择 `scripts` 文件夹中的任一 `git-pull-chrome-only` 脚本。这些脚本将：

  - 自动将 Firefox 配置文件夹设为 Git 工作目录  
  - 添加 FlexFox 为远程仓库  
  - 仅下载并更新 `chrome` 文件夹（不包含其他内容）

- 或手动为 Firefox 配置文件夹添加远程仓库：

  **首次设置（初始化 chrome 文件夹）：**
  ```bash
  git init
  git remote add origin https://github.com/yuuqilin/FlexFox.git
  git sparse-checkout init --no-cone
  git sparse-checkout set /chrome
  git fetch origin
  git checkout -b main origin/main
  ```

  **手动更新：**
  ```bash
  git fetch origin
  git checkout main
  git merge origin/main --allow-unrelated-histories
  ```

</details>

## ⚙️ 配置选项

### 📜 用户自定义样式

> [!TIP]  
> 你可以自定义 FlexFox 的样式，而无需担心在更新时被覆盖。
>
> * 若需修改 **界面（chrome）** 样式，请在 `components` 文件夹中创建 `uc-user-settings.css`
> * 若需修改 **网页内容（content）** 样式，请在 `content` 文件夹中创建 `uc-custom-content.css`
>
> 将你想修改的样式或变量（如从 `uc-variables.css` 中）复制到上述文件中进行调整。这些文件中的规则将覆盖 FlexFox 的默认样式。
> 它们不会在 FlexFox 更新时被修改，因此你的个性化设置将始终保留。
>
> 💡 复制样式时请包含完整的选择器，以确保上下文正确。

---

### 🧩 可配置的首选项（`about:config`）

#### ✅ FlexFox 样式所需配置

| 配置选项 | 值 | 说明 |
|----------|:------:|----------|
| `toolkit.legacyUserProfileCustomizations.stylesheets` | `true` | 启用 `userChrome.css` 文件，以支持自定义样式。 |
| `svg.context-properties.content.enabled` | `true` | 允许图标颜色根据亮／暗主题自动调整。 |
| `sidebar.visibility` | `always-show` | 启用 FlexFox 的垂直标签页自动折叠功能和布局（在垂直标签页模式下生效）。也可以在侧栏设置中取消勾选 **“悬停时展开侧栏”** 来应用此设置。 |

#### 🪄 添加或启用选项

| 配置选项 | 值 | 说明 |
|----------|:------:|----------|
| `uc.flex.add-ui-text-stroke` | `true` | 为界面文字添加粗描边，提高低分辨率屏幕下的可读性。 |
| `uc.flex.fully-hide-sidebery` | `true` | 完全隐藏 Sidebery 和原生垂直标签页，将鼠标移至屏幕边缘时自动显示。 |
| `uc.flex.fully-hide-toolbox` | `true` | 完全隐藏顶部所有工具栏（标签栏、导航栏、书签工具栏），将鼠标移至屏幕顶部时自动显示。 |
| `uc.flex.auto-hide-navbar-icons` | `true` | 默认隐藏导航栏中的图标，鼠标悬停在工具栏上时会显示。窗口控制按钮、地址栏和侧栏按钮（FlexFox 图标）始终显示，但当侧栏按钮未放在导航栏边缘，或启用了 `uc.flex.revert-to-original-sidebar-icon` 时，也会一并隐藏。 |
| `uc.flex.allow-addons-to-change-toolbar-color` | `true` | 允许 Firefox Color 等扩展修改工具栏的颜色（在未设置背景图时需要启用）。 |
| `uc.flex.enable-gradient-highlight` | `0`-`X` | 为 FlexFox 图标、侧栏彩带、书签星形图标等主要界面元素中使用的高亮颜色启用渐变样式。此选项接受数值设置：`0` 表示关闭渐变，`1` 到 `X` 表示切换不同的渐变样式。 |
| `uc.flex.enable-colored-bookmarks-folder-icons` | `0`-`2` | 启用彩色书签文件夹图标。此选项为数值类型：`0` 表示关闭，`1` 使用第一组图标，`2` 使用第二组图标（并自动隐藏标签）。 |
| `uc.flex.remove-bookmarks-folder-icons` | `true` | 移除书签文件夹的图标。 |
| `uc.flex.remove-bookmarks-labels` | `true` | 移除书签文件夹的文字标签。 |
| `uc.flex.show-flexfox-version-info-in-about-config` | `true` | 在 `about:config` 頁面顯示 FlexFox 已安裝的提示訊息，並附帶當前版本號。 |
| `uc.flex.show-pin-tabs-separator-in-expanded-state` | `true` | 在原生垂直标签页处于“展开模式”时，在已固定的标签页和普通标签页之间显示分隔线（默认情况下该分隔线为隐藏）。 |
| `uc.flex.move-pip-volume-to-top` | `true` | 将画中画（PiP）窗口中的音量控制按钮移至顶部。 |
| `uc.flex.dim-urlbar-popup-backdrop` | `0`-`2` | 当地址栏展开下拉列表时使背景变暗。此选项接受数值 `0`（关闭）到 `2`，数值越大，背景越暗。 |
| `uc.flex.enable-rounded-web-content` | `0`-`2` | 为网页内容区域添加边距、阴影和圆角效果。此选项为数值型，接受 `0`（关闭）到 `2`，数值越大，边距越宽。 |

#### 🚫 停用或还原选项

| 配置选项 | 值 | 说明 |
|----------|:------:|----------|
| `uc.flex.disable-flexfox` | `true` | 无需重启 Firefox 即可停用所有 FlexFox 样式和功能。 |
| `uc.flex.skip-loading-uc-*.css`  | `true` | 跳过加载 `./components/` 和 `./content/` 中的特定 `uc-*.css` 文件。例如将 `uc.flex.skip-loading-uc-newtab.css` 设置为 true 时，将不会加载 `./content/uc-newtab.css` 文件。 |
| `uc.flex.disable-bookmarks-autohide` | `true` | 停用书签工具栏的自动隐藏功能。 |
| `uc.flex.disable-tabs-toolbar-autohide` | `true` | 当 Sidebery 处于非活动状态时，防止原生水平标签栏自动隐藏。 |
| `uc.flex.disable-findbar-autohide` | `true` | 防止查找栏（Findbar）在失去焦点后自动隐藏。 |
| `uc.flex.disable-sidebery-autohide` | `true` | 禁用 Sidebery 和原生垂直标签页的自动折叠功能。 |
| `uc.flex.disable-nav-bar-first-item-right-padding` | `true` | 默认情况下，FlexFox 会在导航栏第一个图标后添加右侧间距，以优化垂直标签页与周围项目之间的视觉间隔和对齐。此选项可停用该间距。 |
| `uc.flex.disable-menu-icons` | `true` | 停用 FlexFox 添加的自定义选单图标。 |
| `uc.flex.revert-to-original-window-controls` | `true` | 将 FlexFox 使用的 macOS 风格窗口按钮恢复为 Firefox 默认的最小化、最大化、关闭按钮。 |
| `uc.flex.revert-to-original-flat-corner-style` | `true` | 将 URL 栏、搜索栏和查找栏的圆角样式恢复为 Firefox 默认的较平角设计，替代 FlexFox 使用的大圆角样式。 |
| `uc.flex.revert-to-original-bookmark-star-icon` | `true` | 将 FlexFox 使用的书签星形图标恢复为 Firefox 默认设计。 |
| `uc.flex.revert-to-original-sidebar-icon` | `true` | 将 FlexFox 使用的侧栏按钮图标恢复为 Firefox 默认设计。 |
| `uc.flex.remove-sidebar-stripe` | `true` | Sidebery 激活时移除侧边栏彩带。若需切换侧边栏工具，垂直标签页模式下可按 <kbd>F1</kbd> 显示侧边栏工具按钮，水平标签页模式下可按 <kbd>Ctrl</kbd> + <kbd>B</kbd> 恢复显示侧边栏表头。 |

#### 🪛 修改或调整选项

| 配置选项 | 值 | 说明 |
|----------|:------:|----------|
| `uc.flex.increase-sidebery-expanded-width` | `true` | 增加 Sidebery 展开时的宽度；启用 `uc.flex.disable-sidebery-autohide` 或激活 `Lock Sidebery` 时，也会同步增加原生垂直标签页的展开宽度。 |
| `uc.flex.increase-navbar-height` | `true` | 恢复旧版 FlexFox 中使用的较厚导航栏高度。此更改会覆盖当前默认值（与 Firefox 原始的紧凑高度一致）。 |
| `uc.flex.switch-to-alternate-condensed-panel` | `true` | 默认情况下，FlexFox 会将原生扩展面板替换为仅显示图标的面板，此时可通过右键点击图标访问扩展设置。启用此选项后，将切换为包含扩展名称和设置按钮的简洁面板，提供更具说明性的视图。 |
| `sidebar.visibility` | `expand-on-hover` | 禁用 FlexFox 的垂直标签页自动折叠功能和布局。也可以在侧栏设置中勾选 **“悬停时展开侧栏”** 来启用此模式。启用后，可以自由调整侧栏宽度，并使用 <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>Z</kbd> 或侧栏切换按钮在展开和折叠状态之间切换。 |
| `sidebar.animation.expand-on-hover.duration-ms` | `120` | Firefox 原生设置，用于控制在 `sidebar.visibility` 设置为 `expand-on-hover` 时，原生垂直标签页展开和折叠的动画速度。 |
| `uc.flex.sidebery-fast-hover-expand` | `true` | 加快 Sidebery 与原生垂直标签页的自动展开/折叠速度。 |
| `uc.flex.sidebery-slow-hover-expand` | `true` | 减慢 Sidebery 与原生垂直标签页的自动展开/折叠速度。 |
| `uc.flex.sidebery-apply-expand-speed-to-toolbars` | `true` | 将导航栏和书签栏的动画速度统一为 Sidebery／垂直标签页的速度。启用 Mica 或壁纸时自动生效。 |
| `uc.flex.max-visible-vertical-pinned-tabs` | `4`-`6` | 设置原生垂直标签页中每列可显示的固定标签页数量上限（可选值为数值，范围 4–6）。超过该值时将出现滚动条，可根据使用习惯进行调整。 |
| `uc.flex.findbar-position` | `'top-center-left'`\|<br>`'top-right'`\|<br>`'bottom-right'` | 设置查找栏的位置。可选值为字符串：`'top-center-left'` 或 `'1'`（顶部左侧），`'top-right'` 或 `'2'`（右上角），`'bottom-right'` 或 `'3'`（右下角）。 |
| `uc.flex.menu-item-spacing` | `'small'`\|<br>`'medium'`\|<br>`'large'` | 设置 Firefox 的应用菜单、书签菜单和右键菜单中项目之间的垂直间距。可选值为字符串 `'1'` 或 `'small'`（较小间距）、`'2'` 或 `'medium'`（默认间距）、`'3'` 或 `'large'`（较大间距）。 |

#### 🧊 视觉背景和 Mica 效果

| 配置选项 | 值 | 说明 |
|----------|:------:|----------|
| `widget.windows.mica` | `true` | 启用 Firefox 原生的 Mica 背景效果。需将主题设置为 `系统主题 — 自动` 才能生效。此功能仅在 Windows 11 系统中可用。如果当前系统不支持 Mica，可使用 `uc.flex.browser-wallpaper-enabled` 来模拟类似效果。 |
| `widget.windows.mica.popups` | `1`\|`2`<br>(`2`) | 为弹出菜单启用 Mica 背景效果。可设置为 `0`（关闭）、`1`（开启）或 `2`（自动）。 |
| `widget.windows.mica.toplevel-backdrop` | `2` | 指定要使用的 Mica 背景类型：`0`（自动或不使用）、`1`: Mica、`2`: Acrylic、`3`: Mica Alt。FlexFox 是基于该选项设为 `2`: Acrylic 的前提进行设计的。 |
| `browser.tabs.allow_transparent_browser` | `true` | 允许 Sidebery 和网页内容背景透明，可显示 Mica 或壁纸效果。**更改后需重启 Firefox 才会生效。** 若要实现网页内容透明，需安装 [Transparent Zen](https://addons.mozilla.org/firefox/addon/transparent-zen/) 扩展。若部分网页因透明而难以阅读，建议搭配 [Dark Reader](https://addons.mozilla.org/firefox/addon/darkreader/) 使用。 |
| `uc.flex.browser-mica-transparency-level` | `0`-`4`<br>(`2`) | 调整浏览器 Mica 背景遮罩的透明度。此选项为数值类型，接受 0 到 4 的数值，数值越大，遮罩效果越弱，背景越清晰。Firefox 默认值为 0，而 FlexFox 的默认值为 2。 |
| `uc.flex.browser-wallpaper-enabled` | `true` | 启用 Firefox 浏览器背景的自定义壁纸。此功能会套用 Acrylic 风格的模糊效果，用于模拟原生 Mica 效果。适用于系统不支持 Mica，或希望始终显示固定背景的情况。但请注意，模拟效果无法与原生 Mica 完全一致。 |
| `uc.flex.browser-wallpaper-index` | `1`-`9`<br>(`1`) | 设置使用哪一张编号图片作为浏览器背景。该选项为数值类型，可设置为 1 到 9。每个数值对应使用 `../icons/wallpaper/` 文件夹中的 `main-image-1.jpg` 到 `main-image-9.jpg` 文件。|
| `uc.flex.browser-wallpaper-acrylic-disabled` | `true` | 禁用自定义壁纸背景的 Acrylic 模糊效果。 |
| `uc.flex.browser-wallpaper-transparency-level` | `0`-`4`<br>(`2`) | 调整浏览器壁纸遮罩的透明度。此选项为数值类型，接受 0 到 4 的数值，数值越大，遮罩效果越弱，壁纸越清晰。该设置旨在与 Mica 背景的透明度效果保持视觉一致。FlexFox 的默认值为 2。 |
| `uc.flex.browser-wallpaper-contrast-level` | `0`-`4`<br>(`2`) | 在深色模式下启用 Acrylic 模糊效果时，用于调整浏览器壁纸的对比度。可设置的数值范围为 0 到 4，数值越高对比度越强。FlexFox 默认值为 2。 |

## 🐞 已知问题

- 对于 Floorp 用户：请在 Floorp 界面选项中切换到 `Firefox Proton UI`，以减少兼容性问题。
- 仅在 Windows 上测试：可能需要为其他操作系统进行调整。

## 🎖️ 鸣谢

FlexFox 基于以下优秀项目的成果构建而成：

- **[VerticalFox](https://github.com/christorange/VerticalFox)** — 为垂直标签布局和核心界面结构提供了设计基础。  
- **[firefox-csshacks](https://github.com/MrOtherGuy/firefox-csshacks)** — FlexFox 的许多界面优化和细节调整参考并继承自这个极具价值的 CSS 资源合集。

此外，以下项目的设计理念和界面风格也为 FlexFox 带来了不少启发：

- [EdgyArc-fr](https://github.com/artsyfriedchicken/EdgyArc-fr)  
- [Edge-Frfox](https://github.com/bmFtZQ/edge-frfox)  
- [ArcWTF](https://github.com/KiKaraage/ArcWTF)  
- [shimmer](https://github.com/nuclearcodecat/shimmer)
- [firefox-gx](https://github.com/Godiesc/firefox-gx)

感谢所有开源贡献者的努力与分享。

<details>
  <summary><h2 style="display: inline;">📄 许可证</h2></summary>
  <hr style="border: none; border-top: 0.1px solid #d0d7de; margin: 16px 0;">
  <p>本项目主要基于 MIT 许可证进行授权。<br>
  不过，部分源代码（见下文）整合了原本采用 Mozilla Public License 2.0（MPL-2.0）授权的代码。</p>

  <p>具体来说，<code>uc-sidebar.css</code> 中的部分整合代码来自以下项目：</p>

  <ul>
    <li><strong>项目</strong>：firefox-gx</li>
    <li><strong>作者</strong>：@Godiesc</li>
    <li><strong>代码库</strong>：<a href="https://github.com/Godiesc/firefox-gx">https://github.com/Godiesc/firefox-gx</a></li>
    <li><strong>许可证</strong>：MPL-2.0</li>
  </ul>

  <p>这些代码区块保留了原始的 MPL-2.0 许可声明，并符合其授权条款。<br>
  有关 MPL-2.0 的完整内容，请参见 <code>LICENSES/MPL-2.0.txt</code>。</p>
</details>
