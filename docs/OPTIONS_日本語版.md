# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox 設定オプション一覧

[English](./OPTIONS.md) | [日本語](./OPTIONS_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md) | [简体中文](./OPTIONS_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md)

このドキュメントでは、FlexFox で利用できるすべての設定項目と対応する値を一覧形式でまとめています。

インストール時に付属の `user.js` を導入した場合、FlexFox の設定は `about:config` に自動的に登録され、`uc.flex` を検索することで確認できます。

後のバージョンで追加された設定が一覧に表示されない場合でも、`user.js` を再インポートする必要はありません。このドキュメントに記載されている設定名を使用して手動で追加できます。

設定は、対象となるブラウザー要素やインターフェースごとに分類されています。変更したい項目に対応するカテゴリを展開して、利用可能な設定、対応する値、および説明を確認してください。

<details>
<summary>🔧 初期設定</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `toolkit.legacyUserProfileCustomizations.stylesheets` | `true` | `userChrome.css` を有効にするために必要な Firefox 標準の設定です。FlexFox を含むユーザー定義スタイルを適用するには、この設定を有効にする必要があります。 |
| `svg.context-properties.content.enabled` | `true` | FlexFox で使用される SVG アイコンの色を、Firefox のライト／ダークテーマに合わせて自動的に切り替えます。手動で変更していない場合、この設定はデフォルトで有効になっています。 |
| `sidebar.visibility` | `always-show` | 垂直タブモードで FlexFox の機能を完全に利用するために必要な設定です。サイドバー設定の **「カーソルを合わせた時にサイドバーを展開する」** のチェックを外した状態と同じ動作になります。多くの機能がこの設定を前提としており、他のモードでは意図しない動作が発生する場合があります。手動で変更していない場合、この値が Firefox のデフォルト設定です。 |

</details>

<details>
<summary>🚫 FlexFox の制御</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.disable-flexfox` | `false` | Firefox を再起動することなく、FlexFox のすべてのスタイルを即座に無効化します。FlexFox と標準の Firefox UI の違いを比較したり、不具合を切り分けたりする際に便利です。 |
| `uc.flex.skip-loading-uc-*.css` | `false` | `./components/` および `./content/` 内の特定の `uc-*.css` ファイルの読み込みをスキップします。コンポーネント単位でスタイルを完全に無効化したり、特定の CSS の影響を切り分けたりする際に使用できます。たとえば、`uc.flex.skip-loading-uc-newtab.css` を有効にすると、`./content/uc-newtab.css` は読み込まれません。 |

</details>

<details>
<summary>🦊 サイドバーボタン（Firefox ロゴ）</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.style-sidebar-button` | `0`-`4`<br>(`1`) | ナビゲーションバーに表示される Firefox ロゴ（サイドバー切り替えボタン）のデザインを変更します。値：`0` = Firefox 標準アイコン、`1` = Firefox マスターブランドロゴ（デフォルト）、`2` = Firefox ブラウザロゴ、`3` = Firefox System 1 ロゴ、`4` = Mozilla フラッグシンボル。 |

</details>

