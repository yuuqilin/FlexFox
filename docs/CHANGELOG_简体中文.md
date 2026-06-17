# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox 更新日志

[English](./CHANGELOG.md) | [日本語](./CHANGELOG_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md) | [简体中文](./CHANGELOG_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md)

## 🆕 更新内容

**🦊 v6.5.3**

* 优化地址栏按钮的尺寸和间距，使整体布局更加整齐美观。
* 修复因 Nightly v153 变更导致地址栏按钮位置偏移的问题。([Bug 2039721](https://bugzilla.mozilla.org/show_bug.cgi?id=2039721))
* 修复因 Nightly v153 变更导致 FlexFox 在原生垂直标签页模式下样式完全失效的问题。([Bug 1904860](https://bugzilla.mozilla.org/show_bug.cgi?id=1904860))
* 修复 v6.0.7 引入的回退：在水平标签页模式下展开 Sidebar Stripe 后，背景消失并变为透明。
* 修复 v6.5.0 引入的回退：在水平标签页模式下使用 `uc.flex.style-sidebar-button = 3` 时，图标会变为灰色。
* 修复 Sidebery 中树状分支线重复显示以及分支线断裂的问题。
* 修复当 Sidebery 样式编辑器中残留旧样式时，导致 `uc.flex.sidebery-disable-icon-scaling` 选项失效的问题。
虽然 FlexFox v6 目前仍兼容旧版本注入到 Sidebery 样式编辑器中的样式，但为了避免未来发生冲突、减少重复样式处理并提升运行性能，建议在升级到 v6 后务必清除这些遗留的旧样式。
打开 Sidebery 导航栏 → 设置（齿轮图标）→ 样式编辑器，然后删除"侧边栏"和"分组页面"两个页面中的所有旧样式。
关于 v6 的不兼容性变更详情，请参阅 v6.0.0 发布日志：
[https://github.com/yuuqilin/FlexFox/releases/tag/v6.0.0](https://github.com/yuuqilin/FlexFox/releases/tag/v6.0.0)

<!-- END What's New -->

<a id="updates-top-start"></a>
<details>

<summary>💬 <b>历史更新</b></summary>

更多旧版本的更新记录请参见  
👉 [Wiki 上的历史归档页面](https://github.com/yuuqilin/FlexFox/wiki/Earlier-Update-History-(Simplified-Chinese))

<a href="#updates-top-start">⏫ 返回更新记录顶部</a>
</details>
