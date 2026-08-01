# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox 更新日志

[English](./CHANGELOG.md) | [日本語](./CHANGELOG_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md) | [简体中文](./CHANGELOG_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md)

## 🆕 更新内容

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

<!-- END What's New -->

<a id="updates-top-start"></a>
<details>

<summary>💬 <b>历史更新</b></summary>

<!-- END Release Note -->

更多旧版本的更新记录请参见  
👉 [Wiki 上的历史归档页面](https://github.com/yuuqilin/FlexFox/wiki/Earlier-Update-History-(Simplified-Chinese))

<a href="#updates-top-start">⏫ 返回更新记录顶部</a>
</details>
