# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox（日本語版）

<div>
 <a href='https://www.mozilla.org'><img src="https://img.shields.io/badge/Last%20tested%20Firefox-v144-orange?logo=firefox"></a>
 <a href='https://github.com/yuuqilin/FlexFox/commits/main/'><img src="https://img.shields.io/github/last-commit/yuuqilin/FlexFox/main"></a>
 <a href='https://github.com/yuuqilin/FlexFox/commits/Beta/'><img src="https://img.shields.io/github/last-commit/yuuqilin/FlexFox/Beta?label=last%20Nightly%20commit&color=purple"></a>
 <a href='https://github.com/yuuqilin/FlexFox/stargazers'><img src='https://img.shields.io/github/stars/yuuqilin/FlexFox?style=social'></a>
</div>

<br>

[English](./README.md) | [日本語](./README_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md) | [简体中文](./README_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md) | [Wiki](https://github.com/yuuqilin/FlexFox/wiki)

FlexFox は Firefox をより快適で賢く、使いやすいブラウザに変えます。  
無駄な視覚要素を省き、安定した UI と軽快な動作を両立。  
カスタマイズ性の高いベースとして、理想のインターフェースを自由に作れます。  
見た目を変えるだけではなく、ブラウジングの質そのものを高めるテーマです。  

https://github.com/user-attachments/assets/23d73b36-d2d4-4660-af5b-cde686d0934a  

## 🎉 主な機能アップデート

<details>  
<summary>🧊 <b>新機能：半透明Mica効果とカスタム壁紙背景に対応</b> <i>[クリックで展開]</i> 👇</summary>

* Windows 11 の **Mica 背景効果** に対応しました。
  * 有効にするには、`about:config` に以下の設定を追加してください：
    ```
    widget.windows.mica = true
    widget.windows.mica.popups = 2
    widget.windows.mica.toplevel-backdrop = 2
    browser.tabs.allow_transparent_browser = true
    uc.flex.browser-mica-transparency-level = 2
    ```
  * テーマは `システムテーマ — 自動` に設定しておく必要があります。他のテーマでは Mica は反映されません。
  * **Firefoxの再起動が必要です。**
  * 詳細設定はこちらをご覧ください: [🧊 Visual Background & Mica Effects](https://github.com/yuuqilin/FlexFox#-visual-background--mica-effects)
  * 背景が他のウィンドウに隠れて見えない場合は、<kbd>Win</kbd> + <kbd>Home</kbd> キーで他のウィンドウをすべて最小化できます。マウスジェスチャーや自動化スクリプトでの操作も可能です。  

  ネイティブの Mica 背景効果を表示した例です。YouTube のようなウェブページの透明効果には [Transparent Zen](https://addons.mozilla.org/firefox/addon/transparent-zen/) 拡張機能を使用しています。  
  
  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/seashore-mica.webp" alt="Firefox のツールバーやタブの後ろに Mica 背景効果が表示されている例。" width="96%" />

* Mica が使用できない場合や、固定された壁紙を表示したい場合には、**カスタム背景壁紙**機能を利用できます。
  * `about:config` に以下の設定を追加して有効にします：
    ```
    uc.flex.browser-wallpaper-enabled = true
    uc.flex.browser-wallpaper-index = 1
    uc.flex.browser-wallpaper-acrylic-disabled = false
    browser.tabs.allow_transparent_browser = true
    uc.flex.browser-wallpaper-transparency-level = 2
    uc.flex.browser-wallpaper-contrast-level = 2
    ```
  * **Firefoxの再起動が必要です。**
  * `../icons/wallpaper/` フォルダに `main-image-1.jpg` ～ `main-image-9.jpg` を保存すると、最大9枚の画像を切り替えて使用できます。
  * デフォルトで **Acrylic ぼかし効果** が適用され、Mica に似た外観になります（完全に同じではありません）。
  * **カスタム背景壁紙**機能を有効にすると、Mica の背景が上書きされます。Mica と壁紙を同時に有効にした場合は、壁紙が表示されます。  

  Acrylic ぼかしを有効にしたカスタム背景壁紙の例です。ネイティブの Mica と比べて、ぼかしの強さや色調、質感が異なります。  

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/seashore-acrylic.webp" alt="Acrylic ぼかしが適用されたカスタム壁紙の例。Mica 効果に似た見た目です。" width="96%" />

  Acrylic ぼかしを無効にしたカスタム壁紙の例です。背景がくっきり表示されるため、透明度の設定で文字の読みやすさを調整できます。  

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/churning-in-the-chukchi-sea-no-acrylic.webp" alt="Acrylic ぼかしを無効にしたカスタム壁紙の例。背景画像がくっきり表示されます。" width="96%" />

* サンプル壁紙の出典とクレジット：
  * [a blue and purple background with wavy shapes (Unsplash)](https://unsplash.com/photos/a-blue-and-purple-background-with-wavy-shapes-1hg6NpO0kIk) – Firefox の新しいタブのカスタマイズ機能に組み込まれている背景のひとつです。
  * [Seashore Waves (Unsplash)](https://unsplash.com/photos/seashore-DA_tplYgTow) – Firefox の新しいタブのカスタマイズ機能に組み込まれている背景のひとつです。
  * [Churning in the Chukchi Sea (NASA)](https://www.visibleearth.nasa.gov/images/92412/churning-in-the-chukchi-sea/92412t) ([ダウンロード](https://www.bing.com/th/id/OBTQ.BTF2993094BEFFA1DE53FBFEA6FF54B81C71E858DDE1458F62454AF39BE5112D33?qlt=100&w=3840&h=2160&rs=1&c=4))

* Sidebery やウェブページに Mica や壁紙の背景を表示するには、`browser.tabs.allow_transparent_browser` を有効にしてください。
  * ページの透明化には [Transparent Zen](https://addons.mozilla.org/firefox/addon/transparent-zen/) または [Zen Internet](https://addons.mozilla.org/firefox/addon/zen-internet/) 拡張機能が必要です。
  * 背景が透けて読みにくくなる場合は [Dark Reader](https://addons.mozilla.org/firefox/addon/darkreader/) との併用がおすすめです。

* 新オプション：`uc.flex.sidebery-apply-expand-speed-to-toolbars`
  * Sidebery とネイティブの垂直タブで使われている開閉アニメーションの速度を、ナビゲーションバーとブックマークツールバーにも適用し、すべてのアニメーション速度を統一します。
  * 統一後は、`uc.flex.sidebery-fast-hover-expand` または `uc.flex.sidebery-slow-hover-expand` を使って、ナビゲーションバーやブックマークツールバーの速度も調整できます。
  * Mica やカスタム壁紙を有効にすると、FlexFox が内部的にアニメーション速度を自動で統一するため、その場合はこのオプションを手動で設定する必要はありません。

</details>

<details>  
<summary>🧩 <b>新機能：ピン留めタブパネルのグリッドレイアウトをカスタマイズ可能に</b> <i>[クリックで展開]</i> 👇</summary>

* `uc.flex.max-visible-horizontal-pinned-tabs` を追加し、ピン留めタブパネルの 1 行に表示するタブ数（横方向）を設定できます。  
  * Sidebery とネイティブ垂直タブの両方に対応。  
  * 設定範囲は `2`～`5`（既定値 `5`）。  

* `uc.flex.max-visible-vertical-pinned-tabs` を追加し、ピン留めタブパネルの 1 列に表示するタブ数（縦方向）を設定できます。  
  * ネイティブ垂直タブ専用で、パネルの高さを制限します。  
  * ピン留めタブが設定値を超える場合、残りのタブはスクロールバーで表示できます。  
  * 設定範囲は `4`～`6`（既定値 `4`）。  
  * `0` を設定すると高さ制限が解除され、タブ数に応じて無制限に拡張します。  

* `uc.flex.show-pin-tabs-separator-in-expanded-state` を追加し、釘選タブパネルの分隔線を常に表示できるようにしました。  
  * ネイティブ垂直タブ専用。  
  * このオプションを有効にすると高さ制限が解除され、区切り線をドラッグして高さを自由に調整できます。  

  <p>
    <img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/new-vt-splitter-resize.webp"
         alt="新しいネイティブ垂直タブの仕切り線（ホバー時／リサイズ可能状態）"
         height="510" hspace=15 />
    <img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/new-vt-splitter-collapsed.webp"
         alt="新しいネイティブ垂直タブの仕切り線（パネル折りたたみ時）"
         height="510" hspace=15 />
    <img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/new-vt-splitter-expanded.webp"
         alt="新しいネイティブ垂直タブの仕切り線（パネル展開時）"
         height="510" hspace=15 />
  </p>

</details>

<details>  
<summary>🖌️ <b>新機能：Sidebery の背景がテーマに連動</b> <i>《クリックで展開》</i> 👇</summary>

* FlexFox は、Firefox の現在のテーマに合わせて Sidebery の背景色を自動で切り替えられるようになりました。
* この機能を有効にするには、Sidebery の **設定 → 外観 → カラースキーム** で `"firefox"` を選択してください。
  <details><summary>Sidebery の外観設定のスクリーンショットを見る</summary>
  <img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/sidebery-appearance-settings.  webp"alt="Sidebery の外観設定" width="50%" />
  </details>

</details>

<details>  
<summary>👻 <b>新機能：ツールバーのアイコンを自動で非表示に</b> <i>《クリックで展開》</i> 👇</summary>

* ナビゲーションバーのツールボタンを既定で非表示にし、ホバー時に表示させる `uc.flex.auto-hide-navbar-icons` オプションを追加しました。
* 以下の要素は常に表示されます：
  * ウィンドウ操作ボタン（最小化・最大化・閉じる）
  * URLバー
  * サイドバーの切り替えボタン（FlexFoxロゴ）
* サイドバー切り替えボタンがツールバーの最左端・最右端以外に移動された場合や、`uc.flex.revert-to-original-sidebar-icon` オプションが有効な場合、このボタンも自動非表示の対象になります。
* アニメーションの速度やイージングは、`uc-variables.css` の以下の変数を `uc-user-settings.css` にコピーして調整できます：

  ```css
  --uc-autohide-navbar-icons-duration
  --uc-hover-navbar-icons-duration
  --uc-autohide-navbar-icons-type
  --uc-collapse-navbar-icons-duration
  ```

ナビゲーションバーの自動非表示と、Sidebery のテーマ背景切り替えのプレビュー： <video src="https://github.com/user-attachments/assets/070f798d-2925-4681-ac50-7cd4b36936e7" controls></video>

</details>

<details>  
<summary>🧩 <b>新機能：メニュー項目の間隔を調整可能に</b> <i>《クリックで展開》</i> 👇</summary>

* メニュー項目の間隔を調整するための `uc.flex.menu-item-spacing` オプションを追加しました。  
  指定できる文字列は以下の通りです：  
  `"1"` または `"small"` = コンパクトな間隔（デフォルト。従来バージョンと同じ）  
  `"2"` または `"medium"` = 中程度の間隔  
  `"3"` または `"large"` = Firefox 標準の広い間隔  

* 各メニューの間隔をより細かく調整したい場合は、`uc-variables.css` の変数を `uc-user-settings.css` にコピーして編集してください：

  ```css
  --uc-app-menu-item-padding-block
  --uc-menu-item-padding-block
  --uc-content-area-context-menu-item-padding-block
  --uc-appMenu-zoom-controls-x-offset
  ```

</details>

<details>  
<summary>🪄 <b>新機能：丸みと浮かせたようなWeb表示スタイル</b> <i>《クリックで展開》</i> 👇</summary>

新しいビジュアルオプション `uc.flex.enable-rounded-web-content` が追加されました。

このオプションを有効にすると、Webコンテンツの周囲に余白が追加され、角丸とドロップシャドウが適用され、カードのように柔らかく浮いた印象の表示になります。Zen や Microsoft Edge を参考にしたデザインです。

値は `0`（無効）〜 `2` まで指定でき、数値が大きいほど余白が広がります。

表示をさらに細かくカスタマイズしたい場合は、`uc-variables.css` の変数を `uc-user-settings.css` にコピーして編集してください：

  ```css
  --uc-web-content-margin
  --uc-web-content-radius-box
  ```

以下は `uc.flex.enable-rounded-web-content = 1` の状態での表示例です：

<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/flexfox-rounded-web-content.webp" alt="Rounded web content preview in FlexFox" width="96%" />

</details>

<details>  
<summary>🪄 <b>新機能：角丸なしのフラットなデザインに切り替え可能</b> <i>《クリックで展開》</i> 👇</summary>

新しく追加された `uc.flex.revert-to-original-flat-corner-style` オプションを有効にすると、Firefox標準のフラットな角のスタイルに戻すことができます。FlexFox独自の丸みを帯びたデザインを使わず、よりシャープな外観を好む方におすすめです。

さらにカスタマイズしたい場合は、アドレスバー・検索バー・検索ウィンドウの角丸のサイズを調整するために、`uc-variables.css` の以下の変数を `uc-user-settings.css` にコピーして編集してください：

```css
--uc-urlbar-border-radius
--uc-urlbar-popup-border-radius
--uc-urlbar-icon-radius
--uc-urlbar-icon-inner-radius
--uc-searchbar-popup-border-radius
--uc-findbar-border-radius
```

<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/firefox-original-flat-corner-style.webp" alt="Firefox original flat corner style preview" width="72%" />

</details>

<details>
<summary>🎨 <b>新機能：Firefox Color 対応</b> <i>《クリックで展開》</i> 👇</summary>

FlexFox は [Firefox Color](https://color.firefox.com/) に対応し、ブラウザーの配色をライブプレビュー付きで自由にカスタマイズできるようになりました。

FlexFox 上で Firefox Color を有効にするには、Firefox Color サイトの **Custom backgrounds** タブから任意の背景画像を選ぶか、`uc.flex.allow-addons-to-change-toolbar-color` 設定を有効にしてください。どちらも設定されていない場合、配色の変更は反映されません。

<p>以下は、Firefox Color を使って <a href="https://github.com/rose-pine/firefox">Rosé Pine Moon</a> テーマを適用した FlexFox の表示例です：</p>
<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/firefox-color-rose-pine-moon.webp" alt="FlexFox with Rosé Pine Moon theme" width="96%" />

</details>

<details>
<summary>🌈 <b>新機能：ブックマークフォルダーのアイコンをカスタマイズ</b> <i>《クリックで展開》</i> 👇</summary>

数値型オプション `uc.flex.enable-colored-bookmarks-folder-icons` を追加しました：

  - `0`：無効
  - `1`：第1セットのカラーフォルダーアイコンを有効化
  - `2`：フォルダー名を自動的に非表示にし、第2セットのアイコンを使用

**表示例：**
こちらはFirefoxのデフォルトのブックマークフォルダーアイコンです：  
<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/colored-bookmarks-folder-1.webp" alt="colored-bookmarks-folder-1" width="65%" />

`uc.flex.remove-bookmarks-folder-icons` を有効にすると、フォルダーアイコンが非表示になり、フォルダー名のみが表示されます：  
<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/colored-bookmarks-folder-2.webp" alt="colored-bookmarks-folder-2" width="65%" />

`uc.flex.enable-colored-bookmarks-folder-icons` を `1` に設定すると、第1セットのカラーフォルダーアイコンが表示されます：  
<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/colored-bookmarks-folder-3.webp" alt="colored-bookmarks-folder-3" width="65%" />

さらに `uc.flex.remove-bookmarks-labels` を併用すると、ラベルが非表示になり、アイコンのみ表示されます：  
<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/colored-bookmarks-folder-4.webp" alt="colored-bookmarks-folder-4" width="65%" />

値を `2` に設定すると、ラベルが自動的に非表示になり、第2セットのアイコンが適用されます：  
<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/colored-bookmarks-folder-5.webp" alt="colored-bookmarks-folder-5" width="65%" />

CSS変数 `--uc-bookmark-folder-*` を編集してアイコンの色・サイズ・位置を調整したり、`../icons/bookmark/` フォルダー内の `folder*.svg` ファイルを差し替えて好きなアイコンに変更することができます。

</details>

<details>  
<summary>🚀 <b>新機能：ネイティブ縦型タブと Sidebery の統合</b> <i>《クリックで展開》</i> 👇</summary>

* FlexFox は、ネイティブ縦型タブと Sidebery の動作を統合しました。Sidebery がアクティブなときは、ネイティブ縦型タブが自動的に非表示になり、サイドバーのツールバーは Sidebery の上部にカラー付きの細いストライプとして折りたたまれます。
* サイドバーのツールや拡張機能を開くなど Sidebery が非アクティブな状態になると、ネイティブ縦型タブが自動的に復元され、Sidebery が使えない場合の代替として機能します。
* ネイティブ縦型タブは Sidebery と同じレイアウトと挙動を持ち、展開幅・アニメーション速度・トリガー領域といった変数設定にも対応しています。常時展開や完全非表示、全画面モード（<kbd>F11</kbd>）での自動非表示にも対応し、両者を切り替える際にも自然で一貫した操作体験が得られます。

</details>

<details>
<summary>🚀 <b>新機能：ショートカットによる UI レイアウト切り替えに対応</b> <i>《クリックで展開》</i> 👇</summary>

FlexFox は [UserChrome Toggle Extended](https://addons.mozilla.org/firefox/addon/userchrome-toggle-extended/) 拡張機能に対応しました。
以下の画像のように設定してください：  
<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/userchrome-toggle-extended.webp" alt="userchrome-toggle-extended.webp" width="65%" />  
設定後は、左上の `Apply changes` ボタンをクリックするのを忘れずに。クリックしないと設定が反映されません。

設定が完了すれば、次のショートカットキーで 4 種類の UI レイアウトを切り替えられます：

| ショートカット | ラベル | 動作内容 |
| ------------- | ------ | ------- |
| <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>1</kbd> | Lock Sidebery | Sidebery とネイティブ縦型タブを自動折りたたみと常時展開の状態で切り替え。`uc.flex.disable-sidebery-autohide` オプションと同じ挙動になります。 |
| <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>2</kbd> | Hide Topbar | タブ・ナビゲーションバー・ブックマークバーなど、すべての上部ツールバーを完全に非表示に切り替え。隠れている時はマウスを画面上端に移動すると表示されます。`uc.flex.fully-hide-toolbox` と同様。 |
| <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>3</kbd> | Hide Sidebery | Sidebery とネイティブの縦型タブを完全に非表示に切り替え。隠れている時はマウスを画面端に移動すると表示されます。`uc.flex.fully-hide-sidebery` と同様。 |
| <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>4</kbd> | Hide All | すべてのツールバーとサイドバー（Sidebery またはネイティブ縦型タブ）を隠し、ウェブページのコンテンツだけが表示される状態に切り替え。隠れている時はマウスを画面端に移動すると表示されます。レイアウトは `uc.flex.fully-hide-toolbox` と `uc.flex.fully-hide-sidebery` と同様の動作をします。 |

> [!IMPORTANT]
> `about:config` で有効にしているオプションはショートカットより優先され、状態が固定されます。ショートカットで切り替えを行うには、該当するオプションを `false` に設定してください。

キーボードショートカットに加えて、UserChrome Toggle Extended 拡張機能のボタンからもレイアウトを切り替えることができます。  
<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/userchrome-toggle-button.webp" alt="userchrome-toggle-button" width="28.3%" />  
ショートカットキーの設定を変更するには、右上の歯車アイコンをクリックし、メニューから **拡張機能のショートカットキーの管理** を選んでください。  
<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/shortcut-settings.webp" alt="shortcut-settings" width="50%" />

</details>

> [!IMPORTANT]
> FlexFox を垂直タブモードで使用する際は、「サイドバーのカスタマイズ」にある「カーソルを合わせた時にサイドバーを展開する」オプションを **無効** にしてください。多くの機能はこの設定が必要です。

## 🆕 最新情報

**🦊 v4.5.1**
* Firefox v142 で発生したリグレッションを修正。「サイドバーのカスタマイズ」 → 「カーソルを合わせた時にサイドバーを展開する」を有効にすると、ネイティブ垂直タブが繰り返し展開／折りたたみされる問題が解消されました。 [Bug 1957008](https://bugzilla.mozilla.org/show_bug.cgi?id=1957008)  
  （注意: このオプションを有効にすると FlexFox の最適化が無効化されるため、通常利用では推奨されません。）
* 検索バーの幅を修正。文字サイズの拡大・縮小設定によって幅が長すぎたり短すぎたりする問題を解消しました。
* ピン留めされたタブとアクティブなタブの背景色や枠線色をカスタマイズできる変数を追加しました:
  * **ネイティブ垂直タブ** 用: `components\uc-user-settings.css` に追加してください。
    ```css
    /* ピン留めされたタブの枠線色 */
    --uc-vt-pinned-tab-border-color: light-dark(rgba(0, 0, 0, 0.22), rgba(172, 112, 255, 0.7));
    /* 読み込まれていないピン留めタブの枠線色 */
    --uc-vt-pinned-tab-unloaded-border-color: light-dark(rgba(0, 0, 0, 0.1), rgba(172, 112, 255, 0.28));
    /* アクティブなタブの背景色 */
    --uc-vt-active-tab-bgcolor: light-dark(#ea4c895e, #9651ff80);
    /* アクティブなタブの内側の枠線シャドウ（アウトライン） */
    --uc-vt-active-tab-border-shadow: 0 0 0 1px light-dark(rgba(0, 0, 0, 0.6), rgba(255, 255, 255, 0.467));
    /* アクティブなタブの下に表示されるドロップシャドウ */
    --uc-vt-active-tab-drop-shadow: 0 1px 3px -1px light-dark(rgba(0, 0, 0, 0.196), rgba(0, 0, 0, 0.212));
    ```
  * **Sidebery** 用: `content\uc-custom-content.css` に追加してください。
    ```css
    /* ピン留めされたタブの枠線色 */
    --uc-sb-pinned-tab-border-color: light-dark(rgba(0, 0, 0, 0.22), rgba(172, 112, 255, 0.7));
    /* 読み込まれていないピン留めタブの枠線色 */
    --uc-sb-pinned-tab-unloaded-border-color: light-dark(rgba(0, 0, 0, 0.1), rgba(172, 112, 255, 0.28));
    /* アクティブなタブの背景色 */
    --uc-sb-active-tab-bgcolor: light-dark(#ea4c895e, #9651ff80);
    /* アクティブなタブの内側の枠線シャドウ（アウトライン） */
    --uc-sb-active-tab-border-shadow: 0 0 0 1px light-dark(rgba(0, 0, 0, 0.6), rgba(255, 255, 255, 0.467));
    /* アクティブなタブの下に表示されるドロップシャドウ */
    --uc-sb-active-tab-drop-shadow: 0 1px 3px -1px light-dark(rgba(0, 0, 0, 0.196), rgba(0, 0, 0, 0.212));
    ```
* 未読み込みのタブの見た目を Sidebery と同じ挙動に変更しました:
  * Firefox には未読み込みタブの表示を制御する 2 つの設定があります:
    * `browser.tabs.fadeOutExplicitlyUnloadedTabs` — 破棄されたタブを制御（既定: 有効）
    * `browser.tabs.fadeOutUnloadedTabs` — 起動時に復元される保留中のタブを制御（既定: 無効）
  * Firefox の既定動作では、未読み込みタブのアイコンはグレースケール化されフェードアウトしますが、ラベル文字列はそのまま表示されます。
  * FlexFox では Sidebery と同じ挙動に変更しました。アイコンはカラーのままラベルと同時にフェードアウトし、より統一感があり見やすい表示になります。
  * Sidebery と同じ効果を得たい場合は、上記 2 つの設定を有効にしてください。利用したくない場合は無効のままで構いません。

<a id="updates-top-start"></a>
<details>

<summary>💬 <b>過去の更新</b></summary>

**v4.5.0**
* Sidebery の展開／折りたたみアニメーションを再構築し、より滑らかで自然な動きに改善しました。
* Sidebery をサイドバーのボタンと中央揃えで整列しました。
* ネイティブ垂直タブの外観を最適化しました：
  * Sidebery と統一感のあるデザインになり、切り替えがスムーズになりました。
  * タブグループラベルの背景色を柔らかくし、閲覧中の視認性を向上させました。
  * 音声再生アイコンをサイトアイコンと重ねて省スペース化しました。
  * アクティブなタブが一目で分かるように強調表示を改善しました。
  * ピン留めタブを背景色の強調から控えめな枠線表示に変更しました。
* ピン留めタブパネルを再構築しました：
  * `uc.flex.max-visible-horizontal-pinned-tabs` を追加。1 行に表示するピン留めタブの数を 2～5 で設定できます（既定値 5）。
  * Sidebery とネイティブ垂直タブの両方に対応しています。
  * `uc.flex.max-visible-vertical-pinned-tabs` は `0`（制限なし）も設定可能になり、タブ数に応じて自動的に拡張されます。
* ピン留めタブと通常タブの間にある仕切り線を改善しました：
  * `uc.flex.show-pin-tabs-separator-in-expanded-state` で有効化できます（デフォルトでは無効）。
  * 長さを短くして中央に配置し、視覚的な干渉を抑えました。
  * ホバー時のみ全体に展開されるようになり、高さ調整は可能なまま、通常のタブ操作を妨げません。
* ブックマークスターのホバーや編集時の表示を直感的な動作に合わせて改善しました。
* ブラウザーのテーマとウェブサイトの配色が異なる場合に発生していた角丸部分の背景のはみ出しを修正しました。
* Nightly v144 の変更によりサイドバーのツールが展開できなかった問題を修正しました。 [Bug 1972629](https://bugzilla.mozilla.org/show_bug.cgi?id=1972629)  
  <p>
    <img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/new-vt-splitter-resize.webp"
         alt="新しいネイティブ垂直タブの仕切り線（ホバー時／リサイズ可能状態）"
         height="510" hspace=15 />
    <img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/new-vt-splitter-collapsed.webp"
         alt="新しいネイティブ垂直タブの仕切り線（パネル折りたたみ時）"
         height="510" hspace=15 />
    <img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/new-vt-splitter-expanded.webp"
         alt="新しいネイティブ垂直タブの仕切り線（パネル展開時）"
         height="510" hspace=15 />
  </p>

**v4.0.5**
* v142で追加された折りたたみタブグループのオーバーフローカウンターに対応しました。 [Bug 1949401](https://bugzilla.mozilla.org/show_bug.cgi?id=1949401)
* タブグループのデザインを調整し、サイズや配置を改善しました。
* ネイティブ垂直タブとSideberyの展開幅を統一しました。両者は同じ幅になり、`uc.flex.increase-sidebery-expanded-width` オプションを使うことでネイティブ垂直タブの展開幅をさらに広げることができます。
* ネイティブ垂直タブにカーソルを合わせた際、ピン留めタブの幅が早く変わってしまう問題を修正しました。
* v4.0.4で導入された組み込みページの半透明効果における表示不具合を修正しました。
* PDFビューアウィンドウとメニューに半透明背景のサポートを追加しました。Micaやカスタム壁紙が有効で、`browser.tabs.allow_transparent_browser` を使用している場合に適用されます。
* 表示スケーリングを変更した際にメニューアイコンがずれて表示される問題を修正しました。
* 表示スケーリングを変更した際にネイティブ垂直タブが中央に配置されない問題を修正しました。

**v4.0.4**
* Nightly v143 の変更により、組み込みページの半透明背景が表示されなくなっていた問題を修正しました。 [Bug 1980414](https://bugzilla.mozilla.org/show_bug.cgi?id=1980414)
* v141 の変更により、テーマの背景画像がブックマークツールバーとナビゲーションバーの間でずれて、画像が途切れて見える問題を修正しました。 [Bug 1971941](https://bugzilla.mozilla.org/show_bug.cgi?id=1971941)
* ネイティブ垂直タブが折りたたみ状態のときに、タブのハイライトが中央に配置されない問題を修正しました。 #17
* アドレスバーにフォーカスしたときの内側の陰影効果を調整しました。 #17
* macOS 風ウィンドウ操作ボタンの色をカスタマイズできる変数を追加しました。 #17

  ```css
    --uc-osx-ctrls-close-fill
    --uc-osx-ctrls-maximize-fill
    --uc-osx-ctrls-minimize-fill
    --uc-osx-ctrls-close-stroke
    --uc-osx-ctrls-maximize-stroke
    --uc-osx-ctrls-maximize-restore-stroke
    --uc-osx-ctrls-minimize-stroke
  ```

**v4.0.3**
* Nightly v143 の変更によって発生していたレイアウトの不具合を修正しました。メニューバー有効時の背景画像のズレ、および `uc.flex.disable-bookmarks-autohide` を有効にした際のサイドバーのストライプの位置ズレが含まれます。[Bug 1979014](https://bugzilla.mozilla.org/show_bug.cgi?id=1979014)
* Firefox 141 Beta 2 の変更により水平タブモードで消えていたサイドバーのストライプ色を復元しました。[Bug 1973777](https://bugzilla.mozilla.org/show_bug.cgi?id=1973777)

**v4.0.2**
* Nightly v143 の仕様変更により、ブックマークのサブフォルダーに設定したカラーアイコンが表示されなくなっていた問題を修正しました。[Bug 1979338](https://bugzilla.mozilla.org/show_bug.cgi?id=1979338)
* Nightly v143 の変更によって非表示になっていた、折りたたみ状態の垂直タブ下部のセパレーターを復元しました。[Bug 1977243](https://bugzilla.mozilla.org/show_bug.cgi?id=1977243)
* Nightly v143 の変更により発生していた、折りたたみ状態の垂直タブの表示位置ズレを修正しました（タブやアイコンが中央から左にずれて表示されていた問題）。[Bug 1936927](https://bugzilla.mozilla.org/show_bug.cgi?id=1936927)

**v4.0.1**
* `browser.tabs.allow_transparent_browser` を有効にした状態で Mica バックドロップまたはカスタム壁紙を使用している場合：
  * 「設定」「アドオンマネージャー」「新しいタブ」などの組み込みページに半透明の背景を追加。  

    <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/translucent-about-preferences.webp" alt="「設定」ページ（`about:preferences`）に適用された半透明の背景効果" width="96%" />

  * アドレスバーのドロップダウンと検索バーに背景のぼかし効果を追加。
  * カスタム壁紙モードでは、ドロップダウン全体にぼかしが適用され、ナビゲーションバーの上にも効果が反映されます。
* カスタム壁紙モード時のメニューの透明度が `uc.flex.browser-wallpaper-transparency-level` の設定値に従うようになり、壁紙の透明度と一致するようになりました。
* アプリメニューおよびコンテキストメニューで、これまでアイコンがなかった3項目にアイコンを追加。
* Firefox Nightly v143 の仕様変更により、アドレスバーのスタイルが適用されなくなっていた問題を修正（[Bug 1980372](https://bugzilla.mozilla.org/show_bug.cgi?id=1980372)）。

以前のバージョンの更新履歴については  
👉 [Wiki のアーカイブページ](https://github.com/yuuqilin/FlexFox/wiki/Earlier-Update-History-(Japanese))をご覧ください。

<a href="#updates-top-start">⏫ アップデート一覧の先頭へ戻る</a>
</details>

## ✨ 特徴

### 🌟 ミニマル設計

> *表示領域を最大限に。*

- ツールバーやサイドバーを個別に折りたたみ・非表示にできます。  
  > *サイドバーだけを隠してナビゲーションバーを残す、あるいはその逆など、柔軟に組み合わせて作業しやすい画面にできます。*

- すべてのUIを隠すことで、コンテンツに完全フォーカス。  
  > *ブラウザのUIが一切ない、まるで付箋のような小さなウィンドウを作ることができ、複数ページの並列表示や作業用のコンパクトビューにも最適です。また、全画面表示に切り替えることなくページ領域を最大化でき、デスクトップ環境へのアクセスも維持されます。*

### 🌟 安定した動作

> *UIが動いても、ページは動かない。*

- UIを展開しても、ページのレイアウトに影響なし。  
  > *折りたたまれたUIはページ上に浮かぶように表示され、表示中のページが押しのけられることはありません。*

- タブを展開しても位置がずれません。  
  > *縦型タブが展開される際、横に広がっても元の縦位置のまま動かず、マウスカーソルの再移動は不要です。*

### 🌟 適応性

> *使い方に合わせて自動調整。*

- Sidebery有効時はネイティブのタブバーを自動的に非表示に。  
  > *似た機能が重複しないように、自動的に最適化します。*

- Firefoxの様々なUI構成に対応。  
  > *タイトルバーやメニューバーの表示、ブックマークツールバーの有無、サイドバーの左右配置など、ユーザーの好みに合わせた環境でもレイアウトが崩れません。*

### 🌟 柔軟性

> *自分好みにカスタマイズ。*

- `about:config`から機能を簡単にオン・オフ可能。  
  > *不要な機能を無効にして、Firefox本来の見た目や挙動に戻すこともできます。*

- 独自スタイルで詳細設定も可能。  
  > *ユーザースタイルはFlexFox本体の後に読み込まれるため、設定を安全に上書きでき、アップデートの影響も受けません。*

## 💿 導入

### 👷 方法1：手動インストール

> [!IMPORTANT]
> 1. [Sidebery](https://addons.mozilla.org/firefox/addon/sidebery/) をインストール（推奨）。
> 2. FlexFoxをダウンロード：
>    * [FlexFox](https://github.com/yuuqilin/FlexFox/archive/refs/heads/main.zip)：通常版Firefox用
>    * [FlexFox Beta](https://github.com/yuuqilin/FlexFox/archive/refs/heads/Beta.zip)：Firefox Beta / Nightly用
>    * [FlexFox ESR](https://github.com/yuuqilin/FlexFox/archive/refs/heads/ESR.zip)：Firefox ESR用
> 3. `about:support`を開き、「プロファイルフォルダー」の「フォルダーを開く」をクリック。
> 4. `chrome` フォルダと、`scripts` フォルダ内の `user.js` をプロファイルフォルダにコピーします。
> 5. テキストエディタで `user.js` を開き、必要な機能の `//` コメントを外します。
>    * 以下の設定が次のようになっていることを確認してください：
>      * `toolkit.legacyUserProfileCustomizations.stylesheets` = `true`
>      * `svg.context-properties.content.enabled` = `true`
>      * `sidebar.visibility` = `always-show`
> 6. Firefoxを再起動し、その後 `user.js` を削除して、`about:config` の変更を保存できるようにします。
> 7. Sideberyの設定：
>    * サイドバーの歯車アイコンから設定を開く
>    * コンフリクトを避けるため、`Styles editor` にある既存のスタイルを削除してください。
>    * 「ヘルプ」→「アドオンデータをインポート」で、アーカイブ内の `Sidebery` フォルダにある `sidebery-settings.json` と `sidebery-styles.json` をインポート
>    * *注*：スタイルが正しく反映されない場合は、再度インポートを試してください。
> 8. `about:config` で `uc.flex.` を検索し、必要に応じてFlexFoxの機能を有効／無効にします。

### 🚀 方法2：自動インストールと更新

> [!IMPORTANT]
> 初めて FlexFox をインストールする場合は、スクリプトの実行後に [方法1](https://github.com/yuuqilin/FlexFox?tab=readme-ov-file#-method-1-manual-installation) の手順5以降を手動で実行してください。  
> 以降のアップデートでは、スクリプトを再実行するだけで自動的に更新されます。手動作業は不要です。

<h4>💻 PowerShellスクリプト</h4>
<details>
<summary><i>《クリックで展開》</i> 👇</summary>

- **オンライン導入** – PowerShellで次のコマンドを実行します：
  ```powershell
   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass; iex ((New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/yuuqilin/FlexFox/refs/heads/main/deploy-userchrome.ps1') -replace '(?s)<#.*?#>', '')
  ```
  **サイレント導入（オンライン）**：
  ```powershell
   $env:FLEXFOX_INSTALL_MODE = 'silent'; Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass; iex ((New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/yuuqilin/FlexFox/refs/heads/main/deploy-userchrome.ps1') -replace '(?s)<#.*?#>', '')
  ```

- **ローカル導入** – [`deploy-userchrome.ps1`](https://github.com/yuuqilin/FlexFox/raw/refs/heads/main/deploy-userchrome.ps1) をダウンロードしてPowerShellで実行：
  ```powershell
   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass; .\deploy-userchrome.ps1
  ```
  **サイレント導入（ローカル）**：
  ```powershell
   $env:FLEXFOX_INSTALL_MODE = 'silent'; Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass; .\deploy-userchrome.ps1
  ```

- **タスクスケジューラや「ファイル名を指定して実行」からの導入**：
  ```powershell
   powershell -ExecutionPolicy Bypass -Command "$env:FLEXFOX_INSTALL_MODE = 'silent'; .\deploy-userchrome.ps1"
  ```

</details>

<h4>🔃 Git Pull</h4>
<details>
<summary><i>《クリックで展開》</i> 👇</summary>

- 使用環境に応じて、`scripts` フォルダ内のいずれかの `git-pull-chrome-only` スクリプトを使ってください。これらのスクリプトでは：
  - FirefoxプロファイルフォルダをGitワーキングディレクトリとして設定
  - FlexFoxリポジトリをリモートとして登録
  - `chrome`フォルダのみを取得・更新（他のファイルは除外）

- または、手動でリモートリポジトリを追加：

  **初回セットアップ（chromeフォルダの作成）：**
  ```bash
  git init
  git remote add origin https://github.com/yuuqilin/FlexFox.git
  git sparse-checkout init --no-cone
  git sparse-checkout set /chrome
  git fetch origin
  git checkout -b main origin/main
  ```

  **手動で更新する場合：**
  ```bash
  git fetch origin
  git checkout main
  git merge origin/main --allow-unrelated-histories
  ```

</details>

## ⚙️ カスタマイズ設定

### 📜 ユーザー定義スタイル

> [!TIP] 
> FlexFox のスタイルは、将来のアップデートによって上書きされる心配なく自由にカスタマイズできます。
>
> * **インターフェース（chrome）** を変更するには、`components` フォルダに `uc-user-settings.css` を作成
> * **ウェブページ（content）** を変更するには、`content` フォルダに `uc-custom-content.css` を作成
>
> 変更したいスタイルや変数（例：`uc-variables.css` など）をこれらのファイルにコピーして編集してください。ここで定義した内容は FlexFox の設定を上書きします。
> これらのファイルはアップデートの影響を受けず、変更内容はそのまま保持されます。
>
> 💡 スタイルをコピーする際は、セレクター全体を含めて文脈を保ってください。

---

### 🧩 カスタマイズ可能な設定 (`about:config`)

#### ✅ FlexFox スタイルの動作に必須

| 設定名 | 値 | 説明 |
|--------|:------:|--------|
| `toolkit.legacyUserProfileCustomizations.stylesheets` | `true` | ユーザー定義のスタイルを適用するために、`userChrome.css` を有効にします。 |
| `svg.context-properties.content.enabled` | `true` | ライト／ダークテーマに応じてアイコンの色を自動調整できるようにします。 |
| `sidebar.visibility` | `always-show` | FlexFoxの垂直タブの自動折りたたみ機能とレイアウトを有効にします（垂直タブモード時）。この設定は、サイドバーの設定画面で **「カーソルを合わせた時にサイドバーを展開する」** のチェックを外すことでも適用できます。 |

#### 🪄 機能を追加・有効化するオプション

| 設定名 | 値 | 説明 |
|--------|:------:|--------|
| `uc.flex.add-ui-text-stroke` | `true` | UIテキストに太めのアウトラインを追加し、特に低解像度の画面での視認性を向上させます。 |
| `uc.flex.fully-hide-sidebery` | `true` | Sidebery とネイティブの縦型タブを完全に非表示にします。マウスカーソルを画面端に移動すると再表示されます。 |
| `uc.flex.fully-hide-toolbox` | `true` | 上部のすべてのツールバー（水平タブバー、ナビゲーションバー、ブックマークツールバー）を完全に非表示にします。マウスカーソルを画面上端に移動すると再表示されます。 |
| `uc.flex.auto-hide-navbar-icons` | `true` | ナビゲーションバーのアイコンを通常は非表示にし、ツールバーにカーソルを合わせると再表示されます。ウィンドウ操作ボタン、URLバー、サイドバーのボタン（FlexFox ロゴ）は常に表示されますが、サイドバーのボタンがナビゲーションバーの端に配置されていない場合や、`uc.flex.revert-to-original-sidebar-icon` が有効な場合は自動的に隠れます。 |
| `uc.flex.allow-addons-to-change-toolbar-color` | `true` | Firefox Color などの拡張機能によるツールバーの色の変更を有効にします（背景画像が設定されていない場合に必要です）。 |
| `uc.flex.enable-gradient-highlight` | `0`-`X` | FlexFox のロゴ、サイドバーのストライプ、ブックマークの星アイコンなど、主要な UI 要素に使われるハイライトカラーにグラデーションスタイルを適用します。数値で設定でき、`0` は無効、`1` ～ `X` は異なるグラデーションスタイルを選択します。 |
| `uc.flex.enable-colored-bookmarks-folder-icons` | `0`-`2` | ブックマークフォルダーのアイコンをカラー表示にします。数値で設定でき、`0` は無効、`1` は第1セットのアイコンを使用、`2` は第2セットのアイコンを使用し、ラベルは自動的に非表示になります。 |
| `uc.flex.remove-bookmarks-folder-icons` | `true` | ブックマークフォルダーのアイコンを非表示にします。 |
| `uc.flex.remove-bookmarks-labels` | `true` | ブックマークフォルダーのラベル（テキスト）を非表示にします。 |
| `uc.flex.show-flexfox-version-info-in-about-config` | `true` | `about:config` ページに FlexFox のインストール確認メッセージと現在のバージョン番号を表示します。 |
| `uc.flex.show-pin-tabs-separator-in-expanded-state` | `true` | ネイティブ垂直タブの展開状態で、固定タブと通常タブの間に区切り線を表示します。Firefox では通常ホバー時のみ表示されますが、FlexFox では常に表示され、この区切り線をドラッグして固定タブパネルの高さを調整できます。 |
| `uc.flex.move-pip-volume-to-top` | `true` | ピクチャ・イン・ピクチャ（PiP）ウィンドウ内の音量調整ボタンを上部に移動します。 |
| `uc.flex.dim-urlbar-popup-backdrop` | `0`-`2` | URL バーのドロップダウンが表示されている間、背景を暗くします。数値で設定でき、`0` は無効、`1` ～ `2` は暗さの強さを示します。値が大きいほど暗くなります。 |
| `uc.flex.enable-rounded-web-content` | `0`-`2` | Web コンテンツ領域にマージン、影、四隅の角丸を追加します。数値で設定でき、`0` は無効、`1` ～ `2` はマージンの大きさを調整します。値が大きいほどスペースが広がります。 |

#### 🚫 機能を無効化・元に戻すオプション

| 設定名 | 値 | 説明 |
|--------|:------:|--------|
| `uc.flex.disable-flexfox` | `true` | Firefox を再起動せずに、FlexFox のすべてのスタイルと機能を無効にします。 |
| `uc.flex.skip-loading-uc-*.css` | `true` | `./components/` および `./content/` 内の特定の `uc-*.css` ファイルの読み込みをスキップします。たとえば、`uc.flex.skip-loading-uc-newtab.css` を有効にすると `./content/uc-newtab.css` が読み込まれなくなります。 |
| `uc.flex.disable-bookmarks-autohide` | `true` | ブックマークツールバーの自動非表示を無効にします。 |
| `uc.flex.disable-tabs-toolbar-autohide` | `true` | Sidebery が非アクティブなときに、ネイティブの水平タブバーが自動で隠れないようにします。 |
| `uc.flex.disable-findbar-autohide` | `true` | 検索バー（Findbar）のフォーカスが外れたときに自動で隠れる動作を無効にします。 |
| `uc.flex.disable-sidebery-autohide` | `true` | Sidebery とネイティブ縦型タブの自動折りたたみを無効にします。 |
| `uc.flex.disable-nav-bar-first-item-right-padding` | `true` | デフォルトでは、ナビゲーションバーの最初の項目の後ろに右側の余白を追加して、垂直タブとその周辺項目との視覚的な区切りや整列を改善します。このオプションはその余白を無効にします。 |
| `uc.flex.disable-menu-icons` | `true` | FlexFox によって追加されたメニューのカスタムアイコンを無効にします。 |
| `uc.flex.revert-to-original-window-controls` | `true` | FlexFox 独自の macOS風ウィンドウコントロールアイコンを Firefox 標準の最小化・最大化・閉じるボタンに戻します。 |
| `uc.flex.revert-to-original-flat-corner-style` | `true` | URLバー、検索バー、検索パネルの角丸を、FlexFox 独自の大きな丸みから Firefox 標準の控えめな角丸スタイルに戻します。 |
| `uc.flex.revert-to-original-bookmark-star-icon` | `true` | FlexFox 独自のブックマーク星アイコンを Firefox 標準のデザインに戻します。 |
| `uc.flex.revert-to-original-sidebar-icon` | `true` | FlexFox 独自のロゴを使用したサイドバーアイコンを Firefox 標準のデザインに戻します。 |
| `uc.flex.remove-sidebar-stripe` | `true` | Sidebery がアクティブなときにサイドバーのストライプを非表示にします。サイドバーを切り替えるには、縦型タブモードでは <kbd>F1</kbd> を押してサイドバーツールボタンを表示し、横型タブモードでは <kbd>Ctrl</kbd> + <kbd>B</kbd> を押してサイドバーヘッダーを表示します。 |

#### 🪛 機能を調整・変更するオプション

| 設定名 | 値 | 説明 |
|--------|:------:|--------|
| `uc.flex.increase-sidebery-expanded-width` | `true` | Sidebery と Firefox 標準の縦型タブを展開したときの幅を広くします。 |
| `uc.flex.increase-navbar-height` | `true` | 以前のFlexFoxバージョンで使用されていた、より厚みのあるナビゲーションバーの高さを復元します。現在のデフォルト（Firefox本来のコンパクトな高さ）を上書きします。 |
| `uc.flex.switch-to-alternate-condensed-panel` | `true` | デフォルトでは、FlexFox は Firefox 標準の統合拡張機能パネルをアイコンのみのビューに置き換えます。この状態では、拡張機能アイコンを右クリックすることでオプションにアクセスできます。この設定を有効にすると、拡張名やオプションボタンも表示される簡易ビューに切り替わり、より情報が分かりやすくなります。 |
| `uc.flex.sidebery-fast-hover-expand` | `true` | Sidebery とネイティブ垂直タブの自動展開・折りたたみの動作を高速化します。 |
| `uc.flex.sidebery-slow-hover-expand` | `true` | Sidebery とネイティブ垂直タブの自動展開・折りたたみの動作を低速化します。 |
| `uc.flex.sidebery-apply-expand-speed-to-toolbars` | `true` | Sidebery／垂直タブと同じ速度でツールバーを統一。Mica またはカスタム壁紙使用時は自動適用。 |
| `uc.flex.max-visible-horizontal-pinned-tabs` | `2`-`5`<br>(`5`) | Sidebery とネイティブ垂直タブのピン留めタブについて、1 行に表示するタブの数を設定します。指定した数を超えると、自動的に次の行に折り返されます。 |
| `uc.flex.max-visible-vertical-pinned-tabs` | `0` \|<br>`4`–`6`<br>(`4`) | ネイティブ垂直タブで固定タブの行数の上限を設定します。上限を超えると固定タブパネルにスクロールバーが表示されます。`0` に設定すると制限が解除され、パネルがタブ数に応じて無制限に拡張されます。 |
| `uc.flex.findbar-position` | `'top-center-left'`\|<br>`'top-right'`\|<br>`'bottom-right'` | 検索バー（Findbar）の表示位置を設定します。指定可能な値は文字列 `'top-center-left'` または `'1'`（左寄せ上部）、`'top-right'` または `'2'`（右上）、`'bottom-right'` または `'3'`（右下）です。 |
| `uc.flex.menu-item-spacing` | `'small'`\|<br>`'medium'`\|<br>`'large'` | Firefoxのアプリメニュー、ブックマークメニュー、右クリックメニューにおける項目同士の垂直間隔を設定します。指定可能な値は文字列 `'1'` または `'small'`（狭い間隔）、`'2'` または `'medium'`（標準の間隔）、`'3'` または `'large'`（広い間隔）です。 |

#### ⚙️ Firefox ネイティブ設定
| 設定名 | 値 | 説明 |
|--------|:------:|--------|
| `browser.tabs.fadeOutExplicitlyUnloadedTabs` | `true` | ネイティブの Firefox 設定で、垂直サイドバー内の破棄されたタブをフェードアウト表示にします。 |
| `browser.tabs.fadeOutUnloadedTabs` | `true` | ネイティブの Firefox 設定で、垂直サイドバー内の起動時に復元待ちのタブをフェードアウト表示にします。 |
| `sidebar.visibility` | `expand-on-hover` | FlexFoxが提供する垂直タブの自動折りたたみ機能とレイアウトを無効にします。この設定は、サイドバーの設定画面で **「カーソルを合わせた時にサイドバーを展開する」** にチェックを入れることでも適用できます。このモードでは、サイドバーの幅を自由に調整したり、<kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>Z</kbd>キーやサイドバーの切り替えボタンで展開・折りたたみを切り替えたりできます。 |
| `sidebar.animation.expand-on-hover.duration-ms` | `120` | ネイティブの Firefox 設定で、`sidebar.visibility` が `expand-on-hover` に設定されているときに、垂直サイドバーの展開・折りたたみにかかるアニメーション速度を制御します。 |

#### 🧊 背景の見た目とMica効果

| 設定名 | 値 | 説明 |
|--------|:------:|--------|
| `widget.windows.mica` | `true` | Firefox のネイティブな Mica 背景効果を有効にします。有効にするには、テーマを `システムテーマ — 自動` に設定する必要があります。この機能は Windows 11 環境でのみ利用可能です。お使いのシステムが Mica をサポートしていない場合は、`uc.flex.browser-wallpaper-enabled` を使って類似の効果を模倣できます。 |
| `widget.windows.mica.popups` | `1`\|`2`<br>(`2`) | ポップアップメニューに Mica 背景効果を適用します。`0`（無効）、`1`（有効）、`2`（自動）を指定できます。 |
| `widget.windows.mica.toplevel-backdrop` | `2` | 使用する Mica 背景の種類を指定します：`0`（自動または無効）、`1`: Mica、`2`: Acrylic、`3`: Mica Alt。FlexFox は `2`: Acrylic を前提として設計されています。 |
| `browser.tabs.allow_transparent_browser` | `true` | Sidebery とウェブコンテンツの背景を透過させて、Mica や壁紙を表示できるようにします。**反映には Firefox の再起動が必要です。** ウェブページの透過には [Transparent Zen](https://addons.mozilla.org/firefox/addon/transparent-zen/) または [Zen Internet](https://addons.mozilla.org/firefox/addon/zen-internet/) の導入が必要です。ページが読みにくくなった場合は、[Dark Reader](https://addons.mozilla.org/firefox/addon/darkreader/) の併用を推奨します。 |
| `uc.flex.browser-mica-transparency-level` | `0`-`4`<br>(`2`) | ブラウザーの Mica バックドロップマスクの透明度を調整します。数値で設定でき、0 ～ 4 を指定します。値が大きいほど、マスクの効果が薄くなり背景がより明瞭に表示されます。Firefox のデフォルトは 0 で、FlexFox のデフォルトは 2 に設定されています。 |
| `uc.flex.browser-wallpaper-enabled` | `true` | Firefox ブラウザーの背景にカスタム壁紙を表示します。この機能では、ネイティブの Mica 効果を模倣するアクリル風のぼかしが適用されます。Mica が使用できない環境や、常に同じ背景を表示したい場合に便利です。ただし、見た目は Mica と完全には一致しません。 |
| `uc.flex.browser-wallpaper-index` | `1`-`9`<br>(`1`) | 番号付きの壁紙画像をブラウザーの背景として指定します。設定値は数値で、1 ～ 9 を指定できます。各値は、`../icons/wallpaper/` フォルダーにある `main-image-1.jpg` ～ `main-image-9.jpg` に対応します。|
| `uc.flex.browser-wallpaper-acrylic-disabled` | `true` | カスタム壁紙に適用されるアクリル風ぼかし効果を無効にします。 |
| `uc.flex.browser-wallpaper-transparency-level` | `0`-`4`<br>(`2`) | ブラウザーの壁紙マスクの透明度を調整します。数値で設定でき、0 ～ 4 を指定します。値が大きいほど、マスクの効果が薄くなり壁紙がはっきり表示されます。この設定は Mica の透明度と視覚的に揃うように設計されています。FlexFox のデフォルトは 2 に設定されています。 |
| `uc.flex.browser-wallpaper-contrast-level` | `0`-`4`<br>(`2`) | ダークモードでアクリル風ぼかし効果を使用する際、ブラウザーの壁紙のコントラストを調整します。0〜4 の数値を指定でき、値が大きいほどコントラストが強くなります。FlexFox のデフォルト値は 2 です。 |

## 🐞 既知の問題

- **Floorp使用時の注意点：**  
  Floorpのインターフェース設定で`Firefox Proton UI`を選択すると、互換性の問題が軽減されます。

- **動作環境について：**  
  Windows環境での動作確認を行っています。他のOSでは別途調整が必要な場合があります。

## 🎖️ クレジット

FlexFox は、以下の優れたプロジェクトの成果を基盤に構築されています：

- **[VerticalFox](https://github.com/christorange/VerticalFox)** — 垂直タブのレイアウトと、いくつかのレイアウト設計の基本となる発想を提供してくれました。  
- **[firefox-csshacks](https://github.com/MrOtherGuy/firefox-csshacks)** — 多くの微調整やレイアウトの修正において、この素晴らしい CSS コレクションを活用しています。

また、以下のプロジェクトからもデザインや機能の着想を得ています：

- [EdgyArc-fr](https://github.com/artsyfriedchicken/EdgyArc-fr)  
- [Edge-Frfox](https://github.com/bmFtZQ/edge-frfox)  
- [ArcWTF](https://github.com/KiKaraage/ArcWTF)  
- [shimmer](https://github.com/nuclearcodecat/shimmer)
- [firefox-gx](https://github.com/Godiesc/firefox-gx)

これらの素晴らしい制作者の皆様に、心から感謝いたします。

<details>
  <summary><h2 style="display: inline;">📄 ライセンス</h2></summary>
  <hr style="border: none; border-top: 1px solid #d0d7de; margin: 16px 0;">
  <p>本プロジェクトは主に MIT ライセンスのもとで公開されています。<br>
  ただし、一部のソースコード（以下参照）は Mozilla Public License 2.0（MPL-2.0）でライセンスされたコードを組み込んでいます。</p>

  <p>具体的には、<code>uc-sidebar.css</code> 内の一部コードは、以下のプロジェクトに由来しています：</p>

  <ul>
    <li><strong>プロジェクト</strong>：firefox-gx</li>
    <li><strong>作者</strong>：@Godiesc</li>
    <li><strong>リポジトリ</strong>：<a href="https://github.com/Godiesc/firefox-gx">https://github.com/Godiesc/firefox-gx</a></li>
    <li><strong>ライセンス</strong>：MPL-2.0</li>
  </ul>

  <p>該当するコードには元の MPL-2.0 のライセンス表記が保持されており、ライセンス条件を遵守しています。<br>
  MPL-2.0 の全文は <code>LICENSES/MPL-2.0.txt</code> をご覧ください。</p>
</details>
