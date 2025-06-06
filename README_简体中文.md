# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox（简体中文版）

<div>
 <a href='https://www.mozilla.org'><img src="https://img.shields.io/badge/Last%20tested%20Firefox-v141-orange?logo=firefox"></a>
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

**🦊 v3.5.6**
* 修复了在侧边栏置于右侧、且启用 `uc.flex.fully-hide-sidebery`、使用 `Hide Sidebery` 快捷键或进入全屏模式时出现的多个显示异常。
* 重构了右侧侧边栏的排版逻辑，简化了规则，减少判断流程的复杂性。

<details>  
<summary>🪄 <b>重大更新：圆角与悬浮式网页内容样式</b> <i>《点击展开》</i> 👇</summary>

新增了视觉选项 `uc.flex.enable-rounded-web-content`，可以为网页内容区域添加边距、圆角和阴影效果，让页面呈现出卡片式、浮起的柔和视觉风格，灵感来源于 Zen 和 Microsoft Edge 的界面设计。

该选项支持从 `0`（关闭）到 `2` 的数值，数值越高，页面周围的边距越宽。

也可以通过以下变量进一步调整显示效果：

* `--uc-web-content-margin-small`
* `--uc-web-content-margin-large`
* `--uc-web-content-radius-box`

以下是启用该功能后（`uc.flex.enable-rounded-web-content = 1`）的效果预览图：

<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/flexfox-rounded-web-content.webp" alt="Rounded web content preview in FlexFox" width="96%" />

</details>

<details>  
<summary>🪄 <b>重大更新：支持还原原生平角风格</b> <i>《点击展开》</i> 👇</summary>

现在可以通过启用 `uc.flex.revert-to-original-flat-corner-style` 选项，将界面样式切换回 Firefox 默认的平直角风格，替代 FlexFox 的圆角设计。如果你偏好更加简洁、锐利的视觉效果，这个选项非常适合。

此外，还可以通过修改 `uc-variables.css` 中该选项下的 `*-radius` 变量，自定义地址栏、搜索栏和查找栏的圆角大小，实现更精细的个性化调整。

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
<summary>🚀 <b>重大更新：原生垂直选项卡现支持完全隐藏与保持展开模式</b> <i>《点击展开》</i> 👇</summary>

- `uc.flex.fully-hide-sidebery` 选项与 `Hide Sidebery` 快捷键现在也适用于原生垂直选项卡，可将其完全隐藏。
- 进入全屏模式（<kbd>F11</kbd>）时，原生垂直选项卡也会随之自动隐藏。
- 在窗口未最大化时，变量 `--uc-hover-sidebar-trigger-width` 现在也适用于原生垂直选项卡，可同时控制其触发区域。
- `uc.flex.disable-sidebery-autohide` 选项与 `Lock Sidebery` 快捷键现在也适用于原生垂直选项卡，可使其保持展开状态。
- 至此，所有适用于 Sidebery 的设置（如显示/隐藏速度）也会同步应用于原生垂直选项卡，实现一致的操作体验。

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
<summary>🚀 <b>重大更新：支持通过快捷键切换 UI 布局</b> <i>《点击展开》</i> 👇</summary>

