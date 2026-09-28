# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox 更新履歴

[English](./CHANGELOG.md) | [日本語](./CHANGELOG_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md) | [简体中文](./CHANGELOG_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md)

## 🆕 最新情報

## 🦊 v7.1.0

> [!IMPORTANT]
> v7.0.0 では、複数の新機能と互換性のない変更が導入されました。まだ確認していない場合は、こちらから更新履歴をご覧ください。
>
> [English](./CHANGELOG.md#-v700---nova-ui-edition) | [日本語](./CHANGELOG_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md#-v700---nova-ui-edition) | [简体中文](./CHANGELOG_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md#-v700---nova-ui-edition)

> [!IMPORTANT]
> Firefox 157 では、Nova UI がデフォルトで有効になります。
>
> 次回の FlexFox リリースでは、Firefox のサポート終了に合わせて Firefox ESR 140 のサポートを終了し、以降は ESR 153 以降のみをサポートします。ESR 140 に対応する最終版のソースコードは凍結し、`ESR-v140` ブランチへ移動します。
>
> また、次回のリリースでは、Sidebery のスタイルエディターに残っている v6 より前の FlexFox 旧スタイルとの互換性も終了します。まだ残っている場合は、**次回の FlexFox にアップデートする前に** 削除してください。詳しくは「[v6 より前のバージョンからアップデートする](./USAGE_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md#-v6-より前のバージョンからアップデートする)」を参照してください。

### 新機能

- **使い勝手の向上：** Sidebery を使用中、サイドバーストライプにカーソルを合わせるとネイティブ垂直タブのパネル全体を開ける `uc.flex.show-native-vertical-tabs-on-sidebar-stripe-hover` を追加しました。

  - デフォルトでは Sidebery のタブ一覧と重複しないよう、ストライプにカーソルを合わせてもサイドバーツールボタンだけが展開されます。
  - Firefox は分割ビューやタブノートなどの機能を拡張機能から利用するための API をまだ提供しておらず、Sidebery から直接使用することはできません。通常は <kbd>F1</kbd> を押してネイティブ垂直タブに切り替え、もう一度 <kbd>F1</kbd> を押して Sidebery に戻る必要があります。
  - サイドバー切り替えボタン（Firefox ロゴ）は、**展開モード**ではカラー表示、**折りたたみモード**ではグレー表示になります。
  - この設定を有効にすると、展開モードでサイドバーストライプにカーソルを合わせるだけで、Sidebery から切り替えずにネイティブ垂直タブのパネル全体を開けます。折りたたみモードの場合や、`uc.flex.remove-sidebar-stripe` を有効にしている場合は機能しません。
  - Mica またはカスタム壁紙と `uc.flex.sidebery-allow-resizable-width` を併用している場合、サイドバー切り替えボタンが展開モードの間は、Sidebery の幅を `uc.flex.sidebery-expand-width` で指定した幅より狭くできません。Mica や壁紙を使用していない場合、この制限はありません。

- **互換性：** Sidebery Nightly（v5.6.1.5）に対応しました。未リリースのこのバージョンには旧版との互換性がない変更が複数含まれており、対応しないと FlexFox の一部スタイルや機能が正常に動作しなくなります。[Commit 6228919](https://github.com/mbnuqw/sidebery/commit/622891943b4ace519b827bf67eed9da07b8b6f4b) [Commit 43944c7](https://github.com/mbnuqw/sidebery/commit/43944c74e965d5ee9687696d2698da55bfd684a1)

### 改善

- URL バー内のアイコンボタンの角丸が `uc.flex.style-toolbar-items-border-radius` の設定に従うようになりました。
- 水平タブモードでも `Hide Sidebery` でサイドバーツールボタンを非表示にできるようになりました。`Hide All` や <kbd>F11</kbd> の全画面表示でも自動的に非表示になり、マウスカーソルを画面端に近づけると再表示されます。
- サイドバーツールボタンのレイアウト処理をリファクタリングしました。
- サイドバーの重なり順（`z-index`）の処理をリファクタリングしました。

### 修正

- Sidebery でタブをドラッグしても移動できない、または意図しない位置に移動する問題を修正しました。[Issue #49](https://github.com/yuuqilin/FlexFox/issues/49)
- Firefox 154 の変更により、<kbd>F11</kbd> の全画面表示でネイティブ垂直タブを展開できなくなる問題を修正しました。[Bug 2052711](https://bugzilla.mozilla.org/show_bug.cgi?id=2052711) [Bug 2054085](https://bugzilla.mozilla.org/show_bug.cgi?id=2054085)
- Firefox 156 の変更後、水平タブモードでサイドバーツールボタンが中央に配置されない問題を修正しました。[Bug 2049659](https://bugzilla.mozilla.org/show_bug.cgi?id=2049659)
- Firefox 158 の変更後、サイドバーツールボタンの表示位置がずれる問題を修正しました。[Bug 2041030](https://bugzilla.mozilla.org/show_bug.cgi?id=2041030)
- Firefox 158 の変更により、Tab Split View のタブの位置がずれる問題を修正しました。[Bug 2068234](https://bugzilla.mozilla.org/show_bug.cgi?id=2068234)

<!-- END What's New -->

## 🦊 v7.0.1

> [!IMPORTANT]
> v7.0.0 では、複数の新機能と互換性のない変更が導入されました。まだ確認していない場合は、こちらから更新履歴をご覧ください。
>
> [English](./CHANGELOG.md#-v700---nova-ui-edition) | [日本語](./CHANGELOG_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md#-v700---nova-ui-edition) | [简体中文](./CHANGELOG_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md#-v700---nova-ui-edition)

### 修正

- **重大：** Firefox 157 との互換性の問題により URL バーが機能しなくなり、ブラウザーを使用できなくなる不具合を修正しました。[Bug 2065901](https://bugzilla.mozilla.org/show_bug.cgi?id=2065901)

  - `uc.flex.move-urlbar-popup-to-center` を有効にすると入力欄が消え、ナビゲーションツールバーやウェブコンテンツの位置がずれる問題を修正しました。
  - `uc.flex.enable-translucent-urlbar-popup-and-menus` を有効にすると URL バーが完全に透明になり、背景のぼかし効果が失われる問題を修正しました。
  - `uc.flex.dim-urlbar-popup-backdrop` を有効にしてもビューポート全体を暗くできない問題を修正しました。

- **重大：** Firefox 157 との互換性の問題により、ブックマークツールバーを展開できなくなる不具合を修正しました。[Bug 2069885](https://bugzilla.mozilla.org/show_bug.cgi?id=2069885)
- **重大：** Firefox 158 の変更により発生した、ネイティブタブのレイアウトが崩れる問題を修正しました。[Bug 2037111](https://bugzilla.mozilla.org/show_bug.cgi?id=2037111)
- Firefox 157 の変更後、タブグループと Tab Split View の項目から角丸が失われる問題を修正しました。[Bug 2033008](https://bugzilla.mozilla.org/show_bug.cgi?id=2033008)
- Firefox 156 の変更後、「カーソルを合わせた時にサイドバーを展開する」が無効でサイドバーが折りたたまれている場合に、下部のツールボタン上にある区切り線のスタイルが正しく表示されない問題を修正しました。[Bug 2056278](https://bugzilla.mozilla.org/show_bug.cgi?id=2056278)
- Nova UI が有効な場合、`uc.flex.style-toolbar-items-border-radius = 1` でアプリケーションメニューとパネルを Proton UI の角丸に強制できない問題を修正しました。
- `uc.flex.style-tab-items-gradient-border = 0` および `uc.flex.style-tab-items-border-width = 2` に設定した場合に、ネイティブタブの枠線が内側にずれて影から離れる v7.0.0 のリグレッションを修正しました。
- ライトモードで Sidebery のタブを閉じるボタンの色の不透明度が正しくない問題を修正しました。
- Sidebery の「密度」を「コンパクト」または「ゆったり」に設定した場合に、下部のボタンが中央に配置されない問題を修正しました。

## 🦊 v7.0.0 - Nova UI Edition

> [!IMPORTANT]
> v6.6.0 では、複数の新しい設定と互換性のない変更が導入されました。まだ確認していない場合は、こちらから更新履歴をご覧ください。
>
> [English](./CHANGELOG.md#-v660) | [日本語](./CHANGELOG_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md#-v660) | [简体中文](./CHANGELOG_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md#-v660)

### 新機能と変更

- サイドバーストライプのグラデーションを URL バーの各要素に適用する `uc.flex.style-urlbar-gradient` を追加しました。

  ```
  0 = 無効（デフォルト）
  1 = グラデーションアイコン
  2 = グラデーションアイコンと、カーソルを合わせた時に表示されるアニメーション付きグラデーション枠線
  3 = グラデーションアイコン、カーソルを合わせた時に表示されるアニメーション付きグラデーション枠線、グラデーション URL テキスト
  ```

  グラデーションの色は `uc.flex.style-sidebar-stripe-color` の設定に従います。[Bug 2063127](https://bugzilla.mozilla.org/show_bug.cgi?id=2063127) の影響により、Firefox 155 と 156 では文字の淡色化の表示が異なります。文字グラデーションを淡色化せずに表示するには、ネイティブ設定 `browser.urlbar.formatting.enabled` を新規作成し、`false` に設定してください。

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/urlbar-gradient.webp" width="680px">

  プレビューで使用している設定：

  ```
  uc.flex.style-urlbar-gradient            = 3
  uc.flex.style-sidebar-stripe-color       = 9
  ```

- アクティブなタブの枠線の太さを設定する `uc.flex.style-tab-items-border-width` を追加しました。

  ```
  0 = 枠線なし
  1 = 1px の枠線（以前のデフォルト）
  2 = 2px の枠線（デフォルト）
  ```

- アクティブなタブのグラデーション枠線を設定する `uc.flex.style-tab-items-gradient-border` を追加しました。

  ```
  0 = 無効（以前のデフォルト）
  1 = 静止グラデーション（デフォルト）
  2 = アニメーショングラデーション
  ```

  グラデーションの色は `uc.flex.style-sidebar-stripe-color` の設定に従います。静止グラデーションは Nova UI のデフォルトです。[Issue #41](https://github.com/yuuqilin/FlexFox/issues/41) に対応するため、FlexFox では正式な展開に先駆けてデフォルトで有効にしています。`uc.flex.style-tab-items-border-width` が `0` の場合、この設定は機能しません。

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/gradient-border.webp" width="300px">

  プレビューで使用している設定：

  ```
  uc.flex.style-tab-items-gradient-border = 2
  uc.flex.style-tab-items-background-fill = 0
  ```

- ピン留めタブの外観を設定する `uc.flex.style-tab-items` の値の範囲を `0`～`2` に拡張しました。

  ```
  0 = 枠線も背景の塗りつぶしも表示しない
  1 = 枠線のみ（デフォルト）
  2 = 背景の塗りつぶしのみ
  ```

  枠線と背景の塗りつぶしには、ライトモードではニュートラルカラー、ダークモードではサイドバーストライプのアクセントカラーを使用します。値 `2` では、選択中のタブの枠線に常にアクセントカラーを使用します。

- タブの背景の塗りつぶしを設定する `uc.flex.style-tab-items-background-fill` を追加しました。

  ```
  0 = アクティブなタブの背景を透明にする
  1 = アクティブなタブの背景にアクセントカラーを使用（デフォルト）
  2 = すべてのタブにニュートラルカラーの基本背景を追加
  ```

  `uc.flex.style-tab-items` を有効にすると、ピン留めタブの基本背景色が上書きされます。この設定と `uc.flex.style-tab-items-border-width` がともに `0` の場合でも、1px の枠線が保持されます。

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/background-fill.webp" width="965px">

  プレビューで使用している設定：`uc.flex.style-tab-items-background-fill = 2`

- アクティブなタブのグラデーション背景を設定する `uc.flex.style-tab-items-gradient-background` を追加しました。

  ```
  0 = 無効（デフォルト）
  1 = 静止グラデーション
  2 = アニメーショングラデーション
  ```

  グラデーション枠線と同時に使用できます。この設定は `uc.flex.style-tab-items-background-fill` を上書きします。

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/gradient-background.webp" width="298px">

  プレビューで使用している設定：

  ```
  uc.flex.style-tab-items-gradient-background = 2
  uc.flex.style-tab-items-border-width        = 0
  ```

- `uc.flex.show-tab-close-button-on-favicon-hover` を拡張し、従来のネイティブ横タブに加えて、ネイティブ垂直タブと Sidebery にも対応しました。閉じるボタンをファビコンと統合し、ファビコンにカーソルを合わせた時に表示します。

- タブを閉じるボタン内の警告領域の表示とサイズを設定する `uc.flex.style-tab-close-button-warning-zone-size` を追加しました。

  ```
  0 = 非表示（標準の外観）
  1 = 小（デフォルト）
  2 = 大
  ```

  `uc.flex.show-tab-close-button-on-favicon-hover` が有効な場合、値 `2` は効果がなく、警告領域はデフォルトのサイズ（`1`）で表示されます。

- タブ項目に Proton UI または Nova UI の大きな角丸を使用する `uc.flex.style-tab-items-border-radius` を追加しました。

  ```
  0 = 自動（デフォルト）。browser.nova.enabled = true の場合は Nova UI の角丸を使用
  1 = Proton UI の角丸を強制
  2 = Nova UI の角丸を強制
  ```

  水平タブバーに配置された「すべてのタブを一覧表示」ボタンの角丸にも適用されます。

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/border-radius.webp" width="298px">

  プレビューで使用している設定：

  ```
  uc.flex.style-tab-items                          = 0
  uc.flex.style-tab-close-button-warning-zone-size = 1
  ```

- ツールバーボタン、パネル項目、メニュー項目、ブックマークメニュー項目、展開したサイドバーの外側上部の角、サイドバーストライプ、および検索バーに Proton UI または Nova UI の大きな角丸を使用する `uc.flex.style-toolbar-items-border-radius` を追加しました。

  ```
  0 = 自動（デフォルト）。browser.nova.enabled = true の場合は Nova UI の角丸を使用
  1 = Proton UI の角丸を強制
  2 = Nova UI の角丸を強制
  ```

  `uc.flex.revert-to-original-flat-corner-style` は、上記 2 つの角丸設定を上書きします。

### 改善

- ピン留めタブのグリッド内の余白と間隔を調整し、窮屈さを抑えたバランスのよい外観に改善しました。

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/grid-gap.webp" width="300px">

- 検索バーに角丸の輪郭を追加し、ウェブコンテンツの背景から分離して浮かんで見えるデザインに変更しました。

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/findbar-border.webp" width="923px">

- 空の `about:config` 検索欄に「`uc.flex` を入力してすべての FlexFox 設定を表示」というプレースホルダーを追加しました。

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/preference-search-hint.webp" width="630px">

- サイドバーストライプのアクセントカラーの適用範囲を横タブへ拡張し、垂直タブと同じ枠線と背景色を使用できるようにしました。
- Sidebery のグループページのタイトル文字を改善し、文字列の長さに関係なく全体にグラデーションが表示されるようにしました。

  <img src="https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/group-page-gradient.webp" width="214px">

### 互換性のない変更

- `uc.flex.skip-loading-uc-*.css` を `uc.flex.~dev-skip-loading-uc-*.css` に名前変更しました。

  これらの設定は、指定した CSS ファイルの読み込みをスキップし、不具合の切り分けを容易にします。以前の名前は `about:config` で通常の設定の間に並ぶため、各設定の説明がずれることがありました。新しい名前は通常の設定より後に並ぶため、レイアウトを崩さずに開発用設定を追加できます。

### 修正

- Firefox のアップデートにより発生した複数のスタイルおよびレイアウトの不具合を修正しました：[Bug 2049244](https://bugzilla.mozilla.org/show_bug.cgi?id=2049244)、[Bug 2055840](https://bugzilla.mozilla.org/show_bug.cgi?id=2055840)、[Bug 2046942](https://bugzilla.mozilla.org/show_bug.cgi?id=2046942)、[Bug 2033583](https://bugzilla.mozilla.org/show_bug.cgi?id=2033583)、[Bug 2044711](https://bugzilla.mozilla.org/show_bug.cgi?id=2044711)、[Bug 2045752](https://bugzilla.mozilla.org/show_bug.cgi?id=2045752)、[Bug 2054481](https://bugzilla.mozilla.org/show_bug.cgi?id=2054481)、[Bug 2023711](https://bugzilla.mozilla.org/show_bug.cgi?id=2023711)、[Bug 2022975](https://bugzilla.mozilla.org/show_bug.cgi?id=2022975)、[Bug 2052608](https://bugzilla.mozilla.org/show_bug.cgi?id=2052608)、[Bug 2034495](https://bugzilla.mozilla.org/show_bug.cgi?id=2034495)、[Bug 2029183](https://bugzilla.mozilla.org/show_bug.cgi?id=2029183)、[Bug 2046646](https://bugzilla.mozilla.org/show_bug.cgi?id=2046646)、[Bug 2039721](https://bugzilla.mozilla.org/show_bug.cgi?id=2039721)、[Bug 2047784](https://bugzilla.mozilla.org/show_bug.cgi?id=2047784)、[Bug 1998985](https://bugzilla.mozilla.org/show_bug.cgi?id=1998985)、[Bug 2063294](https://bugzilla.mozilla.org/show_bug.cgi?id=2063294)

## 🦊 v6.6.0

### 新機能

https://github.com/user-attachments/assets/84a3ddf1-02f8-4c02-9957-4afcba52bf78

* Sidebery とネイティブ垂直タブの展開・折りたたみアニメーションを変更する `uc.flex.sidebery-expand-style` を追加しました。

  ```
  1 = バランス型（`ease-in-out`、滑らかで均一、デフォルト）
  2 = 段階表示型（`ease-out` / `ease-in`、内容が徐々に現れます）
  3 = 軽快型（`easeOutQuart` / `easeInQuart`、素早く展開して滑らかに収まります）
  4 = キビキビ型（`easeOutExpo` / `ease-in-expo`、勢いよく展開し、しっかりと折りたたまれます）
  ```

* アニメーション時間を設定する `uc.flex.sidebery-expand-duration` を追加しました。

  ```
  1 = 展開 `115ms` / 折りたたみ `55ms`（デフォルト）
  2 = `160ms` / `80ms`
  3 = `200ms` / `100ms`
  4 = `340ms` / `220ms`
  ```

  時間を長くすると、アニメーションスタイルの違いが分かりやすくなります。

* カーソルを合わせてから Sidebery とネイティブ垂直タブが展開するまでの待機時間を設定する `uc.flex.sidebery-expand-delay` を追加しました。

  ```
  0 = 待機なし
  1 = `80ms`（デフォルト）
  2 = `160ms`
  3 = `350ms`
  4 = `460ms`
  ```

  この設定は、横タブとツールバーの展開待機時間にも適用されます。

* Sidebery とネイティブ垂直タブの展開幅を設定する `uc.flex.sidebery-expand-width` を追加しました。

  ```
  1 = `220px`（デフォルト）
  2 = `240px`
  3 = `260px`
  4 = `280px`
  ```

* Mica、壁紙、または `uc.flex.sidebery-apply-expand-speed-to-toolbars` を有効にすると、これらのアニメーション設定が横タブとツールバーにも適用されます。

* 4 つの設定はいずれもデフォルト値が `1` で、v6.6 より前と同じ動作になります。新しいアニメーションや展開幅を使用するには、値を手動で変更してください。

* プレビューで使用している設定：

  ```
  uc.flex.sidebery-expand-delay    = 2
  uc.flex.sidebery-expand-duration = 2
  uc.flex.sidebery-expand-style    = 2
  uc.flex.sidebery-expand-width    = 2
  ```

### 互換性のない変更

* 以下の設定は廃止され、機能しなくなりました。FlexFox の設定説明がずれないよう、`about:config` から削除してください。

  ```
  uc.flex.sidebery-fast-hover-expand
  → uc.flex.sidebery-expand-delay に置き換えられました

  uc.flex.sidebery-slow-hover-expand
  → uc.flex.sidebery-expand-delay に置き換えられました

  uc.flex.increase-sidebery-expanded-width
  → uc.flex.sidebery-expand-width に置き換えられました
  ```

* `uc.flex.findbar-position` で使用できる値を変更しました。

  ```
  top-left または 1       = 左上
  top-right または 2      = 右上
  bottom-right または 3   = 右下
  ```

  以前の `top-center-left` は機能しなくなりました。

### 改善

<img src="https://raw.githubusercontent.com/yuuqilin/media-assets/FlexFox/assets/v6.6-findbar.png" width="582px">

* 検索バーのデザインを改善しました。

  * 輪郭をより滑らかで安定した表示に変更しました。
  * Mica や壁紙使用時のぼかしと影を改善しました。
  * `uc.flex.style-sidebar-stripe-color-apply-to-all-icons` が検索バーのアイコンにも適用されるようになりました。

<img src="https://raw.githubusercontent.com/yuuqilin/media-assets/FlexFox/assets/v6.6-bookmark-folders.png" width="364px">

* フォルダー名を非表示にした時、ブックマークフォルダーのアイコンと Nova UI のホバー背景が中央に表示されるようになりました。

<img src="https://raw.githubusercontent.com/yuuqilin/media-assets/FlexFox/assets/v6.6-gradient-tab-borders.png" width="330px">

* Nova UI のグラデーションタブ枠線に対応しました。色は `uc.flex.style-sidebar-stripe-color` で設定できます。

  ```
  0      = Nova UI のデフォルトグラデーション
  1～10  = FlexFox のアクセントカラーグラデーション
  ```
* リンクプレビューパネルの半透明背景に対応しました。
* `about:config` に Nova UI スタイルを追加しました。

### 修正

#### Sidebery UI

* Sidebery の垂直ナビゲーションバーで、最後のボタンの下側が角丸になるよう調整しました。
* v6.5.6 で発生した、Sidebery の折りたたみ時に現在のパネルアイコンが正しく表示されない問題を修正しました。
* Sidebery v5.6.0 以降でタブのバッジ色が正しく表示されない問題を修正しました。[Commit ec84311](https://github.com/mbnuqw/sidebery/commit/ec8431190c3e42aa4f8357ca2c7aabc97db87fff)

#### Firefox UI

* 複数のアイコンが欠ける、または正しく表示されない問題を修正しました。
* `sidebar.visibility = expand-on-hover` 使用時のサイドバーストライプの位置を修正しました。
* Firefox 154 の `about:addons` で発生する Nova UI のレイアウト崩れを修正しました。[Bug 2051559](https://bugzilla.mozilla.org/show_bug.cgi?id=2051559)
* Firefox 154 で、全画面表示時に Sidebery とネイティブ垂直タブを展開できない問題を修正しました。[Bug 1927457](https://bugzilla.mozilla.org/show_bug.cgi?id=1927457)
* Firefox 154 で、コンテキストメニューのアイコンの明暗が反転する問題を修正しました。[Bug 2048186](https://bugzilla.mozilla.org/show_bug.cgi?id=2048186)
* Firefox 154 で発生する検索バーのレイアウト崩れを修正しました。[Bug 2048907](https://bugzilla.mozilla.org/show_bug.cgi?id=2048907)、[Bug 2056829](https://bugzilla.mozilla.org/show_bug.cgi?id=2056829)
* Firefox 154 の横タブ使用時に `uc.flex.enable-rounded-web-content` が機能しない問題を修正しました。[Bug 2047653](https://bugzilla.mozilla.org/show_bug.cgi?id=2047653)
* Firefox 154 でタブグループの背景色が正しく表示されない問題を修正しました。[Bug 2046942](https://bugzilla.mozilla.org/show_bug.cgi?id=2046942)
* Firefox 155 で消えていたタブグループのホバー背景を復元しました。[Bug 2023691](https://bugzilla.mozilla.org/show_bug.cgi?id=2023691)
* Firefox 155 で消えていたピン留めタブの枠線と背景を復元しました。[Bug 2023619](https://bugzilla.mozilla.org/show_bug.cgi?id=2023619)
* Firefox 155 で一部のパネルの角丸が正しく表示されない問題を修正しました。[Bug 2054953](https://bugzilla.mozilla.org/show_bug.cgi?id=2054953)
* Firefox 155 でディスプレイ倍率が 125% を超えるとネイティブ垂直タブのレイアウトが崩れる問題を一時的に緩和しました。[Bug 2044082](https://bugzilla.mozilla.org/show_bug.cgi?id=2044082)
* Firefox 155 で Nova UI がデフォルトで有効になったことによる、多数のレイアウトおよび機能上の問題を修正しました。[Bug 2056188](https://bugzilla.mozilla.org/show_bug.cgi?id=2056188)

<a id="updates-top-start"></a>
<details>

<summary>💬 <b>過去の更新</b></summary>

<!-- END Release Note -->

以前のバージョンの更新履歴については  
👉 [Wiki のアーカイブページ](https://github.com/yuuqilin/FlexFox/wiki/Earlier-Update-History-(Japanese))をご覧ください。

<a href="#updates-top-start">⏫ アップデート一覧の先頭へ戻る</a>
</details>
