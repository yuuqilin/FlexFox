# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox 更新日志

[English](./CHANGELOG.md) | [日本語](./CHANGELOG_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md) | [简体中文](./CHANGELOG_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md)

## 🆕 更新内容

## 🦊 v7.1.0

> [!IMPORTANT]
> v7.0.0 引入了多个新功能和不兼容变更。如果此前错过，可以在此查看更新日志。
>
> [English](./CHANGELOG.md#-v700---nova-ui-edition) | [日本語](./CHANGELOG_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md#-v700---nova-ui-edition) | [简体中文](./CHANGELOG_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md#-v700---nova-ui-edition)

> [!IMPORTANT]
> Firefox 157 将默认启用 Nova UI。
>
> FlexFox 将在下一次版本更新时，随 Firefox 一同停止支持 Firefox ESR 140，之后仅支持 ESR 153 及更新版本。最后一版兼容 ESR 140 的源代码将冻结并移至 `ESR-v140` 分支。
>
> 下个版本也将不再兼容 Sidebery 样式编辑器中遗留的 v6 之前的 FlexFox 旧样式。如果尚未删除，请在**升级到下一个 FlexFox 版本之前**清除这些样式。具体操作请参阅[从 v6 之前的版本升级](./USAGE_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md#-从-v6-之前的版本升级)。

### 新增

- **体验优化：** 新增 `uc.flex.show-native-vertical-tabs-on-sidebar-stripe-hover`，使用 Sidebery 时，悬停侧栏彩带即可打开完整的原生垂直标签页面板。

  - 默认情况下，FlexFox 仅在悬停彩带时展开侧栏工具按钮，以免与 Sidebery 的标签页列表重复显示。
  - Firefox 尚未向扩展开放分屏视图、标签页便笺等原生功能所需的 API，因此 Sidebery 暂时无法直接使用这些功能。通常需要按 <kbd>F1</kbd> 切换到原生垂直标签页，再按一次 <kbd>F1</kbd> 才能返回 Sidebery。
  - 侧栏切换按钮（Firefox 标志）在**展开模式**下显示彩色图标，在**折叠模式**下显示灰色图标。
  - 启用此选项后，在展开模式下悬停侧栏彩带，即可打开完整的原生垂直标签页面板，无需切换离开 Sidebery。处于折叠模式或启用 `uc.flex.remove-sidebar-stripe` 移除彩带时，此选项不生效。
  - 如果使用 Mica 或自定义壁纸，并启用了 `uc.flex.sidebery-allow-resizable-width`，当侧栏切换按钮处于展开模式时，Sidebery 的宽度不能调整得比 `uc.flex.sidebery-expand-width` 指定的宽度更窄。未使用 Mica 或壁纸时，不受此限制。

- **兼容性：** 新增对 Sidebery Nightly（v5.6.1.5）的支持。这个尚未正式发布的版本包含多项不兼容旧版的变更，如果不进行适配，FlexFox 的部分样式和功能将无法正常工作。[Commit 6228919](https://github.com/mbnuqw/sidebery/commit/622891943b4ace519b827bf67eed9da07b8b6f4b) [Commit 43944c7](https://github.com/mbnuqw/sidebery/commit/43944c74e965d5ee9687696d2698da55bfd684a1)

### 改进

- 地址栏内图标按钮的圆角现在会跟随 `uc.flex.style-toolbar-items-border-radius` 的设置。
- 在水平标签页模式下，现在也可以通过 `Hide Sidebery` 隐藏侧栏工具按钮。使用 `Hide All` 或进入 <kbd>F11</kbd> 全屏模式时，这些按钮也会自动隐藏，鼠标靠近屏幕边缘时则会重新显示。
- 重构侧栏工具按钮的布局处理。
- 重构侧栏的堆叠顺序（`z-index`）处理。

### 修复

- 修复 Sidebery 标签页拖拽时无法移动，或被移动到错误位置的问题。[Issue #49](https://github.com/yuuqilin/FlexFox/issues/49)
- 修复 Firefox 154 变更导致在 <kbd>F11</kbd> 全屏模式下无法展开原生垂直标签页的问题。[Bug 2052711](https://bugzilla.mozilla.org/show_bug.cgi?id=2052711) [Bug 2054085](https://bugzilla.mozilla.org/show_bug.cgi?id=2054085)
- 修复 Firefox 156 变更导致水平标签页模式下侧栏工具按钮未居中对齐的问题。[Bug 2049659](https://bugzilla.mozilla.org/show_bug.cgi?id=2049659)
- 修复 Firefox 158 变更导致侧栏工具按钮显示位置错误的问题。[Bug 2041030](https://bugzilla.mozilla.org/show_bug.cgi?id=2041030)
- 修复 Firefox 158 变更导致分屏视图标签页位置错乱的问题。[Bug 2068234](https://bugzilla.mozilla.org/show_bug.cgi?id=2068234)

<!-- END What's New -->

## 🦊 v7.0.1

> [!IMPORTANT]
> v7.0.0 引入了多个新功能和不兼容变更。如果此前错过，可以在此查看更新日志。
>
> [English](./CHANGELOG.md#-v700---nova-ui-edition) | [日本語](./CHANGELOG_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md#-v700---nova-ui-edition) | [简体中文](./CHANGELOG_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md#-v700---nova-ui-edition)

### 修复

- **严重：** 修复 Firefox 157 兼容性问题导致地址栏损坏，并可能使浏览器完全无法使用的问题。[Bug 2065901](https://bugzilla.mozilla.org/show_bug.cgi?id=2065901)

  - 修复启用 `uc.flex.move-urlbar-popup-to-center` 后输入框消失，导致导航工具栏和网页内容位置错乱的问题。
  - 修复启用 `uc.flex.enable-translucent-urlbar-popup-and-menus` 后地址栏完全透明，且背景模糊效果失效的问题。
  - 修复启用 `uc.flex.dim-urlbar-popup-backdrop` 后无法调暗整个视口的问题。

- **严重：** 修复 Firefox 157 兼容性问题导致书签工具栏无法展开的问题。[Bug 2069885](https://bugzilla.mozilla.org/show_bug.cgi?id=2069885)
- **严重：** 修复 Firefox 158 变更导致原生标签页布局错乱的问题。[Bug 2037111](https://bugzilla.mozilla.org/show_bug.cgi?id=2037111)
- 修复 Firefox 157 变更导致标签组和分屏视图项目失去圆角的问题。[Bug 2033008](https://bugzilla.mozilla.org/show_bug.cgi?id=2033008)
- 修复 Firefox 156 变更导致关闭“悬停时展开侧栏”且侧栏处于折叠模式时，底部工具按钮上方的分隔线样式错误的问题。[Bug 2056278](https://bugzilla.mozilla.org/show_bug.cgi?id=2056278)
- 修复启用 Nova UI 时，`uc.flex.style-toolbar-items-border-radius = 1` 无法强制应用程序菜单和面板使用 Proton UI 圆角的问题。
- 修复 v7.0.0 引起的回退问题：将 `uc.flex.style-tab-items-gradient-border` 设为 `0`，并将 `uc.flex.style-tab-items-border-width` 设为 `2` 时，原生标签页的边框向内收缩并与阴影分离。
- 修复亮色模式下 Sidebery 标签页关闭按钮的颜色透明度不正确的问题。
- 修复 Sidebery 的“排列方式”设为“紧凑”或“宽松”时，底部按钮未居中的问题。

## 🦊 v7.0.0 - Nova UI Edition

> [!IMPORTANT]
> v6.6.0 引入了多个新选项和不兼容变更。如果此前错过，可以在此查看更新日志。
>
> [English](./CHANGELOG.md#-v660) | [日本語](./CHANGELOG_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md#-v660) | [简体中文](./CHANGELOG_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md#-v660)

### 新增与变更

- 新增 `uc.flex.style-urlbar-gradient`，将侧栏彩带的渐变效果应用到地址栏元素：

  ```
  0 = 关闭（默认）
  1 = 渐变图标
  2 = 渐变图标和悬停时显示的动态渐变边框
  3 = 渐变图标、悬停时显示的动态渐变边框和渐变网址文字
  ```

  渐变颜色会跟随 `uc.flex.style-sidebar-stripe-color` 的设置变化。受 [Bug 2063127](https://bugzilla.mozilla.org/show_bug.cgi?id=2063127) 影响，Firefox 155 和 156 的文字淡化效果有所不同。如需 100% 没有淡化的文字渐变效果，请新建原生偏好设置 `browser.urlbar.formatting.enabled` 并设为 `false`。

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/urlbar-gradient.webp" width="680px">

  展示图使用的设置：

  ```
  uc.flex.style-urlbar-gradient            = 3
  uc.flex.style-sidebar-stripe-color       = 9
  ```

- 新增 `uc.flex.style-tab-items-border-width`，用于设置活动标签页的边框宽度：

  ```
  0 = 无边框
  1 = 1px 边框（旧版默认值）
  2 = 2px 边框（默认）
  ```

- 新增 `uc.flex.style-tab-items-gradient-border`，用于设置活动标签页的渐变边框：

  ```
  0 = 关闭（旧版默认值）
  1 = 静态渐变（默认）
  2 = 动态渐变
  ```

  渐变颜色会跟随 `uc.flex.style-sidebar-stripe-color` 的设置变化。静态渐变是 Nova UI 的默认效果。由于 [Issue #41](https://github.com/yuuqilin/FlexFox/issues/41)，FlexFox 在正式推送前已将其设为默认启用。当 `uc.flex.style-tab-items-border-width` 设置为 `0` 时，此选项不会生效。

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/gradient-border.webp" width="300px">

  展示图使用的设置：

  ```
  uc.flex.style-tab-items-gradient-border = 2
  uc.flex.style-tab-items-background-fill = 0
  ```

- 将 `uc.flex.style-tab-items` 的取值范围扩展至 `0`-`2`，用于设置固定标签页的外观：

  ```
  0 = 不显示边框和背景填充
  1 = 仅显示边框（默认）
  2 = 仅显示背景填充
  ```

  边框和背景填充在亮色模式下使用中性色，在暗色模式下使用侧栏彩带的强调色。取值为 `2` 时，选中标签页的边框始终使用强调色。

- 新增 `uc.flex.style-tab-items-background-fill`，用于设置标签页背景填充：

  ```
  0 = 活动标签页背景透明
  1 = 活动标签页背景使用强调色（默认）
  2 = 为所有标签页添加中性色基础背景填充
  ```

  启用 `uc.flex.style-tab-items` 时，会覆盖固定标签页的基础背景色。当此选项与 `uc.flex.style-tab-items-border-width` 均设为 `0` 时，仍会保留 1px 边框。

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/background-fill.webp" width="965px">

  展示图使用的设置：`uc.flex.style-tab-items-background-fill = 2`

- 新增 `uc.flex.style-tab-items-gradient-background`，用于设置活动标签页的渐变背景：

  ```
  0 = 关闭（默认）
  1 = 静态渐变
  2 = 动态渐变
  ```

  可与渐变边框同时使用。此设置会覆盖 `uc.flex.style-tab-items-background-fill`。

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/gradient-background.webp" width="298px">

  展示图使用的设置：

  ```
  uc.flex.style-tab-items-gradient-background = 2
  uc.flex.style-tab-items-border-width        = 0
  ```

- 扩展 `uc.flex.show-tab-close-button-on-favicon-hover` 的适用范围。除原生水平标签页外，现在也支持原生垂直标签页和 Sidebery。此选项会将关闭按钮与网站图标合并，并在鼠标悬停于网站图标时显示。

- 新增 `uc.flex.style-tab-close-button-warning-zone-size`，用于显示并调整标签页关闭按钮内警示区域的尺寸：

  ```
  0 = 不显示（原生外观）
  1 = 小尺寸（默认）
  2 = 大尺寸
  ```

  启用 `uc.flex.show-tab-close-button-on-favicon-hover` 时，取值 `2` 无效，警示区域会以默认尺寸（`1`）显示。

- 新增 `uc.flex.style-tab-items-border-radius`，用于设置标签页项目采用 Proton UI 圆角或 Nova UI 大圆角：

  ```
  0 = 自动（默认）。browser.nova.enabled = true 时使用 Nova UI 圆角
  1 = 强制使用 Proton UI 圆角
  2 = 强制使用 Nova UI 圆角
  ```

  放置在水平标签栏上的“列出所有标签页”按钮也会跟随此设置。

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/border-radius.webp" width="298px">

  展示图使用的设置：

  ```
  uc.flex.style-tab-items                          = 0
  uc.flex.style-tab-close-button-warning-zone-size = 1
  ```

- 新增 `uc.flex.style-toolbar-items-border-radius`，用于设置工具栏按钮、面板项、菜单项、书签菜单项、展开的侧栏外侧上角、侧栏彩带和查找栏采用 Proton UI 圆角或 Nova UI 大圆角：

  ```
  0 = 自动（默认）。browser.nova.enabled = true 时使用 Nova UI 圆角
  1 = 强制使用 Proton UI 圆角
  2 = 强制使用 Nova UI 圆角
  ```

  `uc.flex.revert-to-original-flat-corner-style` 会覆盖上述两个圆角选项。

### 改进

- 调整固定标签页网格的留白和间距，减少拥挤感，使整体外观更加平衡、精致。

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/grid-gap.webp" width="300px">

- 为查找栏添加圆角轮廓，使其呈现悬浮效果，并与网页内容背景分离。

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/findbar-border.webp" width="923px">

- 在 `about:config` 搜索框为空时，添加“输入 `uc.flex` 可显示全部 FlexFox 偏好设置”占位提示。

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/preference-search-hint.webp" width="630px">

- 将侧栏彩带强调色的适用范围扩展至水平标签页，使其可以使用与垂直标签页一致的边框和背景颜色。
- 改进 Sidebery 分组页面的标题文字，使完整文字无论长短都能显示渐变色。

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/group-page-gradient.webp" width="214px">

### 不兼容变更

- 将 `uc.flex.skip-loading-uc-*.css` 重命名为 `uc.flex.~dev-skip-loading-uc-*.css`。

  这些选项用于跳过加载指定的 CSS 文件，以便进行问题排查。旧名称在 `about:config` 中会排列在普通选项之间，可能导致各选项的说明错位。新名称会排列在普通选项之后，因此可以随时添加开发选项而不会破坏排版。

### 修复

- 修复 Firefox 更新引起的多项样式失效和布局问题：[Bug 2049244](https://bugzilla.mozilla.org/show_bug.cgi?id=2049244)、[Bug 2055840](https://bugzilla.mozilla.org/show_bug.cgi?id=2055840)、[Bug 2046942](https://bugzilla.mozilla.org/show_bug.cgi?id=2046942)、[Bug 2033583](https://bugzilla.mozilla.org/show_bug.cgi?id=2033583)、[Bug 2044711](https://bugzilla.mozilla.org/show_bug.cgi?id=2044711)、[Bug 2045752](https://bugzilla.mozilla.org/show_bug.cgi?id=2045752)、[Bug 2054481](https://bugzilla.mozilla.org/show_bug.cgi?id=2054481)、[Bug 2023711](https://bugzilla.mozilla.org/show_bug.cgi?id=2023711)、[Bug 2022975](https://bugzilla.mozilla.org/show_bug.cgi?id=2022975)、[Bug 2052608](https://bugzilla.mozilla.org/show_bug.cgi?id=2052608)、[Bug 2034495](https://bugzilla.mozilla.org/show_bug.cgi?id=2034495)、[Bug 2029183](https://bugzilla.mozilla.org/show_bug.cgi?id=2029183)、[Bug 2046646](https://bugzilla.mozilla.org/show_bug.cgi?id=2046646)、[Bug 2039721](https://bugzilla.mozilla.org/show_bug.cgi?id=2039721)、[Bug 2047784](https://bugzilla.mozilla.org/show_bug.cgi?id=2047784)、[Bug 1998985](https://bugzilla.mozilla.org/show_bug.cgi?id=1998985)、[Bug 2063294](https://bugzilla.mozilla.org/show_bug.cgi?id=2063294)

## 🦊 v6.6.0

### 新增

https://github.com/user-attachments/assets/84a3ddf1-02f8-4c02-9957-4afcba52bf78

* 新增 `uc.flex.sidebery-expand-style`，用于设置 Sidebery 和原生垂直标签页的展开与折叠动画风格：

  ```
  1 = 均衡（`ease-in-out`；平滑且均匀，默认）
  2 = 渐进展开（`ease-out` / `ease-in`；内容会逐步呈现）
  3 = 轻快（`easeOutQuart` / `easeInQuart`；快速展开并平滑停止）
  4 = 利落有力（`easeOutExpo` / `ease-in-expo`；迅速展开并有力地折叠）
  ```

* 新增 `uc.flex.sidebery-expand-duration`，用于设置动画持续时间：

  ```
  1 = 展开 `115ms` / 折叠 `55ms`（默认）
  2 = `160ms` / `80ms`
  3 = `200ms` / `100ms`
  4 = `340ms` / `220ms`
  ```

  持续时间越长，动画风格之间的差异越明显。

* 新增 `uc.flex.sidebery-expand-delay`，用于设置鼠标悬停后 Sidebery 和原生垂直标签页开始展开前的延迟：

  ```
  0 = 无延迟
  1 = `80ms`（默认）
  2 = `160ms`
  3 = `350ms`
  4 = `460ms`
  ```

  此设置也会控制水平标签页和工具栏的展开延迟。

* 新增 `uc.flex.sidebery-expand-width`，用于设置 Sidebery 和原生垂直标签页展开后的宽度：

  ```
  1 = `220px`（默认）
  2 = `240px`
  3 = `260px`
  4 = `280px`
  ```

* 启用 Mica、壁纸或 `uc.flex.sidebery-apply-expand-speed-to-toolbars` 后，这些动画设置也会应用于水平标签页和工具栏。

* 4 个选项的默认值均为 `1`，与 v6.6 之前的默认效果相同。需要手动修改数值，才能使用新的动画风格、速度或展开宽度。

* 展示图使用的设置：

  ```
  uc.flex.sidebery-expand-delay    = 2
  uc.flex.sidebery-expand-duration = 2
  uc.flex.sidebery-expand-style    = 2
  uc.flex.sidebery-expand-width    = 2
  ```

### 不兼容变更

* 以下选项已废弃且不再生效。请从 `about:config` 中删除，以免 FlexFox 的选项说明发生错位：

  ```
  uc.flex.sidebery-fast-hover-expand
  → 已由 uc.flex.sidebery-expand-delay 取代

  uc.flex.sidebery-slow-hover-expand
  → 已由 uc.flex.sidebery-expand-delay 取代

  uc.flex.increase-sidebery-expanded-width
  → 已由 uc.flex.sidebery-expand-width 取代
  ```

* 调整了 `uc.flex.findbar-position` 的可选值：

  ```
  top-left 或 1       = 左上
  top-right 或 2      = 右上
  bottom-right 或 3   = 右下
  ```

  原有的 `top-center-left` 已不再生效。

### 改进

<img src="https://raw.githubusercontent.com/yuuqilin/media-assets/FlexFox/assets/v6.6-findbar.png" width="582px">

* 改进查找栏的外观：

  * 边缘显示更加流畅、稳定。
  * 改进 Mica 和壁纸模式下的背景模糊与阴影效果。
  * `uc.flex.style-sidebar-stripe-color-apply-to-all-icons` 现在也会为查找栏图标应用彩带颜色。

<img src="https://raw.githubusercontent.com/yuuqilin/media-assets/FlexFox/assets/v6.6-bookmark-folders.png" width="364px">

* 隐藏书签文件夹文字时，文件夹图标及其 Nova UI 悬停背景现在会居中显示。

<img src="https://raw.githubusercontent.com/yuuqilin/media-assets/FlexFox/assets/v6.6-gradient-tab-borders.png" width="330px">

* 支持 Nova UI 的渐变标签页边框，可通过 `uc.flex.style-sidebar-stripe-color` 设置颜色：

  ```
  0      = Nova UI 默认渐变色
  1～10  = FlexFox 强调色渐变
  ```
* Link Preview Panel 支持半透明背景。
* 为 `about:config` 添加 Nova UI 样式。

### 修复

#### Sidebery UI

* 调整 Sidebery 垂直导航栏的最后一个按钮，使其底部保持圆角。
* 修复 v6.5.6 引起的回退问题：Sidebery 折叠时无法正确显示当前面板图标。
* 修复 Sidebery v5.6.0 及更高版本中标签页徽章颜色错误的问题。[Commit ec84311](https://github.com/mbnuqw/sidebery/commit/ec8431190c3e42aa4f8357ca2c7aabc97db87fff)

#### Firefox UI

* 修复多个图标缺失或显示错误的问题。
* 修复 `sidebar.visibility = expand-on-hover` 时侧边栏彩带位置错误的问题。
* 修复 Firefox 154 中 `about:addons` 页面的 Nova UI 排版问题。[Bug 2051559](https://bugzilla.mozilla.org/show_bug.cgi?id=2051559)
* 修复 Firefox 154 中全屏模式下 Sidebery 和原生垂直标签页无法展开的问题。[Bug 1927457](https://bugzilla.mozilla.org/show_bug.cgi?id=1927457)
* 修复 Firefox 154 中右键菜单图标明暗色显示颠倒的问题。[Bug 2048186](https://bugzilla.mozilla.org/show_bug.cgi?id=2048186)
* 修复 Firefox 154 中查找栏排版错位的问题。[Bug 2048907](https://bugzilla.mozilla.org/show_bug.cgi?id=2048907)、[Bug 2056829](https://bugzilla.mozilla.org/show_bug.cgi?id=2056829)
* 修复 Firefox 154 中水平标签页模式下 `uc.flex.enable-rounded-web-content` 失效的问题。[Bug 2047653](https://bugzilla.mozilla.org/show_bug.cgi?id=2047653)
* 修复 Firefox 154 中标签页分组背景颜色错误的问题。[Bug 2046942](https://bugzilla.mozilla.org/show_bug.cgi?id=2046942)
* 恢复 Firefox 155 中消失的标签页分组悬停背景。[Bug 2023691](https://bugzilla.mozilla.org/show_bug.cgi?id=2023691)
* 恢复 Firefox 155 中消失的固定标签页边框和背景。[Bug 2023619](https://bugzilla.mozilla.org/show_bug.cgi?id=2023619)
* 修复 Firefox 155 中部分面板圆角显示不正确的问题。[Bug 2054953](https://bugzilla.mozilla.org/show_bug.cgi?id=2054953)
* 暂时缓解 Firefox 155 中显示缩放高于 125% 时原生垂直标签页排版错位的问题。[Bug 2044082](https://bugzilla.mozilla.org/show_bug.cgi?id=2044082)
* 修复 Firefox 155 默认启用 Nova UI 后引起的多项排版和功能问题。[Bug 2056188](https://bugzilla.mozilla.org/show_bug.cgi?id=2056188)

<a id="updates-top-start"></a>
<details>

<summary>💬 <b>历史更新</b></summary>

<!-- END Release Note -->

更多旧版本的更新记录请参见  
👉 [Wiki 上的历史归档页面](https://github.com/yuuqilin/FlexFox/wiki/Earlier-Update-History-(Simplified-Chinese))

<a href="#updates-top-start">⏫ 返回更新记录顶部</a>
</details>
