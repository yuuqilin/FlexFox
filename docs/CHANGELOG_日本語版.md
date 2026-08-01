# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox 更新履歴

[English](./CHANGELOG.md) | [日本語](./CHANGELOG_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md) | [简体中文](./CHANGELOG_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md)

## 🆕 最新情報

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

<!-- END What's New -->

<a id="updates-top-start"></a>
<details>

<summary>💬 <b>過去の更新</b></summary>

<!-- END Release Note -->

以前のバージョンの更新履歴については  
👉 [Wiki のアーカイブページ](https://github.com/yuuqilin/FlexFox/wiki/Earlier-Update-History-(Japanese))をご覧ください。

<a href="#updates-top-start">⏫ アップデート一覧の先頭へ戻る</a>
</details>
