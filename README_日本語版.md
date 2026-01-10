# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox（日本語版）

<div>
 <a href='https://www.mozilla.org'><img src="https://img.shields.io/badge/Last%20tested%20Firefox-v148-orange?logo=firefox"></a>
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

> [!IMPORTANT]
> FlexFox の多くの機能は、「サイドバーのカスタマイズ」にある「カーソルを合わせた時にサイドバーを展開する」オプションのチェックを **外す** ことで正しく動作します。「サイドバーのカスタマイズ」はナビゲーションバーのサイドバー切替ボタンの右クリックメニューから開けます。このオプションは Firefox の初期設定でチェックが外れています。以前にチェックしていた場合は、外すことで FlexFox が正常に機能します。

## 🆕 最新情報

**🦊 v6.0.3**
* `uc.flex.enable-rounded-web-content` を有効にした際、シャドウが誤った側に表示される問題を修正しました。

## 🦊 v6.0.2

### ⚠️ 互換性のない変更

* `uc.flex.style-urlbar` オプションの値の範囲および動作仕様を変更しました。
  * 値の範囲を従来の `0`～`4` から `1`～`4` に変更しました。値 `0` が持っていた機能は、新しいオプション `uc.flex.auto-hide-urlbar-icons` に分離されています。
  * 値 `2`～`4` に含まれていたテキスト中央揃えの機能は、新しいオプション `uc.flex.style-urlbar-center-text` に分離されました。
  * 変更後の値は、URL バーの外観のみを制御します。
    * `1` = Flat（既定、従来と同じ）
    * `2` = Inset（バーが埋め込まれたデザイン）
    * `3` = Debossed（凹んだデザイン）
    * `4` = Seamless（ナビゲーションバーと一体化したデザイン）

### ✨ 新機能

* `uc.flex.auto-hide-urlbar-icons` (Boolean) を追加しました。既定で有効で、アドレスバーのアイコンを自動的に非表示にし、アドレスバーにカーソルを合わせると左右からスライドするアニメーションで表示されます。
* `uc.flex.style-urlbar-center-text` (Boolean) を追加しました。URL バーのテキストを中央揃えにします。

### 🛠️ 修正

