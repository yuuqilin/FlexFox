# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox 可配置选项列表

[English](./OPTIONS.md) | [日本語](./OPTIONS_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md) | [简体中文](./OPTIONS_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md)

本文档汇总了 FlexFox 提供的全部配置选项及其可用取值。

如果在安装时导入了附带的 `user.js`，FlexFox 选项会自动显示在 `about:config` 中，并可通过搜索 `uc.flex` 快速查看。

如果后续版本新增的选项没有出现在列表中，则无需重新导入 `user.js`。只需根据本文档中列出的选项名称手动创建即可。

所有选项均按照其影响的浏览器组件或界面区域进行分类。请根据需要修改的界面元素展开对应分类，查看可用选项、取值以及说明。

<details>
<summary>🔧 初始设置</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `toolkit.legacyUserProfileCustomizations.stylesheets` | `true` | 这是 Firefox 的内置选项，必须启用后才能使 `userChrome.css` 自定义样式生效。 |
| `svg.context-properties.content.enabled` | `true` | 允许 FlexFox 使用的 SVG 图标根据 Firefox 的亮色／暗色主题自动切换颜色。若未手动修改过，此选项默认已启用。 |
| `sidebar.visibility` | `always-show` | 在垂直标签页模式下，需要将此选项设为此值才能正常使用 FlexFox 的全部功能。该设置等同于在侧栏设置中取消勾选 **“悬停时展开侧栏”**。FlexFox 的许多功能基于此模式设计，使用其他设置可能会导致非预期问题。若未手动修改过，此值即为 Firefox 的默认设置。 |

</details>

<details>
<summary>🚫 FlexFox 控制</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.disable-flexfox` | `false` | 启用后无需重启 Firefox 即可立即停用所有 FlexFox 样式，方便快速对比 FlexFox 与原生 Firefox 界面的差异，并用于排查问题。 |
| `uc.flex.skip-loading-uc-*.css` | `false` | 跳过加载 `./components/` 和 `./content/` 中的特定 `uc-*.css` 文件。可用于完全停用某个组件的样式，或排除特定 CSS 文件的影响，以便进行问题排查。例如，启用 `uc.flex.skip-loading-uc-newtab.css` 后，将不会加载 `./content/uc-newtab.css`。 |

</details>

<details>
<summary>🦊 侧栏按钮（Firefox 标志）</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.style-sidebar-button` | `0`-`4`<br>(`1`) | 更改导航栏中显示的 Firefox 标志（侧栏切换按钮）。取值：`0` = Firefox 默认图标，`1` = Firefox 主品牌标志（默认），`2` = Firefox 浏览器标志，`3` = Firefox System 1 标志，`4` = Mozilla 旗帜符号。 |

</details>