<details>
<summary>🌈 サイドバーストライプとアクセントカラー</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.remove-sidebar-stripe` | `false` | サイドバーストライプを非表示にします。サイドバーツールは通常、このストライプ内に折りたたまれているため、有効にするとサイドバーツールへすばやくアクセスできなくなります。再度アクセスするには、Sidebery の切り替えには <kbd>F1</kbd>、Firefox のサイドバーを表示するには <kbd>Ctrl</kbd> + <kbd>B</kbd> などのショートカットを使用してください。 |
| `uc.flex.style-sidebar-stripe-color` | `0`-`10`<br>(`0`) | サイドバーストライプやサイドバーボタン（Firefox ロゴ）など、FlexFox の主要なインターフェース要素に適用されるアクセントカラーを設定します。値：`0` = Classic（デフォルト）、`1` = レッド、`2` = オレンジ、`3` = イエロー、`4` = グリーン、`5` = シアン、`6` = ブルー、`7` = バイオレット、`8` = パープル、`9` = ピンク、`10` = グレー。選択した色は、ブックマークスター、タブのハイライト、Sidebery のナビゲーションアイコンなどにも適用されます。 |
| `uc.flex.style-sidebar-stripe-color-apply-to-all-icons` | `false` | 選択したアクセントカラーをすべてのアイコンに適用します。ダークモードでは、インターフェースの境界線にも適用されます。また、`uc.flex.revert-to-original-bookmark-star-icon` が有効な場合でも、Firefox 標準のブックマークスターの色を上書きします。 |
| `uc.flex.style-sidebar-stripe-color-use-gradient` | `false` | 選択したアクセントカラーのグラデーションを、サイドバーストライプとサイドバーボタン（Firefox ロゴ）に適用します。このグラデーションは、ブックマークスターやブックマークフォルダーにも適用されます。 |

</details>

<details>
<summary>📚 Sidebery と垂直タブ</summary>

### 共通設定

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.fully-hide-sidebery` | `false` | Sidebery とネイティブ垂直タブを完全に非表示にし、マウスカーソルを画面端に近づけたときだけ表示します。表示を開始する範囲は `--uc-sidebar-hover-trigger-width` で調整できます。この設定を有効にすると、`Hide Sidebery` ショートカットは上書きされ、表示と非表示を切り替えられなくなります。通常はこの設定を無効のままにし、ショートカットでレイアウトを切り替えることをおすすめします。設定方法については、「[レイアウトの切り替え](USAGE_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md#-レイアウトの切り替え)」を参照してください。 |
| `uc.flex.disable-sidebery-autohide` | `false` | Sidebery とネイティブ垂直タブの自動折りたたみを無効にし、常に展開された状態を維持します。この設定を有効にすると、`Lock Sidebery` ショートカットは上書きされ、自動折りたたみと固定表示を切り替えられなくなります。通常はこの設定を無効のままにし、ショートカットでレイアウトを切り替えることをおすすめします。設定方法については、「[レイアウトの切り替え](USAGE_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md#-レイアウトの切り替え)」を参照してください。 |
| `uc.flex.increase-sidebery-expanded-width` | `false` | Sidebery とネイティブ垂直タブを展開したときの幅を広げます。 |
| `uc.flex.sidebery-fast-hover-expand` | `false` | Sidebery とネイティブ垂直タブの展開・折りたたみアニメーションを高速化します。 |
| `uc.flex.sidebery-slow-hover-expand` | `false` | Sidebery とネイティブ垂直タブの展開・折りたたみアニメーションを低速化します。 |
| `uc.flex.sidebery-apply-expand-speed-to-toolbars` | `false` | サイドバーとツールバーは標準では異なる速度で展開・折りたたまれます。この設定を有効にすると、サイドバーのアニメーション速度をナビゲーションバーやツールバーにも適用し、上記の速度設定をインターフェース全体で共有できるようになります。Mica またはカスタム壁紙を使用している場合は、自動的に統一された速度が適用されるため、この設定は無効になります。 |

### Sidebery 専用

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.sidebery-disable-icon-scaling` | `false` | Sidebery のピン留めタブおよびナビゲーションパネルを展開した際の、アイコンのわずかな拡大効果を無効にします。 |
| `uc.flex.sidebery-allow-resizable-width` | `false` | Sidebery の自動折りたたみを無効にし、サイドバーの境界線をドラッグして幅を調整できるようにします。サイドバー切り替えボタン（Firefox ロゴ）を使って、展開状態と折りたたみ状態をすばやく切り替えることもできます。一時的に自動非表示へ戻して画面スペースを確保したい場合は、`Hide Sidebery` ショートカットを使用して、リサイズ可能モードと自動非表示モードを切り替えられます。この設定は Firefox のタブ表示モードが垂直タブの場合にのみ有効で、横型タブモードでは効果がありません。 |
| `uc.flex.style-sidebery-nav-icon` | `0`-`2`<br>(`0`) | Sidebery が折りたたまれている時に表示されるナビゲーションアイコンを設定します。値：`0` = アクティブなパネルのアイコンを使用（新しいデフォルト）、`1` = Sidebery ロゴ、`2` = シェブロン（以前のデフォルト）。 |
| `uc.flex.style-sidebery-nav-icon-use-active-panel-color` | `false` | 現在アクティブなパネルの色をナビゲーションアイコンに適用します。 |

### ネイティブ垂直タブ専用

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.show-pin-tabs-separator-in-expanded-state` | `false` | ピン留めタブコンテナの下部にリサイズ用の区切り線を表示します。FlexFox では、ピン留めタブコンテナの高さはデフォルトで固定されています。この設定を有効にすると、区切り線をドラッグしてコンテナの高さを自由に調整できます。 |

</details>

<details>
<summary>📑 水平タブ</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.auto-hide-horizontal-tabs-and-keep-navbar` | `0`-`3`<br>(`0`) | ナビゲーションバーを表示したまま、水平タブを自動的に非表示にします。値：`0` = タブは非表示になりません（デフォルト）、`1` = ナビゲーションバーにカーソルを合わせると、その下にタブを表示、`2` = ナビゲーションバーにカーソルを合わせると、その上にタブを表示、`3` = 画面上端にカーソルを移動した場合のみ、ナビゲーションバーの上にタブを表示します。ナビゲーションバーにカーソルを合わせただけでは表示されません。反応範囲は `--uc-tabstoolbar-hover-trigger-width` で調整できます。 |
| `uc.flex.auto-hide-navbar-and-keep-horizontal-tabs` | `0`-`1`<br>(`0`) | 水平タブを表示したまま、ナビゲーションバーを自動的に非表示にします。値：`0` = ナビゲーションバーは非表示になりません（デフォルト）、`1` = タブにカーソルを合わせるとナビゲーションバーを表示します。この設定は `uc.flex.auto-hide-horizontal-tabs-and-keep-navbar` より優先され、両方を有効にした場合はこちらが適用されます。 |
| `uc.flex.show-tab-close-button-on-favicon-hover` | `false` | 閉じるボタンをファビコンと統合し、ファビコンにカーソルを合わせたときに表示します。この設定により、タブタイトルの表示領域を広げることができます。 |
| `uc.flex.disable-tab-close-button-on-inactive-horizontal-tabs` | `false` | タブをすばやく閉じられるよう、FlexFox はデフォルトですべてのタブに閉じるボタンを表示します。タブ幅が狭くなると、誤操作を防ぐためにボタンは自動的に縮小され、隅へ移動します。誤操作を完全に防ぎたい場合は、この設定を有効にして非アクティブなタブの閉じるボタンを非表示にできます。 |
| `uc.flex.increase-active-horizontal-tab-min-width` | `0`-`4`<br>(`1`) | 現在のタブの幅を自動的に広げ、タブタイトルをより見やすくするとともに、他のタブと区別しやすくします。値：`0` = 無効（すべてのタブを同じ幅で表示）、`1` = 1.8 倍（アニメーションなし）、`2` = 1.8 倍（アニメーションあり）、`3` = 2 倍（アニメーションなし）、`4` = 2 倍（アニメーションあり）。この拡大効果はデフォルトで有効です。すべてのタブを同じ幅にしたい場合は `0` に設定してください。 |

</details>

<details>
<summary>📌 ピン留めタブ</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.max-visible-horizontal-pinned-tabs` | `0`-`5`<br>(`5`) | ピン留めタブを 1 行あたりに表示する最大数を設定します。垂直タブモードでは、上限を超えたタブは次の行に折り返されます。`1`～`5` は 1 行あたり 1～5 個のピン留めタブを表示します。水平タブモードでは、上限を超えたタブは自動的に折りたたまれます。`0` は自動折りたたみを無効にし、`1`～`5` は 2～10 個の表示数に対応します。 |
| `uc.flex.max-visible-vertical-pinned-tabs` | `0` \|<br>`2`-`8`<br>(`4`) | ピン留めタブを 1 列あたりに表示する最大数を設定します。上限に達すると、ピン留めタブコンテナにスクロールバーが表示されます。`0` に設定すると上限がなくなり、コンテナの高さはタブ数に応じて自動的に拡張されます。この設定は、水平タブモードでは効果がありません。 |

</details>

<details>
<summary>🗂️ タブグループ</summary>

### ネイティブ垂直タブ専用

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.style-tab-groups` | `0`-`2`<br>(`1`) | タブグループの表示スタイルを設定します。値：`0` = ツリーレイアウト（展開状態インジケーターなし）、`1` = 三角形の状態インジケーター付きツリーレイアウト（デフォルト）、`2` = フォルダーアイコン付きボックスレイアウト。インジケーターは、グループの展開状態に応じて自動的に切り替わります。 |
| `uc.flex.style-tab-groups-add-transition` | `0`-`2`<br>(`2`) | タブグループの展開・折りたたみアニメーションと、状態インジケーターのアニメーションを設定します。値：`0` = アニメーションなし、`1` = 展開・折りたたみアニメーション、`2` = 展開・折りたたみアニメーション + 状態インジケーターのアニメーション（デフォルト）。 |
| `uc.flex.style-tab-groups-center-label-text` | `false` | タブグループのラベルテキストを中央揃えで表示します。 |

</details>

<details>
<summary>🧩 タブの外観</summary>

### Sidebery とネイティブ垂直タブ専用

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.style-tab-items` | `1`-`2`<br>(`1`) | タブ項目の外観を設定します。現在のタブは識別しやすいよう、常に枠線と背景ハイライトの両方が表示されます。通常のタブには枠線や背景ハイライトは表示されません。値：`1` = ピン留めタブを枠線のみで表示（デフォルト）、`2` = ピン留めタブを背景ハイライトのみで表示。背景ハイライトにはサイドバーストライプのアクセントカラーが使用されます。ダークモードで `2` を選択した場合、枠線にもアクセントカラーが適用されます。 |
| `uc.flex.style-tab-items-add-hover-trail` | `true` | タブ上でカーソルを移動した際に、背景ハイライトがゆっくり消えていくトレイル効果を追加します。この効果はデフォルトで有効になっており、無効にするには `false` に設定してください。 |

</details>

<details>
<summary>🔖 ブックマーク</summary>

### ブックマーク項目

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.enable-colored-bookmarks-folder-icons` | `0`-`2`<br>(`0`) | カラーのブックマークフォルダーアイコンを有効にします。値：`0` = Firefox 標準アイコンを使用（デフォルト）、`1` = 単色のフォルダーアイコン、`2` = パターン付きフォルダーアイコン。`2` に設定すると、ブックマークフォルダーのラベルは自動的に非表示になります。 |
| `uc.flex.remove-bookmarks-folder-icons` | `false` | ブックマークフォルダーのアイコンを非表示にします。 |
| `uc.flex.remove-bookmarks-labels` | `false` | ブックマークフォルダーのラベルを非表示にします。 |

### ブックマークスター

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.revert-to-original-bookmark-star-icon` | `false` | FlexFox では、デフォルトでハート型のブックマークアイコンを使用します。この設定を有効にすると、Firefox 標準のブックマークスターアイコンと既定の色に戻ります。サイドバーストライプのアクセントカラーを適用するには、`uc.flex.style-sidebar-stripe-color-apply-to-all-icons` を有効にしてください。 |

</details>

<details>
<summary>🧭 ナビゲーションバーとツールバー</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.fully-hide-toolbox` | `false` | ブラウザー上部のすべてのツールバーを完全に非表示にし、マウスカーソルを画面上端に近づけたときだけ表示します。反応範囲は `--uc-toolbox-rotation` で調整できます。この設定を有効にすると、`Hide Topbar` ショートカットは上書きされ、表示と非表示を切り替えられなくなります。通常はこの設定を無効のままにし、ショートカットでレイアウトを切り替えることをおすすめします。設定方法については、「[レイアウトの切り替え](USAGE_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md#-レイアウトの切り替え)」を参照してください。 |
| `uc.flex.disable-bookmarks-autohide` | `false` | ブックマークツールバーの自動非表示を無効にします。FlexFox では、デフォルトでブックマークツールバーはナビゲーションバーにカーソルを合わせたときのみ表示されるため、Firefox の設定を「常に表示」にしていても画面スペースを占有しません。 |
| `uc.flex.disable-nav-bar-first-item-right-padding` | `false` | デフォルトでは、ナビゲーションバーの最初の項目（標準では Firefox ロゴ）の右側に余白を追加し、下部の垂直タブと視覚的に一体化するよう調整されています。この設定を有効にすると、その余白を無効にします。余白の量は垂直タブの有効・無効に応じて自動調整されるため、通常は変更する必要はありません。 |
| `uc.flex.increase-navbar-height` | `false` | ナビゲーションバーの高さを 3px 拡大します。この設定は、旧バージョンの FlexFox および VerticalFox スタイルとの互換性のために残されており、通常は変更する必要はありません。 |

</details>

<details>
<summary>🛠️ ツールバーボタン</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.auto-hide-navbar-icons` | `false` | ナビゲーションバーやその他の上部ツールバーのアイコンを自動的にフェードアウトし、ナビゲーションバーにカーソルを合わせるとフェードインして再表示します。URL バー内のアイコンやウィンドウ操作ボタンは別の設定で制御されるため、この設定の影響を受けません。サイドバーボタン（Firefox ロゴ）はデフォルトでは常に表示されますが、ナビゲーションバーの先頭項目でなくなった場合、または `uc.flex.style-sidebar-button` を `0` に設定した場合は、自動非表示の対象になります。 |
| `uc.flex.style-all-tabs-button` | `0`-`2`<br>(`1`) | 「すべてのタブを表示」ボタンのアイコンを設定します。値：`0` = Firefox 標準アイコン、`1` = フィルター（デフォルト）、`2` = シェブロン。 |

</details>

<details>
<summary>🔎 アドレスバー</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.auto-hide-urlbar-icons` | `true` | URL バー内のアイコンを非表示にし、URL バーにカーソルを合わせるとスライドアニメーションで表示します。この設定はデフォルトで有効になっており、常に表示したい場合は `false` に設定してください。 |
| `uc.flex.style-urlbar` | `1`-`4`<br>(`1`) | URL バーの外観を設定します。値：`1` = フラット（デフォルト）、`2` = インセット、`3` = デボス、`4` = シームレス（ナビゲーションバーと完全に一体化）。 |
| `uc.flex.style-urlbar-center-text` | `false` | URL バー内のテキストを中央揃えで表示します。 |
| `uc.flex.move-urlbar-popup-to-center` | `0`-`2`<br>(`0`) | URL バーのポップアップをブラウザーウィンドウの中央に表示します。値：`0` = 無効（デフォルト）、`1` = フォーカス時に中央表示、`2` = 入力中のみ中央表示。 |
| `uc.flex.dim-urlbar-popup-backdrop` | `0`-`2`<br>(`0`) | URL バーのポップアップ表示中、ポップアップ以外のブラウザーインターフェースを暗くします。値：`0` = 無効、`1`～`2` = 暗さの強さ。数値が大きいほど暗くなります。 |

</details>

<details>
<summary>🧩 拡張機能パネル</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.switch-to-alternate-condensed-panel` | `false` | FlexFox はデフォルトで、拡張機能パネルを省スペースなアイコングリッド形式で表示します。多数の拡張機能をインストールしていても、スクロールせずに直接アクセスできます。このモードでは拡張機能メニューボタンは非表示になりますが、アイコンを右クリックすることで各種オプションにアクセスできます。この設定を有効にすると、拡張機能名を表示するリスト形式に切り替わります。Firefox 標準のリスト表示よりもコンパクトで、視認性と操作性を両立します。 |

</details>

<details>
<summary>🪟 ウィンドウコントロール</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.auto-hide-window-controls` | `false` | ウィンドウコントロールを自動的に非表示にし、マウスカーソルを画面端まで移動すると、スライドして表示します。 |
| `uc.flex.restore-window-controls-on-tabbar` | `false` | Firefox では、水平タブモードではウィンドウコントロールがタブバーに表示され、垂直タブモードではナビゲーションバーに表示されます。FlexFox ではデフォルトで両方のモードを統一し、常にナビゲーションバーに表示します。この設定を有効にすると、水平タブモードで Firefox の標準動作に戻します。 |
| `uc.flex.revert-to-original-window-controls` | `false` | ウィンドウコントロールのアイコンを Firefox 標準のデザインに戻します。 |
| `uc.flex.style-window-controls` | `1`-`3`<br>(`1`) | ウィンドウコントロールのアイコンを切り替えます。値：`1` = トラフィックライトボタン（デフォルト）、`2` = Yosemite ウィンドウボタン、`3` = Yosemite GTK テーマ。 |
| `uc.flex.style-window-controls-shift-up` | `false` | Windows では、ウィンドウコントロールは標準で中央よりやや上に配置されます。FlexFox では他のアイコンとの位置を揃えるために下げて表示します。この設定を有効にすると、Firefox の標準的な配置に戻します。 |
| `uc.flex.style-window-controls-shrink-size` | `false` | ウィンドウコントロールのサイズを小さくします。 |
| `uc.flex.move-window-controls-to-left` | `false` | ウィンドウコントロールを左側に移動します。macOS ではレイアウトが崩れる可能性があるため、有効にしないでください。 |

</details>

<details>
<summary>📋 メニュー</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.disable-menu-icons` | `false` | メニューとパネルのアイコンを非表示にし、Firefox 標準の表示に戻します。 |
| `uc.flex.menu-item-spacing` | `'small'`\|<br>`'medium'`\|<br>`'large'` | メニューやパネル内の項目の垂直間隔を設定します。指定可能な値：`'1'` または `'small'` = 狭い間隔、`'2'` または `'medium'` = 標準の間隔、`'3'` または `'large'` = 広い間隔。 |

</details>

<details>
<summary>🌐 ウェブコンテンツ領域</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.enable-rounded-web-content` | `0`-`2`<br>(`0`) | Web コンテンツ領域に余白、影、角丸を追加し、浮かび上がるカードのような立体感を演出します。値が大きいほど余白が広がります。 |
| `uc.flex.enable-rounded-web-content-at-sidebery-corner` | `false` | デフォルトでは、サイドバーストライプと自然につながるよう、ストライプに隣接する角には角丸を適用しません。サイドバーストライプ表示時も 4 つの角すべてを同じ角丸にしたい場合は、この設定を有効にしてください。 |
| `uc.flex.style-web-content-outline` | `0`-`2`<br>(`0`) | Web コンテンツ領域の周囲に枠線を表示します。この設定は `uc.flex.enable-rounded-web-content` と組み合わせることで、よりはっきりとした効果が得られます。値：`0` = 枠線なし（デフォルト）、`1` = Tab Split View でフォーカス中のパネルのみ強調表示、`2` = すべての Web コンテンツ領域に枠線を表示。 |

</details>

<details>
<summary>🔍 検索バー</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.disable-findbar-autohide` | `false` | Findbar がフォーカスを失ったときに自動的に非表示になる動作を無効にします。<kbd>Esc</kbd> キーで Findbar をすばやく閉じることもできます。 |
| `uc.flex.findbar-position` | `'top-center-left'`\|<br>`'top-right'`\|<br>`'bottom-right'` | Findbar の表示位置を設定します。指定可能な値：`'top-center-left'` または `'1'` = 上部中央左寄せ、`'top-right'` または `'2'` = 右上、`'bottom-right'` または `'3'` = 右下。 |

</details>

<details>
<summary>🎨 ブラウザーの外観</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.add-ui-text-stroke` | `false` | UI テキストにアウトラインを追加し、特に低解像度環境での視認性を向上させます。 |
| `uc.flex.allow-addons-to-change-toolbar-color` | `false` | FlexFox は、背景画像を含むテーマを自動的に検出し、その配色を適用します。背景画像が設定されていないテーマでは、ツールバーの色が正しく反映されない場合があります。この設定を有効にすると、拡張機能やテーマによるツールバーの色設定を強制的に適用します。競合を避けるため、この設定を使用する代わりに背景画像を設定することを推奨します。たとえば [Firefox Color](https://color.firefox.com/) を使用する場合は、単色の画像をテーマの背景として設定するだけで、FlexFox が自動的に配色を適用します。 |
| `uc.flex.style-toolbar-bgcolor` | `1`-`2`<br>(`1`) | Firefox 標準のライトテーマまたはダークテーマ使用時に、ツールバーへ次の配色を適用します。`1` = Tokyo Night テーマ（デフォルト）、`2` = Firefox Acorn Design。 |
| `uc.flex.revert-to-original-flat-corner-style` | `0`-`3`<br>(`0`) | インターフェース全体の角のスタイルを設定します。値：`0` = 小さな角丸（FlexFox デフォルト）、`1` = 大きな角丸（Firefox デフォルト）、`2` = 直角（旧 Firefox スタイル）、`3` = アドレスバーのみ小さな角丸、その他は直角。 |

</details>

<details>
<summary>🧰 便利機能</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.show-flexfox-version-info-in-about-config` | `true` | `about:config` にインストール済みの FlexFox のバージョン情報を表示します。最新リリースのバージョンと比較し、更新が必要かどうかを確認できます。 |
| `uc.flex.show-tab-count-in-alltabs-button` | `0`-`2`<br>(`0`) | 「すべてのタブを一覧表示」ボタンに現在開いているタブ数を表示します。値：`0` = 無効、`1` = すべてのタブ数を表示、`2` = 読み込み済みタブのみ表示。 |
| `uc.flex.show-tab-number-in-tab-label` | `false` | 各タブのラベルの先頭に番号を表示します。この設定はネイティブタブでのみ有効です。タブの幅が狭く、ラベルの内容を識別しにくい場合でも、目的のタブをすばやく見つけやすくなります。 |
| `uc.flex.move-pip-volume-to-top` | `false` | ピクチャーインピクチャ（PiP）ウィンドウの音量ボタンを上部に移動します。 |

</details>

<details>
<summary>⚙️ Firefox ネイティブ設定</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `browser.sessionstore.restore_pinned_tabs_on_demand` | `false` | ピン留めタブの読み込みを、Firefox 起動時ではなく選択時まで遅延させる Firefox 標準の設定です。大量のピン留めタブを使用している場合でも、起動時間の短縮に役立ちます。FlexFox では、高密度なピン留めタブレイアウトにより、多数のピン留めタブを頻繁に利用するページへのショートカットとして活用できます。そのため、この設定を有効にすることを推奨します。 |
| `browser.tabs.fadeOutExplicitlyUnloadedTabs` | `true` | 手動でアンロードしたタブをフェード表示する Firefox 標準の設定です。ネイティブタブに適用されます。 |
| `browser.tabs.fadeOutUnloadedTabs` | `false` | Firefox 起動後、まだ読み込まれていないタブをフェード表示する Firefox 標準の設定です。ネイティブタブに適用されます。これら 2 つの設定を有効にすると、現在のセッションで使用したタブと未使用のタブを区別しやすくなります。 |

</details>

<details>
<summary>🧊 Windows Mica</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `widget.windows.mica` | `false` | Firefox で Windows のネイティブ Mica 背景効果を有効にします。この機能は Windows 11 でのみ利用できます。Mica を表示するには、Firefox のテーマを `システムテーマ — 自動` に設定する必要があります。このオプションは有効のままにしておき、テーマ設定を Mica のオン・オフ切り替えとして利用できます。任意のテーマで Mica を使用したい場合は、下記の `uc.flex.browser-mica-force-enabled-on-all-themes` を有効にしてください。カスタム壁紙を使用している場合は、壁紙が優先されます。 |
| `uc.flex.browser-mica-force-enabled-on-all-themes` | `false` | すべての Firefox テーマで Mica 背景効果を強制的に有効にします。これにより、Mica のライト／ダーク表示を Windows のシステム設定から切り離し、Firefox の現在のテーマに追従させることができます。たとえば、Windows をライトモードのまま、Firefox の Mica のみをダークモードにすることが可能です。このオプションを使用するには、`widget.windows.mica` を有効にする必要があります。 |
| `widget.windows.mica.popups` | `0`\|`1`\|<br>`2`<br>(`2`) | ポップアップメニューに Windows の Mica 背景効果を適用するかどうかを設定します。値：`0` = 無効、`1` = 有効、`2` = 自動（デフォルト）。 |
| `widget.windows.mica.toplevel-backdrop` | `2` | Firefox で使用する Windows の背景効果を設定します。値：`0` = 自動またはなし、`1` = Mica、`2` = Acrylic、`3` = Mica Alt。FlexFox は `2` = Acrylic を前提として設計されています。 |
| `uc.flex.browser-mica-transparency-level` | `0`-`4`<br>(`2`) | Mica 背景の上に重ねるオーバーレイの透明度を調整します。ライトモードでは白、ダークモードでは黒のオーバーレイが使用されます。値が大きいほどオーバーレイが透明になり、背景がより鮮明に表示されます。Firefox のデフォルトは `0`、FlexFox のデフォルトはより明るい `2` です。 |

</details>

<details>
<summary>✨ 透明ブラウザー</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `browser.tabs.allow_transparent_browser` | `false` | ウェブコンテンツと Sidebery の背景を透過し、Mica やカスタム壁紙を表示できるようにします。**設定を反映するには Firefox の再起動が必要です。** FlexFox はすべての組み込み `about:*` ページの透過表示に対応しています。対応ページの一覧は `about:about` で確認できます。通常のウェブサイトを透過表示するには、[Transparent Zen](https://addons.mozilla.org/firefox/addon/transparent-zen/) または [Zen Internet](https://addons.mozilla.org/firefox/addon/zen-internet/) 拡張機能が必要です。透過によって文字が読みにくくなる場合は、[UltimaDark](https://addons.mozilla.org/firefox/addon/ultimadark/) や [Dark Reader](https://addons.mozilla.org/firefox/addon/darkreader/) を利用するか、ツールバーボタンまたはショートカットキーで FlexFox の `Solid Page` 機能に切り替えてください。詳しくは [Layout Switching via Hotkeys]() を参照してください。 |
| `uc.flex.browser-solid-page-color-scheme` | `0`-`2`<br>(`1`) | `Solid Page` 使用時の背景色を設定します。値：`0` = 黒、`1` = 白（デフォルト）、`2` = Firefox の「ウェブサイトの外観」設定に従う。 |
| `uc.flex.enable-translucent-urlbar-popup-and-menus` | `false` | Mica やカスタム壁紙を使用せずに、メニュー、パネル、URL バーのポップアップに半透明効果を適用します。透明度は `uc.flex.browser-mica-transparency-level` で調整できます。Mica またはカスタム壁紙を使用している場合、この効果は自動的に有効になるため、このオプションは機能しません。 |

</details>

<details>
<summary>🖼️ ブラウザー壁紙</summary>
<br>

| Preference | Value | Description |
|-----------|:-------------:|-------------|
| `uc.flex.browser-wallpaper-enabled` | `false` | カスタムブラウザー壁紙を有効にし、Firefox のインターフェース全体に静止画またはアニメーション背景を常時表示します。**この設定を有効にすると、上記の Mica 背景設定は上書きされます。** |
| `uc.flex.browser-wallpaper-index` | `0`-`9`<br>(`0`) | 使用する壁紙ソースを指定します。`0` は現在の Firefox テーマの背景画像をブラウザー全体の壁紙として使用します。`1`～`9` は `../icons/wallpaper/` 内の `main-image-1.jpg` ～ `main-image-9.jpg` を使用します。壁紙ファイルは、元の形式に関係なく `.jpg` 拡張子にリネームする必要があります。対応形式は JPG、WebP、Animated WebP、PNG、APNG、AVIF、GIF です。 |
| `uc.flex.browser-wallpaper-svg-enabled` | `false` | SVG 壁紙のサポートを有効にします。有効にすると、`../icons/wallpaper/` に配置した `main-image-1.svg` ～ `main-image-9.svg` を壁紙として使用できます。SVG ファイルは、他の壁紙形式とは異なり、拡張子を `.svg` のまま維持する必要があります。 |
| `uc.flex.browser-wallpaper-acrylic-disabled` | `false` | ブラウザー壁紙に適用されるアクリル風のぼかし効果を無効にします。デフォルトでは Mica に近い見た目を再現するため、壁紙にアクリル風のぼかしが適用されます。この設定を有効にすると、壁紙を本来の鮮明な状態で表示します。 |
| `uc.flex.browser-wallpaper-align-horizontal` | `'auto'`\|<br>`'left'`\|<br>`'center'`\|<br>`'right'` | 壁紙画像がブラウザーウィンドウに合わせて切り抜かれる際の水平方向の位置を設定します。指定可能な値：`'auto'` または `'0'` = 自動配置（デフォルト）、`'left'` または `'1'` = 左寄せ、`'center'` または `'2'` = 中央、`'right'` または `'3'` = 右寄せ。 |
| `uc.flex.browser-wallpaper-transparency-level` | `0`-`4`<br>(`2`) | 壁紙の上に重ねるオーバーレイの透明度を調整します。ライトモードでは白、ダークモードでは黒のオーバーレイが使用されます。値が大きいほどオーバーレイが透明になり、背景がよりはっきり表示されます。この設定は `uc.flex.browser-mica-transparency-level` と明るさが揃うように設計されており、デフォルト値の `2` は Mica 透明度 `2` に近い見た目になります。これにより、カスタム壁紙と Mica を切り替えた際の急な明るさの変化を抑えます。 |
| `uc.flex.browser-wallpaper-contrast-level` | `0`-`4`<br>(`2`) | 壁紙の上に重ねるオーバーレイのコントラストを調整します。この設定は、ダークモードでアクリル風のぼかし効果が有効な場合にのみ適用されます。値が大きいほどコントラストが高くなり、色がより鮮やかに表示されます。デフォルト値は `2` です。 |

</details>
