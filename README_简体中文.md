# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox（简体中文版）

<div>
 <a href='https://www.mozilla.org'><img src="https://img.shields.io/badge/Last%20tested%20Firefox-v153-orange?logo=firefox"></a>
 <a href='https://github.com/yuuqilin/FlexFox/commits/main/'><img src="https://img.shields.io/github/last-commit/yuuqilin/FlexFox/main"></a>
 <a href='https://github.com/yuuqilin/FlexFox/commits/Beta/'><img src="https://img.shields.io/github/last-commit/yuuqilin/FlexFox/Beta?label=last%20Nightly%20commit&color=purple"></a>
 <a href='https://github.com/yuuqilin/FlexFox/stargazers'><img src='https://img.shields.io/github/stars/yuuqilin/FlexFox?style=social'></a>
</div>

<br>

[English](./README.md) | [日本語](./README_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md) | [简体中文](./README_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md) | [Wiki](https://github.com/yuuqilin/FlexFox/wiki)

FlexFox 是一款 Firefox userChrome 主题，旨在不影响操作便利性的前提下，更高效地利用屏幕空间。工具栏和侧栏在闲置时会自动折叠，展开时会以悬浮形式覆盖在页面之上，不会推挤页面而引发布局偏移。当启用 Sidebery 时，原生标签页会自动隐藏，从而保持单一的标签管理系统，避免界面元素冗余。主题支持通过首选项进行深度定制，为适应不同的浏览习惯提供了一个灵活的基础框架。

![FlexFox v6.5](https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/FlexFox-v6.5.0.webp)  

> [!IMPORTANT]
>
> * **启用过“悬停时展开侧栏”选项？** 请将其关闭。FlexFox 需要此选项保持未勾选状态。
> * **从 v6 之前的版本升级？** 请删除 Sidebery 样式编辑器中的所有旧样式。
> * **推荐配置：** 使用 Firefox 的垂直标签页模式，并建议搭配 Sidebery，以获得最完整的功能支持和最佳使用体验。

## 🎬 功能演示视频

v6.5 新功能演示：

https://github.com/user-attachments/assets/64be5a0e-f97e-4257-aac8-63245791d07b

如需更好的画质，请在 YouTube 观看：

[YouTube Link](https://www.youtube.com/watch?v=lhf1mpXDIOM)

<details>
<summary><b>快速还原演示视频界面</b> 👇</summary>

FlexFox 默认只启用最基础的界面修改，因此外观会比较简洁。  
如果你想快速还原演示视频中的效果，可以直接使用以下设置。

更完整的自定义说明请参考本 README 下方的选项部分。

```
uc.flex.browser-wallpaper-acrylic-disabled = false (some scenes: true)
uc.flex.browser-wallpaper-enabled = true
uc.flex.browser-wallpaper-index = 0 (some scenes: custom wallpaper index)
uc.flex.browser-wallpaper-transparency-level = 2 (some scenes: 4)
uc.flex.enable-colored-bookmarks-folder-icons = 2
uc.flex.enable-rounded-web-content = 2
uc.flex.enable-rounded-web-content-at-sidebery-corner = true
uc.flex.enable-translucent-urlbar-popup-and-menus = true
uc.flex.move-urlbar-popup-to-center = 1
uc.flex.move-window-controls-to-left = true
uc.flex.show-tab-count-in-alltabs-button = 2
uc.flex.style-all-tabs-button = 2
uc.flex.style-sidebar-button = 2
uc.flex.style-sidebar-stripe-color = 9
uc.flex.style-sidebar-stripe-color-apply-to-all-icons = true
uc.flex.style-sidebar-stripe-color-use-gradient = true
uc.flex.style-tab-groups = 2
uc.flex.style-tab-items = 2
uc.flex.style-urlbar = 2
uc.flex.style-urlbar-center-text = true
uc.flex.style-web-content-outline = 2
uc.flex.style-window-controls = 2
uc.flex.style-window-controls-shrink-size = true
```
</details>

## 🆕 更新内容

**🦊 最新版本：v6.5.3** — 详细内容请参阅[更新日志](./docs/CHANGELOG_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md)。

<!-- END What's New -->

## ✨ 主要功能与特色

* 自动折叠标签页、工具栏和侧边栏。
* 展开时以覆盖层方式显示，不会挤压网页内容或引起布局跳动。
* 可通过快捷键或工具栏按钮快速隐藏或显示标签页与工具栏。
* 启用 Sidebery 后自动隐藏原生标签页，最大化可用显示空间。
* 菜单、面板和地址栏下拉菜单可启用半透明模糊效果。
* 支持 Windows Mica 和自定义浏览器壁纸。
* 内置 11 种主题色，支持浅色与深色模式，可搭配任意 Firefox 主题使用。
* 可自定义侧边栏按钮、书签文件夹、书签星标、窗口控制按钮等图标。
* 支持自动隐藏工具栏按钮和窗口控制按钮，在保持快速访问的同时实现极简界面。
* 可通过 Firefox 偏好设置调整丰富的界面细节，包括：
  * UI 元素的圆角或直角样式
  * 菜单项目间距
  * 网页内容显示区域的边距与边框
  * 扁平化或立体风格地址栏
  * 标签页边框与背景颜色
  * 动画与过渡效果
* 可自定义固定标签页的行列布局与区域显示高度。
* 浮动搜索框。
* 支持通过自定义样式覆盖主题默认设置。
* 其他实用功能，包括：
  * 防止网页加载时出现白屏闪烁
  * 在“列出所有标签页”按钮上显示当前打开的标签页总数
* 提升浏览体验的设计改进，包括：
  * 突出显示当前标签页，方便快速定位和切换相关标签页
  * 网格式固定标签页布局，节省空间、支持大量固定标签页，并防止侧边栏展开时标签页位置偏移，减少鼠标重新定位
* 极低的性能开销。

## ⚙️ 选项

FlexFox 默认会尽可能保留 Firefox 原生界面的外观，在安装后仅启用核心布局功能和必要的基础样式。

如果希望实现预览图中展示的各种布局和界面定制效果，或者调整、恢复某些设计改动，可以使用以下两个独立的配置系统。

### 🧩 可配置选项 (`about:config`)

FlexFox 的大部分功能、布局开关以及界面调整都直接集成在 Firefox 的首选项系统中。无需修改任何代码，即可自定义浏览器行为、启用可选界面增强功能，或将部分修改恢复为 Firefox 的原生外观。

要访问这些选项，请在地址栏输入 `about:config` 并按回车。如果安装时导入了附带的 `user.js` 文件，在搜索框中输入 `uc.flex` 即可列出所有 FlexFox 选项。你也可以根据文档中提供的选项名称手动创建对应的首选项。

有关所有可用选项、支持的取值范围以及详细功能说明，请参阅以下文档：

📄 **完整配置说明：** [docs/OPTIONS_简体中文.md](docs/OPTIONS_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md)

### 📜 用户自定义样式

对于超出内置首选项系统范围的定制需求，FlexFox 提供了专门的用户自定义文件，用于修改界面和网页样式。

* 如需修改 **界面（chrome）** 样式，请在 `components` 文件夹中创建 `uc-user-settings.css`
* 如需修改 **网页（content）** 样式，请在 `content` 文件夹中创建 `uc-custom-content.css`

添加到这些文件中的样式和变量将覆盖 FlexFox 的默认设置。由于这些文件由用户自行管理，且不属于项目源码的一部分，因此在后续更新过程中不会被覆盖。

如果需要复用 FlexFox 现有文件中的样式（例如 `uc-variables.css`），建议复制完整的选择器或规则块，以保留原有的上下文和依赖关系。

## 💿 安装与更新

### 👷 手动安装

1. 安装 [Sidebery](https://addons.mozilla.org/firefox/addon/sidebery/)（可选，但推荐）。

2. 从项目的 **[Releases](https://github.com/yuuqilin/FlexFox/releases)** 页面下载最新版本的 FlexFox。

3. 打开 `about:support`，找到 **配置文件夹**，点击 **打开文件夹** 进入 Firefox 配置目录。

4. 将压缩包根目录中的 `chrome` 文件夹，以及 `scripts` 文件夹内的 `user.js` 复制到 Firefox 配置目录中。

5. （可选）使用文本编辑器打开 `user.js`。

   该文件包含 FlexFox 专用选项（`uc.flex.*`）以及可选的 Firefox 原生选项。FlexFox 选项会直接导入，而 Firefox 原生选项则以注释形式提供。如需修改其中的某项设置，请删除对应项前方的 `//`。同时请确认以下必需选项保持为如下设置：

   ```text
   toolkit.legacyUserProfileCustomizations.stylesheets = true
   svg.context-properties.content.enabled = true
   sidebar.visibility = always-show
   ````

6. 重启 Firefox，然后删除 `user.js`。

   请不要跳过此步骤。如果 `user.js` 仍保留在配置目录中，每次启动 Firefox 时都会重新应用其中的设置，从而重置相关选项，使你在 `about:config` 中所做的修改无法生效。

7. 配置 Sidebery：

   * 打开 **设置**（齿轮图标）
   * 清空 **样式编辑器** 中已有的样式
   * 打开 **帮助 → 导入插件数据**
   * 导入压缩包中 `Sidebery` 文件夹内的 `sidebery-settings.json`

8. 打开 `about:config`，搜索 `uc.flex` 以查看和调整 FlexFox 选项。

### 🚀 自动安装与更新

FlexFox 支持通过 PowerShell 脚本或 Git 实现自动安装和更新。

如果是首次安装，请先运行以下任一方法，然后继续执行 **手动安装** 中从第 5 步开始的内容。

后续更新时，只需重新运行相同的方法即可，无需再执行额外的手动步骤。

#### 💻 PowerShell 脚本

<details>
<summary><i>[点击展开]</i> 👇</summary>

在 PowerShell 窗口中执行以下任一命令。

静默安装会自动使用默认安装路径且不显示交互提示，适合定期更新或无人值守部署。

**在线安装**

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass; iex ((New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/yuuqilin/FlexFox/refs/heads/main/deploy-userchrome.ps1') -replace '(?s)<#.*?#>', '')
```

**静默在线安装**

```powershell
$env:FLEXFOX_INSTALL_MODE = 'silent'; Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass; iex ((New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/yuuqilin/FlexFox/refs/heads/main/deploy-userchrome.ps1') -replace '(?s)<#.*?#>', '')
```

**本地安装**

下载 [`deploy-userchrome.ps1`](https://github.com/yuuqilin/FlexFox/raw/refs/heads/main/deploy-userchrome.ps1) 并执行：

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass; .\deploy-userchrome.ps1
```

**静默本地安装**

```powershell
$env:FLEXFOX_INSTALL_MODE = 'silent'; Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass; .\deploy-userchrome.ps1
```

**计划任务或“运行”对话框**

```powershell
powershell -ExecutionPolicy Bypass -Command "$env:FLEXFOX_INSTALL_MODE = 'silent'; .\deploy-userchrome.ps1"
```

</details>

#### 🔃 Git Pull

<details>
<summary><i>[点击展开]</i> 👇</summary>

请根据你的使用环境选择 `scripts` 文件夹中的 Git Pull 脚本。这些脚本会自动完成以下操作：

* 将 Firefox 配置目录设置为 Git 工作目录
* 将 FlexFox 仓库添加为远程仓库
* 仅下载并更新 `chrome` 文件夹

你也可以选择手动完成这些设置。

**首次设置**

```bash
git init
git remote add origin https://github.com/yuuqilin/FlexFox.git
git sparse-checkout init --no-cone
git sparse-checkout set /chrome
git fetch origin
git checkout -b main origin/main
```

**手动更新**

```bash
git fetch origin
git checkout main
git merge origin/main --allow-unrelated-histories
```

</details>

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