<details>
<summary>🌈 侧栏彩带与强调色</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.remove-sidebar-stripe` | `false` | 移除侧栏彩带。侧栏工具默认会折叠到侧栏彩带中，因此启用此选项后将无法快速访问侧栏工具。若需重新访问，可使用快捷键，例如按 <kbd>F1</kbd> 切换 Sidebery，或按 <kbd>Ctrl</kbd> + <kbd>B</kbd> 打开 Firefox 侧栏。 |
| `uc.flex.style-sidebar-stripe-color` | `0`-`10`<br>(`0`) | 设置 FlexFox 主要界面元素的强调色，例如侧栏彩带和侧栏按钮（Firefox 标志）。取值：`0` = Classic（默认），`1` = Red，`2` = Orange，`3` = Yellow，`4` = Green，`5` = Cyan，`6` = Blue，`7` = Violet，`8` = Purple，`9` = Pink，`10` = Gray。所选颜色还会应用于书签星标、标签页高亮以及 Sidebery 导航图标等元素。 |
| `uc.flex.style-sidebar-stripe-color-apply-to-all-icons` | `false` | 将所选强调色应用到所有图标。在暗色模式下，还会影响界面边框颜色。即使启用 `uc.flex.revert-to-original-bookmark-star-icon`，此选项仍会覆盖 Firefox 默认的书签星标颜色。 |
| `uc.flex.style-sidebar-stripe-color-use-gradient` | `false` | 将所选强调色的渐变效果应用到侧栏彩带和侧栏按钮（Firefox 标志）。该渐变效果还会应用于书签星标和书签文件夹等元素。 |

</details>

<details>
<summary>📚 Sidebery 与垂直标签页</summary>

### 通用设置

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.fully-hide-sidebery` | `false` | 完全隐藏 Sidebery 和原生垂直标签页，仅在鼠标靠近屏幕边缘时显示。触发区域可通过 `--uc-sidebar-hover-trigger-width` 进行调整。启用此选项后，会覆盖 `Hide Sidebery` 快捷键，导致无法通过快捷键在隐藏和显示之间切换。日常使用建议保持此选项为 `false`，并通过快捷键切换布局。具体设置方法请参见“[布局切换](USAGE_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md#-布局切换)”。 |
| `uc.flex.disable-sidebery-autohide` | `false` | 停用 Sidebery 和原生垂直标签页的自动折叠功能，并保持始终展开的布局。启用此选项后，会覆盖 `Lock Sidebery` 快捷键，导致无法通过快捷键在自动折叠和保持展开之间切换。日常使用建议保持此选项为 `false`，并通过快捷键切换布局。具体设置方法请参见“[布局切换](USAGE_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md#-布局切换)”。 |
| `uc.flex.increase-sidebery-expanded-width` | `false` | 增加 Sidebery 和原生垂直标签页展开时的宽度。 |
| `uc.flex.sidebery-fast-hover-expand` | `false` | 加快 Sidebery 和原生垂直标签页的展开和折叠速度。 |
| `uc.flex.sidebery-slow-hover-expand` | `false` | 减慢 Sidebery 和原生垂直标签页的展开和折叠速度。 |
| `uc.flex.sidebery-apply-expand-speed-to-toolbars` | `false` | 默认情况下，侧栏与导航栏使用不同的展开和折叠速度。启用此选项后，导航栏和工具栏将使用与侧栏相同的动画速度，使上述速度选项能够作用于整个界面。启用 Mica 或自定义壁纸时，系统会自动统一动画速度，因此此选项不会生效。 |

### Sidebery 专用

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.sidebery-disable-icon-scaling` | `false` | 移除 Sidebery 固定标签页和导航面板在展开时的轻微图标放大效果。 |
| `uc.flex.sidebery-allow-resizable-width` | `false` | 停用 Sidebery 的自动折叠功能，并允许通过拖动侧栏分隔线自由调整宽度。仍可使用侧栏切换按钮（Firefox 标志）快速切换展开和折叠状态。如果希望临时恢复自动隐藏以节省屏幕空间，可使用 `Hide Sidebery` 快捷键在可调整宽度模式和自动隐藏模式之间切换。此选项仅在 Firefox 的标签页模式设为垂直标签页时生效，在水平标签页模式下无效。 |
| `uc.flex.style-sidebery-nav-icon` | `0`-`2`<br>(`0`) | 设置 Sidebery 收起状态下显示的导航图标。取值：`0` = 使用当前活动面板图标（新默认值），`1` = Sidebery 标志，`2` = V 形箭头图标（旧默认值）。 |
| `uc.flex.style-sidebery-nav-icon-use-active-panel-color` | `false` | 将当前活动面板的颜色应用到导航图标。 |

### 原生垂直标签页专用

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.show-pin-tabs-separator-in-expanded-state` | `false` | 显示固定标签页容器下方的调整分隔线。FlexFox 默认使用固定的固定标签页容器高度，启用此选项后，可通过拖动分隔线自由调整容器高度。 |

</details>

<details>
<summary>📑 水平标签页</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.auto-hide-horizontal-tabs-and-keep-navbar` | `0`-`3`<br>(`0`) | 自动隐藏水平标签页，同时保留导航栏显示。取值：`0` = 不自动隐藏（默认），`1` = 鼠标悬停在导航栏时，标签页显示在导航栏下方，`2` = 鼠标悬停在导航栏时，标签页显示在导航栏上方，`3` = 仅当鼠标靠近屏幕顶部边缘时，标签页显示在导航栏上方。仅悬停在导航栏上不会触发显示。触发区域可通过 `--uc-tabstoolbar-hover-trigger-width` 进行调整。 |
| `uc.flex.auto-hide-navbar-and-keep-horizontal-tabs` | `0`-`1`<br>(`0`) | 自动隐藏导航栏，同时保留水平标签页显示。取值：`0` = 不自动隐藏（默认），`1` = 鼠标悬停在标签页时显示导航栏。此选项优先级更高，同时启用时会覆盖 `uc.flex.auto-hide-horizontal-tabs-and-keep-navbar`。 |
| `uc.flex.show-tab-close-button-on-favicon-hover` | `false` | 将关闭按钮与网站图标合并，并在鼠标悬停于网站图标时显示。此选项可为标签标题提供更多显示空间。 |
| `uc.flex.disable-tab-close-button-on-inactive-horizontal-tabs` | `false` | 为了方便快速关闭标签页，FlexFox 默认会在所有标签页上显示关闭按钮。当标签页变窄时，按钮会自动缩小并移动到角落，以减少误触。如果希望完全避免误触，可启用此选项以隐藏非活动标签页的关闭按钮。 |
| `uc.flex.increase-active-horizontal-tab-min-width` | `0`-`4`<br>(`1`) | 自动增加当前标签页的宽度，使标签标题显示得更完整，并帮助当前标签页与其他标签页区分开来，以便快速定位。取值：`0` = 停用（所有标签页保持相同宽度），`1` = 宽度增加至 1.8 倍（无动画），`2` = 宽度增加至 1.8 倍（有动画），`3` = 宽度增加至 2 倍（无动画），`4` = 宽度增加至 2 倍（有动画）。此效果默认启用，如希望所有标签页保持相同宽度，请将其设为 `0`。 |

</details>

<details>
<summary>📌 固定标签页</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.max-visible-horizontal-pinned-tabs` | `0`-`5`<br>(`5`) | 设置固定标签页每行显示的最大数量。在垂直标签页模式下，超出上限的固定标签会自动换行。`1`–`5` 分别对应每行显示 1–5 个固定标签。在水平标签页模式下，超出上限的固定标签会自动折叠。`0` 表示关闭自动折叠，`1`–`5` 分别对应显示 2–10 个固定标签。 |
| `uc.flex.max-visible-vertical-pinned-tabs` | `0` \|<br>`2`-`8`<br>(`4`) | 设置固定标签页容器每列显示的最大标签数量。达到上限后，固定标签页容器会显示滚动条。设为 `0` 时，将取消高度限制，容器会随标签数量自动扩展。此选项在水平标签页模式下无效。 |

</details>

<details>
<summary>🗂️ 标签页分组</summary>

### 原生垂直标签页专用

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.style-tab-groups` | `0`-`2`<br>(`1`) | 设置标签页分组的显示样式。取值：`0` = 树状布局，不显示展开状态指示图标；`1` = 带三角形状态指示图标的树状布局（默认）；`2` = 带文件夹图标的盒状布局。指示图标会根据分组的展开或折叠状态自动切换。 |
| `uc.flex.style-tab-groups-add-transition` | `0`-`2`<br>(`2`) | 设置标签页分组的展开/折叠动画以及状态指示图标的动画效果。取值：`0` = 无动画，`1` = 启用展开/折叠动画，`2` = 启用展开/折叠动画和状态指示图标动画（默认）。 |
| `uc.flex.style-tab-groups-center-label-text` | `false` | 将标签页分组的标签文字居中显示。 |

</details>

<details>
<summary>🧩 标签页外观</summary>

### Sidebery 与原生垂直标签页专用

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.style-tab-items` | `1`-`2`<br>(`1`) | 设置标签页项目的外观。为了便于快速定位当前标签页，当前标签页会始终同时显示边框和背景高亮。普通标签页不显示边框和背景高亮。取值：`1` = 固定标签页仅显示边框（默认），`2` = 固定标签页仅显示背景高亮。背景高亮使用侧栏彩带的强调色。在暗色模式下选择 `2` 时，边框也会使用强调色。 |
| `uc.flex.style-tab-items-add-hover-trail` | `true` | 为标签页添加悬停拖尾效果。当鼠标划过标签页时，背景高亮会延迟消失，在光标后方形成高亮拖尾。此效果默认启用，如需关闭请将此选项设为 `false`。 |

</details>

<details>
<summary>🔖 书签</summary>

### 书签项目

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.enable-colored-bookmarks-folder-icons` | `0`-`2`<br>(`0`) | 启用彩色书签文件夹图标。取值：`0` = 使用 Firefox 默认图标（默认），`1` = 使用纯色文件夹图标，`2` = 使用带图案的文件夹图标。设为 `2` 时，会自动隐藏书签文件夹的标签文字。 |
| `uc.flex.remove-bookmarks-folder-icons` | `false` | 隐藏书签文件夹图标。 |
| `uc.flex.remove-bookmarks-labels` | `false` | 隐藏书签文件夹标签文字。 |

### 书签星标

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.revert-to-original-bookmark-star-icon` | `false` | FlexFox 默认使用爱心形书签图标。启用此选项后，将恢复为 Firefox 默认的星形图标及其默认颜色。如需改用侧栏彩带的强调色，请启用 `uc.flex.style-sidebar-stripe-color-apply-to-all-icons`。 |

</details>

<details>
<summary>🧭 导航栏与工具栏</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.fully-hide-toolbox` | `false` | 完全隐藏浏览器顶部的所有工具栏，仅在鼠标靠近屏幕顶部边缘时显示。触发区域可通过 `--uc-toolbox-rotation` 进行调整。启用此选项后，会覆盖 `Hide Topbar` 快捷键，导致无法通过快捷键在隐藏和显示之间切换。日常使用建议保持此选项为 `false`，并通过快捷键切换布局。具体设置方法请参见“[布局切换](USAGE_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md#-布局切换)”。 |
| `uc.flex.disable-bookmarks-autohide` | `false` | 停用书签工具栏的自动隐藏功能。默认情况下，FlexFox 仅在鼠标悬停于导航栏时显示书签工具栏，因此即使在 Firefox 中将书签工具栏设为“始终显示”，也不会占用额外的屏幕空间。 |
| `uc.flex.disable-nav-bar-first-item-right-padding` | `false` | 默认情况下，FlexFox 会在导航栏第一个项目（默认为 Firefox 标志）右侧添加额外间距，使其与下方的垂直标签页在视觉上形成统一整体。启用此选项可移除该间距。间距会根据是否启用垂直标签页自动调整，通常无需修改默认值。 |
| `uc.flex.increase-navbar-height` | `false` | 启用后会将导航栏高度增加 3px。此选项仅为兼容旧版 FlexFox 和 VerticalFox 样式而保留，通常无需修改默认值。 |

</details>

<details>
<summary>🛠️ 工具栏按钮</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.auto-hide-navbar-icons` | `false` | 自动淡出导航栏和其他顶部工具栏中的图标，并在鼠标悬停于导航栏时淡入显示。地址栏内的图标和窗口控制按钮由其他选项控制，不受此设置影响。侧栏按钮（Firefox 标志）默认始终可见。只有当它不再位于导航栏的第一个位置，或将 `uc.flex.style-sidebar-button` 设为 `0` 时，才会跟随自动隐藏。 |
| `uc.flex.style-all-tabs-button` | `0`-`2`<br>(`1`) | 设置“列出所有标签页”按钮的图标。取值：`0` = Firefox 默认图标，`1` = 筛选图标（默认），`2` = V 形箭头图标。 |

</details>

<details>
<summary>🔎 地址栏</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.auto-hide-urlbar-icons` | `true` | 自动隐藏地址栏中的图标，并在鼠标悬停于地址栏时通过滑入动画显示。此选项默认启用，如需始终显示图标，请将其设为 `false`。 |
| `uc.flex.style-urlbar` | `1`-`4`<br>(`1`) | 设置地址栏的外观。取值：`1` = 扁平（默认），`2` = 嵌入，`3` = 压印，`4` = 无缝（与导航栏完全融合）。 |
| `uc.flex.style-urlbar-center-text` | `false` | 将地址栏中的文字居中显示。 |
| `uc.flex.move-urlbar-popup-to-center` | `0`-`2`<br>(`0`) | 将地址栏弹出面板移动到浏览器窗口中央。取值：`0` = 关闭（默认），`1` = 聚焦时居中显示，`2` = 仅在输入时居中显示。 |
| `uc.flex.dim-urlbar-popup-backdrop` | `0`-`2`<br>(`0`) | 在地址栏弹出面板显示时，将除弹出面板外的浏览器界面调暗。取值：`0` = 关闭，`1`-`2` = 不同强度的暗化效果，数值越大，暗化程度越高。 |

</details>

<details>
<summary>🧩 扩展面板</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.switch-to-alternate-condensed-panel` | `false` | 默认情况下，FlexFox 使用网格图标布局显示扩展面板，即使安装大量扩展，也能直接访问扩展按钮而无需滚动。在此模式下，扩展菜单按钮会被移除，但仍可通过右键点击图标访问扩展菜单。启用此选项后，将切换为显示扩展名称的紧凑列表布局，在保留列表模式易读性的同时，提供比 Firefox 默认列表更高的空间利用率。 |

</details>

<details>
<summary>🪟 窗口控制按钮</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.auto-hide-window-controls` | `false` | 自动隐藏窗口控制按钮，仅在鼠标移动到屏幕边缘时以滑入动画显示。 |
| `uc.flex.restore-window-controls-on-tabbar` | `false` | Firefox 默认会在水平标签页模式下将窗口控制按钮显示在标签栏上，在垂直标签页模式下显示在导航栏上。FlexFox 默认统一两种模式，始终将窗口控制按钮显示在导航栏上。启用此选项后，可在水平标签页模式下恢复 Firefox 的默认行为。 |
| `uc.flex.revert-to-original-window-controls` | `false` | 将窗口控制按钮恢复为 Firefox 默认图标。 |
| `uc.flex.style-window-controls` | `1`-`3`<br>(`1`) | 切换窗口控制按钮的图标。取值：`1` = 信号灯按钮（默认），`2` = Yosemite 风格按钮，`3` = Yosemite GTK 主题。 |
| `uc.flex.style-window-controls-shift-up` | `false` | Windows 默认会将窗口控制按钮显示在略高于中心线的位置。FlexFox 默认会降低按钮位置，以便与其他图标对齐。启用此选项可恢复系统默认的位置。 |
| `uc.flex.style-window-controls-shrink-size` | `false` | 缩小窗口控制按钮的尺寸。 |
| `uc.flex.move-window-controls-to-left` | `false` | 将窗口控制按钮移动到左侧。在 macOS 上请勿启用此选项，以免导致布局异常。 |

</details>

<details>
<summary>📋 菜单</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.disable-menu-icons` | `false` | 移除菜单和面板中的图标，恢复 Firefox 的默认外观。 |
| `uc.flex.menu-item-spacing` | `'small'`\|<br>`'medium'`\|<br>`'large'` | 调整菜单和面板项目之间的垂直间距。可选值：`'1'` 或 `'small'` = 紧凑间距，`'2'` 或 `'medium'` = 默认间距，`'3'` 或 `'large'` = 宽松间距。 |

</details>

<details>
<summary>🌐 网页内容区域</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.enable-rounded-web-content` | `0`-`2`<br>(`0`) | 为网页内容区域添加边距、阴影和圆角，营造悬浮卡片般的立体效果。数值越大，边距越宽，留白越多。 |
| `uc.flex.enable-rounded-web-content-at-sidebery-corner` | `false` | 默认情况下，为了让网页内容区域与侧栏彩带自然衔接，FlexFox 不会对紧邻侧栏彩带的一角应用圆角。启用此选项后，即使侧栏彩带处于显示状态，网页内容区域的四个角也会保持一致的圆角效果。 |
| `uc.flex.style-web-content-outline` | `0`-`2`<br>(`0`) | 在网页内容区域周围显示边框。此选项与 `uc.flex.enable-rounded-web-content` 搭配使用时效果最明显。取值：`0` = 不显示边框（默认），`1` = 仅在分屏视图中为当前聚焦的网页显示高亮边框，`2` = 为所有网页内容显示边框。 |

</details>

<details>
<summary>🔍 查找栏</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.disable-findbar-autohide` | `false` | 停用查找栏在失去焦点后自动隐藏的行为。可使用 <kbd>Esc</kbd> 快速关闭查找栏。 |
| `uc.flex.findbar-position` | `'top-center-left'`\|<br>`'top-right'`\|<br>`'bottom-right'` | 设置查找栏的位置。可选值：`'top-center-left'` 或 `'1'` = 顶部偏左居中，`'top-right'` 或 `'2'` = 右上角，`'bottom-right'` 或 `'3'` = 右下角。 |

</details>

<details>
<summary>🎨 浏览器外观</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.add-ui-text-stroke` | `false` | 为界面文字添加描边，以提高可读性，尤其适用于低分辨率屏幕。 |
| `uc.flex.allow-addons-to-change-toolbar-color` | `false` | FlexFox 会自动检测带有背景图片的主题，并应用其配色规则。如果主题未设置背景图片，工具栏颜色可能无法正确生效。启用此选项后，可强制应用扩展或主题设置的工具栏颜色。为避免潜在冲突，建议优先为主题设置背景图片，而不是启用此选项。例如使用 [Firefox Color](https://color.firefox.com/) 时，无需启用此设置，只需选择任意一张纯色图片作为背景，FlexFox 即可自动识别并应用所配置的颜色。 |
| `uc.flex.style-toolbar-bgcolor` | `1`-`2`<br>(`1`) | 使用 Firefox 内置亮色或暗色主题时，为工具栏应用以下配色方案：`1` = Tokyo Night 主题（默认），`2` = Firefox Acorn Design。 |
| `uc.flex.revert-to-original-flat-corner-style` | `0`-`3`<br>(`0`) | 设置整个界面的圆角样式。取值：`0` = 小圆角（FlexFox 默认），`1` = 大圆角（Firefox 默认），`2` = 直角（旧版 Firefox 风格），`3` = 地址栏使用小圆角，其余界面使用直角。 |

</details>

<details>
<summary>🧰 实用工具</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.show-flexfox-version-info-in-about-config` | `0`-`2`<br>(`2`) | 控制 `about:config` 中 FlexFox 版本条目的显示方式。`0` = 不显示版本信息，`1` = 仅显示版本信息，`2` = 显示版本信息及选项说明（默认）。选项说明会按照完整的 `uc.flex` 列表对齐显示，因此需要导入 `user.js`，或手动补齐所有 FlexFox 选项，才能保持对应关系。 |
| `uc.flex.show-tab-count-in-alltabs-button` | `0`-`2`<br>(`0`) | 在“显示所有标签页”按钮上显示当前打开的标签页数量。取值：`0` = 关闭，`1` = 显示所有标签页数量，`2` = 仅显示已加载标签页数量。 |
| `uc.flex.show-tab-number-in-tab-label` | `false` | 在标签页标题前显示编号。此选项仅适用于原生标签页，可帮助快速定位特定标签页，尤其适合标签页宽度过窄、无法显示足够标题信息时使用。 |
| `uc.flex.move-pip-volume-to-top` | `false` | 将画中画（PiP）窗口中的音量控制按钮移动到顶部。 |

</details>

<details>
<summary>⚙️ Firefox 原生设置</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `browser.sessionstore.restore_pinned_tabs_on_demand` | `false` | Firefox 原生设置，用于延迟加载固定标签页，仅在点击时才进行加载。这可以有效避免大量固定标签页拖慢 Firefox 启动速度。FlexFox 支持高密度固定标签页布局，可将大量固定标签页作为常用页面的快速入口使用，因此建议启用此选项以缩短启动时间。 |
| `browser.tabs.fadeOutExplicitlyUnloadedTabs` | `true` | Firefox 原生设置，用于淡化手动卸载的原生标签页。 |
| `browser.tabs.fadeOutUnloadedTabs` | `false` | Firefox 原生设置，用于淡化启动后尚未加载的原生标签页。启用这两个选项后，可以更容易区分当前会话中已经使用和未使用的标签页。 |

</details>

<details>
<summary>🧊 Windows Mica</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `widget.windows.mica` | `false` | 启用 Firefox 的原生 Windows Mica 背景效果。此功能仅在 Windows 11 上可用。要显示 Mica 效果，需要将 Firefox 主题设置为 `系统主题 — 自动`。你可以保持此选项开启，并通过切换 Firefox 主题来控制 Mica 的显示与否。如需在任意主题下使用 Mica，请启用下方的 `uc.flex.browser-mica-force-enabled-on-all-themes`。启用自定义壁纸后，壁纸会优先显示并覆盖 Mica 效果。 |
| `uc.flex.browser-mica-force-enabled-on-all-themes` | `false` | 强制在所有 Firefox 主题下启用 Mica 背景效果。启用后，Mica 的亮色／暗色模式将不再跟随 Windows 系统设置，而是跟随当前 Firefox 主题。例如，可以让 Windows 保持亮色模式，同时让 Firefox 使用暗色 Mica 效果。此选项需要配合 `widget.windows.mica` 使用。 |
| `widget.windows.mica.popups` | `0`\|`1`\|<br>`2`<br>(`2`) | 设置弹出菜单是否使用 Windows Mica 背景效果。取值：`0` = 关闭，`1` = 开启，`2` = 自动（默认）。 |
| `widget.windows.mica.toplevel-backdrop` | `2` | 设置 Firefox 使用的 Windows 背景效果类型。取值：`0` = 自动或无效果，`1` = Mica，`2` = Acrylic，`3` = Mica Alt。FlexFox 基于 `2` = Acrylic 进行设计。 |
| `uc.flex.browser-mica-transparency-level` | `0`-`4`<br>(`2`) | 调整覆盖在 Mica 背景上的遮罩透明度。亮色模式下使用白色遮罩，暗色模式下使用黑色遮罩。数值越大，遮罩越透明，背景越清晰。Firefox 默认值为 `0`，FlexFox 默认使用更明亮的 `2`。 |

</details>

<details>
<summary>✨ 透明浏览器</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `browser.tabs.allow_transparent_browser` | `false` | 允许网页内容和 Sidebery 背景透明，以显示 Mica 或自定义壁纸。**修改后需要重新启动 Firefox 才会生效。** FlexFox 支持所有内置 `about:*` 页面透明化，可通过 `about:about` 查看完整列表。普通网页需要安装 [Transparent Zen](https://addons.mozilla.org/firefox/addon/transparent-zen/) 或 [Zen Internet](https://addons.mozilla.org/firefox/addon/zen-internet/) 扩展才能实现透明效果。如果透明背景导致文字难以阅读，可使用 [UltimaDark](https://addons.mozilla.org/firefox/addon/ultimadark/) 或 [Dark Reader](https://addons.mozilla.org/firefox/addon/darkreader/)，也可以通过工具栏按钮或快捷键切换 FlexFox 内置的 `Solid Page` 功能。详见“[改善透明网页中的文字可读性](USAGE_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md#-改善透明网页的可读性)”。 |
| `uc.flex.browser-solid-page-color-scheme` | `0`-`2`<br>(`1`) | 设置 `Solid Page` 使用的纯色背景。取值：`0` = 黑色，`1` = 白色（默认），`2` = 跟随 Firefox“网站外观”设置。 |
| `uc.flex.enable-translucent-urlbar-popup-and-menus` | `false` | 在不使用 Mica 或自定义壁纸的情况下，为菜单、面板和地址栏弹出面板启用半透明效果。透明度可通过 `uc.flex.browser-mica-transparency-level` 调整。启用 Mica 或自定义壁纸后，此效果会自动生效，因此此选项不会产生作用。 |

</details>

<details>
<summary>🖼️ 浏览器壁纸</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.browser-wallpaper-enabled` | `false` | 启用自定义浏览器壁纸，使整个 Firefox 界面始终显示静态或动态背景。**启用此选项会覆盖上方的 Mica 背景设置。** |
| `uc.flex.browser-wallpaper-index` | `0`-`9`<br>(`0`) | 选择壁纸来源。`0` 表示使用当前 Firefox 主题的背景图片作为整个浏览器界面的壁纸；`1`-`9` 表示使用 `../icons/wallpaper/` 目录中的 `main-image-1.jpg` 至 `main-image-9.jpg`。所有壁纸文件都必须改为 `.jpg` 扩展名，不论原始格式为何。支持 JPG、WebP、Animated WebP、PNG、APNG、AVIF 和 GIF 格式。 |
| `uc.flex.browser-wallpaper-svg-enabled` | `false` | 启用 SVG 壁纸支持。启用后，可使用放置于 `../icons/wallpaper/` 目录中的 `main-image-1.svg` 至 `main-image-9.svg` 作为壁纸。与其他壁纸格式不同，SVG 文件必须保留 `.svg` 扩展名。 |
| `uc.flex.browser-wallpaper-acrylic-disabled` | `false` | 停用浏览器壁纸的 Acrylic 模糊效果。默认情况下，壁纸会使用 Acrylic 风格的模糊效果，以模拟 Mica 的视觉表现。启用此选项后，壁纸将以原始的清晰状态显示。 |
| `uc.flex.browser-wallpaper-align-horizontal` | `'auto'`\|<br>`'left'`\|<br>`'center'`\|<br>`'right'` | 设置壁纸图片在适配浏览器窗口并被裁切时的水平对齐方式。可选值：`'auto'` 或 `'0'` = 自动对齐（默认），`'left'` 或 `'1'` = 左对齐，`'center'` 或 `'2'` = 居中，`'right'` 或 `'3'` = 右对齐。 |
| `uc.flex.browser-wallpaper-transparency-level` | `0`-`4`<br>(`2`) | 调整覆盖在壁纸上方的遮罩透明度。亮色模式下使用白色遮罩，暗色模式下使用黑色遮罩。数值越大，遮罩越透明，背景越清晰。此选项的亮度被设计为与 `uc.flex.browser-mica-transparency-level` 对齐，因此默认值 `2` 的显示效果会接近 Mica 透明度 `2`，以避免在自定义壁纸和 Mica 之间切换时出现明显的亮度跳变。 |
| `uc.flex.browser-wallpaper-contrast-level` | `0`-`4`<br>(`2`) | 调整覆盖在壁纸上方的遮罩对比度。此选项仅在暗色模式且 Acrylic 模糊效果未被停用时生效。数值越大，对比度越高，色彩越鲜明。默认值为 `2`。 |

</details>
