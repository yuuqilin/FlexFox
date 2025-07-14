# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox（简体中文版）

<div>
 <a href='https://www.mozilla.org'><img src="https://img.shields.io/badge/Last%20tested%20Firefox-v142-orange?logo=firefox"></a>
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

![FlexFox Dark-Light Theme](https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/FlexFox-light-dark.webp) 

## 🆕 更新内容

**🦊 v3.7.7**
* 修复折叠原生垂直标签页或侧栏标题时，动画过渡效果失效的问题。
* 修复开启“悬停时展开侧栏”并保持侧栏展开状态时，打开侧栏面板会遮挡原生垂直标签页的问题。
* 修复在 Sidebery 活动时，网页区域的阴影无法覆盖侧栏彩带的问题。
* 修正启用 `uc.flex.sidebery-fast-hover-expand` 时，Sidebery 折叠动画的过渡效果。

自动隐藏图标和根据主题切换 Sidebery 背景色的展示：  
<video src="https://github.com/user-attachments/assets/070f798d-2925-4681-ac50-7cd4b36936e7" controls></video>

🖌️ <b>重要更新：Sidebery 背景颜色可自动跟随主题</b>
> [!NOTE]
> * FlexFox 现在可以根据当前的 Firefox 主题自动调整 Sidebery 的背景颜色。
> * 要启用此功能，请在 Sidebery 的 **设置 → 外观 → 配色模式** 中选择 `"firefox"`。
> <details><summary>点击展开 Sidebery 外观设置截图</summary>
> <img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/sidebery-appearance-settings.webp" alt="Sidebery 外观设置" width="50%" />
> </details>

🔧 <b>v3.6.x 修复 v3.5.1 引入的性能问题</b>
> [!NOTE]
> * **v3.5.1** 中引入的性能衰退问题已从 **v3.6.0** 起修复。
> * 最明显的提升是打开 **“列出所有标签页”** 面板时的速度，最新版相比 **v3.5.8** 提升可达 **18 倍**。
> * 除了修复性能衰退，新版本还重构了部分代码，进一步提升了速度，与 Firefox 原生界面的差距已小于 **2ms**。
> * 建议使用 **v3.5.x** 系列的用户更新到最新版本。

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
  --uc-web-content-margin-small
  --uc-web-content-margin-large
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

<a id="updates-top-start"></a>
<details>

<summary>💬 <b>历史更新</b></summary>

**v3.7.6**
* 新增一个菜单图标，并修复了一个现有图标的显示问题。

**v3.7.5**
* 优化了 v3.7.4 中引入的动画效果，修复了 Sidebery 折叠时出现的闪烁问题。

**v3.7.4**
* 改进了在启用 `uc.flex.sidebery-slow-hover-expand` 时，Sidebery 处于折叠状态下，点击树形标签页的根节点时，能够切换到根节点标签页，而不是折叠整个树分支。

**v3.7.3**
* 修复了在全屏模式下，查找栏位置过高导致被导航栏遮挡的问题。
* 调整了侧栏工具区域与原生垂直标签页之间边框和分隔线重复显示的问题。
* 修复启用 `uc.flex.sidebery-slow-hover-expand` 时，在 Sidebery 尚未完全展开前点击标签页可能会意外关闭标签页的问题。

**v3.7.2**
* 修复 Sidebery 展开时树状缩进线提前出现，未与动画同步的问题。

**v3.7.1**
* 修复在水平标签页模式下启用 `uc.flex.enable-rounded-web-content` 时，网页内容周围的间距区域背景颜色与工具栏不一致的问题。
* 修复同时启用 `uc.flex.revert-to-original-sidebar-icon` 和 `uc.flex.auto-hide-navbar-icons` 时，侧边栏开关按钮图标无法隐藏的问题。
* 新增选项 `uc.flex.remove-sidebar-stripe`，在 Sidebery 激活时可移除侧边栏彩带。如需切换到其他侧边栏工具或扩展，垂直标签页模式下可按 <kbd>F1</kbd> 显示工具按钮，水平模式下可按 <kbd>Ctrl</kbd> + <kbd>B</kbd> 恢复显示侧边栏表头。  

   <img src="https://github.com/yuuqilin/media-assets/blob/FlexFox/assets/remove-sidebar-stripe.gif" alt="移除侧边栏彩带" width="55%" />

