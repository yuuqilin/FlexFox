# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox（日本語版）

<div>
 <a href='https://www.mozilla.org'><img src="https://img.shields.io/badge/Last%20tested%20Firefox-v145-orange?logo=firefox"></a>
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

## 🆕 最新情報

**🦊 v5.5.1**
* `uc.flex.remove-sidebar-stripe` を有効にした際、Sidebery パネルの上下の境界線の色が一致しない問題を修正しました。
* `uc.flex.move-urlbar-popup-to-center` を有効にして水平タブを使用している場合に、URL バーのアニメーション遷移が消える問題を修正しました。
* Nightly v145 の更新により発生した、縦型タブのタブグループラベルの角丸が他のタブと一致しない問題を修正しました。 [Bug 1989112](https://bugzilla.mozilla.org/show_bug.cgi?id=1989112)
* Nightly v145 の更新により発生した、URL バーのアイコンの角丸が消える問題を修正しました。 [Bug 1992450](https://bugzilla.mozilla.org/show_bug.cgi?id=1992450)
* 新しいオプション `uc.flex.enable-rounded-web-content-at-sidebery-corner` を追加しました。`uc.flex.enable-rounded-web-content` が有効な場合、Sidebery のカラーストライプ側の角にも角丸効果を適用します。

**✨ FlexFox v5.5.0 – UI / UX の改善**

* `uc.flex.style-sidebar-button` を追加。サイドバー切り替えボタンのアイコンを変更可能 (`1`～`4`)。
  * `1` = Firefox Master Brand Logo（既定、従来と同じ）
  * `2` = Firefox Browser Logo
  * `3` = Firefox System 1 Logo
  * `4` = Mozilla Flag Symbol
* `uc.flex.style-toolbar-bgcolor` を追加。ナビゲーションバーとサイドバーの背景色を変更可能 (`1`～`2`)。
  * `1` = Tokyo Night テーマ（既定、従来と同じ）
  * `2` = Firefox Acorn Design
* `uc.flex.style-urlbar` を追加。URLバーの外観を切り替え可能 (`1`～`4`)。
  * `1` = Flat（既定、従来と同じ）
  * `2` = Inset（バーが埋め込まれたデザイン、中央揃えの文字）
  * `3` = Debossed（凹んだデザイン、中央揃えの文字）
  * `4` = Seamless（ナビゲーションバーと完全に一体化、中央揃えの文字）
* `uc.flex.move-urlbar-popup-to-center` を追加。URLバーのポップアップ位置を調整 (`0`～`2`)。
  * `0` = 無効（既定）
  * `1` = フォーカス時に中央へ移動
  * `2` = 入力中のみ中央へ移動
* `uc.flex.dim-urlbar-popup-backdrop` の背景暗化効果を新しい挙動に合わせて更新 (`0`～`2`)。
  * `0` = 暗化なし（既定）
  * `1` = 35% 暗化
  * `2` = 50% 暗化
* `uc.flex.style-window-controls` を追加。ウィンドウコントロールのアイコンを変更可能 (`1`～`3`)。
  * `1` = Traffic Light Buttons（既定、従来と同じ）
  * `2` = Yosemite Window Buttons
  * `3` = Yosemite GTK テーマ
* `uc.flex.style-window-controls-shift-up` を追加。ウィンドウコントロールをわずかに上方向へ移動（既定値: `False`）。
* `uc.flex.style-window-controls-shrink-size` を追加。ウィンドウコントロールを小型化（既定値: `False`）。
* `uc.flex.move-window-controls-to-left` を追加。ウィンドウコントロールをナビゲーションバーまたは水平タブバーの左端へ移動（既定値: `False`）。

  * 注: `uc.flex.auto-hide-navbar-and-keep-horizontal-tabs` が有効で、かつ `uc.flex.restore-window-controls-on-tabbar` が無効の場合、この設定は反映されません。
* URLバーのポップアップのシャドウを改善。
* Findbar の外観を調整し、サイズや角の滑らかさ、陰影、アニメーションの動きを最適化。
* `uc.flex.enable-colored-bookmarks-folder-icons` が “Other Bookmarks” フォルダーに対応。
* `uc.flex.style-tab-group` のアニメーション有効時、インジケーターに回転エフェクトを追加。
* `uc.flex.style-tab-group` = `2` または `4` のとき、折りたたまれたタブが表示されない問題を修正。
* `uc.flex.remove-sidebar-stripe` と `uc.flex.show-tab-count-in-alltabs-button` を併用した際のカウント不具合を修正。
* `uc.flex.auto-hide-horizontal-tabs-and-keep-navbar` = `2` かつ `uc.flex.show-tab-close-button-on-favicon-hover` が有効な場合に、アイコンが隠れない問題を修正。
* Firefox v143 による URL バー内の検索エンジン切り替えボタンのスタイル崩れを修正（[Bug 1980913](https://bugzilla.mozilla.org/show_bug.cgi?id=1980913)）。
* その他多数のバグ修正と調整。
* `uc.flex.show-flexfox-version-info-in-about-config` が既定で有効化されました。無効にするには `False` に設定してください。

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
<summary>🧩 <b>新機能：Sidebery と水平タブの新しいレイアウトモード</b> <i>《クリックで展開》</i> 👇</summary>  

* Sidebery に 2 種類の新しいレイアウトモードを追加
  * `uc.flex.sidebery-allow-resizable-width` を追加：サイドバーの仕切りをドラッグして Sidebery の幅を自由に変更できます。
  * このオプションを有効にすると Sidebery の自動折りたたみは無効になりますが、サイドバーの切り替えボタン（Firefox ロゴ）で展開／折りたたみを操作できます。
  * 自動折りたたみを一時的に戻したい場合は、`Hide Sidebery` ショートカットを使うか、<kbd>F1</kbd> でネイティブの垂直タブに切り替えてください。
* 水平タブに 3 種類の新しいレイアウトモードを追加し、機能を最適化
  * 旧オプション `uc.flex.disable-tabs-toolbar-autohide` を廃止。Sidebery が有効でないときでも、水平タブはデフォルトで表示されます。
  * `uc.flex.auto-hide-horizontal-tabs-and-keep-navbar` を追加：Sidebery が有効でないときに水平タブを自動で隠し、ナビゲーションバーにカーソルを合わせると表示します。設定値：`0` = 無効、`1` = ナビゲーションバーの下に表示、`2` = 上に表示。
  * `uc.flex.auto-hide-navbar-and-keep-horizontal-tabs` を追加：Sidebery が有効でないときにナビゲーションバーを自動で隠し、水平タブにカーソルを合わせると表示します。設定値：`0` = 無効、`1` = 有効。前の自動非表示設定より優先されます。
  * `uc.flex.disable-tab-close-button-on-inactive-horizontal-tabs` を追加：水平タブモードで、デフォルトでは非アクティブタブにカーソルを合わせると閉じるボタンが表示されます。タブ数が増えて幅が狭くなると、誤クリックを防ぐためにボタンは自動的に縮小して右上に移動します。このオプションを有効にすると、閉じるボタンを完全に非表示にできます。
  * `uc.flex.show-tab-close-button-on-favicon-hover` を追加：水平タブモードで、閉じるボタンをファビコンと統合してスペースを節約します。閉じるボタンはファビコンにカーソルを合わせたときのみ表示されます。このオプションを有効にすると、上記の自動縮小・移動の挙動が無効化されます。
  * `uc.flex.increase-active-horizontal-tab-min-width` を追加：タブが狭まったときにもアクティブタブを広めに確保し、他のタブと区別しやすくなるようにします。設定値：
    * `0` = 無効
    * `1` = 最小幅 1.8 倍、アニメーションなし
    * `2` = 最小幅 1.8 倍、アニメーションあり
    * `3` = 最小幅 2 倍、アニメーションなし
    * `4` = 最小幅 2 倍、アニメーションあり
    * デフォルト：`1`（有効）。すべてのタブを固定幅にしたい場合は `0` を設定してください。
  * 水平ピン留めタブは可視数を超えると自動的に折りたたまれます。可視ピン留めタブの既定値は 10 個です。`uc.flex.max-visible-horizontal-pinned-tabs` で調整できます（設定値 `1`～`5` は 2～10 個に対応）。

</details>

<details>  
<summary>🧩 <b>新機能：ピン留めタブパネルのグリッドレイアウトをカスタマイズ可能に</b> <i>[クリックで展開]</i> 👇</summary>

* `uc.flex.max-visible-horizontal-pinned-tabs` を追加し、ピン留めタブパネルの 1 行に表示するタブ数（横方向）を設定できます。
  * 設定範囲は `1`～`5`（既定値 `5`）。
  * 垂直タブでは、超過したピン留めタブは次の行に折り返されます。
  * 水平タブでは、超過したピン留めタブは自動で折りたたまれます（設定値により表示タブ数 2～10 に相当）。

* `uc.flex.max-visible-vertical-pinned-tabs` を追加し、ピン留めタブパネルの 1 列に表示するタブ数（縦方向）を設定できます。
  * 設定範囲は `2`～`8`（既定値 `4`）。
  * ネイティブ垂直タブと Sidebery の両方に対応し、パネルの高さを制限します。
  * ピン留めタブが設定値を超える場合、残りのタブはスクロールバーで表示できます。
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
<summary>🔢 <b>新機能：タブカウンター＆タブインデックス</b> <i>[クリックで展開]</i> 👇</summary>

* `uc.flex.show-tab-count-in-alltabs-button` オプションを追加し、「すべてのタブを一覧」ボタンに現在開いているタブの合計数を表示できるようにしました。設定値は以下の通りです：
  * `0` = 無効
  * `1` = アイコン＋数（全タブ）
  * `2` = アイコン＋数（読み込み済みタブのみ）
  * `3` = 数字のみ（全タブ）
  * `4` = 数字のみ（読み込み済みタブのみ）
* `uc.flex.show-tab-number-in-tab-label` オプションを追加し、ネイティブタブラベル上に各タブのインデックス番号を表示できるようにしました。ラベルが狭くて全文が表示されない場合でも、タブを素早く識別できます。

</details>

<details>  
<summary>👻 <b>新機能：ツールバーのアイコンとウィンドウ操作ボタンを自動で非表示</b> <i>《クリックで展開》</i> 👇</summary>

* `uc.flex.auto-hide-navbar-icons` オプションを追加しました。このオプションを有効にすると、ツールバー上のアイコン（ナビゲーションバー、ブックマークツールバー、メニューバーのアイテムを含む）が既定で非表示になり、ホバー時に表示されます。URLバーやウィンドウ操作ボタンには影響しません。
* `uc.flex.auto-hide-window-controls` オプションを追加しました。このオプションを有効にすると、ウィンドウ操作ボタン（最小化・最大化・閉じる）が既定で非表示になり、ツールバーの端にカーソルを合わせたときのみ表示されます。
* サイドバー切り替えボタン（FlexFoxロゴ）は通常常に表示されます。ナビゲーションバーの端（最左端または最右端）に配置されていない場合、または `uc.flex.revert-to-original-sidebar-icon` オプションが有効な場合、このボタンも自動非表示の対象となります。
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
<summary>🖌️ <b>新機能：Sidebery の背景がテーマに連動</b> <i>《クリックで展開》</i> 👇</summary>

* FlexFox は、Firefox の現在のテーマに合わせて Sidebery の背景色を自動で切り替えられるようになりました。
* この機能を有効にするには、Sidebery の **設定 → 外観 → カラースキーム** で `"firefox"` を選択してください。
  <details><summary>Sidebery の外観設定のスクリーンショットを見る</summary>
  <img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/sidebery-appearance-settings.  webp"alt="Sidebery の外観設定" width="50%" />
  </details>

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

<a id="updates-top-start"></a>
<details>

<summary>💬 <b>過去の更新</b></summary>

**v5.0.3**

* URL バーにフォーカスしている時は、水平タブバーが常に表示されるように改善しました。
* アクティブなタブの幅が変化する際のアニメーション速度を、`uc.flex.sidebery-fast-hover-expand` と `uc.flex.sidebery-slow-hover-expand` で調整できるようになりました。
* `uc.flex.sidebery-allow-resizable-width` を有効にして折りたたみ状態にした時の音量アイコンの位置を調整しました。
* 「カーソルを合わせた時にサイドバーを展開する」と `uc.flex.fully-hide-sidebery` を同時に有効にすると、ネイティブ垂直タブが展開できない不具合を修正しました。 (#21)
* ネイティブ垂直タブで、ピン留めタブから DOM フルスクリーンに入って終了した後にアイコンがずれる不具合を修正しました。
* タブグループ作成時に「完了」と「キャンセル」ボタンの文字が表示されない不具合を修正しました。
* v5.0.2 で発生したリグレッションを修正しました。`Lock Sidebery` と `Hide Sidebery` を同時に有効にすると、ネイティブ垂直タブが展開できなくなる問題です。
* `uc.flex.auto-hide-navbar-and-keep-horizontal-tabs` を有効にした状態で、タブバーを展開するためにカーソルを合わせた際に、タブバーとナビゲーションバーの間を移動すると点滅する問題を修正しました。
* コンテキストメニューに「Copilot」と「新しいグループにタブを追加」のアイコンを追加しました。
* ネイティブ垂直タブのタブグループの外観を変更できるオプション `uc.flex.style-tab-group` を追加しました：
  * `1`（デフォルト）：展開/折りたたみインジケーターあり、アニメーションなし
  * `2`：インジケーターあり、展開/折りたたみアニメーションあり
  * `3`：ラベル中央揃え、インジケーターなし、アニメーションなし
  * `4`：ラベル中央揃え、インジケーターなし、アニメーションあり

**v5.0.2**

* **パフォーマンス**: 一部コードをリファクタリングし、ネイティブ垂直タブの展開・折りたたみアニメーションのCPU使用率を v4.0.5 と比べて40％削減しました。Firefox標準の「カーソルを合わせた時にサイドバーを展開する」オプションと同等の性能ですが、依然として Sidebery より2倍重いです。Sidebery はネイティブ垂直タブより高速で機能豊富、バグも少なく、利用を推奨します。
* **ビジュアル**: Mica やカスタム壁紙を有効にした際に、折りたたみアニメーションで発生するゴースト（ghosting）現象を修正しました。
* **新しいオプション**: `uc.flex.restore-window-controls-on-tabbar` を追加しました。水平タブモードでタブバー上にウィンドウコントロールボタンを復元できます。
* **その他**: 複数の細かな不具合を修正しました。

**v5.0.1**

* `uc.flex.sidebery-allow-resizable-width` の使いやすさを改善しました。
  * サイドバーボタン（Firefox ロゴ）で折りたたみ状態に切り替えた際に、Sidebery が左右に揺れて画面が大きく乱れる問題を防止しました。
  * Sidebery の幅が狭くなった時にピン留めタブが自動で折り返され、はみ出してクリックできなくなるのを回避できるようになりました。
* `uc.flex.max-visible-vertical-pinned-tabs` がネイティブ垂直タブだけでなく Sidebery のピン留めタブパネルにも対応するようになりました。
  * デフォルト値は `4` で、最大 4 行まで表示され、それ以上はスクロールできます。
  * 設定範囲が `2`～`8` に拡大されました。
  * `0` を設定すると高さ制限が解除され、無制限に展開できます。
* Firefox の「ツールバーカスタマイズ」モードで `uc.flex.auto-hide-navbar-and-keep-horizontal-tabs` を有効にしていると、ホバーしていない時にウィンドウ操作ボタンが消えてしまう問題を修正しました。
* Nightly v144 の変更によってタググループラベルの外観が崩れてしまう問題を修正しました。 [Bug 1981197](https://bugzilla.mozilla.org/show_bug.cgi?id=1981197)
* Nightly v144 の変更によって、ネイティブ垂直タブを折りたたみ状態に切り替えた時に幅が崩れてしまう問題を修正しました。 [Bug 1985296](https://bugzilla.mozilla.org/show_bug.cgi?id=1985296)
* Nightly v144 の変更によって `uc.flex.show-tab-count-in-alltabs-button` のカウンターが動作しなくなる問題を修正しました。 [Bug 1985296](https://bugzilla.mozilla.org/show_bug.cgi?id=1985296)

**✨ v5.0.0 – 主な機能アップデート**

* Sidebery に 2 種類の新しいレイアウトモードを追加
  * `uc.flex.sidebery-allow-resizable-width` を追加：サイドバーの仕切りをドラッグして Sidebery の幅を自由に変更できます。
  * このオプションを有効にすると Sidebery の自動折りたたみは無効になりますが、サイドバーの切り替えボタン（Firefox ロゴ）で展開／折りたたみを操作できます。
  * 自動折りたたみを一時的に戻したい場合は、`Hide Sidebery` ショートカットを使うか、<kbd>F1</kbd> でネイティブの垂直タブに切り替えてください。
* 水平タブに 3 種類の新しいレイアウトモードを追加し、機能を最適化
  * 旧オプション `uc.flex.disable-tabs-toolbar-autohide` を廃止。Sidebery が有効でないときでも、水平タブはデフォルトで表示されます。
  * `uc.flex.auto-hide-horizontal-tabs-and-keep-navbar` を追加：Sidebery が有効でないときに水平タブを自動で隠し、ナビゲーションバーにカーソルを合わせると表示します。設定値：`0` = 無効、`1` = ナビゲーションバーの下に表示、`2` = 上に表示。
  * `uc.flex.auto-hide-navbar-and-keep-horizontal-tabs` を追加：Sidebery が有効でないときにナビゲーションバーを自動で隠し、水平タブにカーソルを合わせると表示します。設定値：`0` = 無効、`1` = 有効。前の自動非表示設定より優先されます。
  * `uc.flex.disable-tab-close-button-on-inactive-horizontal-tabs` を追加：水平タブモードで、デフォルトでは非アクティブタブにカーソルを合わせると閉じるボタンが表示されます。タブ数が増えて幅が狭くなると、誤クリックを防ぐためにボタンは自動的に縮小して右上に移動します。このオプションを有効にすると、閉じるボタンを完全に非表示にできます。
  * `uc.flex.show-tab-close-button-on-favicon-hover` を追加：水平タブモードで、閉じるボタンをファビコンと統合してスペースを節約します。閉じるボタンはファビコンにカーソルを合わせたときのみ表示されます。このオプションを有効にすると、上記の自動縮小・移動の挙動が無効化されます。
  * `uc.flex.increase-active-horizontal-tab-min-width` を追加：タブが狭まったときにもアクティブタブを広めに確保し、他のタブと区別しやすくなるようにします。設定値：
    * `0` = 無効
    * `1` = 最小幅 1.8 倍、アニメーションなし
    * `2` = 最小幅 1.8 倍、アニメーションあり
    * `3` = 最小幅 2 倍、アニメーションなし
    * `4` = 最小幅 2 倍、アニメーションあり
    * デフォルト：`1`（有効）。すべてのタブを固定幅にしたい場合は `0` を設定してください。
  * 水平ピン留めタブは可視数を超えると自動的に折りたたまれます。可視ピン留めタブの既定値は 10 個です。`uc.flex.max-visible-horizontal-pinned-tabs` で調整できます（設定値 `1`～`5` は 2～10 個に対応）。
* `uc.flex.auto-hide-window-controls` を追加：ナビゲーションバー上のウィンドウコントロールを自動で隠し、端にカーソルを合わせると表示します。
* `uc.flex.show-tab-count-in-alltabs-button` を追加：「すべてのタブを一覧」ボタンに現在開いているタブの合計数を表示します。設定値：
  * `0` = 無効
  * `1` = アイコン＋数（全タブ）
  * `2` = アイコン＋数（読み込み済みタブのみ）
  * `3` = 数字のみ（全タブ）
  * `4` = 数字のみ（読み込み済みタブのみ）
* `uc.flex.show-tab-number-in-tab-label` を追加：ネイティブタブラベルに番号を表示し、ラベルが狭くて全文が見えないときでも素早く識別できます。
* 水平タブ時の Firefox ロゴ表示を改善：Sidebery が有効なときのみ位置移動と拡大が行われます。
* ネイティブ垂直タブの音量アイコンの見た目を改善し、違和感を軽減しました。
* `uc.flex.disable-sidebery-autohide` と `Hide Sidebery` を併用した場合に発生していた Mica 背景の透過問題を修正しました。
* UI テーマとページテーマが逆になっているとき、全画面表示でコンテンツの角丸が正しく解除されない問題を修正しました。
* Mica バックドロップとカスタム壁紙関連のコードをリファクタリングし、パフォーマンスを約 4% 向上しました。

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
| `sidebar.visibility` | `always-show` | FlexFox の**最適化された**垂直タブの自動折りたたみ機能とレイアウトを有効にします（垂直タブモード時）。FlexFox の多くの機能はこの設定に依存しています。この設定は、サイドバーの設定画面で **「カーソルを合わせた時にサイドバーを展開する」** のチェックを外すことでも適用できます。 |

#### 🪄 機能を追加・有効化するオプション

| 設定名 | 値 | 説明 |
|--------|:------:|--------|
| `uc.flex.add-ui-text-stroke` | `true` | UIテキストに太めのアウトラインを追加し、特に低解像度の画面での視認性を向上させます。 |
| `uc.flex.fully-hide-sidebery` | `true` | Sidebery とネイティブの縦型タブを完全に非表示にします。マウスカーソルを画面端に移動すると再表示されます。 |
| `uc.flex.fully-hide-toolbox` | `true` | 上部のすべてのツールバー（水平タブバー、ナビゲーションバー、ブックマークツールバー）を完全に非表示にします。マウスカーソルを画面上端に移動すると再表示されます。 |
| `uc.flex.auto-hide-horizontal-tabs-and-keep-navbar` | `0`-`2` | 水平タブモードで、Sidebery が非アクティブ時に水平タブを自動で非表示にします。ナビゲーションバーにカーソルを合わせるとタブが表示されます。値：`0` = 無効、`1` = ナビゲーションバー下に表示、`2` = ナビゲーションバー上に表示。 |
| `uc.flex.auto-hide-navbar-and-keep-horizontal-tabs` | `0`-`1` | 水平タブモードで、Sidebery が非アクティブ時にナビゲーションバーを自動で非表示にします。水平タブにカーソルを合わせるとナビゲーションバーが表示されます。値：`0` = 無効、`1` = 有効。このオプションは優先度が高く、`uc.flex.auto-hide-horizontal-tabs-and-keep-navbar` と同時に有効にした場合、そちらを上書きします。 |
| `uc.flex.auto-hide-navbar-icons` | `true` | ツールバーのアイコン（ナビゲーションバー、ブックマークツールバー、メニューバーのアイテムを含む）を既定で非表示にし、ツールバーにカーソルを合わせると再表示されます。このオプションは URL バーやウィンドウ操作ボタンには影響しません。サイドバー切り替えボタン（FlexFoxロゴ）は通常常に表示されますが、ナビゲーションバーの端に配置されていない場合、または `uc.flex.revert-to-original-sidebar-icon` が有効な場合は自動非表示の対象となります。 |
| `uc.flex.auto-hide-window-controls` | `true` | ウィンドウ操作ボタン（最小化・最大化・閉じる）を既定で非表示にし、ツールバーの端にカーソルを合わせると再表示されます。 |
| `uc.flex.allow-addons-to-change-toolbar-color` | `true` | Firefox Color などの拡張機能によるツールバーの色の変更を有効にします（背景画像が設定されていない場合に必要です）。 |
| `uc.flex.enable-gradient-highlight` | `0`-`X` | FlexFox のロゴ、サイドバーのストライプ、ブックマークの星アイコンなど、主要な UI 要素に使われるハイライトカラーにグラデーションスタイルを適用します。数値で設定でき、`0` は無効、`1` ～ `X` は異なるグラデーションスタイルを選択します。 |
| `uc.flex.enable-colored-bookmarks-folder-icons` | `0`-`2` | ブックマークフォルダーのアイコンをカラー表示にします。数値で設定でき、`0` は無効、`1` は第1セットのアイコンを使用、`2` は第2セットのアイコンを使用し、ラベルは自動的に非表示になります。 |
| `uc.flex.remove-bookmarks-folder-icons` | `true` | ブックマークフォルダーのアイコンを非表示にします。 |
| `uc.flex.remove-bookmarks-labels` | `true` | ブックマークフォルダーのラベル（テキスト）を非表示にします。 |
| `uc.flex.show-flexfox-version-info-in-about-config` | `true` | `about:config` ページに FlexFox のインストール確認メッセージと現在のバージョン番号を表示します。 |
| `uc.flex.show-pin-tabs-separator-in-expanded-state` | `true` | ネイティブ垂直タブの展開状態で、固定タブと通常タブの間に区切り線を表示します。Firefox では通常ホバー時のみ表示されますが、FlexFox では常に表示され、この区切り線をドラッグして固定タブパネルの高さを調整できます。 |
| `uc.flex.show-tab-close-button-on-favicon-hover` | `true` | 水平タブで閉じるボタンをファビコンと統合してスペースを節約します。ファビコンにカーソルを合わせるとボタンが表示されます。有効化すると、タブが狭くなったときの閉じるボタンの自動縮小・移動機能は自動的に停止します。 |
| `uc.flex.show-tab-count-in-alltabs-button` | `0`-`4` | 「すべてのタブを一覧表示」ボタンにタブの総数を表示します。数値で設定でき、`0` は無効、`1` はアイコンと数字を表示（すべてのタブ）、`2` はアイコンと数字を表示（読み込み済みタブのみ）、`3` は数字のみを表示（すべてのタブ）、`4` は数字のみを表示（読み込み済みタブのみ）です。 |
| `uc.flex.show-tab-number-in-tab-label` | `true` | 各タブラベルの前に番号を表示します。ラベルの文字が狭いスペースで省略される場合でも、タブを見分けやすくなります。 |

#### 🚫 機能を無効化・元に戻すオプション

| 設定名 | 値 | 説明 |
|--------|:------:|--------|
| `uc.flex.disable-flexfox` | `true` | Firefox を再起動せずに、FlexFox のすべてのスタイルと機能を無効にします。 |
| `uc.flex.skip-loading-uc-*.css` | `true` | `./components/` および `./content/` 内の特定の `uc-*.css` ファイルの読み込みをスキップします。たとえば、`uc.flex.skip-loading-uc-newtab.css` を有効にすると `./content/uc-newtab.css` が読み込まれなくなります。 |
| `uc.flex.disable-bookmarks-autohide` | `true` | ブックマークツールバーの自動非表示を無効にします。 |
| `uc.flex.disable-findbar-autohide` | `true` | 検索バー（Findbar）のフォーカスが外れたときに自動で隠れる動作を無効にします。 |
| `uc.flex.disable-sidebery-autohide` | `true` | Sidebery とネイティブ縦型タブの自動折りたたみを無効にします。 |
| `uc.flex.disable-tab-close-button-on-inactive-horizontal-tabs` | `true` | FlexFoxでは、非アクティブの水平タブにカーソルを合わせると閉じるボタンが表示されます。タブが狭い場合、ボタンは縮小され右上に移動して誤クリックを防ぎます。このオプションを有効にすると、閉じるボタンは完全に表示されなくなります。 |
| `uc.flex.disable-nav-bar-first-item-right-padding` | `true` | デフォルトでは、ナビゲーションバーの最初の項目の後ろに右側の余白を追加して、垂直タブとその周辺項目との視覚的な区切りや整列を改善します。このオプションはその余白を無効にします。 |
| `uc.flex.disable-menu-icons` | `true` | FlexFox によって追加されたメニューのカスタムアイコンを無効にします。 |
| `uc.flex.restore-window-controls-on-tabbar` | `true` | 水平タブモードで、最小化・最大化・閉じるボタンをタブバー上に戻します。 |
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
| `uc.flex.increase-active-horizontal-tab-min-width` | `0`-`4`<br>(`1`) | 水平タブが狭くなったときにアクティブタブを広めに保ち、他のタブと区別しやすくします。値：`0` = 無効、`1` = 最小幅の1.8倍（アニメーションなし）、`2` = 1.8倍（アニメーションあり）、`3` = 2倍（アニメーションなし）、`4` = 2倍（アニメーションあり）。デフォルトで有効。すべてのタブを同じ幅にしたい場合は `0` に設定してください。 |
| `uc.flex.switch-to-alternate-condensed-panel` | `true` | デフォルトでは、FlexFox は Firefox 標準の統合拡張機能パネルをアイコンのみのビューに置き換えます。この状態では、拡張機能アイコンを右クリックすることでオプションにアクセスできます。この設定を有効にすると、拡張名やオプションボタンも表示される簡易ビューに切り替わり、より情報が分かりやすくなります。 |
| `uc.flex.sidebery-allow-resizable-width` | `true` | サイドバー分割線をドラッグして Sidebery の幅を自由に変更できます。有効にすると Sidebery の自動折りたたみは無効になりますが、サイドバー切り替えボタン（Firefox ロゴ）で展開・折りたたみを切り替え可能です。自動折りたたみが必要な場合は、`Hide Sidebery` ショートカットや <kbd>F1</kbd> キーで原生垂直タブに切り替えて自動折りたたみできます。 | 
| `uc.flex.sidebery-fast-hover-expand` | `true` | Sidebery とネイティブ垂直タブの自動展開・折りたたみの動作を高速化します。 |
| `uc.flex.sidebery-slow-hover-expand` | `true` | Sidebery とネイティブ垂直タブの自動展開・折りたたみの動作を低速化します。 |
| `uc.flex.sidebery-apply-expand-speed-to-toolbars` | `true` | Sidebery／垂直タブと同じ速度でツールバーを統一。Mica またはカスタム壁紙使用時は自動適用。 |
| `uc.flex.max-visible-horizontal-pinned-tabs` | `1`-`5`<br>(`5`) | ピン留めタブの 1 行あたりの最大表示数を設定します。垂直タブでは超過したピン留めタブは次の行に折り返されます。水平タブでは超過したピン留めタブは自動で折りたたまれ、設定値により表示数は 2～10 に相当します。 |
| `uc.flex.max-visible-vertical-pinned-tabs` | `0` \|<br>`2`-`8`<br>(`4`) | ネイティブ垂直タブと Sidebery の両方で、1 列あたりに表示できるピン留めタブの最大数を設定します。上限を超えると固定タブパネルにスクロールバーが表示されます。`0` に設定すると制限が解除され、パネルが無制限に拡張されます。 |
| `uc.flex.findbar-position` | `'top-center-left'`\|<br>`'top-right'`\|<br>`'bottom-right'` | 検索バー（Findbar）の表示位置を設定します。指定可能な値は文字列 `'top-center-left'` または `'1'`（左寄せ上部）、`'top-right'` または `'2'`（右上）、`'bottom-right'` または `'3'`（右下）です。 |
| `uc.flex.menu-item-spacing` | `'small'`\|<br>`'medium'`\|<br>`'large'` | Firefoxのアプリメニュー、ブックマークメニュー、右クリックメニューにおける項目同士の垂直間隔を設定します。指定可能な値は文字列 `'1'` または `'small'`（狭い間隔）、`'2'` または `'medium'`（標準の間隔）、`'3'` または `'large'`（広い間隔）です。 |

#### ⚙️ Firefox ネイティブ設定
| 設定名 | 値 | 説明 |
|--------|:------:|--------|
| `browser.sessionstore.restore_pinned_tabs_on_demand` | `true` | ピン留めされたタブは選択されたときにのみ読み込まれるため、多くのピン留めタブを持っていても Firefox の起動が遅くなりません。FlexFox のピン留めタブレイアウトや自動折りたたみ機能と組み合わせると、迅速にアクセスするために多くのタブを活用できるため、FlexFox 使用時はこのオプションの有効化を推奨します。 |
| `browser.tabs.fadeOutExplicitlyUnloadedTabs` | `true` | ネイティブの Firefox 設定で、垂直サイドバー内の破棄されたタブをフェードアウト表示にします。 |
| `browser.tabs.fadeOutUnloadedTabs` | `true` | ネイティブの Firefox 設定で、垂直サイドバー内の起動時に復元待ちのタブをフェードアウト表示にします。 |
| `sidebar.visibility` | `expand-on-hover` | FlexFox が提供する**最適化された**垂直タブの自動折りたたみ機能とレイアウトを無効にします。この設定は、サイドバーの設定画面で **「カーソルを合わせた時にサイドバーを展開する」** にチェックを入れることでも適用できます。このモードでは、サイドバーの幅を自由に調整したり、<kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>Z</kbd>キーやサイドバーの切り替えボタンで展開・折りたたみを切り替えたりできます。**FlexFox の日常使用では推奨されません。** |
| `sidebar.animation.expand-on-hover.duration-ms` | `120` | ネイティブの Firefox 設定で、`sidebar.visibility` が `expand-on-hover` に設定されているときに、垂直サイドバーの展開・折りたたみにかかるアニメーション速度を制御します。 |

#### 🎨 UIのスタイルと外観
| 設定名 | 値 | 説明 |
|--------|:------:|--------|
| `uc.flex.style-sidebar-button` | `1`-`4`<br>(`1`) | サイドバー切り替えボタンのアイコンを変更します。値：`1` = Firefox マスターブランドロゴ（デフォルト、従来と同じ）、`2` = Firefox ブラウザロゴ、`3` = Firefox System 1 ロゴ、`4` = Mozilla フラッグシンボル。 |
| `uc.flex.style-toolbar-bgcolor` | `1`-`2`<br>(`1`) | ナビゲーションバーとサイドバーの背景色を切り替えます。値：`1` = Tokyo Night テーマ（デフォルト、従来と同じ）、`2` = Firefox Acorn Design。 |
| `uc.flex.style-urlbar` | `1`-`4`<br>(`1`) | URL バーの外観をカスタマイズします。値：`1` = フラット（デフォルト、従来と同じ）、`2` = インセット（ナビゲーションバーに埋め込まれたような見た目、中央揃えのテキスト）、`3` = デボス（押し込まれたような見た目、中央揃えのテキスト）、`4` = シームレス（ナビゲーションバーに完全に溶け込む、中央揃えのテキスト）。 |
| `uc.flex.move-urlbar-popup-to-center` | `0`-`2`<br>(`0`) | URL バーのポップアップ位置を調整します。値：`0` = 無効（デフォルト）、`1` = フォーカス時に中央へ表示、`2` = 入力中のみ中央へ表示。 |
| `uc.flex.dim-urlbar-popup-backdrop` | `0`-`2` | URL バーのドロップダウンが表示されている間、背景を暗くします。数値で設定でき、`0` は無効、`1` ～ `2` は暗さの強さを示します。値が大きいほど暗くなります。 |
| `uc.flex.style-window-controls` | `1`-`3`<br>(`1`) | ウィンドウコントロールアイコンを切り替えます。値：`1` = トラフィックライトボタン（デフォルト、従来と同じ）、`2` = Yosemite ウィンドウボタン、`3` = Yosemite GTK テーマ。 |
| `uc.flex.style-window-controls-shift-up` | `true` | ウィンドウコントロールを少し上に移動します。 |
| `uc.flex.style-window-controls-shrink-size` | `true` | ウィンドウコントロールのサイズを小さくします。 |
| `uc.flex.move-window-controls-to-left` | `true` | ウィンドウコントロールをナビゲーションバーまたは水平タブバーの左端に移動します。 |
| `uc.flex.move-pip-volume-to-top` | `true` | ピクチャ・イン・ピクチャ（PiP）ウィンドウ内の音量調整ボタンを上部に移動します。 |
| `uc.flex.style-tab-group` | `1`-`4`<br>(`1`) | ネイティブ垂直タブのタブグループの外観を調整します。値：`1` = 展開／折りたたみインジケーターを表示（アニメーションなし）、`2` = インジケーターを表示（アニメーションあり）、`3` = ラベルを中央揃え（インジケーターなし・アニメーションなし）、`4` = ラベルを中央揃え（インジケーターなし・アニメーションあり）。デフォルトは `1` です。 |
| `uc.flex.enable-rounded-web-content` | `0`-`2` | Web コンテンツ領域にマージン、影、四隅の角丸を追加します。数値で設定でき、`0` は無効、`1` ～ `2` はマージンの大きさを調整します。値が大きいほどスペースが広がります。 |
| `uc.flex.enable-rounded-web-content-at-sidebery-corner` | `true` | `uc.flex.enable-rounded-web-content` が有効な場合、Sidebery のカラーストライプに接する側の角にも角丸効果を適用します。 |

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

FlexFox で使用している追加アイコン:

- **Custom Brand Icons** — elax46 の [custom-brand-icons](https://github.com/elax46/custom-brand-icons) を元に改変。  
- **Newaita** — cbrnix の [Newaita](https://github.com/cbrnix/Newaita) を元に改変。  
- **Yosemite Buttons** — Doublefire-Chen の [macos-traffic-light-buttons-as-SVG](https://github.com/Doublefire-Chen/macos-traffic-light-buttons-as-SVG) を元に改変。  
- **Yosemite GTK Theme** — kxmylo の [Yosemite GTK 3.14/3.16 Theme Alpha4](https://www.deviantart.com/kxmylo/art/Yosemite-GTK-3-14-3-16-Theme-Alpha4-575639716) を元に改変。

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

  <p>このプロジェクトには、以下のライセンスで提供される追加のグラフィック資産が含まれます:</p>
  
  <ul>
    <li><strong>Custom Brand Icons</strong> — <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/">CC BY-NC-SA 4.0</a> に基づくライセンス </li>
    <li><strong>Newaita</strong> — <a href="https://creativecommons.org/licenses/by-nc-sa/3.0/">CC BY-NC-SA 3.0</a> に基づくライセンス</li>
    <li><strong>Yosemite Buttons</strong> — <a href="https://creativecommons.org/licenses/by/3.0/">CC BY 3.0</a> に基づくライセンス</li>
  </ul>
</details>