FlexFox 现在支持扩展 [UserChrome Toggle Extended](https://addons.mozilla.org/firefox/addon/userchrome-toggle-extended/)。
安装并按下图设置：  
<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/userchrome-toggle-extended.webp" alt="userchrome-toggle-extended.webp" width="65%" />  
设置后，别忘了点击左上角的 `Apply changes` 按钮，否则设置不会生效。

完成设置后，可通过快捷键切换四种 UI 布局模式：

| 快捷键 | 标签 | 功能说明 |
| ------ | ---- | ------- |
| <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>1</kbd> | Lock Sidebery | 切换 Sidebery 和原生垂直选项卡的自动折叠与保持展开状态，保持展开的布局效果与选项 `uc.flex.disable-sidebery-autohide` 相同。 |
| <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>2</kbd> | Hide Topbar | 切换是否完全隐藏顶部工具栏（标签页、导航栏、书签栏），隐藏时鼠标移到屏幕上方边缘可自动显示。对应选项 `uc.flex.fully-hide-toolbox`。 |
| <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>3</kbd> | Hide Sidebery | 切换是否完全隐藏 Sidebery 和原生垂直选项卡。隐藏时鼠标移到屏幕边缘可自动显示。对应选项 `uc.flex.fully-hide-sidebery`。                                                      |
| <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>4</kbd> | Hide All      | 切换是否隐藏所有工具栏和侧边栏（Sidebery 或原生垂直选项卡），只显示网页内容。隐藏时将鼠标移到屏幕边缘可自动显示。相当于 `uc.flex.fully-hide-toolbox` + `uc.flex.fully-hide-sidebery` 的组合效果。 |

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

**v3.5.5**
* 修复 Sidebery 放在右侧，并启用 `uc.flex.disable-sidebery-autohide`、快捷键 `Hide Sidebery` 或进入全屏模式时，展开侧边栏彩带后，彩带中的工具按钮显示错位的问题。
* 导航栏高度已调整为 Firefox 默认值，整体界面更为紧凑。而在旧版 FlexFox 中，导航栏高度更高，在视觉上与侧边栏的宽度更为接近。
* 新增选项 `uc.flex.increase-navbar-height`，启用后可将导航栏高度恢复为旧版 FlexFox 的样式。

**v3.5.4**
* 提升了兼容性：当启用快捷键 `Lock Sidebery` 或设定 `uc.flex.disable-sidebery-autohide` 固定原生垂直选项卡为展开状态时，即使通过侧边栏按钮切换为折叠状态，原生垂直选项卡的版式也不会错乱，能保持一致的显示效果。
* 启用 `Lock Sidebery` 后，原生垂直选项卡的宽度现在会与 Sidebery 保持一致，切换时不会因宽度变化而造成画面跳动。同时，在此状态下启用 `uc.flex.increase-sidebery-expanded-width`，也会一并扩大原生面板的展开宽度。

**v3.5.3**
* 修复了 v3.5.2 引入的问题：启用 `uc.flex.enable-rounded-web-content` 时，开发者工具面板在嵌入主窗口时无法调整大小。
* 优化了地址栏的显示与行为：
  * 修复了地址栏中权限相关图标（如定位请求、通知、摄像头/麦克风共享等）的错位问题。
  * 当鼠标未悬停时，隐藏更多图标，使默认状态下更简洁。
  * 确保阅读模式和画中画图标在功能启用时始终显示。
* 改进了 `uc-pdf.js.css` 的 PDF 检测与样式支持。现在不仅支持本地 PDF 文件，也能正确识别并样式化一些虽然 URL 不以 `.pdf` 结尾、但页面本身是 PDF 查看器的学术网站。
* 过去使用 `Lock Sidebery` 快捷键将 Sidebery 保持展开时，悬停动画会导致页面元素发生轻微抖动，通常需要启用 `uc.flex.disable-sidebery-hover-animations` 选项来规避这个问题。现在通过改进行为判断机制，在 Sidebery 固定展开时会自动停用悬停动画，无需额外设置，因此该选项已不再需要，相关设置也已被移除。

**v3.5.2**
* 修复启用 `uc.flex.move-pip-volume-to-top` 时，画中画窗口的音量滑块长度过短的问题。
* 新增选项 `uc.flex.disable-flexfox`，可在 Firefox 运行中立即停用所有 FlexFox 样式与功能。
* 新增选项 `uc.flex.skip-loading-uc-*.css`，允许选择性跳过加载位于 `./components/` 和 `./content/` 目录下的特定 `uc-*.css` 文件。例如设置 `uc.flex.skip-loading-uc-newtab.css` 为 true，可跳过加载 `./content/uc-newtab.css` 文件。

**v3.5.1**
* 修复 v3.4.7 引入的回归问题：当启用 `uc.flex.disable-sidebery-autohide` 或使用快捷键 `Lock Sidebery` 时，原生垂直选项卡在悬停时会发生闪烁，若分栏在右侧时，展开位置也会异常。
* 让画中画 (PiP) 的音量控制按钮始终可见。致谢 Reddit 用户 u/endgame0。
* 新增选项 `uc.flex.move-pip-volume-to-top`，将 PiP 的音量按钮移至上方（布尔值）。致谢 Reddit 用户 u/endgame0。
* 新增选项 `uc.flex.dim-urlbar-popup-backdrop`，在地址栏下拉建议列表展开时暗化背景。支持数值 `0`（关闭）至 `2`，数值越大，背景越暗。
* 新增选项 `uc.flex.enable-rounded-web-content`，为网页内容区域添加边距、圆角和阴影。可设置为 `0`（关闭）至 `2`，数值越大，边距越宽。启用后，网页内容呈现出柔和的卡片式悬浮感，整体视觉风格类似 Zen 或 Microsoft Edge 浏览器。
  可通过以下变量快速调整外观：`--uc-web-content-margin-small`、`--uc-web-content-margin-large` 和 `--uc-web-content-radius-box`。

  下图为 `uc.flex.enable-rounded-web-content` 设为 `1` 时的 FlexFox 显示效果：
  
  <img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/flexfox-rounded-web-content.webp" alt="FlexFox 卡片式网页显示效果预览" width="96%" />

**v3.5.0**
* 修复了在 Firefox v141 及以上版本中，原生垂直选项卡的固定标签显示为垂直排列的问题（应为水平排列）。
* 修复了当固定标签数量少于 4 个时，标签宽度溢出的问题。
* 修复了当侧边栏工具按钮少于 6 个时，设置按钮位置不对齐，以及工具栏展开方向错误的问题（原本应水平展开，却变为垂直）。
* 统一了原生垂直选项卡中侧边栏工具按钮的排列样式。无论 Sidebery 是否启用，侧边栏是否展开，按钮数量是多是少，展开或折叠状态下，均能保持一致、整齐的间距与布局。

**v3.4.10**
* 修复了查找栏背景颜色显示异常的问题。

**v3.4.9**
* 修复了 v3.4.8 中地址栏在鼠标悬停时无法显示外框的问题。
* 新标签页的搜索框也已支持 `uc.flex.revert-to-original-flat-corner-style` 选项，可还原为 Firefox 默认的圆角样式。

**v3.4.8**
* 修复了在地址栏聚焦时，地址栏与下拉建议列表边缘未对齐的问题。
* 新增选项 `uc.flex.revert-to-original-flat-corner-style`，设置为 `true` 后可关闭 FlexFox 的圆角设计，还原为 Firefox 默认的较平缓圆角风格。你也可以在 `uc-variables.css` 中调整该选项下的 `*-radius` 变量，自定义地址栏、搜索框和查找栏的圆角大小。

  <img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/firefox-original-flat-corner-style.webp" alt="Firefox 默认圆角样式预览" width="72%" />

**v3.4.7**
* 修复了将原生垂直选项卡放在右侧时，鼠标移到屏幕最右边无法顺畅展开的问题。
* 修复了原生垂直选项卡在右侧无法显示滚动条的问题。
* 调整了原生垂直选项卡在左侧展开时左侧留白不足的问题。

**v3.4.6**
* 修复了 Firefox v140+ 中分组标签（tab group）的尺寸和位置显示异常的问题。
* 修复了在启用 `uc.flex.show-pin-tabs-separator-in-expanded-state` 选项时，仍无法显示固定标签页与普通标签页之间分隔线的问题（v140 起结构发生变化导致该问题）。

**v3.4.5**
* 修复 v3.4.3 引入的回归问题：在原生垂直选项卡处于折叠模式时，显示宽度异常。

**v3.4.4**
* 修复了 Nightly v140 中 Sidebery 无法展开的问题。
* 增强了对主题的兼容性：如果主题设置了背景图片（包括透明图片），FlexFox 会自动允许主题覆盖内建配色，无需手动启用 `uc.flex.allow-addons-to-change-toolbar-color` 选项。
* 支持 [Firefox Color](https://color.firefox.com/)，用户现在可以自由调整浏览器界面配色。

  * 请在 Firefox Color 网站中的「Custom backgrounds」标签页中选择任意一张背景图片，FlexFox 就会允许 Firefox Color 覆盖内建配色方案。
  * Firefox Color 内置的部分「Preset themes」主题没有背景图。要让这些主题完全生效，请选择一张背景图，或手动启用 `uc.flex.allow-addons-to-change-toolbar-color` 选项。否则只会改变文字颜色，工具栏等背景颜色则不会变动。

<p>这是使用 Firefox Color 套用 <a href="https://github.com/rose-pine/firefox">Rosé Pine Moon</a> 主题后的 FlexFox 显示效果：</p>
<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/firefox-color-rose-pine-moon.webp" alt="FlexFox with Rosé Pine Moon theme" width="96%" />

**v3.4.3**
* 修复启用 `uc.flex.add-ui-text-stroke` 时，Sidebery 误用指定字体的问题。
* 修复在使用水平标签页时，导航栏第一个元素后方多出不必要的空白的问题。
* 提升在仅启用新版侧边栏但未启用原生垂直选项卡时的兼容性：

  * 侧边栏彩带现在能正确显示高亮颜色
  * 彩带展开时设置按钮不再发生偏移

> [!NOTE]
> 注意：不推荐在未启用原生垂直选项卡的情况下单独使用新版侧边栏，因为 FlexFox 的优化是基于垂直选项卡模式设计的。

**v3.4.2**
- 修复在 Firefox v138 中使用原生垂直选项卡的保持展开模式时出现的布局问题。由于宽度处理不正确，导致悬停时抖动，以及书签工具栏未能正确对齐。

**v3.4.1**
- 修复完全隐藏 Sidebery 时，侧边栏彩带展开高度不正确的问题。
- 修复侧边栏在右侧且原生垂直选项卡完全隐藏时，展开宽度不正确的问题。
- 修复同时启用 `uc.flex.disable-native-vertical-tabs-autohide` 和 `uc.flex.fully-hide-sidebery` 时，原生垂直选项卡无法展开的问题。
- 废弃 `uc.flex.disable-native-vertical-tabs-autohide` 选项。现在使用 `uc.flex.disable-sidebery-autohide` 可统一控制 Sidebery 和原生垂直选项卡是否保持展开。

**v3.4.0**
- 修复使用快捷键切换完全隐藏 Sidebery 时，鼠标触发区域的宽度无法按 `--uc-hover-sidebar-trigger-width` 自定义设置生效的问题。
- 重要更新：FlexFox 现已支持完全隐藏 **原生垂直选项卡**。
  现有选项 `uc.flex.fully-hide-sidebery` 和快捷键 `Hide Sidebery` 除了可以隐藏 Sidebery，也同样适用于 Firefox 自带的垂直选项卡。此外，进入全屏模式（<kbd>F11</kbd>）时也会自动隐藏原生垂直选项卡。
  在窗口未最大化时，`--uc-hover-sidebar-trigger-width` 除了控制 Sidebery 的触发宽度，也用于原生垂直选项卡的触发区域。至此，所有适用于 Sidebery 的相关设置（如显示/隐藏速度）也会同步应用于原生垂直选项卡，实现一致的行为体验。

更多旧版本的更新记录请参见  
👉 [Wiki 上的历史归档页面](https://github.com/yuuqilin/FlexFox/wiki/Earlier-Update-History-(Simplified-Chinese))

<a href="#updates-top-start">⏫ 返回更新记录顶部</a>
</details>

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
  > *垂直选项卡展开时，会在原位横向伸展，垂直位置保持不变，鼠标无需重新定位目标标签页。*

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
| `uc.flex.fully-hide-sidebery` | 完全隐藏 Sidebery 和原生垂直选项卡，将鼠标移至屏幕边缘时自动显示。 |
| `uc.flex.fully-hide-toolbox` | 完全隐藏顶部所有工具栏（标签栏、导航栏、书签工具栏），将鼠标移至屏幕顶部时自动显示。 |
| `uc.flex.allow-addons-to-change-toolbar-color` | 允许主题或扩展修改工具栏的背景颜色或背景图。 |
| `uc.flex.enable-gradient-highlight` | 为 FlexFox 图标、侧栏彩带、书签星形图标等主要界面元素中使用的高亮颜色启用渐变样式。此选项接受数值设置：`0` 表示关闭渐变，`1` 到 `X` 表示切换不同的渐变样式。 |
| `uc.flex.enable-colored-bookmarks-folder-icons` | 启用彩色书签文件夹图标。此选项为数值类型：`0` 表示关闭，`1` 使用第一组图标，`2` 使用第二组图标（并自动隐藏标签）。 |
| `uc.flex.remove-bookmarks-folder-icons` | 移除书签文件夹的图标。 |
| `uc.flex.remove-bookmarks-labels` | 移除书签文件夹的文字标签。 |
| `uc.flex.show-pin-tabs-separator-in-expanded-state` | 在原生垂直选项卡处于“展开模式”时，在已固定的标签页和普通标签页之间显示分隔线（默认情况下该分隔线为隐藏）。 |
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
| `sidebar.visibility`（`always-show`） | Firefox 的原生设置。当设置为 `always-show` 时，Firefox 自带的垂直选项卡自动折叠功能将会停用，FlexFox 的自动折叠功能将接管。相比原生功能，FlexFox 的动画更流畅，折叠后的布局更整洁，对固定标签页的处理也更加合理。你也可以通过取消勾选侧栏设置中的 **“悬停时展开侧栏”** 来切换此功能。 |
| `sidebar.visibility`（`expand-on-hover`） | 当设置为 `expand-on-hover` 时，将恢复 Firefox 原生的垂直选项卡自动折叠行为，同时会关闭 FlexFox 的自动折叠功能。此功能也可以通过勾选 **“悬停时展开侧栏”** 来启用。在此模式下，原生垂直选项卡和 Sidebery 都可以通过快捷键 <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>Z</kbd> 或侧栏开关按钮，在自动折叠和保持展开之间切换。 |
| `sidebar.animation.expand-on-hover.duration-ms` | Firefox 原生设置，用于控制在 `sidebar.visibility` 设置为 `expand-on-hover` 时，原生垂直选项卡展开和折叠的动画速度。 |
| `uc.flex.disable-sidebery-autohide` | 禁用 Sidebery 和原生垂直选项卡的自动折叠功能。 |
| `uc.flex.disable-nav-bar-first-item-right-padding` | 默认情况下，FlexFox 会在导航栏第一个图标后添加右侧间距，以优化垂直选项卡与周围项目之间的视觉间隔和对齐。此选项可停用该间距。 |
| `uc.flex.disable-menu-icons` | 停用 FlexFox 添加的自定义选单图标。 |
| `uc.flex.revert-to-original-window-controls` | 将 FlexFox 使用的 macOS 风格窗口按钮恢复为 Firefox 默认的最小化、最大化、关闭按钮。 |
| `uc.flex.revert-to-original-flat-corner-style` | 将 URL 栏、搜索栏和查找栏的圆角样式恢复为 Firefox 默认的较平角设计，替代 FlexFox 使用的大圆角样式。 |
| `uc.flex.revert-to-original-bookmark-star-icon` | 将 FlexFox 使用的书签星形图标恢复为 Firefox 默认设计。 |
| `uc.flex.revert-to-original-sidebar-icon` | 将 FlexFox 使用的侧栏按钮图标恢复为 Firefox 默认设计。 |

#### 🪛 修改或调整选项

| 配置选项 | 说明 |
|----------|------|
| `uc.flex.increase-sidebery-expanded-width` | 增加 Sidebery 展开时的宽度；启用 `uc.flex.disable-sidebery-autohide` 或激活 `Lock Sidebery` 时，也会同步增加原生垂直选项卡的展开宽度。 |
| `uc.flex.increase-navbar-height` | 恢复旧版 FlexFox 中使用的较厚导航栏高度。此更改会覆盖当前默认值（与 Firefox 原始的紧凑高度一致）。 |
| `uc.flex.switch-to-alternate-condensed-panel` | 默认情况下，FlexFox 会将原生扩展面板替换为仅显示图标的面板，此时可通过右键点击图标访问扩展设置。启用此选项后，将切换为包含扩展名称和设置按钮的简洁面板，提供更具说明性的视图。 |
| `uc.flex.sidebery-fast-hover-expand` | 加快 Sidebery 与原生垂直选项卡的自动展开/折叠速度。 |
| `uc.flex.sidebery-slow-hover-expand` | 减慢 Sidebery 与原生垂直选项卡的自动展开/折叠速度。 |
| `uc.flex.max-visible-vertical-pinned-tabs` | 设置原生垂直选项卡中每列可显示的固定标签页数量上限（可选值为数值，范围 4–6）。超过该值时将出现滚动条，可根据使用习惯进行调整。 |
| `uc.flex.findbar-position` | 设置查找栏的位置。可选值为字符串：`"top-center-left"` 或 `"0"`（顶部左侧），`"top-right"` 或 `"1"`（右上角），`"bottom-right"` 或 `"2"`（右下角）。 |

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