**v3.7.0**
* 改进了 Sidebery 的展开与收起动画，解决了悬停时标签页抖动的问题。
  （旧版在动画过程中，padding 和自动计算的宽度不协调，导致标签页位置阶段性跳动，无法顺畅过渡，看起来会有明显的抖动感。）
* 修复启用 `uc.flex.sidebery-slow-hover-expand` 后，侧边栏与 Sidebery 的动画时序不同步的问题。
* 为了让 Sidebery 内部的动画与外部容器保持同步，现在在 `uc-sidebery.css` 中也定义了控制展开动画的变量。
  如果你曾将 `uc-variables.css` 中的变量复制到 `uc-user-settings.css` 来自定义动画时间，请务必也将对应的定义（包含正确的 `@media` 查询语句和 `#root` 选择器）从 `uc-sidebery.css` 复制到 `uc-custom-content.css`，并使用相同的数值。这样才能确保 userChrome 和 userContent 样式之间的动画效果保持一致。

**v3.6.10**
* 修复了 v3.6.8 引入的问题：当启用“悬停时展开侧栏”并处于 Sidebery 活动状态时，展开后的侧栏工具栏无法正常显示。

**v3.6.9**
* 修复 v3.6.8 引起的问题：在原生水平标签页模式下，侧栏标题条的颜色消失。
* 修复 v3.6.8 引起的问题：在原生水平标签页模式下，打开侧栏标题时，Sidebery 无法保持展开状态。

**v3.6.8**
* 修复了Nightly 142导致的侧栏开关按钮在悬停时高亮尺寸错误的问题。
* 改进了 `uc.flex.enable-rounded-web-content` 的显示效果：现在网页容器的阴影和圆角不会被裁剪，相关样式已重构，复杂度大幅降低。
* 调整了侧栏与导航栏的层叠样式处理方式，从原来的固定数值改为悬停时动态提升。
* 修复在启用“悬停时展开侧栏”并启用 Sidebery 时，侧栏工具栏无法完全展开的问题。
* 优化了在使用原生水平标签页布局时，侧栏标题栏与主题背景颜色之间的显示兼容性。

**v3.6.7**
* 优化了 `uc.flex.auto-hide-navbar-icons` 的显示逻辑。现在即使鼠标未悬停，打开菜单的按钮也会和菜单一起保持可见。
* 统一了地址栏、导航栏和书签工具栏隐藏按钮的动画效果。你可以将下列变量从 `uc-variables.css` 中复制到 `uc-user-settings.css` 并修改，以自定义转场效果：

  ```css
  --uc-autohide-navbar-icons-duration
  --uc-hover-navbar-icons-duration
  --uc-autohide-navbar-icons-type
  --uc-collapse-navbar-icons-duration
  ```

