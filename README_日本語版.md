# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox（日本語版）

<div>
 <a href='https://www.mozilla.org'><img src="https://img.shields.io/badge/Last%20tested%20Firefox-v142-orange?logo=firefox"></a>
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

![FlexFox Dark-Light Theme](https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/FlexFox-light-dark.webp) 

## 🆕 最新情報

**🦊 v3.7.0**
* Sideberyの展開・折りたたみアニメーションを改善し、ホバー時のタブのちらつきを解消しました。
  （従来は`padding`や自動計算された`width`の変化が段階的に発生し、タブの位置が滑らかに遷移せず、不自然な揺れが生じていました。）
* `uc.flex.sidebery-slow-hover-expand` オプション有効時に、サイドバーと Sidebery のアニメーションのタイミングが合わない問題を修正しました。
* サイドバーのアニメーション速度に関する変数は、Sidebery 内部のアニメーションと同期させるために `uc-sidebery.css` にも定義されるようになりました。
  `uc-variables.css` の変数を `uc-user-settings.css` にコピーしてカスタマイズしている場合は、同じ値の変数定義を `uc-sidebery.css` から `uc-custom-content.css` にもコピーしてください。その際、`@media` クエリと `#root` セレクタを含めるのを忘れないようにしてください。userChrome と userContent の間でアニメーションのタイミングを一致させるために必要です。

ナビゲーションバーの自動非表示機能とSideberyの背景色切り替えのプレビュー：  
<video src="https://github.com/user-attachments/assets/070f798d-2925-4681-ac50-7cd4b36936e7" controls></video>

🖌️ <b>大きな改良点：Sidebery の背景がテーマに連動</b>
> [!NOTE]
> * FlexFox は、Firefox の現在のテーマに合わせて Sidebery の背景色を自動で切り替えられるようになりました。
> * この機能を有効にするには、Sidebery の **設定 → 外観 → カラースキーム** で `"firefox"` を選択してください。
> <details><summary>Sidebery の外観設定のスクリーンショットを見る</summary>
> <img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/sidebery-appearance-settings.webp" alt="Sidebery の外観設定" width="50%" />
> </details>

🔧 <b>v3.6.x パフォーマンス修正（v3.5.1の問題に対応）</b>
> [!NOTE]
> * **v3.5.1** で発生していたパフォーマンスの低下は、**v3.6.0** 以降で修正されています。
> * 特に「**タブを一覧表示します**」パネルを開く速度が目に見えて向上しており、最新版では **v3.5.8** に比べて最大 **18倍** 高速です。
> * 単なるパフォーマンス低下の修正にとどまらず、一部のコードをリファクタリングすることで速度をさらに最適化しました。Firefox のネイティブ UI との差は **2ms 未満** まで縮まりました。
> * **v3.5.x** をお使いの方には、最新バージョンへのアップデートをおすすめします。

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
  --uc-web-content-margin-small
  --uc-web-content-margin-large
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

<a id="updates-top-start"></a>
<details>

<summary>💬 <b>過去の更新</b></summary>

**v3.6.10**
* v3.6.8で発生した不具合を修正しました。Sideberyがアクティブな状態で「カーソルを合わせた時にサイドバーを展開する」設定を有効にしていると、展開されたサイドバーのツールバーが表示されない問題が発生していました。

**v3.6.9**
* v3.6.8で発生した不具合を修正：ネイティブの横型タブモードで、サイドバーのヘッダーストライプの色が表示されなくなる問題を修正しました。
* v3.6.8で発生した不具合を修正：ネイティブの横型タブモードでサイドバーヘッダーを開いた際、Sideberyが展開状態を維持できなくなる問題を修正しました。

**v3.6.8**
* Nightly 142で発生した、サイドバー切り替えボタンのホバー時のハイライトサイズが正しく表示されない問題を修正しました。
* `uc.flex.enable-rounded-web-content` の表示を改善。ページコンテナの影や角丸が正常に表示されるようになり、スタイル全体を再構築してパフォーマンスと可読性を向上させました。
* サイドバーとナビゲーションバーのz-indexの処理を見直し、固定値ではなくホバー時に動的に切り替わるようになりました。
* 「カーソルを合わせた時にサイドバーを展開する」が有効かつSideberyがアクティブなとき、サイドバーツールバーが完全に展開されない問題を修正しました。
* ネイティブの横型タブレイアウト使用時に、サイドバーのヘッダーとテーマの背景色の表示がより自然になるよう調整しました。