* `uc.flex.style-urlbar` を `4` に設定した場合に、Trust Panel アイコンが非表示にならない問題を修正しました。
* `uc.flex.style-tab-items` を `2` に設定した場合に、Sidebery の下部ボタンでホバー時のハイライトが表示されない問題を修正しました。 (#31)
* `uc.flex.show-pin-tabs-separator-in-expanded-state` が有効な場合に、ピン留めタブの区切り線をカーソルで展開するとピン留めタブがずれる問題を修正しました。
* Firefox Nightly v148 の変更により、サイドバートグルボタン（Firefox ロゴ）および検索バーのボタンで背景色とホバー時のハイライトが表示されなくなる問題を修正しました。 ([Bug 2008041](https://bugzilla.mozilla.org/show_bug.cgi?id=2008041))

## 🦊 v6.0.0 – 主要機能アップデート

> [!IMPORTANT]
> **今回のアップデートには互換性のない変更が含まれています。** いくつかのオプションが廃止または変更され、古い Sidebery スタイルは使用されなくなりました。アップデートの前に、この変更履歴をよくお読みください。
>
> アップデート後は、競合を防ぐために **必ず Sidebery のスタイルエディターから古いスタイルを削除してください。**
> **Sidebery のナビゲーションバー → 設定（歯車アイコン） → スタイルエディター** に進み、**「サイドバー」** と **「グループページ」** のタブ内に残っている旧スタイルをすべて削除してください。

---

### 🎨 新機能: 10 種類のカラーテーマ

![Image](https://github.com/user-attachments/assets/f5b4550d-8bd6-4f41-8206-7114399d69fe)

* `uc.flex.style-sidebar-stripe-color` を追加:

  * サイドバーのストライプ、サイドバーボタン（Firefox ロゴ）、ブックマークスターアイコンの色を制御します。
  * ダークモードでは、タブの枠線、背景、ハイライト、そして Sidebery のナビゲーションアイコンにも適用されます。
  * 値: `0` = クラシック（従来バージョンと同じ・デフォルト）; `1` = レッド; `2` = オレンジ; `3` = イエロー; `4` = グリーン; `5` = シアン; `6` = ブルー; `7` = バイオレット; `8` = パープル; `9` = ピンク; `10` = グレー

* `uc.flex.style-sidebar-stripe-color-apply-to-all-icons`（Boolean）を追加:

  * サイドバーストライプの色をすべてのアイコンに適用します。
  * ダークモードでは、アドレスバーや Web 領域の枠線にも適用されます。
  * また、このオプションは `uc.flex.revert-to-original-bookmark-star-icon` が有効な場合でも、Firefox デフォルトのブックマークスターアイコンの色を上書きします。

* `uc.flex.style-sidebar-stripe-color-use-gradient`（Boolean）を追加:

  * `uc.flex.style-sidebar-stripe-color` で選択した色に基づいたグラデーション表現を適用します。
  * このグラデーションは、サイドバーストライプ、サイドバーボタンアイコン（Firefox ロゴ）、ブックマークスターアイコン、そしてブックマークフォルダアイコンに適用されます。

---

### 🗂 新機能: 「すべてのタブを表示」ボタンのアイコン

<img width="106" height="108" alt="Image" src="https://github.com/user-attachments/assets/b9f8d20d-aa84-4310-97df-b34506971ac6" />
<img width="106" height="108" alt="Image" src="https://github.com/user-attachments/assets/033c7c53-fb3f-4546-8f04-69ad0f9d7046" />
<img width="106" height="108" alt="Image" src="https://github.com/user-attachments/assets/d0932b40-5608-4797-934e-0e1c86ab6a71" />

* `uc.flex.style-all-tabs-button` を追加:

  * 「すべてのタブを表示」ボタンのアイコンを設定します。
  * 値:

    * `0` = Firefox デフォルトのアイコン
    * `1` = フィルター（従来バージョンと同じ・デフォルト）
    * `2` = シェブロン

---

### 📌 新機能: Sidebery 折りたたみ時のナビゲーションアイコン

<img width="56" height="106" alt="Image" src="https://github.com/user-attachments/assets/3ed3abf5-b7bb-4dd5-a0e4-99e4060ea7ee" />
<img width="56" height="106" alt="Image" src="https://github.com/user-attachments/assets/166ee87e-4f87-4bff-8989-49f2332e18f8" />
<img width="56" height="106" alt="Image" src="https://github.com/user-attachments/assets/aac5d1da-0b86-4d28-9db0-1e513b55ccea" />

* `uc.flex.style-sidebery-nav-icon` を追加:

  * Sidebery が折りたたまれている時に表示されるナビゲーションアイコンを設定します。
  * 値:

    * `0` = アクティブパネルのアイコンを使用（新しいデフォルト）
    * `1` = Sidebery ロゴ
    * `2` = シェブロン（以前のデフォルト）

* `uc.flex.style-sidebery-nav-icon-use-active-panel-color`（Boolean）を追加:

  * 現在のアクティブパネルの色をナビゲーションアイコンに適用します。

---

### 📑 新機能: タブの枠線・背景スタイル

<img width="276" height="298" alt="Image" src="https://github.com/user-attachments/assets/7f4b1374-a183-46f5-86e3-810a88d5a62a" />
<img width="276" height="298" alt="Image" src="https://github.com/user-attachments/assets/9717eac6-f2d7-4752-95ec-d64b222dc08a" />
<img width="276" height="298" alt="Image" src="https://github.com/user-attachments/assets/99f9f4e6-60d5-4be0-9589-51d108ec199b" />

*(ネイティブ垂直タブおよび Sidebery のみ)*

* `uc.flex.style-tab-items` を追加:

  * タブ項目の見た目を設定します。
  * 値:

    * `1` = ピン留めタブ： 枠線のみ、背景なし。ライトテーマではアドレスバーの枠線色と一致し、ダークテーマではサイドバーストライプの色と一致します。（従来バージョンと同じ・デフォルト）

    * `2` = ピン留めタブ： 背景のみ、枠線なし。ライトテーマではアドレスバーの背景色と一致し、ダークテーマではサイドバーストライプの色と一致します。

      タブ： すべてのタブに滑らかなホバーアニメーションが適用され、枠線とハイライトにはサイドバーストライプの色が使用されます。

---

### 🗃 新機能: タブグループスタイル

![Image](https://github.com/user-attachments/assets/631e6805-63c3-432d-9988-e551c62f01c7)

*(ネイティブ垂直タブのみ)*

* `uc.flex.style-tab-groups` を追加:

  * タブグループの見た目を設定します。
  * 値:

    * `0` = ツリーレイアウト（展開/折りたたみインジケーターなし）
    * `1` = ツリーレイアウト（三角形のインジケーター付き、従来のデフォルト）
    * `2` = ボックスレイアウト（フォルダアイコン付き）

* `uc.flex.style-tab-groups-add-transition` を追加:

  * タブグループの展開・折りたたみ時のトランジションと、インジケーターの回転アニメーションを設定します。
  * 値:

    * `0` = トランジションなし
    * `1` = 展開/折りたたみトランジションを有効化
    * `2` = トランジション + 回転インジケーター（デフォルト）

* `uc.flex.style-tab-groups-center-label-text`（Boolean）を追加:

  * タブグループのラベルテキストを中央揃えにします。

---

### ⚠️ 互換性のない変更

#### 廃止

以下のオプションは廃止され、現在は効果がありません。Firefox の高度な設定（about:config）から削除してください。

* `uc.flex.style-tab-group`

  * 置き換え先:

    * `uc.flex.style-tab-groups`
    * `uc.flex.style-tab-groups-add-transition`
    * `uc.flex.style-tab-groups-center-label-text`

* `uc.flex.enable-gradient-highlight`

  * `uc.flex.style-sidebar-stripe-color-use-gradient` に置き換えられました。

* `uc.flex.revert-to-original-sidebar-icon`

  * この機能は `uc.flex.style-sidebar-button = 0` に統合されました。

---

#### 更新

* `uc.flex.style-sidebar-button`

  * 値の範囲を `1–4` から `0–4` に更新
  * `0` = Firefox デフォルトのアイコン

* `uc.flex.show-tab-count-in-alltabs-button`

  * 値の範囲を `0–4` から `0–2` に更新
  * `0` = タブ数を表示しない（デフォルト）
  * `1` = すべてのタブ数を表示
  * `2` = 読み込み済みタブのみ表示
  * アイコンの外観は `uc.flex.style-all-tabs-button` で設定します。

---

#### 削除

* これまで `sidebery-styles.json` を通してインポートしていた古い Sidebery 用スタイルは、すべて `uc-sidebery.css` に移行されました。v6 以降、FlexFox は Sidebery スタイルエディター経由で注入するスタイルに依存しなくなります。

  * 以前のバージョンからアップグレードした場合、これらのレガシースタイルは Sidebery のスタイルエディター内に残ったままになります。アップデート後は、不要な CSS の処理を避け、競合を防ぐため削除することを推奨します。
  * v6 以降は `sidebery-styles.json` は提供されません。新規導入の場合は `sidebery-settings.json` をインポートするだけで完了します。
  * その後、`uc.flex.skip-loading-uc-sidebery.css` を使用することで、FlexFox のデフォルト Sidebery スタイルを完全に無効化でき、他のカスタムスタイルとの組み合わせをより柔軟に行えます。

---

### 🛠 改善と修正

* さまざまなビジュアル改善および不具合修正。
* Nightly v148 で追加された新機能 **Trust Panel** に対応。この機能は `browser.urlbar.trustPanel.featureGate` により制御されており、v148 ではデフォルトで有効化される予定です。
* Nightly v148 で発生したリグレッションを修正：ネイティブ垂直タブでピン留めタブにホバーした際、サイドバーが展開状態を維持できず、自動的に折りたたまれてしまう問題です。
  関連: [Bug 2000063](https://bugzilla.mozilla.org/show_bug.cgi?id=2000063)

---

## 🎉 主な機能アップデート

<details>  
<summary>✨ <b>新機能：UI・UXスタイル調整オプションの追加</b> <i>[クリックで展開]</i> 👇</summary>

* `uc.flex.style-sidebar-button` を追加。サイドバー切り替えボタンのアイコンを変更可能 (`0`～`4`)：
  * `0` = Firefox デフォルトのアイコン
  * `1` = Firefox マスターブランドロゴ（既定、従来と同じ）
  * `2` = Firefox ブラウザロゴ
  * `3` = Firefox System 1 ロゴ
  * `4` = Mozilla フラッグシンボル
* `uc.flex.style-toolbar-bgcolor` を追加。ナビゲーションバーとサイドバーの背景色を変更可能 (`1`～`2`)。
  * `1` = Tokyo Night テーマ（既定、従来と同じ）
  * `2` = Firefox Acorn Design
* `uc.flex.style-urlbar` を追加。URLバーの外観を切り替え可能（`1`～`4`）：
  * `1` = Flat（既定、従来と同じ）
  * `2` = Inset（バーが埋め込まれたデザイン）
  * `3` = Debossed（凹んだデザイン）
  * `4` = Seamless（ナビゲーションバーと一体化したデザイン）
* `uc.flex.style-urlbar-center-text` を追加し、URLバーの文字を中央揃えにします（既定値: `False`）。
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
* `uc.flex.style-web-content-outline` を追加。Web コンテンツ領域の枠線を調整できます（`0`～`2`）。
  * `0` = 枠線なし（既定）
  * `1` = Tab Split View でフォーカス中の Web コンテンツのみ強調枠線を表示
  * `2` = すべての Web コンテンツに枠線を表示

</details>

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

* `uc.flex.enable-translucent-urlbar-popup-and-menus` を追加：URL バーのポップアップや各種メニューに半透明＋ぼかしの背景を適用します。通常は Mica またはカスタム壁紙有効時のみ有効になりますが、このオプションを使うことでそれらがなくても半透明のポップアップとメニューを利用できます。背景の透明度は `uc.flex.browser-mica-transparency-level` で調整可能で、範囲は `0`～`4`、値が大きいほど透明になります。すでに Mica またはカスタム壁紙を有効にしている場合は設定する必要はありません。

</details>

<details>  
<summary>🧩 <b>新機能：Sidebery と水平タブの新しいレイアウトモード</b> <i>《クリックで展開》</i> 👇</summary>  

* Sidebery に 2 種類の新しいレイアウトモードを追加
  * `uc.flex.sidebery-allow-resizable-width` を追加：サイドバーの仕切りをドラッグして Sidebery の幅を自由に変更できます。
  * このオプションを有効にすると Sidebery の自動折りたたみは無効になりますが、サイドバーの切り替えボタン（Firefox ロゴ）で展開／折りたたみを操作できます。
  * 自動折りたたみを一時的に戻したい場合は、`Hide Sidebery` ショートカットを使うか、<kbd>F1</kbd> でネイティブの垂直タブに切り替えてください。
* 水平タブに 3 種類の新しいレイアウトモードを追加し、機能を最適化
  * 旧オプション `uc.flex.disable-tabs-toolbar-autohide` を廃止。Sidebery が有効でないときでも、水平タブはデフォルトで表示されます。
  * `uc.flex.auto-hide-horizontal-tabs-and-keep-navbar` を追加：Sidebery が有効でないときに水平タブを自動で隠し、ナビゲーションバーにカーソルを合わせると表示します。設定値：`0` = 無効、`1` = ナビゲーションバーの下に表示、`2` = 上に表示、`3` = レイアウトは `2` と同じですが、画面最上部にカーソルが届いた時だけ表示され、ブックマークやナビゲーションバー操作時の誤表示を防ぎます。表示判定の高さは `--uc-tabstoolbar-hover-trigger-width` で調整できます。
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
  * 水平ピン留めタブは可視数を超えると自動的に折りたたまれます。可視ピン留めタブの既定値は 10 個です。`uc.flex.max-visible-horizontal-pinned-tabs` で調整できます（設定値 `0`～`5` は 2～10 個に対応。`0` に設定すると水平タブでの自動折りたたみを無効化）。

</details>

<details>  
<summary>🧩 <b>新機能：ピン留めタブパネルのグリッドレイアウトをカスタマイズ可能に</b> <i>[クリックで展開]</i> 👇</summary>

* `uc.flex.max-visible-horizontal-pinned-tabs` を追加し、ピン留めタブパネルの 1 行に表示するタブ数（横方向）を設定できます。
  * 設定範囲は `0`～`5`（既定値 `5`）。
  * 垂直タブでは、超過したピン留めタブは次の行に折り返されます。
  * 水平タブでは、超過したピン留めタブは自動で折りたたまれます（設定値により表示タブ数 2～10 に相当）。
  * `0` に設定すると水平タブでの自動折りたたみを無効化。

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
  * `1` = すべてのタブ数を表示
  * `2` = 読み込み済みタブのみ表示
* `uc.flex.show-tab-number-in-tab-label` オプションを追加し、ネイティブタブラベル上に各タブのインデックス番号を表示できるようにしました。ラベルが狭くて全文が表示されない場合でも、タブを素早く識別できます。

</details>

<details>  
<summary>👻 <b>新機能：ツールバーのアイコンとウィンドウ操作ボタンを自動で非表示</b> <i>《クリックで展開》</i> 👇</summary>

* `uc.flex.auto-hide-navbar-icons` オプションを追加しました。ツールバー上のアイコン（ナビゲーションバー、ブックマークツールバー、メニューバーのアイテムを含む）を非表示にし、ホバー時に表示されます。URLバーやウィンドウ操作ボタンには影響しません。
* `uc.flex.auto-hide-urlbar-icons` オプションを追加しました。既定で有効になっており、アドレスバー内のアイコンを自動的に非表示にし、カーソルを合わせると左右からスライドするアニメーションで表示されます。
* `uc.flex.auto-hide-window-controls` オプションを追加しました。ウィンドウ操作ボタン（最小化・最大化・閉じる）を非表示にし、ナビゲーションバーの端にカーソルを合わせると表示されます。
* サイドバー切り替えボタン（FlexFoxロゴ）は通常常に表示されます。ナビゲーションバーの端（最左端または最右端）に配置されていない場合、または `uc.flex.style-sidebar-button` が `0` に設定されている場合、このボタンも自動非表示の対象となります。
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
<summary>🪄 <b>新機能：オリジナルのフラット角スタイルを復元</b> <i>《クリックで展開》</i> 👇</summary>

新しいオプション `uc.flex.revert-to-original-flat-corner-style` が追加されました。これを有効にすると、URLバーと検索バーの FlexFox 大丸角（9999px）を無効化し、Firefox 本来のフラット角スタイルに戻すことができます。

Firefox v145 では標準の角丸が 4px から 8px に変更され、より丸みのあるデザインになりました。これに対応するため、このオプションは従来のオン/オフ形式から数値設定（`0`～`3`）へ拡張されています。旧バージョンからアップグレードした場合は、以前のブール値設定を削除し、新しい数値形式で作り直してください。

**選択可能な値**

* `0` = URLバーと検索バーに FlexFox の大丸角スタイル（9999px、デフォルト）
* `1` = Firefox v145 以降の丸角スタイル（全要素 8px）
* `2` = v145 以前のフラット角スタイル（全要素 4px）
* `3` = URLバーと検索バーは FlexFox の大丸角、その他の要素は v145 以前のフラット角スタイル

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

<a id="updates-top-start"></a>
<details>

<summary>💬 <b>過去の更新</b></summary>

**v6.0.1**
- Sidebery の **密度** を **デフォルト** 以外に設定した際に発生していたレイアウトや表示の不整合を修正しました。

以前のバージョンの更新履歴については  
👉 [Wiki のアーカイブページ](https://github.com/yuuqilin/FlexFox/wiki/Earlier-Update-History-(Japanese))をご覧ください。

<a href="#updates-top-start">⏫ アップデート一覧の先頭へ戻る</a>
</details>

---

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
>
> 1. [Sidebery](https://addons.mozilla.org/firefox/addon/sidebery/) をインストール（推奨）。
> 2. プロジェクトの **[Releases](https://github.com/yuuqilin/FlexFox/releases)** ページから最新の FlexFox をダウンロードしてください。
> 3. `about:support` を開き、「プロファイルフォルダー」の「フォルダーを開く」をクリックします。
> 4. ダウンロードしたアーカイブの `scripts` フォルダから、`chrome` フォルダと `user.js` をプロファイルフォルダへコピーします。
> 5. テキストエディタで `user.js` を開き、有効にしたい機能の `//` コメントを外します。
>
>    * 以下の設定が次のようになっていることを確認してください：
>
>      * `toolkit.legacyUserProfileCustomizations.stylesheets` = `true`
>      * `svg.context-properties.content.enabled` = `true`
>      * `sidebar.visibility` = `always-show`
> 6. Firefox を再起動し、その後 `user.js` を削除して、`about:config` の変更が保存されるようにします。
> 7. Sidebery の設定：
>
>    * サイドバーにある歯車アイコンから設定を開く
>    * 競合を避けるため、`スタイルエディター` にある既存スタイルを削除してください
>    * 「ヘルプ」→「アドオンデータのインポート」から、アーカイブ内の `Sidebery` フォルダにある `sidebery-settings.json` をインポートします
> 8. `about:config` で `uc.flex.` を検索し、必要に応じて機能を有効／無効にします。

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
| `uc.flex.auto-hide-horizontal-tabs-and-keep-navbar` | `0`-`3`<br>(`0`) | 水平タブモードで、Sidebery が非アクティブ時に水平タブを自動で非表示にします。ナビゲーションバーにカーソルを合わせるとタブが表示されます。値：`0` = 無効、`1` = ナビゲーションバー下に表示、`2` = ナビゲーションバー上に表示、`3` = `2` と同じですが、画面最上部にカーソルが届いた時のみ表示され、誤表示を防ぎます。 |
| `uc.flex.auto-hide-navbar-and-keep-horizontal-tabs` | `0`-`1`<br>(`0`) | 水平タブモードで、Sidebery が非アクティブ時にナビゲーションバーを自動で非表示にします。水平タブにカーソルを合わせるとナビゲーションバーが表示されます。値：`0` = 無効、`1` = 有効。このオプションは優先度が高く、`uc.flex.auto-hide-horizontal-tabs-and-keep-navbar` と同時に有効にした場合、そちらを上書きします。 |
| `uc.flex.auto-hide-navbar-icons` | `true` | ツールバーのアイコン（ナビゲーションバー、ブックマークツールバー、メニューバーのアイテムを含む）を非表示にし、ツールバーにカーソルを合わせると再表示されます。このオプションは URL バーやウィンドウ操作ボタンには影響しません。サイドバー切り替えボタン（FlexFox ロゴ）は通常常に表示されますが、ナビゲーションバーの端に配置されていない場合、または `uc.flex.style-sidebar-button` が `0` に設定されている場合は、自動非表示の対象となります。 |
| `uc.flex.auto-hide-urlbar-icons` | `true` | アドレスバー内のアイコンを非表示にし、アドレスバーにカーソルを合わせると左右からスライドするアニメーションで表示します。既定で有効で、常に表示したい場合は `false` に設定してください。 |
| `uc.flex.auto-hide-window-controls` | `true` | ウィンドウ操作ボタン（最小化・最大化・閉じる）を非表示にし、ナビゲーションバーの端にカーソルを合わせると再表示されます。 |
| `uc.flex.allow-addons-to-change-toolbar-color` | `true` | Firefox Color などの拡張機能によるツールバーの色の変更を有効にします（背景画像が設定されていない場合に必要です）。 |
| `uc.flex.enable-colored-bookmarks-folder-icons` | `0`-`2`<br>(`0`) | ブックマークフォルダーのアイコンをカラー表示にします。数値で設定でき、`0` は無効、`1` は第1セットのアイコンを使用、`2` は第2セットのアイコンを使用し、ラベルは自動的に非表示になります。 |
| `uc.flex.remove-bookmarks-folder-icons` | `true` | ブックマークフォルダーのアイコンを非表示にします。 |
| `uc.flex.remove-bookmarks-labels` | `true` | ブックマークフォルダーのラベル（テキスト）を非表示にします。 |
| `uc.flex.show-flexfox-version-info-in-about-config` | `true` | `about:config` ページに FlexFox のインストール確認メッセージと現在のバージョン番号を表示します。 |
| `uc.flex.show-pin-tabs-separator-in-expanded-state` | `true` | ネイティブ垂直タブの展開状態で、固定タブと通常タブの間に区切り線を表示します。Firefox では通常ホバー時のみ表示されますが、FlexFox では常に表示され、この区切り線をドラッグして固定タブパネルの高さを調整できます。 |
| `uc.flex.show-tab-close-button-on-favicon-hover` | `true` | 水平タブで閉じるボタンをファビコンと統合してスペースを節約します。ファビコンにカーソルを合わせるとボタンが表示されます。有効化すると、タブが狭くなったときの閉じるボタンの自動縮小・移動機能は自動的に停止します。 |
| `uc.flex.show-tab-count-in-alltabs-button` | `0`-`2`<br>(`0`) | 「すべてのタブを一覧表示」ボタンにタブの総数を表示します。数値で設定でき、`0` は無効、`1` はすべてのタブ数を表示、`2` は読み込み済みタブのみ表示です。 |
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
| `uc.flex.revert-to-original-flat-corner-style` | `0`-`3`<br>(`0`) | URLバー・検索バーを含む各 UI 要素の角形状を、Firefox 本来のフラットな角スタイルへ戻します。値：`0` = FlexFox の大きな角丸（9999px、デフォルト）、`1` = Firefox v145+ の角丸スタイル（8px）、`2` = v145 以前のフラットな角（4px）、`3` = URLバー／検索バーのみ FlexFox の大きな角丸で、その他は v145 以前のフラット角。 |
| `uc.flex.revert-to-original-bookmark-star-icon` | `true` | FlexFox 独自のブックマーク星アイコンを Firefox 標準のデザインに戻します。 |
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
| `uc.flex.max-visible-horizontal-pinned-tabs` | `0`-`5`<br>(`5`) | ピン留めタブの 1 行あたりの最大表示数を設定します。垂直タブでは超過したピン留めタブは次の行に折り返されます。水平タブでは超過したピン留めタブは自動で折りたたまれ、設定値により表示数は 2～10 に相当します。`0` に設定すると水平タブでの自動折りたたみを無効化。 |
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
| `uc.flex.style-all-tabs-button` | `0`-`2`<br>(`1`) | 「すべてのタブを表示」ボタンのアイコンを設定します。値：`0` = Firefox デフォルトアイコン、`1` = フィルター（デフォルト）、`2` = シェブロン。 |
| `uc.flex.style-sidebar-button` | `0`-`4`<br>(`1`) | サイドバー切り替えボタンのアイコンを変更します。値：`0` = Firefox デフォルトのアイコン、`1` = Firefox マスターブランドロゴ（デフォルト）、`2` = Firefox ブラウザロゴ、`3` = Firefox System 1 ロゴ、`4` = Mozilla フラッグシンボル。 |
| `uc.flex.style-sidebar-stripe-color` | `0`-`10`<br>(`0`) | サイドバーのストライプ、サイドバーボタン（Firefox ロゴ）、ブックマークスターアイコンの色を制御します。ダークモードでは、タブの枠線、背景、ハイライト、さらに Sidebery のナビゲーションアイコンにも適用されます。値：`0` = クラシック（デフォルト）、`1` = レッド、`2` = オレンジ、`3` = イエロー、`4` = グリーン、`5` = シアン、`6` = ブルー、`7` = バイオレット、`8` = パープル、`9` = ピンク、`10` = グレー。 |
| `uc.flex.style-sidebar-stripe-color-apply-to-all-icons` | `true` | サイドバーのストライプカラーをすべてのアイコンに適用します。ダークモードでは、アドレスバーや Web 領域の枠線にも適用されます。また、`uc.flex.revert-to-original-bookmark-star-icon` が有効な場合でも、Firefox デフォルトのブックマークスターの色を上書きします。 |
| `uc.flex.style-sidebar-stripe-color-use-gradient` | `true` | `uc.flex.style-sidebar-stripe-color` で選択した色に基づいたグラデーション表現を適用します。サイドバーストライプ、サイドバーボタンアイコン（Firefox ロゴ）、ブックマークスターアイコン、ブックマークフォルダアイコンに適用されます。 |
| `uc.flex.style-sidebery-nav-icon` | `0`-`2`<br>(`0`) | Sidebery が折りたたまれている時に表示されるナビゲーションアイコンを設定します。値：`0` = アクティブパネルのアイコンを使用（新しいデフォルト）、`1` = Sidebery ロゴ、`2` = シェブロン（以前のデフォルト）。 |
| `uc.flex.style-sidebery-nav-icon-use-active-panel-color` | `true` | 現在のアクティブパネルの色をナビゲーションアイコンに適用します。 |
| `uc.flex.style-toolbar-bgcolor` | `1`-`2`<br>(`1`) | ナビゲーションバーとサイドバーの背景色を切り替えます。値：`1` = Tokyo Night テーマ（デフォルト）、`2` = Firefox Acorn Design。 |
| `uc.flex.style-urlbar` | `1`-`4`<br>(`1`) | URL バーの外観をカスタマイズします。値：`1` = フラット（デフォルト）、`2` = インセット（バーが埋め込まれたデザイン）、`3` = デボス（凹んだデザイン）、`4` = シームレス（ナビゲーションバーと一体化したデザイン）。 |
| `uc.flex.style-urlbar-center-text` | `true` | URL バーの文字を中央揃えにします。 |
| `uc.flex.move-urlbar-popup-to-center` | `0`-`2`<br>(`0`) | URL バーのポップアップ位置を調整します。値：`0` = 無効（デフォルト）、`1` = フォーカス時に中央へ表示、`2` = 入力中のみ中央へ表示。 |
| `uc.flex.dim-urlbar-popup-backdrop` | `0`-`2`<br>(`0`) | URL バーのドロップダウンが表示されている間、背景を暗くします。数値で設定でき、`0` は無効、`1` ～ `2` は暗さの強さを示します。値が大きいほど暗くなります。 |
| `uc.flex.style-window-controls` | `1`-`3`<br>(`1`) | ウィンドウコントロールアイコンを切り替えます。値：`1` = トラフィックライトボタン（デフォルト）、`2` = Yosemite ウィンドウボタン、`3` = Yosemite GTK テーマ。 |
| `uc.flex.style-window-controls-shift-up` | `true` | ウィンドウコントロールを少し上に移動します。 |
| `uc.flex.style-window-controls-shrink-size` | `true` | ウィンドウコントロールのサイズを小さくします。 |
| `uc.flex.move-window-controls-to-left` | `true` | ウィンドウコントロールをナビゲーションバーまたは水平タブバーの左端に移動します。 |
| `uc.flex.move-pip-volume-to-top` | `true` | ピクチャ・イン・ピクチャ（PiP）ウィンドウ内の音量調整ボタンを上部に移動します。 |
| `uc.flex.style-tab-items` | `1`-`2`<br>(`1`) | 垂直のタブ項目の見た目を設定します。値：`1` = ピン留めタブは枠線のみで背景なし（デフォルト）、`2` = ピン留めタブは背景のみで枠線なし。タブには滑らかなホバーアニメーションが適用され、枠線とハイライトはサイドバーストライプの色に一致します。 |
| `uc.flex.style-tab-groups` | `0`-`2`<br>(`1`) | 原生垂直タブのタブグループの見た目を設定します。値：`0` = ツリーレイアウト（展開/折りたたみインジケーターなし）、`1` = ツリーレイアウト（三角形のインジケーター付き、デフォルト）、`2` = ボックスレイアウト（フォルダアイコン付き）。 |
| `uc.flex.style-tab-groups-add-transition` | `0`-`2`<br>(`2`) | 原生垂直タブのタブグループの展開・折りたたみ時のトランジションと回転インジケーターのアニメーションを設定します。値：`0` = トランジションなし、`1` = 展開/折りたたみトランジションを有効化、`2` = トランジション + 回転インジケーター（デフォルト）。 |
| `uc.flex.style-tab-groups-center-label-text` | `true` | 原生垂直タブのタブグループのラベルテキストを中央揃えにします。 |
| `uc.flex.style-web-content-outline` | `0`-`2`<br>(`0`) | Web コンテンツ領域の枠線を調整します。値：`0` = 枠線なし（デフォルト）、`1` = Tab Split View でフォーカス中の Web コンテンツのみ強調枠線を表示、`2` = すべての Web コンテンツに枠線を表示。 |
| `uc.flex.enable-rounded-web-content` | `0`-`2`<br>(`0`) | Web コンテンツ領域にマージン、影、四隅の角丸を追加します。数値で設定でき、`0` は無効、`1` ～ `2` はマージンの大きさを調整します。値が大きいほどスペースが広がります。 |
| `uc.flex.enable-rounded-web-content-at-sidebery-corner` | `true` | `uc.flex.enable-rounded-web-content` が有効な場合、Sidebery のカラーストライプに接する側の角にも角丸効果を適用します。 |
| `uc.flex.enable-translucent-urlbar-popup-and-menus` | `true` | URL バーのポップアップや各種メニューに半透明かつぼかしの背景を適用します。FlexFox では通常 Mica またはカスタム壁紙使用時にのみ有効ですが、このオプションを使うことでそれらなしでも適用できます。背景の透明度は `uc.flex.browser-mica-transparency-level` で調整可能で、値の範囲は `0`～`4`、大きいほど透明になります。 |

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
