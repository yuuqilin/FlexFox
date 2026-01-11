# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox（简体中文版）

<div>
 <a href='https://www.mozilla.org'><img src="https://img.shields.io/badge/Last%20tested%20Firefox-v148-orange?logo=firefox"></a>
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

https://github.com/user-attachments/assets/23d73b36-d2d4-4660-af5b-cde686d0934a  

> [!IMPORTANT]
> FlexFox 的大部分功能只有在「定制侧栏」中的「悬停时展开侧栏」选项 **未勾选** 时才能正常运作。「定制侧栏」可以在导航栏侧栏切换按钮的右键菜单中找到。该选项在 Firefox 中默认未勾选。如果你之前曾手动启用过，请取消勾选以保证 FlexFox 正常工作。

## 🆕 更新内容

## 🦊 v6.0.4

### ✨ 新增（仅限原生垂直标签页和 Sidebery）

![Image](https://github.com/user-attachments/assets/596ef515-6d39-4a00-a7eb-c7e60c13f68d)

* 新增选项 `uc.flex.style-tab-items-add-hover-trail`（布尔值）：

  * 控制标签页悬停时的拖尾效果。
  * 过去该效果仅在 `uc.flex.style-tab-items = 2` 时启用。
  * 现在可以在任意标签样式下独立开启或关闭该效果。
  * 默认启用，设置为 `false` 可关闭。

## 🦊 v6.x.x 系列 – 重大功能更新

> [!IMPORTANT]
> **v6.x.x 系列引入了多项不兼容的变更。** 部分选项已被弃用或调整，旧的 Sidebery 样式不再使用。更新前请仔细阅读本更新日志。
>
> 更新后，为避免冲突，请务必 **删除 Sidebery 样式编辑器中的旧样式**。
> 打开 **Sidebery 导航栏 → 设置（齿轮图标）→ 样式编辑器**，然后删除 **侧边栏** 和 **分组页面** 两个页面中的所有旧样式。

---

### 🎨 新增：10 种可选颜色主题

![Image](https://github.com/user-attachments/assets/f5b4550d-8bd6-4f41-8206-7114399d69fe)

* 新增选项 `uc.flex.style-sidebar-stripe-color`：

  * 控制侧边栏彩带、侧边栏按钮（Firefox 图标）以及地址栏书签星标的颜色。
  * 在暗色模式下，还会应用于标签页的边框、背景、高亮和 Sidebery 导航图标。
  * 数值：`0` = Classic（与旧版相同，默认值）；`1` = Red；`2` = Orange；`3` = Yellow；`4` = Green；`5` = Cyan；`6` = Blue；`7` = Violet；`8` = Purple；`9` = Pink；`10` = Gray。

* 新增选项 `uc.flex.style-sidebar-stripe-color-apply-to-all-icons`（布尔值）：

  * 将侧边栏彩带颜色应用到所有图标。
  * 在暗色模式下，也会应用于地址栏和网页区域的边框。
  * 当启用 `uc.flex.revert-to-original-bookmark-star-icon` 时，此选项也会覆盖 Firefox 默认的书签星标颜色。

* 新增选项 `uc.flex.style-sidebar-stripe-color-use-gradient`（布尔值）：

  * 根据 `uc.flex.style-sidebar-stripe-color` 选择的颜色应用对应的渐变样式。
  * 渐变颜色会作用于侧边栏彩带、侧边栏按钮图标（Firefox 图标）、地址栏书签星标以及书签文件夹图标。

---

### 🗂 新增：“列出所有标签页”按钮图标

<img width="106" height="108" alt="Image" src="https://github.com/user-attachments/assets/b9f8d20d-aa84-4310-97df-b34506971ac6" />
<img width="106" height="108" alt="Image" src="https://github.com/user-attachments/assets/033c7c53-fb3f-4546-8f04-69ad0f9d7046" />
<img width="106" height="108" alt="Image" src="https://github.com/user-attachments/assets/d0932b40-5608-4797-934e-0e1c86ab6a71" />

* 新增选项 `uc.flex.style-all-tabs-button`：

  * 设置 “列出所有标签页” 按钮的图标。
  * 数值：

    * `0` = Firefox 默认图标
    * `1` = 筛选图标（与旧版相同，默认值）
    * `2` = V 形箭头图标

---

### 📌 新增：Sidebery 收起状态的导航图标

<img width="56" height="106" alt="Image" src="https://github.com/user-attachments/assets/3ed3abf5-b7bb-4dd5-a0e4-99e4060ea7ee" />
<img width="56" height="106" alt="Image" src="https://github.com/user-attachments/assets/166ee87e-4f87-4bff-8989-49f2332e18f8" />
<img width="56" height="106" alt="Image" src="https://github.com/user-attachments/assets/aac5d1da-0b86-4d28-9db0-1e513b55ccea" />

* 新增选项 `uc.flex.style-sidebery-nav-icon`：

  * 设置 Sidebery 收起状态下显示的导航图标。
  * 数值：

    * `0` = 使用当前活动面板图标（新默认值）
    * `1` = Sidebery Logo
    * `2` = V 形箭头图标（旧默认值）

* 新增选项 `uc.flex.style-sidebery-nav-icon-use-active-panel-color`（布尔值）：

  * 让导航图标使用当前活动面板所设置的颜色。

---

### 📑 新增：标签页的边框与背景样式

<img width="276" height="298" alt="Image" src="https://github.com/user-attachments/assets/7f4b1374-a183-46f5-86e3-810a88d5a62a" />
<img width="276" height="298" alt="Image" src="https://github.com/user-attachments/assets/9717eac6-f2d7-4752-95ec-d64b222dc08a" />
<img width="276" height="298" alt="Image" src="https://github.com/user-attachments/assets/99f9f4e6-60d5-4be0-9589-51d108ec199b" />

*(仅限原生垂直标签页和 Sidebery)*

* 新增选项 `uc.flex.style-tab-items`：

  * 设置标签页的外观。
  * 数值：

    * `1` = 固定标签页仅显示边框且无背景。亮色模式下边框颜色与地址栏边框一致，暗色模式下与侧边栏彩带一致。（与旧版相同，默认值）

    * `2` = 固定标签页仅显示背景且无边框。亮色模式下背景颜色与地址栏背景一致，暗色模式下与侧边栏彩带一致。

      所有标签页的边框和高亮使用侧边栏彩带的颜色。

* 新增选项 `uc.flex.style-tab-items-add-hover-trail`（布尔值）：

  * 为标签页添加鼠标悬停时的拖尾效果。
  * 默认启用，设置为 `false` 可关闭此效果。

---

### 🗃 新增：标签页群组样式

![Image](https://github.com/user-attachments/assets/631e6805-63c3-432d-9988-e551c62f01c7)

*(仅限原生垂直标签页)*

* 新增选项 `uc.flex.style-tab-groups`：

  * 设置标签页群组的外观。
  * 数值：

    * `0` = 树状布局，无展开/折叠指示图标
    * `1` = 树状布局，带三角指示图标（与旧版相同，默认值）
    * `2` = 盒子布局，带文件夹图标

* 新增选项 `uc.flex.style-tab-groups-add-transition`：

  * 设置标签页群组展开/折叠时的过渡动画和旋转指示图标的效果。
  * 数值：

    * `0` = 不启用动画
    * `1` = 启用展开/折叠动画
    * `2` = 启用动画 + 旋转指示图标（默认值）

* 新增选项 `uc.flex.style-tab-groups-center-label-text`（布尔值）：

  * 设置标签页群组的标签文字居中显示。

---

### 🔍 新增: 地址栏显示与布局

* 新增选项 `uc.flex.auto-hide-urlbar-icons` (布尔值):

  * 默认启用。
  * 自动隐藏地址栏图标。
  * 鼠标悬停于地址栏时，图标会以从左右滑入的动画方式显示。

* 新增选项 `uc.flex.style-urlbar-center-text` (布尔值):

  * 将地址栏文字居中显示。

---

### ⚠️ 不兼容变更

#### 已废弃选项

以下选项已废弃且不再生效，请从 Firefox 高级首选项（about:config）中移除：

* `uc.flex.style-tab-group`

  * 功能已由以下选项替代：

    * `uc.flex.style-tab-groups`
    * `uc.flex.style-tab-groups-add-transition`
    * `uc.flex.style-tab-groups-center-label-text`

* `uc.flex.enable-gradient-highlight`

  * 改由 `uc.flex.style-sidebar-stripe-color-use-gradient` 控制

* `uc.flex.revert-to-original-sidebar-icon`

  * 功能已合并至 `uc.flex.style-sidebar-button = 0`

#### 更新选项

* `uc.flex.style-sidebar-button`

  * 数值范围由 `1–4` 更新为 `0–4`
  * `0` = Firefox 默认图标

* `uc.flex.show-tab-count-in-alltabs-button`

  * 数值范围由 `0–4` 更新为 `0–2`
  * `0` = 不显示标签页计数（默认值）
  * `1` = 显示所有标签页数量
  * `2` = 仅显示已加载标签页数量
  * 图标外观由 `uc.flex.style-all-tabs-button` 控制

* `uc.flex.style-urlbar`

  * 数值范围由 `0–4` 更新为 `1–4`。
  * 原本数值 `0` 所包含的功能已拆分为新的选项 `uc.flex.auto-hide-urlbar-icons`。
  * 原先包含在数值 `2–4` 中的文字居中功能，已拆分为新的选项 `uc.flex.style-urlbar-center-text`。
  * 更新后的数值仅用于控制地址栏的外观：
    * `1` = Flat（默认，与旧版相同）
    * `2` = Inset（嵌入式外观）
    * `3` = Debossed（凹陷式外观）
    * `4` = Seamless（与导航栏完全融合的外观）

#### 移除选项

* 旧版通过 `sidebery-styles.json` 导入到 Sidebery 样式编辑器的样式已全部迁移至 `uc-sidebery.css`。从 v6 开始，FlexFox 不再依赖 Sidebery 样式编辑器注入的样式。

  * 升级自旧版本的用户请在更新后删除 Sidebery 样式编辑器中的旧版样式，以避免冗馀的 CSS 负担及样式冲突。
  * v6 及以后版本不再提供 `sidebery-styles.json`，新安装只需导入 `sidebery-settings.json`。
  * 此后用户可以通过 `uc.flex.skip-loading-uc-sidebery.css` 完全停用 FlexFox 默认的 Sidebery 样式，从而更灵活地搭配其他自定义样式。

---

## 🎉 主要功能更新

<details>  
<summary>✨ <b>重大更新：全新的 UI/UX 样式自定义选项</b> <i>[点击展开]</i> 👇</summary>

* 新增 `uc.flex.style-sidebar-button`，可切换侧栏切换按钮图标（`0`–`4`）：
  * `0` = Firefox 默认图标
  * `1` = Firefox 主品牌标志（默认，与旧版相同）
  * `2` = Firefox 浏览器标志
  * `3` = Firefox System 1 标志
  * `4` = Mozilla 旗帜符号
* 新增 `uc.flex.style-toolbar-bgcolor`，切换导航栏与侧栏背景色（`1`–`2`）：
  * `1` = Tokyo Night 主题（默认，与旧版相同）
  * `2` = Firefox Acorn Design
* 新增 `uc.flex.style-urlbar`，切换地址栏外观（`1`–`4`）：
  * `1` = Flat（默认，与旧版相同）
  * `2` = Inset（嵌入式外观）
  * `3` = Debossed（凹陷式外观）
  * `4` = Seamless（与导航栏完全融合的外观）
* 新增 `uc.flex.style-urlbar-center-text`，将地址栏文字居中（默认值：`False`）。
* 新增 `uc.flex.move-urlbar-popup-to-center`，将地址栏弹出窗口移至中央（`0`–`2`）：
  * `0` = 不移动（默认）
  * `1` = 聚焦时居中显示
  * `2` = 仅在输入文字时居中显示
* 更新 `uc.flex.dim-urlbar-popup-backdrop` 的背景暗化效果，以配合新弹窗位置（`0`–`2`）：
  * `0` = 不暗化（默认）
  * `1` = 暗化 35%
  * `2` = 暗化 50%
* 新增 `uc.flex.style-window-controls`，切换窗口控制按钮样式（`1`–`3`）：
  * `1` = 交通灯按钮（默认，与旧版相同）
  * `2` = Yosemite 风格按钮
  * `3` = Yosemite GTK 主题
* 新增 `uc.flex.style-window-controls-shift-up`，轻微上移窗口控制按钮（默认值：`False`）。
* 新增 `uc.flex.style-window-controls-shrink-size`，缩小窗口控制按钮尺寸（默认值：`False`）。
* 新增 `uc.flex.move-window-controls-to-left`，将窗口控制按钮移动到导航栏或水平标签栏左侧（默认值：`False`）。
* 新增 `uc.flex.style-web-content-outline`，用于控制网页内容区域的边框（`0`–`2`）：
  * `0` = 无边框（默认）
  * `1` = 仅在 Tab Split View 中聚焦的网页内容上显示高亮边框
  * `2` = 在所有网页内容上显示边框

</details>

<details>  
<summary>🧊 <b>重大更新：支持半透明 Mica 效果与自定义壁纸背景</b> <i>[点击展开]</i> 👇</summary>

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
  * 页面透明效果需安装 [Transparent Zen](https://addons.mozilla.org/firefox/addon/transparent-zen/) 或 [Zen Internet](https://addons.mozilla.org/firefox/addon/zen-internet/) 扩展。
  * 若部分页面显示为全透明导致难以阅读，建议搭配 [Dark Reader](https://addons.mozilla.org/firefox/addon/darkreader/) 使用。

* 新增选项：`uc.flex.sidebery-apply-expand-speed-to-toolbars`
  * 启用后，会将 Sidebery 与原生垂直标签页使用的展开/折叠动画速度应用到导航栏和书签工具栏，统一所有动画速度。
  * 动画速度统一后，也可以使用 `uc.flex.sidebery-fast-hover-expand` 或 `uc.flex.sidebery-slow-hover-expand` 来调整导航栏和书签工具栏的动画速度。
  * 启用 Mica 或自定义壁纸时，FlexFox 会在内部自动统一动画速度，此时无需手动设置这个选项。

* 新增 `uc.flex.enable-translucent-urlbar-popup-and-menus`：为地址栏弹出面板和各类菜单启用半透明与模糊背景。FlexFox 默认只会在启用 Mica 或自定义壁纸时应用这些效果，而通过此选项，即使没有启用 Mica 或壁纸，也能单独启用半透明的弹出面板和菜单。背景透明度可通过 `uc.flex.browser-mica-transparency-level` 调整，范围为 `0`–`4`，数值越大越透明。如果你已经启用了 Mica 或自定义壁纸，则无需再设置这个选项。

</details>

<details>  
<summary>🧩 <b>重大更新：Sidebery 与水平标签页的新布局模式</b> <i>《点击展开》</i> 👇</summary>

* 新增 Sidebery 的 2 种布局模式
  * 新增选项 `uc.flex.sidebery-allow-resizable-width`：允许通过拖动分隔线自由调整 Sidebery 宽度。
  * 启用此选项会停用 Sidebery 的自动折叠，但仍可通过侧栏切换按钮（Firefox Logo）展开或折叠侧栏。
  * 如需临时恢复自动折叠，可使用 `Hide Sidebery` 快捷键，或按 <kbd>F1</kbd> 切换为原生垂直标签页。
* 新增水平标签页的 3 种布局模式并进行优化
  * 废弃旧选项 `uc.flex.disable-tabs-toolbar-autohide`。现在在 Sidebery 非活动时，水平标签页默认保持可见。
  * 新增 `uc.flex.auto-hide-horizontal-tabs-and-keep-navbar`：当 Sidebery 非活动时自动隐藏水平标签页，鼠标悬停在导航栏时显示。设置值：`0` = 关闭，`1` = 标签页显示在导航栏下方，`2` = 显示在导航栏上方，`3` = 布局与 `2` 相同，但只有鼠标移动到屏幕顶部边缘时才会显示，用于避免在使用书签或访问导航栏时误触触发标签栏。触发距离（距屏幕顶部的高度范围）可通过 `--uc-tabstoolbar-hover-trigger-width` 进行调整。
  * 新增 `uc.flex.auto-hide-navbar-and-keep-horizontal-tabs`：当 Sidebery 非活动时自动隐藏导航栏，鼠标悬停在水平标签页时显示。设置值：`0` = 关闭，`1` = 开启。此选项会覆盖前一项的设置。
  * 新增 `uc.flex.disable-tab-close-button-on-inactive-horizontal-tabs`：在水平标签页模式下，FlexFox 默认在非活动标签页悬停时显示关闭按钮。随着标签页数量增加而宽度变窄，关闭按钮会自动缩小并移到右上角以减少误触。启用此选项可以完全移除关闭按钮。
  * 新增 `uc.flex.show-tab-close-button-on-favicon-hover`：在水平标签页模式下，将关闭按钮与网站图标合并以节省空间。关闭按钮仅在鼠标悬停图标时显示。启用此选项后，上述关闭按钮的自动缩小和移位行为会自动停用。
  * 新增 `uc.flex.increase-active-horizontal-tab-min-width`：在水平标签页变窄时保持活动标签页更宽，使其标签在众多标签中仍能清楚区分，便于快速识别。设置值：
    * `0` = 关闭
    * `1` = 最小宽度 1.8 倍，无动画
    * `2` = 最小宽度 1.8 倍，有动画
    * `3` = 最小宽度 2 倍，无动画
    * `4` = 最小宽度 2 倍，有动画
    * 默认值：`1`（开启）。若希望所有标签保持固定宽度，请设为 `0`。
  * 超过可见数量的水平固定标签页会自动折叠。可见固定标签页默认值为 10 个。可通过 `uc.flex.max-visible-horizontal-pinned-tabs` 调整（设置值 `0`–`5` 对应可见 2–10 个；设置 `0` 可在水平标签页中禁用自动折叠）。

</details>

<details>  
<summary>🧩 <b>重大更新：固定标签页面板的网格布局可自定义</b> <i>[点击展开]</i> 👇</summary>

* 新增 `uc.flex.max-visible-horizontal-pinned-tabs`，用于设置固定标签页面板每行可显示的标签数量（横向）。
  * 可设置范围 `0`–`5`（默认值 `5`）。
  * 在垂直标签页中，超过的固定标签会自动换行。
  * 在水平标签页中，超过的固定标签会自动折叠（设置值对应 2–10 个可见固定标签）。
  * 设置 `0` 可在水平标签页中禁用自动折叠。

* 新增 `uc.flex.max-visible-vertical-pinned-tabs`，用于设置固定标签页面板每列可显示的标签数量（纵向）。
  * 可设置范围 `2`–`8`（默认值 `4`）。
  * 适用于原生垂直标签页和 Sidebery，用于限制面板高度。
  * 当固定标签页数量超过设置值时，溢出的标签可通过滚动条浏览。
  * 设为 `0` 时将关闭高度限制，面板会随标签数量无限扩展。  

* 新增 `uc.flex.show-pin-tabs-separator-in-expanded-state`，用于始终显示固定标签页面板的分隔线。    
  * 仅适用于原生垂直标签页。  
  * 启用后会关闭高度限制，并可通过拖动分隔线自由调整面板高度。  

  <p>
    <img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/new-vt-splitter-resize.webp"
         alt="新的原生垂直标签页设计，分隔线处于悬停状态，可拖动调整面板高度"
         height="510" hspace=15 />
    <img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/new-vt-splitter-collapsed.webp"
         alt="新的原生垂直标签页设计，折叠状态下的分隔线外观"
         height="510" hspace=15 />
    <img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/new-vt-splitter-expanded.webp"
         alt="新的原生垂直标签页设计，展开状态下的分隔线外观"
         height="510" hspace=15 />
  </p>

</details>

<details>  
<summary>🔢 <b>重大更新：标签计数与分頁索引显示</b> <i>[点击展开]</i> 👇</summary>

* 新增选项 `uc.flex.show-tab-count-in-alltabs-button`，可在“全部标签页”按钮上显示当前打开的标签页总数。设置值如下：
  * `0` = 关闭
  * `1` = 显示所有标签页数量
  * `2` = 仅显示已加载标签页数量
* 新增选项 `uc.flex.show-tab-number-in-tab-label`，可在原生标签页标签上显示每个标签的索引号。标签过窄看不到完整标题时，也能快速识别标签位置。

</details>

<details>  
<summary>👻 <b>重大更新：自动隐藏工具栏图标及窗口控制按钮</b> <i>《点击展开》</i> 👇</summary>

* 新增选项 `uc.flex.auto-hide-navbar-icons`，用于隐藏工具栏中的图标（包括导航栏、书签栏及菜单栏的工具项），并在鼠标悬停时显示。此选项不影响地址栏或窗口控制按钮。
* 新增选项 `uc.flex.auto-hide-urlbar-icons`，此选项默认启用，会自动隐藏地址栏图标，并在鼠标悬停于地址栏时以从左右滑入的动画方式显示。
* 新增选项 `uc.flex.auto-hide-window-controls`，用于隐藏窗口控制按钮（最小化、最大化、关闭），并在鼠标悬停在导航栏边缘时显示。
* 侧栏切换按钮（FlexFox 图标）通常始终可见。如果侧栏按钮未放在导航栏的最左或最右侧，或者 `uc.flex.style-sidebar-button` 设置为 `0`，该按钮也会跟随自动隐藏。
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
<summary>🖌️ <b>重大更新：Sidebery 背景颜色可自动跟随主题</b> <i>《点击展开》</i> 👇</summary>

* FlexFox 现在可以根据当前的 Firefox 主题自动调整 Sidebery 的背景颜色。
* 要启用此功能，请在 Sidebery 的 **设置 → 外观 → 配色模式** 中选择 `"firefox"`。
  <details><summary>点击展开 Sidebery 外观设置截图</summary>
  <img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/sidebery-appearance-settings.  webp"alt="Sidebery 外观设置" width="50%" />
  </details>

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
<summary>🪄 <b>重大更新：还原原生平角样式</b> <i>《点击展开》</i> 👇</summary>

新增了一个选项 `uc.flex.revert-to-original-flat-corner-style`。启用后可停用 URL 栏和搜索栏的 FlexFox 大圆角（9999px），还原为 Firefox 原生的平角样式。

在 Firefox v145 中，默认圆角由 4px 提升至 8px，使原生设计更加圆润。为了同时支持旧版与新版样式，此选项从布尔值扩展为数值设置（`0`–`3`）。从旧版本升级的用户请删除原有的布尔值设置，并按照新的数值形式重新创建。

**可选数值**

* `0` = URL 栏和搜索栏使用 FlexFox 大圆角（9999px，默认）
* `1` = Firefox v145+ 的圆角样式（所有元素 8px）
* `2` = v145 前的平角样式（所有元素 4px）
* `3` = URL 栏和搜索栏使用 FlexFox 大圆角，其他元素使用 v145 前的平角样式

如需进一步调整 URL 栏、搜索栏和查找栏的圆角尺寸，可以将下列变量从 `uc-variables.css` 复制到 `uc-user-settings.css` 并进行修改：

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

<a id="updates-top-start"></a>
<details>

<summary>💬 <b>历史更新</b></summary>

更多旧版本的更新记录请参见  
👉 [Wiki 上的历史归档页面](https://github.com/yuuqilin/FlexFox/wiki/Earlier-Update-History-(Simplified-Chinese))

<a href="#updates-top-start">⏫ 返回更新记录顶部</a>
</details>

---

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
>
> 1. 安装 [Sidebery](https://addons.mozilla.org/firefox/addon/sidebery/)（可选，但推荐）。
> 2. 请从项目的 **[Releases](https://github.com/yuuqilin/FlexFox/releases)** 页面下载最新版本的 FlexFox。
> 3. 打开 `about:support`，找到 **配置文件夹**，点击 **打开文件夹** 进入你的 Firefox 配置目录。
> 4. 将下载包中 `scripts` 文件夹里的 `chrome` 文件夹与 `user.js` 文件复制到配置文件夹中。
> 5. 使用文本编辑器打开 `user.js`，删除 `//` 注释以启用对应功能。
>
>    * 请确保以下选项设定为：
>
>      * `toolkit.legacyUserProfileCustomizations.stylesheets` = `true`
>      * `svg.context-properties.content.enabled` = `true`
>      * `sidebar.visibility` = `always-show`
> 6. 重启 Firefox，然后删除 `user.js`，以便之后通过 `about:config` 所做的修改能够正常保存。
> 7. 配置 Sidebery：
>
>    * 点击侧边栏中的齿轮图标进入设置
>    * 清除 `样式编辑器` 中已有样式以避免冲突
>    * 前往 `帮助` → `导入`，导入压缩包中 `Sidebery` 文件夹里的 `sidebery-settings.json`
> 8. 打开 `about:config`，搜索 `uc.flex.`，按需求启用或关闭对应功能。

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
| `sidebar.visibility` | `always-show` | 启用 FlexFox 的**优化版**垂直标签页自动折叠功能和布局（在垂直标签页模式下生效）。FlexFox 的许多功能依赖此设置。也可以在侧栏设置中取消勾选 **“悬停时展开侧栏”** 来应用此设置。 |

#### 🪄 添加或启用选项

| 配置选项 | 值 | 说明 |
|----------|:------:|----------|
| `uc.flex.add-ui-text-stroke` | `true` | 为界面文字添加粗描边，提高低分辨率屏幕下的可读性。 |
| `uc.flex.fully-hide-sidebery` | `true` | 完全隐藏 Sidebery 和原生垂直标签页，将鼠标移至屏幕边缘时自动显示。 |
| `uc.flex.fully-hide-toolbox` | `true` | 完全隐藏顶部所有工具栏（标签栏、导航栏、书签工具栏），将鼠标移至屏幕顶部时自动显示。 |
| `uc.flex.auto-hide-horizontal-tabs-and-keep-navbar` | `0`-`3`<br>(`0`) | 在水平标签页模式下，当 Sidebery 非活动时自动隐藏水平标签页。鼠标悬停在导航栏时显示。取值：`0` = 关闭，`1` = 标签页显示在导航栏下方，`2` = 标签页显示在导航栏上方，`3` = 与 `2` 相同，但只在鼠标移动到屏幕顶部边缘时显示，以避免误触。 |
| `uc.flex.auto-hide-navbar-and-keep-horizontal-tabs` | `0`-`1`<br>(`0`) | 在水平标签页模式下，当 Sidebery 非活动时自动隐藏导航栏。鼠标悬停在水平标签页时显示导航栏。取值：`0` = 关闭，`1` = 开启。此选项优先级较高，如果同时启用 `uc.flex.auto-hide-horizontal-tabs-and-keep-navbar`，会覆盖该选项的设置。 |
| `uc.flex.auto-hide-navbar-icons` | `true` | 隐藏工具栏中的图标（包括导航栏、书签栏及菜单栏的工具项），鼠标悬停在工具栏上时显示。此选项不影响地址栏或窗口控制按钮。侧栏切换按钮（FlexFox 图标）通常始终可见，但当侧栏按钮未放在导航栏边缘，或 `uc.flex.style-sidebar-button` 设置为 `0` 时，也会跟随自动隐藏。 |
| `uc.flex.auto-hide-urlbar-icons` | `true` | 隐藏地址栏中的图标，并在鼠标悬停于地址栏时以从左右滑入的动画方式显示。此选项默认启用，如希望图标始终显示，请将其设置为 `false`。 |
| `uc.flex.auto-hide-window-controls` | `true` | 隐藏窗口控制按钮（最小化、最大化、关闭），鼠标悬停在导航栏边缘时显示。 |
| `uc.flex.allow-addons-to-change-toolbar-color` | `true` | 允许 Firefox Color 等扩展修改工具栏的颜色（在未设置背景图时需要启用）。 |
| `uc.flex.enable-colored-bookmarks-folder-icons` | `0`-`2`<br>(`0`) | 启用彩色书签文件夹图标。此选项为数值类型：`0` 表示关闭，`1` 使用第一组图标，`2` 使用第二组图标（并自动隐藏标签）。 |
| `uc.flex.remove-bookmarks-folder-icons` | `true` | 移除书签文件夹的图标。 |
| `uc.flex.remove-bookmarks-labels` | `true` | 移除书签文件夹的文字标签。 |
| `uc.flex.show-flexfox-version-info-in-about-config` | `true` | 在 `about:config` 頁面顯示 FlexFox 已安裝的提示訊息，並附帶當前版本號。 |
| `uc.flex.show-pin-tabs-separator-in-expanded-state` | `true` | 在原生垂直标签页展开状态下显示固定标签页与普通标签页之间的分隔线。Firefox 默认只在悬停时显示，FlexFox 则始终显示。分隔线可拖动，用于调整固定标签页面板的高度。 |
| `uc.flex.show-tab-close-button-on-favicon-hover` | `true` | 在水平标签页中将关闭按钮与网站图标合并，以节省空间。鼠标悬停在图标上时显示关闭按钮。启用此选项后，会自动停用分页变窄时关闭按钮的自动缩小和移位功能。 |
| `uc.flex.show-tab-count-in-alltabs-button` | `0`-`2`<br>(`0`) | 在“显示所有标签页”按钮上显示标签页总数。此选项为数值类型：`0` = 关闭，`1` = 显示所有标签页数量，`2` = 仅显示已加载标签页数量。 |
| `uc.flex.show-tab-number-in-tab-label` | `true` | 在每个标签文字前显示编号。在标签文字因空间不足而被截断时，可以更容易分辨不同的标签。 |

#### 🚫 停用或还原选项

| 配置选项 | 值 | 说明 |
|----------|:------:|----------|
| `uc.flex.disable-flexfox` | `true` | 无需重启 Firefox 即可停用所有 FlexFox 样式和功能。 |
| `uc.flex.skip-loading-uc-*.css`  | `true` | 跳过加载 `./components/` 和 `./content/` 中的特定 `uc-*.css` 文件。例如将 `uc.flex.skip-loading-uc-newtab.css` 设置为 true 时，将不会加载 `./content/uc-newtab.css` 文件。 |
| `uc.flex.disable-bookmarks-autohide` | `true` | 停用书签工具栏的自动隐藏功能。 |
| `uc.flex.disable-findbar-autohide` | `true` | 防止查找栏（Findbar）在失去焦点后自动隐藏。 |
| `uc.flex.disable-sidebery-autohide` | `true` | 禁用 Sidebery 和原生垂直标签页的自动折叠功能。 |
| `uc.flex.disable-tab-close-button-on-inactive-horizontal-tabs` | `true` | 在懸停於非活動的水平分頁時，FlexFox 會顯示關閉按鈕。當分頁寬度很窄時，按鈕會縮小並移到右上角以避免誤觸。啟用此選項後，關閉按鈕將完全不顯示。 |
| `uc.flex.disable-nav-bar-first-item-right-padding` | `true` | 默认情况下，FlexFox 会在导航栏第一个图标后添加右侧间距，以优化垂直标签页与周围项目之间的视觉间隔和对齐。此选项可停用该间距。 |
| `uc.flex.disable-menu-icons` | `true` | 停用 FlexFox 添加的自定义选单图标。 |
| `uc.flex.restore-window-controls-on-tabbar` | `true` | 在水平标签页模式下，将最小化、最大化、关闭按钮恢复到标签栏上。 |
| `uc.flex.revert-to-original-window-controls` | `true` | 将 FlexFox 使用的 macOS 风格窗口按钮恢复为 Firefox 默认的最小化、最大化、关闭按钮。 |
| `uc.flex.revert-to-original-flat-corner-style` | `0`-`3`<br>(`0`) | 将 URL 栏、搜索栏及其他界面元素的样式恢复为 Firefox 原生的平角设计。数值：`0` = FlexFox 大圆角（9999px，默认），`1` = Firefox v145+ 的圆角样式（8px），`2` = v145 之前的平角样式（4px），`3` = URL 栏／搜索栏使用 FlexFox 大圆角，其他元素使用 v145 之前的平角样式。 |
| `uc.flex.revert-to-original-bookmark-star-icon` | `true` | 将 FlexFox 使用的书签星形图标恢复为 Firefox 默认设计。 |
| `uc.flex.remove-sidebar-stripe` | `true` | Sidebery 激活时移除侧边栏彩带。若需切换侧边栏工具，垂直标签页模式下可按 <kbd>F1</kbd> 显示侧边栏工具按钮，水平标签页模式下可按 <kbd>Ctrl</kbd> + <kbd>B</kbd> 恢复显示侧边栏表头。 |

#### 🪛 修改或调整选项

| 配置选项 | 值 | 说明 |
|----------|:------:|----------|
| `uc.flex.increase-sidebery-expanded-width` | `true` | 使 Sidebery 和原生垂直标签页在展开时更宽。 |
| `uc.flex.increase-navbar-height` | `true` | 恢复旧版 FlexFox 中使用的较厚导航栏高度。此更改会覆盖当前默认值（与 Firefox 原始的紧凑高度一致）。 |
| `uc.flex.increase-active-horizontal-tab-min-width` | `0`-`4`<br>(`1`) | 当水平标签页宽度变窄时，保持活动标签页比其他标签更宽，以便在标签被压缩或截断时更容易区分活动标签。取值：`0` = 关闭，`1` = 最小宽度 1.8 倍（无动画），`2` = 1.8 倍（有动画），`3` = 2 倍（无动画），`4` = 2 倍（有动画）。此选项默认启用，如希望所有标签保持相同宽度，可设置为 `0`。 |
| `uc.flex.switch-to-alternate-condensed-panel` | `true` | 默认情况下，FlexFox 会将原生扩展面板替换为仅显示图标的面板，此时可通过右键点击图标访问扩展设置。启用此选项后，将切换为包含扩展名称和设置按钮的简洁面板，提供更具说明性的视图。 |
| `uc.flex.sidebery-allow-resizable-width` | `true` | 允许通过拖动侧栏分隔线自由调整 Sidebery 宽度。启用时，Sidebery 不再自动折叠，但仍可使用侧栏切换按钮（Firefox Logo）切换展开/折叠状态。如需自动折叠，可使用 `Hide Sidebery` 快捷键，或按 <kbd>F1</kbd> 切换为原生垂直标签页以自动折叠标签页。 |
| `uc.flex.sidebery-fast-hover-expand` | `true` | 加快 Sidebery 与原生垂直标签页的自动展开/折叠速度。 |
| `uc.flex.sidebery-slow-hover-expand` | `true` | 减慢 Sidebery 与原生垂直标签页的自动展开/折叠速度。 |
| `uc.flex.sidebery-apply-expand-speed-to-toolbars` | `true` | 将导航栏和书签栏的动画速度统一为 Sidebery／垂直标签页的速度。启用 Mica 或壁纸时自动生效。 |
| `uc.flex.max-visible-horizontal-pinned-tabs` | `0`-`5`<br>(`5`) | 设置每行固定标签页的最大可见数量。在垂直标签页中，超过的固定标签会自动换行。在水平标签页中，超过的固定标签会自动折叠，设置值对应 2–10 个可见固定标签。设置 `0` 可在水平标签页中禁用自动折叠。 |
| `uc.flex.max-visible-vertical-pinned-tabs` | `0` \|<br>`2`-`8`<br>(`4`) | 设置原生垂直标签页和 Sidebery 中每列固定标签页的最大可见数量。达到上限后，固定标签页面板会显示滚动条。设为 `0` 时关闭限制，面板会随标签数量无限扩展。 |
| `uc.flex.findbar-position` | `'top-center-left'`\|<br>`'top-right'`\|<br>`'bottom-right'` | 设置查找栏的位置。可选值为字符串：`'top-center-left'` 或 `'1'`（顶部左侧），`'top-right'` 或 `'2'`（右上角），`'bottom-right'` 或 `'3'`（右下角）。 |
| `uc.flex.menu-item-spacing` | `'small'`\|<br>`'medium'`\|<br>`'large'` | 设置 Firefox 的应用菜单、书签菜单和右键菜单中项目之间的垂直间距。可选值为字符串 `'1'` 或 `'small'`（较小间距）、`'2'` 或 `'medium'`（默认间距）、`'3'` 或 `'large'`（较大间距）。 |

#### ⚙️ Firefox 原生选项
| 配置选项 | 值 | 说明 |
|----------|:------:|----------|
| `browser.sessionstore.restore_pinned_tabs_on_demand` | `true` | 固定标签页仅在被点击时才加载，使你可以固定大量标签页而不会拖慢 Firefox 启动速度。配合 FlexFox 的固定标签页布局和自动折叠功能，可以方便地将大量标签页作为快速访问页面使用，因此建议在使用 FlexFox 时启用此选项。 |
| `browser.tabs.fadeOutExplicitlyUnloadedTabs` | `true` | Firefox 原生设置，用于在原生垂直标签页中淡出已卸载的标签页。 |
| `browser.tabs.fadeOutUnloadedTabs` | `true` | Firefox 原生设置，用于在原生垂直标签页中淡出挂起标签页（启动时待恢复的标签页）。 |
| `sidebar.visibility` | `expand-on-hover` | 禁用 FlexFox 的**优化版**垂直标签页自动折叠功能和布局。也可以在侧栏设置中勾选 **“悬停时展开侧栏”** 来启用此模式。启用后，可以自由调整侧栏宽度，并使用 <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>Z</kbd> 或侧栏切换按钮在展开和折叠状态之间切换。**不建议在日常使用中启用此选项。** |
| `sidebar.animation.expand-on-hover.duration-ms` | `120` | Firefox 原生设置，用于控制在 `sidebar.visibility` 设置为 `expand-on-hover` 时，原生垂直标签页展开和折叠的动画速度。 |

#### 界面样式与外观
| 配置选项 | 值 | 说明 |
|----------|:------:|----------|
| `uc.flex.style-all-tabs-button` | `0`-`2`<br>(`1`) | 设置“列出所有标签页”按钮的图标。取值：`0` = Firefox 默认图标，`1` = 筛选图标（默认），`2` = V 形箭头图标。 |
| `uc.flex.style-sidebar-button` | `0`-`4`<br>(`1`) | 切换侧栏切换按钮的图标。取值：`0` = Firefox 默认图标，`1` = Firefox 主品牌标志（默认），`2` = Firefox 浏览器标志，`3` = Firefox System 1 标志，`4` = Mozilla 旗帜符号。 |
| `uc.flex.style-sidebar-stripe-color` | `0`-`10`<br>(`0`) | 控制侧边栏彩带、侧边栏按钮（Firefox 图标）以及书签星标图标的颜色。在暗色模式下，还会应用到标签页边框、背景、高亮以及 Sidebery 导航图标。取值：`0` = Classic（默认），`1` = Red，`2` = Orange，`3` = Yellow，`4` = Green，`5` = Cyan，`6` = Blue，`7` = Violet，`8` = Purple，`9` = Pink，`10` = Gray。 |
| `uc.flex.style-sidebar-stripe-color-apply-to-all-icons` | `true` | 将侧边栏彩带颜色应用到所有图标。在暗色模式下，还会应用到地址栏和网页区域边框。即使启用 `uc.flex.revert-to-original-bookmark-star-icon`，此选项仍会覆盖 Firefox 默认的书签星标颜色。 |
| `uc.flex.style-sidebar-stripe-color-use-gradient` | `true` | 根据 `uc.flex.style-sidebar-stripe-color` 所选颜色应用对应的渐变样式。渐变效果会作用于侧边栏彩带、侧边栏按钮图标（Firefox 图标）、书签星标以及书签文件夹图标。 |
| `uc.flex.style-sidebery-nav-icon` | `0`-`2`<br>(`0`) | 设置 Sidebery 收起状态下显示的导航图标。取值：`0` = 使用当前活动面板图标（新默认值），`1` = Sidebery Logo，`2` = V 形箭头图标（旧默认值）。 |
| `uc.flex.style-sidebery-nav-icon-use-active-panel-color` | `true` | 让导航图标使用当前活动面板所设置的颜色。 |
| `uc.flex.style-toolbar-bgcolor` | `1`-`2`<br>(`1`) | 切换导航栏和侧栏的背景颜色。取值：`1` = Tokyo Night 主题（默认），`2` = Firefox Acorn Design。 |
| `uc.flex.style-urlbar` | `1`-`4`<br>(`1`) | 自定义地址栏的外观。取值：`1` = 扁平（默认），`2` = 嵌入（嵌入式外观），`3` = 压印（凹陷式外观），`4` = 无缝（与导航栏完全融合的外观）。 |
| `uc.flex.style-urlbar-center-text` | `true` | 将地址栏中的文字居中显示。 |
| `uc.flex.move-urlbar-popup-to-center` | `0`-`2`<br>(`0`) | 调整地址栏弹窗的位置。取值：`0` = 不居中（默认），`1` = 聚焦时居中显示，`2` = 仅在输入文字时居中显示。 |
| `uc.flex.dim-urlbar-popup-backdrop` | `0`-`2`<br>(`0`) | 当地址栏展开下拉列表时使背景变暗。此选项接受数值 `0`（关闭）到 `2`，数值越大，背景越暗。 |
| `uc.flex.style-window-controls` | `1`-`3`<br>(`1`) | 切换窗口控制按钮的图标。取值：`1` = 信号灯按钮（默认），`2` = Yosemite 风格按钮，`3` = Yosemite GTK 主题。 |
| `uc.flex.style-window-controls-shift-up` | `true` | 使窗口控制按钮略微上移。 |
| `uc.flex.style-window-controls-shrink-size` | `true` | 缩小窗口控制按钮的整体尺寸。 |
| `uc.flex.move-pip-volume-to-top` | `true` | 将画中画（PiP）窗口中的音量控制按钮移至顶部。 |
| `uc.flex.move-window-controls-to-left` | `true` | 将窗口控制按钮移动到导航栏或水平标签栏的最左侧。 |
| `uc.flex.style-tab-items` | `1`-`2`<br>(`1`) | 设置垂直标签页的外观。取值：`1` = 固定标签页仅显示边框且无背景（默认），`2` = 固定标签页仅显示背景且无边框。所有标签页的边框和高亮使用侧边栏彩带的颜色。 |
| `uc.flex.style-tab-items-add-hover-trail` | `true` | 为垂直标签页添加鼠标悬停时的拖尾效果。默认启用，设置为 `false` 可关闭此效果。 |
| `uc.flex.style-tab-groups` | `0`-`2`<br>(`1`) | 设置原生垂直标签页的标签页群组外观。取值：`0` = 树状布局，无展开/折叠指示图标，`1` = 树状布局，带三角指示图标（默认），`2` = 盒子布局，带文件夹图标。 |
| `uc.flex.style-tab-groups-add-transition` | `0`-`2`<br>(`2`) | 设置原生垂直标签页的标签页群组展开/折叠时的过渡动画和旋转指示图标效果。取值：`0` = 不启用动画，`1` = 启用展开/折叠动画，`2` = 启用动画 + 旋转指示图标（默认）。 |
| `uc.flex.style-tab-groups-center-label-text` | `true` | 设置原生垂直标签页的标签页群组标签文字居中显示。 |
| `uc.flex.style-web-content-outline` | `0`-`2`<br>(`0`) | 控制网页内容区域的边框。取值：`0` = 无边框（默认），`1` = 仅在 Tab Split View 中聚焦的网页内容上显示高亮边框，`2` = 在所有网页内容上显示边框。 |
| `uc.flex.enable-rounded-web-content` | `0`-`2`<br>(`0`) | 为网页内容区域添加边距、阴影和圆角效果。此选项为数值型，接受 `0`（关闭）到 `2`，数值越大，边距越宽。 |
| `uc.flex.enable-rounded-web-content-at-sidebery-corner` | `true` | 当启用 `uc.flex.enable-rounded-web-content` 时，让网页内容在贴近 Sidebery 彩带的一角也显示圆角效果。 |
| `uc.flex.enable-translucent-urlbar-popup-and-menus` | `true` | 为地址栏弹出面板和各类菜单启用半透明和模糊背景。FlexFox 默认仅在启用 Mica 或自定义壁纸时才启用此效果，但使用此选项可在没有它们的情况下也启用。背景透明度可通过 `uc.flex.browser-mica-transparency-level` 调整，范围 `0`–`4`，数值越大越透明。 |

#### 🧊 视觉背景和 Mica 效果

| 配置选项 | 值 | 说明 |
|----------|:------:|----------|
| `widget.windows.mica` | `true` | 启用 Firefox 原生的 Mica 背景效果。需将主题设置为 `系统主题 — 自动` 才能生效。此功能仅在 Windows 11 系统中可用。如果当前系统不支持 Mica，可使用 `uc.flex.browser-wallpaper-enabled` 来模拟类似效果。 |
| `widget.windows.mica.popups` | `1`\|`2`<br>(`2`) | 为弹出菜单启用 Mica 背景效果。可设置为 `0`（关闭）、`1`（开启）或 `2`（自动）。 |
| `widget.windows.mica.toplevel-backdrop` | `2` | 指定要使用的 Mica 背景类型：`0`（自动或不使用）、`1`: Mica、`2`: Acrylic、`3`: Mica Alt。FlexFox 是基于该选项设为 `2`: Acrylic 的前提进行设计的。 |
| `browser.tabs.allow_transparent_browser` | `true` | 允许 Sidebery 和网页内容背景透明，可显示 Mica 或壁纸效果。**更改后需重启 Firefox 才会生效。** 若要实现网页内容透明，需安装 [Transparent Zen](https://addons.mozilla.org/firefox/addon/transparent-zen/) 或 [Zen Internet](https://addons.mozilla.org/firefox/addon/zen-internet/) 扩展。若部分网页因透明而难以阅读，建议搭配 [Dark Reader](https://addons.mozilla.org/firefox/addon/darkreader/) 使用。 |
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

FlexFox 使用的附加图标资源：

- **Custom Brand Icons** — 修改自 elax46 的 [custom-brand-icons](https://github.com/elax46/custom-brand-icons)。  
- **Newaita** — 修改自 cbrnix 的 [Newaita](https://github.com/cbrnix/Newaita)。  
- **Yosemite Buttons** — 修改自 Doublefire-Chen 的 [macos-traffic-light-buttons-as-SVG](https://github.com/Doublefire-Chen/macos-traffic-light-buttons-as-SVG)。  
- **Yosemite GTK Theme** — 修改自 kxmylo 的 [Yosemite GTK 3.14/3.16 Theme Alpha4](https://www.deviantart.com/kxmylo/art/Yosemite-GTK-3-14-3-16-Theme-Alpha4-575639716)。

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

  <p>本项目包含以下授权的附加图形资源：</p>
  
  <ul>
    <li><strong>Custom Brand Icons</strong> — 使用 <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/">CC BY-NC-SA 4.0</a> 授权</li>
    <li><strong>Newaita</strong> — 使用 <a href="https://creativecommons.org/licenses/by-nc-sa/3.0/">CC BY-NC-SA 3.0</a> 授权</li>
    <li><strong>Yosemite Buttons</strong> — 使用 <a href="https://creativecommons.org/licenses/by/3.0/">CC BY 3.0</a> 授权</li>
  </ul>
</details>