**v3.6.7**
* `uc.flex.auto-hide-navbar-icons` の動作を改善しました。ポップアップを開くボタンは、ホバーしていない場合でもメニューと一緒に表示されたままになります。
* アドレスバー・ナビゲーションバー・ブックマークツールバーの非表示ボタンのアニメーションを統一しました。`uc-variables.css` から以下の変数を `uc-user-settings.css` にコピーして編集することで、遷移効果を調整できます：

  ```css
  --uc-autohide-navbar-icons-duration
  --uc-hover-navbar-icons-duration
  --uc-autohide-navbar-icons-type
  --uc-collapse-navbar-icons-duration
  ```

**v3.6.6**
* Nightly v141の変更によってmacOS風ウィンドウ操作ボタンが表示されなくなっていた問題を修正しました。
  * [Bug 1789579](https://bugzilla.mozilla.org/show_bug.cgi?id=1789579)
* メニュー内で欠けていたアイコンを追加・補完しました。
* 新オプション`uc.flex.auto-hide-navbar-icons`を追加しました。このオプションを有効にすると、ナビゲーションバーのツールボタンアイコンが自動的に非表示になり、ホバー時にのみ表示されるようになります。ウィンドウ操作ボタン、URLバー、FlexFoxロゴのサイドバー切り替えボタンは常に表示されます。ただし、サイドバーボタンがナビゲーションバーの最左端・最右端以外の位置に移動された場合や、`uc.flex.revert-to-original-sidebar-icon`オプションが有効な場合は、このボタンも自動非表示の対象となります。
* 大きな改良点として、FlexFoxはFirefoxのテーマに合わせてSideberyの背景色を自動で切り替えられるようになりました。この機能を使用するには、Sideberyの「設定」→「外観」→「カラースキーム」で「firefox」を選択してください。

**v3.6.5**
* テーマとの互換性を強化。Firefoxの組み込みテーマ以外を使用している場合、ツールバーの色が自動的にテーマに従うようになりました。`uc.flex.allow-addons-to-change-toolbar-color` オプションは、Firefox Color を背景画像なしで使用する場合のみ必要です。
* `uc.flex.enable-rounded-web-content` オプション有効時に、サイドバーが「タブとサイドバーを非表示」に設定され、垂直タブが無効な状態でも、サイドマージンが誤って適用される問題を修正。
* 拡張機能パネル（拡張機能ボタン一覧パネル）の表示を改善。ボタンが見やすくなり、クリックもしやすくなりました。  

    <img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/unified-extensions-panel.webp" alt="拡張機能パネルのレイアウトとボタン間隔を改善" width="175px" />
* メニュー項目の間隔を調整するための `uc.flex.menu-item-spacing` オプションを追加しました。  
  指定可能な文字列値は以下の通りです：  
  `"1"` または `"small"` = コンパクトな間隔（デフォルト。従来バージョンと同様）  
  `"2"` または `"medium"` = 中程度の間隔  
  `"3"` または `"large"` = Firefox 標準の広い間隔  

  以下の変数を使用すれば、各メニューごとにより細かく調整できます：

  ```
  --uc-app-menu-item-padding-block            // アプリメニューの間隔
  --uc-menu-item-padding-block                // ブックマークやシステムメニュー
  --uc-content-area-context-menu-item-padding-block // ページの右クリックメニュー
  --uc-appMenu-zoom-controls-x-offset         // 拡大・縮小ボタンの配置調整
  ```
* `uc-aboutconfig.css` および `uc.flex.menu-item-spacing` の設定形式に合わせて、`uc.flex.findbar-position` の値の範囲を `"0"`〜`"2"` から `"1"`〜`"3"` に変更しました。  
  設定可能な値は以下の通りです：  
  `"1"` または `"top-center-left"` = 左寄せ上部  
  `"2"` または `"top-right"` = 右上  
  `"3"` または `"bottom-right"` = 右下  
* メニュー内のチェックボックス項目の文字位置ずれを修正し、より多くの項目に補完用のアイコンを追加しました。

**v3.6.4**
* Nightly v141 によって発生したサイドバーのレイアウト崩れを修正しました。
  * [Bug 1954155](https://bugzilla.mozilla.org/show_bug.cgi?id=1954155)
  * [Bug 1972060](https://bugzilla.mozilla.org/show_bug.cgi?id=1972060)
* `uc.flex.dim-urlbar-popup-backdrop` の背景暗転にフェードアニメーションを追加し、表示効果を改善しました。
* `about:config` 上に FlexFox のバージョン情報を表示できる `uc.flex.show-flexfox-version-info-in-about-config` を追加しました。
* `about:config` の表示を改善し、変更された設定がより見つけやすくなりました。また、「カーソルを合わせた時にサイドバーを展開する」オプションが有効な場合、FlexFox による垂直タブの最適化が無効化されている旨の通知が12秒間表示されます。

**v3.6.3**
* サイドバー設定で「タブとサイドバーを非表示にする」が有効な場合でも、`uc.flex.enable-rounded-web-content` オプションがウェブ開発ツールとの併用に対応するようになりました。ツールが左右にドッキングされた際にも、コンテンツの周囲に適切な余白が確保されます。
* Sidebery のナビゲーションバーにおいて、パネルの数が1行未満のときにホバーすると、Sidebery 全体が上にズレて画面がちらつく問題を修正しました。
  * 本来意図していない挙動であり、今後はどのような状態でも安定して表示されるようになります。
  * 私自身の環境では常にパネル数が1行を超えていたため、これまで気付かずにいました。
  * ナビゲーションバーの展開アニメーションも調整され、Sidebery の自動非表示と `Lock Sidebery` ショートカットの併用にも対応しました。
  * 修正は `userContent.css` 経由で反映されるため、Sidebery 本体のスタイルは更新不要です。FlexFox の通常アップデートのみで適用されます。

**v3.6.2**
* `uc.flex.disable-bookmarks-autohide` オプション有効時の互換性を、さまざまなケースで向上させました。
* `uc.flex.enable-rounded-web-content` オプション有効時、横型タブモードでウェブ開発ツールを使用する際の互換性を改善しました。
* 古いルールや変数を削除し、より効率的なセレクターに置き換えました。
* Sidebery およびネイティブ垂直タブ関連の変数処理にかかる条件判定の負荷を軽減しました。
* v3.6.1 と比べてパフォーマンスが約 **7％** 向上し、FlexFox を無効にした場合との差は 2ms 未満となりました。

**v3.6.1**
* Firefox の新しい機能を活用し、不要になった `:has()` や `:is()` の判定を削除しました。属性チェックの代わりに `@media` を使用し、新たに追加された属性によって複雑なセレクターを簡素化しています。
* 実測ではパフォーマンスへの影響は 2% 未満で、体感できる違いはありませんでした。
* `uc.flex.disable-bookmarks-autohide` オプションが、「新しいタブでのみブックマークツールバーを表示」設定と併用できるようになりました。
* 「カーソルを合わせた時にサイドバーを展開する」機能の互換性を、さまざまな状況で改善しています。

**🔥 v3.6.0 パフォーマンス大幅改善アップデート**
> [!WARNING]
> * v3.5.1で発生した深刻なパフォーマンス低下を修正しました。
>   * 原因は、v3.5.1で追加された「丸みと浮かせたようなWeb表示スタイル」機能でした。
>   * 特に「タブを一覧表示します」ボタンを押した際、タブ一覧が表示されるまでに約0.5秒以上かかるほど反応が遅くなる現象が見られました。
>   * また、ウェブ開発ツールやブラウザツールボックスを使用中にも、UI全体の動作が重くなることがありました。
>   * 過去のFlexFox更新を追っている方はお気づきかもしれませんが、今回も原因は`:root:has()`セレクターによるものでした。
> * このパフォーマンス低下は修正され、元の速度もさらに最適化されています。
> * v3.5.8と比べて、処理速度はおよそ**17倍**に向上しています。
> * ⬆️ できるだけ早めのアップデートをおすすめします。

以前のバージョンの更新履歴については  
👉 [Wiki のアーカイブページ](https://github.com/yuuqilin/FlexFox/wiki/Earlier-Update-History-(Japanese))をご覧ください。

<a href="#updates-top-start">⏫ アップデート一覧の先頭へ戻る</a>
</details>

> [!IMPORTANT]
> FlexFox を Firefox のネイティブ垂直タブと併用する場合は、「カーソルを合わせた時にサイドバーを展開する」のオプションを「サイドバーのカスタマイズ」設定から **無効** にしてください。
>
> * このオプションを有効にすると、FlexFox 独自の最適化デザインではなく、Firefox 標準の垂直タブレイアウトに切り替わります。
> * FlexFox の外観や動作を最大限に活かすには、通常時はこのオプションを **無効にしたまま** ご使用いただくことをおすすめします。
> * タブ幅の調整など、Firefox 標準の機能が必要な場合は、用途や作業スタイルに応じて柔軟にこのオプションを有効にすることもできます。

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

### 🚀 方法1：自動インストールと更新

> [!IMPORTANT]
> 初めて FlexFox をインストールする場合は、スクリプトの実行後に [方法2](https://github.com/yuuqilin/FlexFox?tab=readme-ov-file#-method-2-manual-installation) の手順5以降を手動で実行してください。  
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

---

### 👷 方法2：手動インストール

> [!IMPORTANT]
> 1. [Sidebery](https://addons.mozilla.org/firefox/addon/sidebery/) をインストール（推奨）。
> 2. FlexFoxをダウンロード：
>    - [FlexFox](https://github.com/yuuqilin/FlexFox/archive/refs/heads/main.zip)：通常版Firefox用
>    - [FlexFox Beta](https://github.com/yuuqilin/FlexFox/archive/refs/heads/Beta.zip)：Firefox Beta / Nightly用
>    - [FlexFox ESR](https://github.com/yuuqilin/FlexFox/archive/refs/heads/ESR.zip)：Firefox ESR用
> 3. `about:support`を開き、「プロファイルフォルダー」の「フォルダーを開く」をクリック。
> 4. `chrome` フォルダと、`scripts` フォルダ内の `user.js` をプロファイルフォルダにコピーします。
> 5. *(任意)* テキストエディタで`user.js`を編集し、必要な機能の`//`コメントを外す。
>    - 以下の設定は`true`のままにしてください：
>      - `toolkit.legacyUserProfileCustomizations.stylesheets`
>      - `svg.context-properties.content.enabled`
> 6. Firefoxを再起動し、その後`user.js`を削除して、`about:config`の変更を保存できるようにします。
> 7. Sideberyの設定：
>    - サイドバーの歯車アイコンから設定を開く
>    - 「ヘルプ」→「アドオンデータをインポート」で、アーカイブ内の`sidebery-settings.json`と`sidebery-styles.json`をインポート
>    - *注*：設定が反映されない場合は再度インポートしてください。
> 8. *(任意)* `about:config`で`uc.flex.`を検索し、必要に応じてFlexFoxの機能を有効／無効にします。

## ⚙️ カスタマイズ設定

### 📜 ユーザー定義スタイル（`uc-user-settings.css`、`uc-custom-content.css`）

> [!TIP]  
> FlexFox のコアファイルを直接編集せずに、Firefoxのインターフェースやウェブページの表示スタイルを自由にカスタマイズできます。
>
> カスタマイズの方法：
>
> - **Firefoxのインターフェース（chrome）**を変更するには、`components` フォルダに `uc-user-settings.css` を作成してください。
> - **ウェブページの内容（content）**を変更するには、`content` フォルダに `uc-custom-content.css` を作成してください。
>
> 必要に応じて、`uc-variables.css` などの既存ファイルから変数やスタイルをコピーし、自分用に編集して使うことができます。これらのファイルは **既定のスタイルの後に読み込まれるため、ユーザーの設定が優先されます。**
>
> これらのファイルは **FlexFox本体には含まれていないため、将来のアップデートで上書きされることはありません。** 一度設定すれば、以後もそのまま利用可能です。
>
> 💡 `:root` や `:root:has(...)` のようにセレクター内で定義されているルールをコピーする場合は、文脈を保つためにセレクター全体を含めてコピーしてください。

### 🧩 カスタマイズ可能な設定 (`about:config`)

#### 🪄 機能を追加・有効化するオプション

| 設定名 | 説明 |
|--------|------|
| `uc.flex.add-ui-text-stroke` | UIテキストに太めのアウトラインを追加し、特に低解像度の画面での視認性を向上させます。 |
| `uc.flex.fully-hide-sidebery` | Sidebery とネイティブの縦型タブを完全に非表示にします。マウスカーソルを画面端に移動すると再表示されます。 |
| `uc.flex.fully-hide-toolbox` | 上部のすべてのツールバー（水平タブバー、ナビゲーションバー、ブックマークツールバー）を完全に非表示にします。マウスカーソルを画面上端に移動すると再表示されます。 |
| `uc.flex.auto-hide-navbar-icons` | ナビゲーションバーのアイコンを通常は非表示にし、ツールバーにカーソルを合わせると再表示されます。ウィンドウ操作ボタン、URLバー、サイドバーのボタン（FlexFox ロゴ）は常に表示されますが、サイドバーのボタンがナビゲーションバーの端に配置されていない場合や、`uc.flex.revert-to-original-sidebar-icon` が有効な場合は自動的に隠れます。 |
| `uc.flex.allow-addons-to-change-toolbar-color` | Firefox Color などの拡張機能によるツールバーの色の変更を有効にします（背景画像が設定されていない場合に必要です）。 |
| `uc.flex.enable-gradient-highlight` | FlexFox のロゴ、サイドバーのストライプ、ブックマークの星アイコンなど、主要な UI 要素に使われるハイライトカラーにグラデーションスタイルを適用します。数値で設定でき、`0` は無効、`1` ～ `X` は異なるグラデーションスタイルを選択します。 |
| `uc.flex.enable-colored-bookmarks-folder-icons` | ブックマークフォルダーのアイコンをカラー表示にします。数値で設定でき、`0` は無効、`1` は第1セットのアイコンを使用、`2` は第2セットのアイコンを使用し、ラベルは自動的に非表示になります。 |
| `uc.flex.remove-bookmarks-folder-icons` | ブックマークフォルダーのアイコンを非表示にします。 |
| `uc.flex.remove-bookmarks-labels` | ブックマークフォルダーのラベル（テキスト）を非表示にします。 |
| `uc.flex.show-flexfox-version-info-in-about-config` | `about:config` ページに FlexFox のインストール確認メッセージと現在のバージョン番号を表示します。 |
| `uc.flex.show-pin-tabs-separator-in-expanded-state` | Firefox の「展開モード」のネイティブ垂直タブにおいて、ピン留めタブと通常タブの間に区切り線を表示します（デフォルトでは非表示）。 |
| `uc.flex.dim-urlbar-popup-backdrop` | URL バーのドロップダウンが表示されている間、背景を暗くします。数値で設定でき、`0` は無効、`1` ～ `2` は暗さの強さを示します。値が大きいほど暗くなります。 |
| `uc.flex.move-pip-volume-to-top` | ピクチャ・イン・ピクチャ（PiP）ウィンドウ内の音量調整ボタンを上部に移動します。 |
| `uc.flex.enable-rounded-web-content` | Web コンテンツ領域にマージン、影、四隅の角丸を追加します。数値で設定でき、`0` は無効、`1` ～ `2` はマージンの大きさを調整します。値が大きいほどスペースが広がります。 |

#### 🚫 機能を無効化・元に戻すオプション

| 設定名 | 説明 |
|--------|------|
| `uc.flex.disable-flexfox` | Firefox を再起動せずに、FlexFox のすべてのスタイルと機能を無効にします。 |
| `uc.flex.skip-loading-uc-*.css` | `./components/` および `./content/` 内の特定の `uc-*.css` ファイルの読み込みをスキップします。たとえば、`uc.flex.skip-loading-uc-newtab.css` を有効にすると `./content/uc-newtab.css` が読み込まれなくなります。 |
| `uc.flex.disable-bookmarks-autohide` | ブックマークツールバーの自動非表示を無効にします。 |
| `uc.flex.disable-tabs-toolbar-autohide` | Sidebery が非アクティブなときに、ネイティブの水平タブバーが自動で隠れないようにします。 |
| `uc.flex.disable-findbar-autohide` | 検索バー（Findbar）のフォーカスが外れたときに自動で隠れる動作を無効にします。 |
| `sidebar.visibility`（`always-show`） | Firefoxのネイティブ設定です。値を `always-show` にすると、Firefox標準の垂直タブバーの自動折りたたみが無効化され、代わりにFlexFox独自の自動折りたたみ機能が有効になります。FlexFoxはアニメーションの滑らかさ、折りたたみ時の整理されたレイアウト、ピン留めタブの扱いやすさに優れています。この設定は、サイドバーの設定画面で **「カーソルを合わせた時にサイドバーを展開する」** のチェックを外すことで切り替えることも可能です。 |
| `sidebar.visibility`（`expand-on-hover`） | 値を `expand-on-hover` にすると、Firefoxの垂直タブバーのネイティブな自動折りたたみ動作が有効になり、FlexFoxの機能は無効化されます。この動作は、サイドバー設定の **「カーソルを合わせた時にサイドバーを展開する」** を有効にすることで切り替え可能です。このモードでは、ネイティブの垂直タブとSideberyのどちらも、<kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>Z</kbd>キーやサイドバーの切り替えボタンで展開・折りたたみの状態を変更できます。 |
| `sidebar.animation.expand-on-hover.duration-ms` | `sidebar.visibility` が `expand-on-hover` に設定されているときに、垂直サイドバーの展開・折りたたみにかかるアニメーションの速度を制御するFirefoxのネイティブ設定です。 |
| `uc.flex.disable-sidebery-autohide` | Sidebery とネイティブ縦型タブの自動折りたたみを無効にします。 |
| `uc.flex.disable-nav-bar-first-item-right-padding` | デフォルトでは、ナビゲーションバーの最初の項目の後ろに右側の余白を追加して、垂直タブとその周辺項目との視覚的な区切りや整列を改善します。このオプションはその余白を無効にします。 |
| `uc.flex.disable-menu-icons` | FlexFox によって追加されたメニューのカスタムアイコンを無効にします。 |
| `uc.flex.revert-to-original-window-controls` | FlexFox 独自の macOS風ウィンドウコントロールアイコンを Firefox 標準の最小化・最大化・閉じるボタンに戻します。 |
| `uc.flex.revert-to-original-flat-corner-style` | URLバー、検索バー、検索パネルの角丸を、FlexFox 独自の大きな丸みから Firefox 標準の控えめな角丸スタイルに戻します。 |
| `uc.flex.revert-to-original-bookmark-star-icon` | FlexFox 独自のブックマーク星アイコンを Firefox 標準のデザインに戻します。 |
| `uc.flex.revert-to-original-sidebar-icon` | FlexFox 独自のロゴを使用したサイドバーアイコンを Firefox 標準のデザインに戻します。 |

#### 🪛 機能を調整・変更するオプション

| 設定名 | 説明 |
|--------|------|
| `uc.flex.increase-sidebery-expanded-width` | Sidebery の展開時の幅を広げます。また、`uc.flex.disable-sidebery-autohide` を有効にするか `Lock Sidebery` が有効な場合は、Firefox標準の縦型タブパネルの幅も広がります。 |
| `uc.flex.increase-navbar-height` | 以前のFlexFoxバージョンで使用されていた、より厚みのあるナビゲーションバーの高さを復元します。現在のデフォルト（Firefox本来のコンパクトな高さ）を上書きします。 |
| `uc.flex.switch-to-alternate-condensed-panel` | デフォルトでは、FlexFox は Firefox 標準の統合拡張機能パネルをアイコンのみのビューに置き換えます。この状態では、拡張機能アイコンを右クリックすることでオプションにアクセスできます。この設定を有効にすると、拡張名やオプションボタンも表示される簡易ビューに切り替わり、より情報が分かりやすくなります。 |
| `uc.flex.sidebery-fast-hover-expand` | Sidebery とネイティブ垂直タブの自動展開・折りたたみの動作を高速化します。 |
| `uc.flex.sidebery-slow-hover-expand` | Sidebery とネイティブ垂直タブの自動展開・折りたたみの動作を低速化します。 |
| `uc.flex.max-visible-vertical-pinned-tabs` | ネイティブの垂直タブにおいて、1列あたりに表示できるピン留めタブの最大数を設定します（数値の範囲は 4～6）。この数を超えるとスクロールバーが表示されるため、使用環境に応じて調整してください。 |
| `uc.flex.findbar-position` | 検索バー（Findbar）の表示位置を設定します。指定可能な値は文字列 `"top-center-left"` または `"1"`（左寄せ上部）、`"top-right"` または `"2"`（右上）、`"bottom-right"` または `"3"`（右下）です。 |
| `uc.flex.menu-item-spacing` | Firefoxのアプリメニュー、ブックマークメニュー、右クリックメニューにおける項目同士の垂直間隔を設定します。指定可能な値は文字列 `"1"` または `"small"`（狭い間隔）、`"2"` または `"medium"`（標準の間隔）、`"3"` または `"large"`（広い間隔）です。 |

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
