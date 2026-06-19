# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox 使い方ガイド

[English](./USAGE.md) | [日本語](./USAGE_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md) | [简体中文](./USAGE_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md)

このドキュメントでは、FlexFox の実践的な使い方、設定手順、よくある利用シーンへの対応方法を紹介します。

利用可能な設定項目や値の一覧については、「[設定オプション一覧](OPTIONS_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md)」を参照してください。

## 📚 目次

- [デモ動画のインターフェースを再現する](#-デモ動画のインターフェースを再現する)
- [レイアウトの切り替え](#-レイアウトの切り替え)
- [Firefox テーマと Sidebery](#-firefox-テーマと-sidebery)
- [透明なウェブコンテンツ、Mica、壁紙](#️-透過表示micaカスタム壁紙)
- [透明なウェブコンテンツの可読性を向上させる](#-透過表示時の視認性改善)

---

## 🎬 デモ動画のインターフェースを再現する

### なぜデモ動画と同じ見た目にならないのですか？

FlexFox は初期状態では最小限の変更のみが有効になっています。

デモ動画と同じインターフェースをすぐに再現したい場合は、以下の設定を適用してください。

<details>
<summary><b>デモ動画の設定を適用する</b> 👇</summary>

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

利用可能な設定項目、設定値、および各オプションの詳細については、「[設定オプション一覧](OPTIONS_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md)」を参照してください。

---

## 🔄 レイアウトの切り替え

### キーボードショートカットやツールバーボタンでツールバーとサイドバーを非表示にする方法

1. [UserChrome Toggle Extended](https://addons.mozilla.org/firefox/addon/userchrome-toggle-extended/) をインストールします。

2. 拡張機能の設定画面を開きます。

   **ハンバーガーメニュー → 設定 → 拡張機能とテーマ → UserChrome Toggle Extended → オプション**

3. 以下のように設定します。

   <img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/userchrome-toggle-extended-solid-page.webp" alt="UserChrome Toggle Extended settings" width="45%" />

   * `Allow multiple styles to be active together` と `Close popup after clicking toggle` を有効にします

   * ドロップダウンメニューで `Toggles from last active window` と `Toggles from previous session` を選択します

   * `Style 1` ～ `Style 4` および `Style 6` を有効にします

   * 各スタイル名を以下のように変更します

     | Style   | Label           |
     | ------- | --------------- |
     | Style 1 | `Lock Sidebery` |
     | Style 2 | `Hide Topbar`   |
     | Style 3 | `Hide Sidebery` |
     | Style 4 | `Hide All`      |
     | Style 6 | `Solid Page`    |

   * 左上の `Apply changes` をクリックして設定を保存します。

4. 初期設定では、<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>1</kbd> ～ <kbd>6</kbd> にショートカットが割り当てられています。変更する場合は、ページ上部の歯車アイコンをクリックし、`拡張機能のショートカットキーの管理` を選択してください。

5. 利用できるレイアウトモードは次のとおりです。

   | ショートカット | ラベル | Preference | 動作 |
   | -------- | ----- | ---------- | ------ |
   | <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>1</kbd> | `Lock Sidebery` | `uc.flex.disable-sidebery-autohide` | Sidebery とネイティブ垂直タブを常に展開した状態にし、自動で折りたたまれないようにします。 |
   | <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>2</kbd> | `Hide Topbar` | `uc.flex.fully-hide-toolbox` | すべての上部ツールバーを非表示にします。カーソルを画面上端に近づけると再表示されます。 |
   | <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>3</kbd> | `Hide Sidebery` | `uc.flex.fully-hide-sidebery` | Sidebery とネイティブ垂直タブを完全に非表示にします。カーソルを画面端に近づけると再表示されます。 |
   | <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>4</kbd> | `Hide All` | `uc.flex.fully-hide-toolbox` +<br>`uc.flex.fully-hide-sidebery` | 上部ツールバーとサイドバーを非表示にし、画面上にはウェブコンテンツのみを表示します。カーソルを画面端に近づけると再表示されます。 |

> [!IMPORTANT]
>
> `about:config` でこれらの Preference を手動で有効にすると、対応するショートカットより Preference の設定が優先されます。
>
> 通常は Preference を `false` のままにして、キーボードショートカットやツールバーボタンでレイアウトを切り替えることをおすすめします。

---

## 🎨 Firefox テーマと Sidebery

### なぜ Sidebery に Firefox テーマの背景が反映されないのですか？

Sidebery で Firefox テーマの背景を使用するには、次の設定を変更してください。

`設定`（歯車アイコン）→ `外観` → `カラースキーム`

`カラースキーム` を `Firefox` に設定します。

<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/sidebery-appearance-settings.webp" alt="Sidebery appearance settings" width="50%" />

---

## 🖼️ 透過表示、Mica、カスタム壁紙

### Sidebery とウェブコンテンツで Mica 背景やカスタム壁紙を表示する方法

1. Sidebery とウェブコンテンツに Mica 背景やカスタム壁紙を表示するには、`browser.tabs.allow_transparent_browser` を有効にする必要があります。

   * Mica を使用する場合は、`about:config` で以下の設定を有効にしてください。

     ```
     browser.tabs.allow_transparent_browser = true
     widget.windows.mica = true
     widget.windows.mica.popups = 2
     widget.windows.mica.toplevel-backdrop = 2
     uc.flex.browser-mica-force-enabled-on-all-themes = true
     uc.flex.browser-mica-transparency-level = 2
     ```

   * カスタム壁紙を使用する場合は、`about:config` で以下の設定を有効にしてください。

     ```
     browser.tabs.allow_transparent_browser = true
     uc.flex.browser-wallpaper-enabled = true
     uc.flex.browser-wallpaper-index = 1
     uc.flex.browser-wallpaper-svg-enabled = false
     uc.flex.browser-wallpaper-acrylic-disabled = true
     uc.flex.browser-wallpaper-align-horizontal = auto
     uc.flex.browser-wallpaper-transparency-level = 2
     uc.flex.browser-wallpaper-contrast-level = 2
     ```

2. `browser.tabs.allow_transparent_browser` を有効にした後は、Firefox を再起動しないと変更は反映されません。

3. 設定項目の詳細、設定可能な値、および各オプションの動作については、「[設定オプション一覧](OPTIONS_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md)」を参照してください。

4. FlexFox は Firefox に標準搭載されているすべての `about:*` ページの透過表示に対応しています。対応ページの一覧は `about:about` で確認できます。

5. 通常のウェブサイトにも Mica 背景や壁紙を表示するには、[Transparent Zen](https://addons.mozilla.org/firefox/addon/transparent-zen/) または [Zen Internet](https://addons.mozilla.org/firefox/addon/zen-internet/) をインストールしてください。

6. アニメーション壁紙を使用する場合は、[Motion Backgrounds](https://motionbgs.com/) から MP4 動画をダウンロードし、[FFmpeg](https://ffmpeg.org/) または [ScreenToGif](https://github.com/NickeManarin/ScreenToGif/) を使って Animated WebP に変換してください。

---

## 👓 透過表示時の視認性改善

### ウェブコンテンツの透過を有効にした後、文字を読みやすくする方法

ウェブコンテンツの透過を有効にすると、背景が完全に透明になることで、一部のウェブサイトで文字が読みにくくなる場合があります。以下のいずれかの方法で改善できます。

1. [UltimaDark](https://addons.mozilla.org/firefox/addon/ultimadark/) または [Dark Reader](https://addons.mozilla.org/firefox/addon/darkreader/) をインストールする。

   * 対応サイトに自動で適用される
   * サイトごとの設定を記憶できる
   * ページの表示速度に影響する場合がある

2. FlexFox に組み込まれている `Solid Page` を使用する。

   * ショートカットキーまたはツールバーボタンですぐに切り替えられる
   * サイトごとの設定は保存されない
   * ページの表示速度に影響しない
   * 設定方法は「[レイアウトの切り替え](#-レイアウトの切り替え)」を参照
   * 背景色はデフォルトで白に設定されており、`uc.flex.browser-solid-page-color-scheme` で変更できる
