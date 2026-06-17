# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox Changelog

[English](./CHANGELOG.md) | [日本語](./CHANGELOG_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md) | [简体中文](./CHANGELOG_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md)

## 🆕 What's New

**🦊 v6.5.3**

* Improved address bar button sizes and spacing for a cleaner, more aligned layout.
* Fixed misaligned address bar buttons caused by changes in Nightly v153. ([Bug 2039721](https://bugzilla.mozilla.org/show_bug.cgi?id=2039721))
* Fixed a Nightly v153 compatibility issue that completely broke FlexFox styles when using native vertical tabs. ([Bug 1904860](https://bugzilla.mozilla.org/show_bug.cgi?id=1904860))
* Fixed a v6.0.7 regression where expanding the Sidebar Stripe caused its background to turn transparent in horizontal tab mode.
* Fixed a v6.5.0 regression where icons turned grayscale when `uc.flex.style-sidebar-button = 3` was applied in horizontal tab mode.
* Fixed duplicated and broken tree guide lines in Sidebery.
* Fixed an issue where legacy styles left in the Sidebery Styles editor prevented the `uc.flex.sidebery-disable-icon-scaling` option from working correctly.
Although v6 remains compatible with legacy styles injected into the Sidebery Styles editor, clearing them is strongly recommended to avoid future conflicts, reduce duplicate style processing, and improve performance.
Go to **Sidebery Navigation bar → Settings (gear icon) → Styles editor**, then delete all legacy styles in the **Sidebar** and **Group Page** tabs.
For more details regarding v6 breaking changes, please refer to the v6.0.0 release notes:
https://github.com/yuuqilin/FlexFox/releases/tag/v6.0.0

<!-- END What's New -->

<a id="updates-top-start"></a>
<details>

<summary>💬 <b>Previous Updates</b></summary>

<!-- END Release Note -->

For more update logs from earlier versions,  
👉 see the [history archive on the Wiki](https://github.com/yuuqilin/FlexFox/wiki/Earlier-Update-History-(English))

<a href="#updates-top-start">⏫ Back to the beginning of updates</a>
</details>