**v3.6.6**
* 修复了由于 Nightly v141 的变更导致 macOS 风格的窗口控制按钮无法显示的问题。
  * [Bug 1789579](https://bugzilla.mozilla.org/show_bug.cgi?id=1789579)
* 增加并补全了更多缺失的菜单图标。
* 新增选项 `uc.flex.auto-hide-navbar-icons`。启用后，导航栏中的工具按钮图标会默认隐藏，鼠标悬停时显示。窗口控制按钮、地址栏以及侧栏切换按钮（FlexFox 图标）会始终显示。如果侧栏按钮被移动到导航栏的中间位置（不是最左或最右），或者启用了 `uc.flex.revert-to-original-sidebar-icon` 选项，该按钮也会跟随隐藏。
* 重要更新：FlexFox 现在可以根据当前 Firefox 主题自动切换 Sidebery 的背景颜色。要启用此功能，请在 Sidebery 的设置中，将「外观」下的「配色模式」设为 “firefox”。

**v3.6.5**
* 增强了对主题的兼容性：只要不使用 Firefox 内建主题，工具栏颜色现在会自动跟随所用主题。只有在使用 Firefox Color 且未设置背景图片时，才需要手动启用 `uc.flex.allow-addons-to-change-toolbar-color` 选项。
* 修复启用 `uc.flex.enable-rounded-web-content` 时，若设置为“隐藏标签页和侧栏”且关闭垂直标签页，侧边误出现边距的问题。
* 优化扩展面板（扩展按钮汇总面板）的显示效果，使按钮更易查看和点击。  

    <img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/unified-extensions-panel.webp" alt="改进后的扩展面板布局和按钮间距" width="175px" />
* 新增 `uc.flex.menu-item-spacing` 选项，用于调整菜单项之间的间距。  
  可选字符串值如下：  
  `"1"` 或 `"small"` = 较小间距（默认值，与旧版相同）  
  `"2"` 或 `"medium"` = 中等间距  
  `"3"` 或 `"large"` = Firefox 默认的最宽间距  

  你也可以使用以下变量分别控制不同类型菜单的间距：

  ```
  --uc-app-menu-item-padding-block            // 应用菜单项间距
  --uc-menu-item-padding-block                // 书签菜单和系统菜单
  --uc-content-area-context-menu-item-padding-block // 页面右键菜单
  --uc-appMenu-zoom-controls-x-offset         // 缩放控制按钮的位置微调
  ```
* 为统一 `uc-aboutconfig.css` 和 `uc.flex.menu-item-spacing` 的设置格式，`uc.flex.findbar-position` 的取值范围已从 `"0"`–`"2"` 调整为 `"1"`–`"3"`。  
  可选字符串值包括：  
  `"1"` 或 `"top-center-left"` = 顶部左侧  
  `"2"` 或 `"top-right"` = 右上角  
  `"3"` 或 `"bottom-right"` = 右下角  
* 修复菜单中复选项（checkbox）文字错位的问题，并为更多菜单项补充图标，提升排版一致性。

**v3.6.4**
* 修复了 Nightly v141 导致的侧栏布局异常问题。
  * [Bug 1954155](https://bugzilla.mozilla.org/show_bug.cgi?id=1954155)
  * [Bug 1972060](https://bugzilla.mozilla.org/show_bug.cgi?id=1972060)
* 改进了 `uc.flex.dim-urlbar-popup-backdrop` 的显示效果，为暗背景添加了淡入动画。
* 新增选项 `uc.flex.show-flexfox-version-info-in-about-config`，启用后可在 `about:config` 页面显示当前使用的 FlexFox 版本，方便确认版本号。
* 优化了 `about:config` 页面显示，已修改的选项现在会更明显地高亮显示。如果启用了“悬停时展开侧栏”，还会在页面中显示 FlexFox 已停用垂直标签页优化的提示信息，显示时长为 12 秒。

**v3.6.3**
* `uc.flex.enable-rounded-web-content` 现在兼容在侧栏设置中启用“隐藏标签页和侧栏”的情况，确保在开发者工具固定在网页左侧或右侧时，网页内容区域依然保有适当边距。
* 修复了一个长期存在的问题：
  * 当 Sidebery 的导航栏面板数量不足一整行时，鼠标悬停在导航栏上会导致整个 Sidebery 向上偏移，引起界面抖动。
  * 这不是预期的行为，FlexFox 应该在所有状态下保持稳定。这么久没有发现，是因为我自己的使用环境中面板数量一直较多。
  * 此问题现已修复，同时也重新设计了导航栏展开的动画效果，以适配 Sidebery 自动隐藏和使用 `Lock Sidebery` 快捷键固定展开的两种情况。
  * 此次修复通过 `userContent.css` 实现，用户不需要修改 Sidebery 本体的样式，只需按正常流程更新 FlexFox 即可。

**v3.6.2**
* 提升了 `uc.flex.disable-bookmarks-autohide` 选项在多种情境下的兼容性。
* 提升了 `uc.flex.enable-rounded-web-content` 选项在水平标签页模式下使用开发者工具时的兼容性。
* 移除旧的规则和变量，改用更高效的选择器。
* 降低 Sidebery 和原生垂直标签页变量赋值时的判断开销。
* 相比 v3.6.1 性能提升约 **7%**，与默认 Firefox UI 的差距小于 2 毫秒。

**v3.6.1**
* 利用 Firefox 的新特性，移除已不再需要的 `:has()` 和 `:is()` 选择器，改用 `@media` 查询替代属性判断，并通过新的内建属性简化选择器结构。
* 实测性能变化低于 2%，属于误差范围，几乎无明显提升。
* 新增 `uc.flex.disable-bookmarks-autohide` 与“仅在新标签页显示书签工具栏”设置的兼容性。
* 提升“悬停时展开侧栏”功能在多种情况下的兼容表现。

**🔥 v3.6.0 重大性能更新**
> [!WARNING]
> * 修复了 v3.5.1 引入的严重性能下降问题。
>   * 问题源自 v3.5.1 中新增的 “圆角与悬浮式网页内容样式” 功能。
>   * 最明显的表现是在点击 “列出所有标签页” 按钮时，标签页列表的展开速度非常缓慢，通常需要 0.5 秒以上。
>   * 此外，在使用开发者工具或浏览器工具箱时，浏览器界面也会明显卡顿。
>   * 熟悉 FlexFox 历史更新的用户可能已经猜到，问题再次与 `:root:has()` 选择器有关。
> * 此性能问题现已修复，并在原有基础上做了一定优化。
> * 相比 v3.5.8，界面响应速度约提升了 **17 倍**。
> * ⬆️ 强烈建议尽快升级到此版本。

更多旧版本的更新记录请参见  
👉 [Wiki 上的历史归档页面](https://github.com/yuuqilin/FlexFox/wiki/Earlier-Update-History-(Simplified-Chinese))

<a href="#updates-top-start">⏫ 返回更新记录顶部</a>
</details>

> [!IMPORTANT]
> 如果你在使用 FlexFox 搭配 Firefox 的原生垂直标签页，请务必在「定制侧栏」设置中取消勾选 **“悬停时展开侧栏”** 选项。
>
> * 启用该选项后，FlexFox 将不会使用其优化后的垂直标签页设计，而是会回退为 Firefox 默认的布局。
> * 为获得最佳的外观和体验，建议在日常使用中 **保持该选项处于未勾选状态**。
> * 如果你需要使用原生功能（如可调节的标签页宽度），可以根据个人习惯或使用需求灵活启用此选项。

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

### 🚀 方法一：自动安装与更新

> [!IMPORTANT]
> 如果是首次安装 FlexFox，请在运行脚本后继续执行 [方法二](https://github.com/yuuqilin/FlexFox?tab=readme-ov-file#-method-2-manual-installation) 中第 5 步开始的手动步骤。  
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

---

### 👷 方法二：手动安装

> [!IMPORTANT]  
> 1. 安装 [Sidebery](https://addons.mozilla.org/firefox/addon/sidebery/)（可选，但推荐）。  
> 2. 下载对应版本的 FlexFox：
>    - [FlexFox](https://github.com/yuuqilin/FlexFox/archive/refs/heads/main.zip)：标准版 Firefox 使用  
>    - [FlexFox Beta](https://github.com/yuuqilin/FlexFox/archive/refs/heads/Beta.zip)：Firefox Beta / Nightly 使用  
>    - [FlexFox ESR](https://github.com/yuuqilin/FlexFox/archive/refs/heads/ESR.zip)：Firefox ESR 使用  
> 3. 打开 `about:support`，找到 **配置文件夹**，点击 **打开文件夹**。  
> 4. 将 `chrome` 文件夹和 `scripts` 文件夹中的 `user.js` 文件复制到配置文件夹中。  
> 5. *(可选)* 使用文本编辑器打开 `user.js`，删除注释 `//` 以启用额外功能。
>    - 确保以下设置保持为 `true`：
>      - `toolkit.legacyUserProfileCustomizations.stylesheets`  
>      - `svg.context-properties.content.enabled`  
> 6. 重启 Firefox，然后删除 `user.js` 文件，以便后续对 `about:config` 的更改能被正常保存。  
> 7. 配置 Sidebery：
>    - 点击侧边栏齿轮图标进入设置  
>    - 前往 `帮助` > `导入插件数据`，导入下载包中的 `sidebery-settings.json` 和 `sidebery-styles.json`  
>    - *注意*：如果设置未生效，请尝试重新导入一次  
> 8. *(可选)* 在 `about:config` 中搜索 `uc.flex.`，按需启用或关闭功能。  

## ⚙️ 配置选项

### 📜 用户自定义样式（`uc-user-settings.css` 和 `uc-custom-content.css`）

> [!TIP]  
> 无需修改核心文件，即可自定义 Firefox 的界面样式与网页内容样式。
>
> 操作方式如下：
>
> - 若需修改 **浏览器界面（chrome）**，请在 `components` 文件夹中创建名为 `uc-user-settings.css` 的文件。  
> - 若需修改 **网页内容（content）**，请在 `content` 文件夹中创建名为 `uc-custom-content.css` 的文件。  
>
> 可将需要更改的变量或样式（如从 `uc-variables.css` 中）复制至上述文件中进行个性化调整。这两个文件会在内建样式之后加载，确保自定义设置优先生效。
>
> 这两个文件 **不属于 FlexFox 项目的默认内容**，因此在更新版本时不会被覆盖。自定义配置可长期保留，无需担心升级带来的影响。
>
> 💡 如果复制的是像 `:root` 或 `:root:has(...)` 这样的选择器中的内容，为了保证语法和上下文正确，请记得一并复制整个选择器块。

### 🧩 可配置的首选项（`about:config`）

#### 🪄 添加或启用选项

| 配置选项 | 说明 |
|----------|------|
| `uc.flex.add-ui-text-stroke` | 为界面文字添加粗描边，提高低分辨率屏幕下的可读性。 |
| `uc.flex.fully-hide-sidebery` | 完全隐藏 Sidebery 和原生垂直标签页，将鼠标移至屏幕边缘时自动显示。 |
| `uc.flex.fully-hide-toolbox` | 完全隐藏顶部所有工具栏（标签栏、导航栏、书签工具栏），将鼠标移至屏幕顶部时自动显示。 |
| `uc.flex.auto-hide-navbar-icons` | 默认隐藏导航栏中的图标，鼠标悬停在工具栏上时会显示。窗口控制按钮、地址栏和侧栏按钮（FlexFox 图标）始终显示，但当侧栏按钮未放在导航栏边缘，或启用了 `uc.flex.revert-to-original-sidebar-icon` 时，也会一并隐藏。 |
| `uc.flex.allow-addons-to-change-toolbar-color` | 允许 Firefox Color 等扩展修改工具栏的颜色（在未设置背景图时需要启用）。 |
| `uc.flex.enable-gradient-highlight` | 为 FlexFox 图标、侧栏彩带、书签星形图标等主要界面元素中使用的高亮颜色启用渐变样式。此选项接受数值设置：`0` 表示关闭渐变，`1` 到 `X` 表示切换不同的渐变样式。 |
| `uc.flex.enable-colored-bookmarks-folder-icons` | 启用彩色书签文件夹图标。此选项为数值类型：`0` 表示关闭，`1` 使用第一组图标，`2` 使用第二组图标（并自动隐藏标签）。 |
| `uc.flex.remove-bookmarks-folder-icons` | 移除书签文件夹的图标。 |
| `uc.flex.remove-bookmarks-labels` | 移除书签文件夹的文字标签。 |
| `uc.flex.show-flexfox-version-info-in-about-config` | 在 `about:config` 頁面顯示 FlexFox 已安裝的提示訊息，並附帶當前版本號。 |
| `uc.flex.show-pin-tabs-separator-in-expanded-state` | 在原生垂直标签页处于“展开模式”时，在已固定的标签页和普通标签页之间显示分隔线（默认情况下该分隔线为隐藏）。 |
| `uc.flex.dim-urlbar-popup-backdrop` | 当地址栏展开下拉列表时使背景变暗。此选项接受数值 `0`（关闭）到 `2`，数值越大，背景越暗。 |
| `uc.flex.move-pip-volume-to-top` | 将画中画（PiP）窗口中的音量控制按钮移至顶部。 |
| `uc.flex.enable-rounded-web-content` | 为网页内容区域添加边距、阴影和圆角效果。此选项为数值型，接受 `0`（关闭）到 `2`，数值越大，边距越宽。 |

#### 🚫 停用或还原选项

| 配置选项 | 说明 |
|----------|------|
| `uc.flex.disable-flexfox` | 无需重启 Firefox 即可停用所有 FlexFox 样式和功能。 |
| `uc.flex.skip-loading-uc-*.css`  | 跳过加载 `./components/` 和 `./content/` 中的特定 `uc-*.css` 文件。例如将 `uc.flex.skip-loading-uc-newtab.css` 设置为 true 时，将不会加载 `./content/uc-newtab.css` 文件。 |
| `uc.flex.disable-bookmarks-autohide` | 停用书签工具栏的自动隐藏功能。 |
| `uc.flex.disable-tabs-toolbar-autohide` | 当 Sidebery 处于非活动状态时，防止原生水平标签栏自动隐藏。 |
| `uc.flex.disable-findbar-autohide` | 防止查找栏（Findbar）在失去焦点后自动隐藏。 |
| `sidebar.visibility`（`always-show`） | Firefox 的原生设置。当设置为 `always-show` 时，Firefox 自带的垂直标签页自动折叠功能将会停用，FlexFox 的自动折叠功能将接管。相比原生功能，FlexFox 的动画更流畅，折叠后的布局更整洁，对固定标签页的处理也更加合理。你也可以通过取消勾选侧栏设置中的 **“悬停时展开侧栏”** 来切换此功能。 |
| `sidebar.visibility`（`expand-on-hover`） | 当设置为 `expand-on-hover` 时，将恢复 Firefox 原生的垂直标签页自动折叠行为，同时会关闭 FlexFox 的自动折叠功能。此功能也可以通过勾选 **“悬停时展开侧栏”** 来启用。在此模式下，原生垂直标签页和 Sidebery 都可以通过快捷键 <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>Z</kbd> 或侧栏开关按钮，在自动折叠和保持展开之间切换。 |
| `sidebar.animation.expand-on-hover.duration-ms` | Firefox 原生设置，用于控制在 `sidebar.visibility` 设置为 `expand-on-hover` 时，原生垂直标签页展开和折叠的动画速度。 |
| `uc.flex.disable-sidebery-autohide` | 禁用 Sidebery 和原生垂直标签页的自动折叠功能。 |
| `uc.flex.disable-nav-bar-first-item-right-padding` | 默认情况下，FlexFox 会在导航栏第一个图标后添加右侧间距，以优化垂直标签页与周围项目之间的视觉间隔和对齐。此选项可停用该间距。 |
| `uc.flex.disable-menu-icons` | 停用 FlexFox 添加的自定义选单图标。 |
| `uc.flex.revert-to-original-window-controls` | 将 FlexFox 使用的 macOS 风格窗口按钮恢复为 Firefox 默认的最小化、最大化、关闭按钮。 |
| `uc.flex.revert-to-original-flat-corner-style` | 将 URL 栏、搜索栏和查找栏的圆角样式恢复为 Firefox 默认的较平角设计，替代 FlexFox 使用的大圆角样式。 |
| `uc.flex.revert-to-original-bookmark-star-icon` | 将 FlexFox 使用的书签星形图标恢复为 Firefox 默认设计。 |
| `uc.flex.revert-to-original-sidebar-icon` | 将 FlexFox 使用的侧栏按钮图标恢复为 Firefox 默认设计。 |
| `uc.flex.remove-sidebar-stripe` | Sidebery 激活时移除侧边栏彩带。若需切换侧边栏工具，垂直标签页模式下可按 <kbd>F1</kbd> 显示侧边栏工具按钮，水平标签页模式下可按 <kbd>Ctrl</kbd> + <kbd>B</kbd> 恢复显示侧边栏表头。 |

#### 🪛 修改或调整选项

| 配置选项 | 说明 |
|----------|------|
| `uc.flex.increase-sidebery-expanded-width` | 增加 Sidebery 展开时的宽度；启用 `uc.flex.disable-sidebery-autohide` 或激活 `Lock Sidebery` 时，也会同步增加原生垂直标签页的展开宽度。 |
| `uc.flex.increase-navbar-height` | 恢复旧版 FlexFox 中使用的较厚导航栏高度。此更改会覆盖当前默认值（与 Firefox 原始的紧凑高度一致）。 |
| `uc.flex.switch-to-alternate-condensed-panel` | 默认情况下，FlexFox 会将原生扩展面板替换为仅显示图标的面板，此时可通过右键点击图标访问扩展设置。启用此选项后，将切换为包含扩展名称和设置按钮的简洁面板，提供更具说明性的视图。 |
| `uc.flex.sidebery-fast-hover-expand` | 加快 Sidebery 与原生垂直标签页的自动展开/折叠速度。 |
| `uc.flex.sidebery-slow-hover-expand` | 减慢 Sidebery 与原生垂直标签页的自动展开/折叠速度。 |
| `uc.flex.max-visible-vertical-pinned-tabs` | 设置原生垂直标签页中每列可显示的固定标签页数量上限（可选值为数值，范围 4–6）。超过该值时将出现滚动条，可根据使用习惯进行调整。 |
| `uc.flex.findbar-position` | 设置查找栏的位置。可选值为字符串：`"top-center-left"` 或 `"1"`（顶部左侧），`"top-right"` 或 `"2"`（右上角），`"bottom-right"` 或 `"3"`（右下角）。 |
| `uc.flex.menu-item-spacing` | 设置 Firefox 的应用菜单、书签菜单和右键菜单中项目之间的垂直间距。可选值为字符串 `"1"` 或 `"small"`（较小间距）、`"2"` 或 `"medium"`（默认间距）、`"3"` 或 `"large"`（较大间距）。 |

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
