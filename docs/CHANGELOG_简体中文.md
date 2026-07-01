# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox 更新日志

[English](./CHANGELOG.md) | [日本語](./CHANGELOG_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md) | [简体中文](./CHANGELOG_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md)

## 🆕 更新内容

## **🦊 v6.5.6**

### 更新

* 优化 Sidebery 的交互表现与视觉一致性。

  * 提升 Sidebery 展开、折叠动画的流畅度，并减少布局计算带来的性能消耗。
  * 修复搜索框展开、折叠时的反弹现象，并将其宽度与下方标签页列表对齐。
  * 改进分屏视图下的圆角处理。现在只有与 Sidebery 相邻的网页区域会在相邻一侧使用直角，另一侧分屏网页会保留四个圆角。
  * 调整启用 `uc.flex.sidebery-allow-resizable-width` 后，折叠状态下关闭按钮和树状分支展开按钮的位置，减少在点击标签页图标时误触的可能。
  * 修复启用 `uc.flex.sidebery-allow-resizable-width` 后，折叠状态下无法展开导航栏标签页面板的问题。
  * 修复启用网页区域圆角边距后，Sidebery 的面板设置窗口顶部和侧边边距消失的问题。

* 优化 `uc.flex.enable-rounded-web-content` 的效果，同步调整侧边栏面板的下边距，使其与网页内容区域的高度保持对齐。

### 变更

* 原生垂直标签页在折叠状态下不再显示调整分隔线。现在分隔线只会在侧边栏展开时显示，让折叠状态下的界面更加干净。

### 修复

* 修复 v6.5.0 引入的回退问题：同时启用 `uc.flex.sidebery-allow-resizable-width` 与 `Lock Sidebery` 时，固定标签页无法自动换行。

* 修复 v6.5.3 引入的回退问题：Sidebery 的新建标签页按钮左右两侧会出现阴影溢出。

* 修复 Firefox Beta v153 的变更导致 PDF 工具栏无法自动隐藏的问题。 [Bug 2045670](https://bugzilla.mozilla.org/show_bug.cgi?id=2045670)

* 修复 Firefox Beta v153 的变更导致 `view-opentabs.svg` 图标变形的问题。 [Bug 2032258](https://bugzilla.mozilla.org/show_bug.cgi?id=2032258)

* 修复 Firefox Nightly v154 的变更导致 Sidebery 展开时标签页上下抖动的问题。 [Bug 2048146](https://bugzilla.mozilla.org/show_bug.cgi?id=2048146)

* 为 Firefox Nightly v154 新增的 App 菜单“编辑 PDF...”选项添加图标。 [Bug 2047915](https://bugzilla.mozilla.org/show_bug.cgi?id=2047915)

<!-- END What's New -->

<a id="updates-top-start"></a>
<details>

<summary>💬 <b>历史更新</b></summary>

<!-- END Release Note -->

## **v6.5.5**

![预览：about:config 选项说明](https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/about-config-preference-descriptions.webp)

### 新增

- 改进 `about:config` 页面的使用体验。
  - 将 FlexFox 版本信息居中显示，让版本号更容易识别。
  - 在 FlexFox 选项列表右侧显示对应的简短说明。
  - 选项说明会按照完整的 `uc.flex` 列表对齐显示。若要保持对应关系，请导入 `user.js`，或手动补齐所有 FlexFox 选项。

- 重写 PowerShell 安装脚本。
  - 安装脚本改为 `scripts/install-flexfox.ps1`。
  - 可检测当前已安装的 FlexFox 版本，并仅在需要时下载最新发布版本。
  - 新增下载包 SHA-256 校验。
  - 新增交互式菜单，可从 Firefox 用户配置文件列表中选择，或手动输入指定路径。
  - 新增用于无人值守安装的命令行选项：使用 `-ProfilePath 'path'` 指定配置文件路径，使用 `-Silent` 跳过交互式提示。
  - 详细说明请参阅 [PowerShell Script](https://github.com/yuuqilin/FlexFox#-powershell-script)。

- 更新 Git Pull 自动化脚本。
  - 新增交互式菜单，可从 Firefox 用户配置文件列表中选择，或手动输入指定工作目录。
  - 新增用于无人值守更新的命令行选项：使用 `-ProfilePath 'path'` 指定工作目录，使用 `-Silent` 跳过交互式提示。
  - 改进对用户自定义文件和 Git 冲突的处理。
  - 详细说明请参阅 [Git Pull](https://github.com/yuuqilin/FlexFox#-git-pull)。

### 不兼容变更

- 将 `uc.flex.show-flexfox-version-info-in-about-config` 的选项类型由布尔改为数值。
  - `0`：不显示 FlexFox 版本信息。
  - `1`：仅显示版本信息。
  - `2`：显示版本信息和选项说明。这是默认值。
  - 请先删除旧选项，再使用相同名称重新创建，并将类型设置为“数值”。

### 更新

- 将 `user.js` 从 `scripts` 文件夹移至根目录，以简化安装步骤。

### 移除

- 移除根目录中的 `deploy-userchrome.ps1`。

**v6.5.4**

* 修复启用地址栏文字居中时，地址栏缩放比例按钮周围间距过窄的问题。
* 移除项目中遗留的旧版 Sidebery 样式文件，避免与当前安装和设置流程混淆。
* 重新整理说明文档，使 README 更聚焦，选项说明更容易查找，并补充更实用的使用指南。

更多旧版本的更新记录请参见  
👉 [Wiki 上的历史归档页面](https://github.com/yuuqilin/FlexFox/wiki/Earlier-Update-History-(Simplified-Chinese))

<a href="#updates-top-start">⏫ 返回更新记录顶部</a>
</details>
