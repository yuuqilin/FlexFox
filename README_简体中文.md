# FlexFox（简体中文版）

<div>
 <a href='https://www.mozilla.org'><img src="https://img.shields.io/badge/Last%20tested%20Firefox-v133-orange?logo=firefox"></a>
 <a href='https://github.com/yuuqilin/FlexFox/commits/main/'><img src="https://img.shields.io/github/last-commit/yuuqilin/FlexFox/main"></a>
 <a href='https://github.com/yuuqilin/FlexFox/commits/Beta/'><img src="https://img.shields.io/github/last-commit/yuuqilin/FlexFox/Beta?label=last%20Nightly%20commit&color=purple"></a>
 <a href='https://github.com/yuuqilin/FlexFox/stargazers'><img src='https://img.shields.io/github/stars/yuuqilin/FlexFox?style=social'></a>
</div>

<br>

一款灵活可定制的 Firefox 主题，灵感来自 [VerticalFox](https://github.com/christorange/VerticalFox)、[EdgyArc-fr](https://github.com/artsyfriedchicken/EdgyArc-fr)、[Edge-Frfox](https://github.com/bmFtZQ/edge-frfox)、[ArcWTF](https://github.com/KiKaraage/ArcWTF)、[shimmer](https://github.com/nuclearcodecat/shimmer) 和 [firefox-csshacks](https://github.com/MrOtherGuy/firefox-csshacks)。FlexFox 提供多种功能选项以增强浏览体验。

## 更新内容

**v1.1.0**:
- 修复启用主题背景图时，悬停展开书签工具栏时背景图断裂的问题。
- 调整了缩放级别文本的亮度。
- 修正了 Nightly (v135) 版本中窗口控制按钮位置的问题，解决了 `tabsintitlebar` 被弃用后与 `customtitlebar` 的兼容性问题。
- 新增选项 `uc.flex.disable-sidebery-autohide`，可停用 Sidebery 自动折叠。

   <details>
   <summary>💬 <b>新功能的展示效果</b></summary>
   <p>启用深色主题和<code>uc.flex.disable-sidebery-autohide</code>的新FlexFox：</p>
   <img src="./assets/disable-sidebery-autohide.webp" alt="disable-sidebery-autohide" width="98%" />
   <p>与<code>uc.flex.fully-hide-toolbox</code>结合使用的效果：</p>
   <img src="./assets/disable-sidebery-autohide-with-fully-hide-toolbox.webp" alt="disable-sidebery-autohide-with-fully-hide-toolbox" width="98%" />
   </details>

> [!IMPORTANT]  
> 在导入 v1.1.0 版的 `sidebery-styles.json` 之前，请先清除旧版样式。打开 Sidebery 设置（齿轮图标）> `Styles editor` > 将 `Sidebar` 和 `Group page` 两个页面下的样式全部清除后，再导入新版样式。  
> 导入 `sidebery-settings.json` 时可能会导致面板数据丢失，请务必先使用快照功能备份面板数据。

**v1.0.4**:
- 当网页缩放比例不是默认值时，固定显示缩放比例图标。
- 当网页已加书签时，固定显示书签星标图标。  
   <img src="./assets/urlbar-star-light.webp" alt="urlbar-star-light" width="380" />  
   <img src="./assets/urlbar-star-dark.webp" alt="urlbar-star-dar" width="380" />

<details>

<summary><b>历史更新</b></summary>

**v1.0.3**:
- 优化了开启 `uc.flex.allow-addons-to-change-toolbar-color` 选项时的性能，相较于v1.0.2速度提升了1.4倍。

**v1.0.2**:
- 改善地址栏切换器和图标的显示效果。
- 添加选项 `uc.flex.allow-addons-to-change-toolbar-color`，允许主题和扩展修改工具栏背景图片和颜色。  
   <img src="./assets/allow-addons-to-change-toolbar-color.webp" alt="allow-addons-to-change-toolbar-color" width="98%" />

**v1.0.1**:  
- 修复了URL栏追踪保护图标无法隐藏的问题。
- 添加了`uc-pdf.js.css`。
- 添加了LICENSE文件。

**v1.0.0**:
- 性能大幅提升，相比之前的版本运行速度提高了 **100 倍**。打开右键菜单的延迟仅增加 **16ms**，与默认界面几乎无异。

</details>

> [!IMPORTANT]
> 如果您在 Firefox v133 之前的版本使用过 FlexFox，更新前请重置设置：在 `about:config` 中搜索 `uc.flex.` 并删除所有相关条目。

## 预览

![FlexFox Light Theme](./assets/FlexFox-light.webp)  
![FlexFox Dark Theme](./assets/FlexFox-dark.webp)  
*上图：FlexFox 的浅色和深色主题预览。*

## 主要功能

- **极简界面与轻量化性能**
  - 简化 UI，减少资源占用。

- **自动隐藏工具栏**
  - 自动隐藏水平标签栏、书签工具栏、顶部所有工具栏以及 Sidebery 侧边栏。
  - 鼠标悬停时展开。

- **可自定义的工具栏显示**
  - 自由选择显示或隐藏哪些工具栏和 Sidebery 侧边栏。
  - 当所有工具栏和侧边栏都被隐藏时，浏览器只显示网页内容，提供无全屏模式的全屏体验。

- **工具栏触发区**
  - 从窗口边缘轻松展开隐藏的工具栏或 Sidebery 侧边栏。
  - 即使窗口未最大化也可使用。
  - 可根据偏好调整触发区灵敏度。

- **Sidebery 兼容性**
  - 可与 Sidebery 配合使用或独立运行。
  - 当 Sidebery 启动时自动隐藏水平标签栏，关闭时恢复显示。
  - 支持将 Sidebery 侧边栏放置在左侧或右侧，可根据您喜欢的布局调整。

- **标题栏和菜单栏集成**
  - FlexFox 可与这些元素兼容并自动调整布局。

- **重叠式工具栏**
  - 展开的工具栏覆盖于网页内容之上，不会引起布局偏移。
  - 全屏模式下同样有效。

- **重新设计的查找栏**
  - 查找栏移到浏览器顶部，采用紧凑型浮动设计。
  - 可自定义其位置（左侧或右侧）。
  - 默认情况下，当失去焦点时自动隐藏（可以在选项中禁用）。

- **紧凑的扩展面板**
  - 只显示扩展图标。
  - 右键点击可进行扩展选项设置。
  - 也可以切换到保留扩展标签的紧凑面板。

- **Sidebery 折叠优化**
  - 自动折叠 Sidebery 的导航区和固定标签区。
  - 展开的区域保持垂直对齐，避免布局跳动，减少鼠标调整操作。

## 安装指南

> [!IMPORTANT]
> 1. 安装 [Sidebery](https://addons.mozilla.org/firefox/addon/sidebery/)（非必需但推荐）。
> 2. 下载适合您的版本：
>    - [FlexFox](https://github.com/yuuqilin/FlexFox/archive/refs/heads/main.zip)（标准版 Firefox）。
>    - [FlexFox Beta](https://github.com/yuuqilin/FlexFox/archive/refs/heads/Beta.zip)（Firefox Beta/Nightly）。
>    - [FlexFox ESR](https://github.com/yuuqilin/FlexFox/archive/refs/heads/ESR.zip)（Firefox ESR）。
> 3. 进入 `about:support`，找到 `配置文件夹` 并点击 **打开文件夹** 以访问您的 Firefox 配置文件夹。
> 4. 将下载包中的 `chrome` 文件夹和 `user.js` 文件复制到 Firefox 配置文件夹中。
> 5. *(可选)* 使用文本编辑器编辑 `user.js`，删除 // 注释符启用更多功能。
>    - 确保 `toolkit.legacyUserProfileCustomizations.stylesheets` 和 `svg.context-properties.content.enabled` 保持启用（值为 `true`）。
> 6. 重启 Firefox，然后删除 `user.js`，以便在 `about:config` 中所做的更改得以保存。
> 7. 配置 Sidebery：
>    - 打开 Sidebery 设置（通过侧边栏的齿轮图标）。
>    - 转到 `帮助` > `导入附加组件数据`，导入从下载的压缩包中的 `sidebery-settings.json` 和 `sidebery-styles.json` 文件。
>    - *注意*：如果 Sidebery 设置未生效，请重新导入文件。
> 8. *(可选)* 使用 `about:config` 搜索 `uc.flex.`，根据需要启用或禁用 FlexFox 的功能。

## 配置选项

| 配置选项                                   | 说明                                           |
|--------------------------------------------|------------------------------------------------|
| `uc.flex.add-ui-text-stroke`               | 给界面文字添加粗体边框。                       |
| `uc.flex.add-bookmarks-left-margin`        | 通过添加边距，使书签与工具栏图标对齐。         |
| `uc.flex.fully-hide-sidebery`              | 完全隐藏 Sidebery。                            |
| `uc.flex.fully-hide-toolbox`               | 隐藏所有顶部工具栏（标签、导航、书签）。       |
| `uc.flex.increase-sidebery-expanded-width` | 增加 Sidebery 展开时的宽度。                   |
| `uc.flex.allow-addons-to-change-toolbar-color` | 允许主题和扩展修改工具栏的背景图片和颜色。 |
| `uc.flex.disable-bookmarks-autohide`       | 禁用书签栏自动隐藏。                           |
| `uc.flex.disable-tabs-toolbar-autohide`    | 禁用 Sidebery 非激活时的原生标签栏自动隐藏。   |
| `uc.flex.disable-findbar-autohide`         | 禁用查找栏失去焦点时自动隐藏。                 |
| `uc.flex.disable-sidebery-autohide`        | 停用 Sidebery 自动折叠。                       |
| `uc.flex.remove-bookmarks-folder-icons`    | 移除书签文件夹中的图标。                       |
| `uc.flex.remove-bookmarks-labels`          | 移除书签文字标签。                             |
| `uc.flex.switch-to-alternate-condensed-panel` | 切换到另一个简洁的扩展面板。                |
| `uc.flex.revert-to-original-window-controls` | 恢复原始窗口按钮（最小化、最大化、关闭）。   |
| `uc.flex.sidebery-fast-hover-expand`       | 加快 Sidebery 悬停展开/折叠的速度。            |
| `uc.flex.sidebery-slow-hover-expand`       | 放慢 Sidebery 悬停展开/折叠的速度。            |

## 已知问题

- 对于 Floorp 用户：请在 Floorp 界面选项中切换到 `Firefox Proton UI`，以减少兼容性问题。
- 仅在 Windows 上测试：可能需要为其他操作系统进行调整。