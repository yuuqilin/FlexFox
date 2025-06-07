# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox（日本語版）

<div>
 <a href='https://www.mozilla.org'><img src="https://img.shields.io/badge/Last%20tested%20Firefox-v141-orange?logo=firefox"></a>
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

**🦊 v3.5.8**
* `Lock Sidebery`、`Collapse sidebar`、`Hide tabs and sidebar`、`Move sidebar to the right` など、複数の状態においてテーマ背景やブックマークツールバーの表示互換性を改善しました。
* Firefox 標準メニュー内にある AI チャットボットやブックマークツールバーのチェックマークアイコンが表示されるように修正しました。
* `uc.flex.enable-rounded-web-content` を有効にした際、ステータスパネルにも角丸が適用されるようになりました。
* 一部の変数名を、より分かりやすい名称に変更しました。

<details>  
<summary>🪄 <b>新機能：丸みと浮かせたようなWeb表示スタイル</b> <i>《クリックで展開》</i> 👇</summary>

新しいビジュアルオプション `uc.flex.enable-rounded-web-content` が追加されました。

このオプションを有効にすると、Webコンテンツの周囲に余白が追加され、角丸とドロップシャドウが適用され、カードのように柔らかく浮いた印象の表示になります。Zen や Microsoft Edge を参考にしたデザインです。

値は `0`（無効）〜 `2` まで指定でき、数値が大きいほど余白が広がります。

以下の変数を調整することで、表示を細かくカスタマイズできます：

* `--uc-web-content-margin-small`
* `--uc-web-content-margin-large`
* `--uc-web-content-radius-box`

以下は `uc.flex.enable-rounded-web-content = 1` の状態での表示例です：

<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/flexfox-rounded-web-content.webp" alt="Rounded web content preview in FlexFox" width="96%" />

</details>

<details>  
<summary>🪄 <b>新機能：角丸なしのフラットなデザインに切り替え可能</b> <i>《クリックで展開》</i> 👇</summary>

新しく追加された `uc.flex.revert-to-original-flat-corner-style` オプションを有効にすると、Firefox標準のフラットな角のスタイルに戻すことができます。FlexFox独自の丸みを帯びたデザインを使わず、よりシャープな外観を好む方におすすめです。

さらに、`uc-variables.css` 内のこのオプションに関連する `*-radius` 変数を編集することで、アドレスバーや検索バー、検索ウィンドウなどの角丸の大きさを細かく調整できます。

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
<summary>🚀 <b>新機能：ネイティブ縦型タブが完全非表示と常時展開に対応</b> <i>《クリックで展開》</i> 👇</summary>

- `uc.flex.fully-hide-sidebery` オプションと `Hide Sidebery` のホットキーは、Sidebery に加えてネイティブ縦型タブにも同じ挙動が適用され、両方を完全に非表示にできます。
- 全画面モード（<kbd>F11</kbd>）では、ネイティブ縦型タブも自動で完全非表示になります。
- 最大化されていないウィンドウでは、`--uc-hover-sidebar-trigger-width` 変数によって Sidebery とネイティブ縦型タブ両方のトリガー領域を制御できます。
- `uc.flex.disable-sidebery-autohide` オプションと `Lock Sidebery` のホットキーは、Sidebery に加えてネイティブ縦型タブにも同じ挙動が適用され、両方を常時展開された状態にできます。
- これにより、ネイティブ縦型タブも Sidebery と同様に変数で制御され（展開／折りたたみの速度など）、一貫した挙動が実現されます。

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

**v3.5.7**
* v3.5.5で発生した不具合を修正。ブックマークツールバーが自動展開される際、ナビゲーションバーとの間でテーマの背景画像が途切れてしまう問題を解消しました。

**v3.5.6**
* サイドバーを右側に配置した際に、`uc.flex.fully-hide-sidebery` や `Hide Sidebery` のショートカット、または全画面モードを有効にすると発生する複数の表示不具合を修正しました。
* サイドバーを右側に置いたときのレイアウト処理を整理し、ルールを簡潔化しました。

**v3.5.5**
* Sidebery を右側に配置し、`uc.flex.disable-sidebery-autohide` や `Hide Sidebery` のショートカット、またはフルスクリーンモードを有効にしている場合に、サイドバーのストライプ内のツールボタンがずれて表示される問題を修正しました。
* ナビゲーションバーの高さを Firefox のデフォルトに変更しました。これにより全体的によりコンパクトな印象になります。以前の FlexFox バージョンでは、ナビゲーションバーがより高く、サイドバーの幅と視覚的に近いバランスでした。
* ナビゲーションバーの高さを従来の FlexFox のレイアウトに戻す `uc.flex.increase-navbar-height` オプションを追加しました。

**v3.5.4**
* `Lock Sidebery` ショートカットを使用するか、`uc.flex.disable-sidebery-autohide` を有効にしている場合でも、Firefoxのサイドバー切り替えボタンで折りたたみ状態にしてもレイアウトが崩れず、表示が一貫するようになりました。
* `Lock Sidebery` 有効時には、Firefox標準の縦型タブパネルもSideberyと同じ幅に揃うようになり、切り替え時にレイアウトが揺れることがなくなりました。また、`uc.flex.increase-sidebery-expanded-width` を有効にすると、標準のパネルの幅も拡張されます。

**v3.5.3**
* `uc.flex.enable-rounded-web-content` を有効にすると、開発者ツールがブラウザウィンドウ内にドッキングされている場合にリサイズできなくなる不具合（v3.5.2で発生）を修正しました。
* アドレスバーの見た目と動作を改善しました：
  * アドレスバー内に表示される位置情報や通知、カメラ／マイク共有などの許可関連アイコンの位置ずれを修正しました。
  * ホバーしていないときに、さらに多くのアイコンを非表示にして、初期状態でよりすっきりとした見た目にしました。
  * リーダーモードやPiP（ピクチャー・イン・ピクチャー）のアイコンは、それぞれの機能が有効な場合に常に表示されるようにしました。
* `uc-pdf.js.css` によるPDF検出とスタイリングを改善しました。`.pdf` で終わらないURLであっても、ページ自体がPDFビューアである学術サイトでも、スタイルが正しく適用されるようになりました。
* 以前は `Lock Sidebery` ショートカットでSideberyを常時表示にした際、ホバーアニメーションによってわずかなレイアウトのズレが発生することがあり、その対策として `uc.flex.disable-sidebery-hover-animations` オプションを有効にする必要がありました。現在は動作判定の改良により、Sideberyを固定表示している場合はホバーアニメーションが自動で無効化されるようになったため、このオプションは不要となり、設定自体も削除されました。

**v3.5.2**
* `uc.flex.move-pip-volume-to-top` を有効にした際、PiP ウィンドウ内の音量スライダーが短すぎる不具合を修正しました。
* 新オプション `uc.flex.disable-flexfox` を追加。Firefox を再起動せずに FlexFox の全スタイルを一時的に無効化できます。
* 新オプション `uc.flex.skip-loading-uc-*.css` を追加。`./components/` や `./content/` フォルダー内の特定の `uc-*.css` ファイルの読み込みを個別にスキップできます。たとえば、`uc.flex.skip-loading-uc-newtab.css` を true に設定すると、`./content/uc-newtab.css` の読み込みが無効化されます。

**v3.5.1**
* v3.4.7 で発生した不具合を修正：`uc.flex.disable-sidebery-autohide` を有効にするか `Lock Sidebery` ショートカットを使用すると、ネイティブの縦型タブでホバー時にちらつきが発生し、タブが右側にある場合に展開位置がずれる問題がありました。
* ピクチャ・イン・ピクチャ (PiP) の音量調整ボタンを常に表示するように変更。Reddit の u/endgame0 氏に感謝。
* 新オプション `uc.flex.move-pip-volume-to-top` を追加。PiP の音量ボタンを上部に移動します（ブール値）。Reddit の u/endgame0 氏に感謝。
* 新オプション `uc.flex.dim-urlbar-popup-backdrop` を追加。アドレスバーのドロップダウンが展開された際に背景を暗くします。`0`（無効）から `2` までの数値を設定でき、数値が大きいほど暗さが増します。
* 新オプション `uc.flex.enable-rounded-web-content` を追加。Web コンテンツ領域にマージン、角丸、影を追加します。`0`（無効）～`2` まで設定可能で、数値が大きいほどマージンが広がります。カードのように柔らかく浮かび上がるスタイルになり、Zen や Microsoft Edge に近い外観になります。
  外観は、`--uc-web-content-margin-small`、`--uc-web-content-margin-large`、`--uc-web-content-radius-box` の各変数で簡単に調整できます。

  下図は `uc.flex.enable-rounded-web-content` を `1` に設定した FlexFox の表示例です：
  
  <img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/flexfox-rounded-web-content.webp" alt="FlexFoxのrounded web content表示例" width="96%" />

**v3.5.0**
* Firefox v141以降で、ピン留めされたタブが縦に並んでしまう表示の不具合を修正しました（本来は横に並ぶべき）。
* ピン留めされたタブが3つ以下のときに、タブの幅がはみ出す問題を修正しました。
* サイドバーのツールボタンが5個以下のときに、設定ボタンの位置がずれる、またツールバーの展開方向が縦になってしまう問題を修正しました。
* ネイティブの縦型タブにおけるサイドバーツールボタンの表示スタイルを統一しました。Sideberyの有効・無効、サイドバーの展開状態、ボタン数の多少にかかわらず、すべてのパターンで一貫した整った間隔で表示されるようになりました。

**v3.4.10**
* 検索バーの背景色が正しく表示されない不具合を修正しました。

**v3.4.9**
* v3.4.8で発生した不具合により、アドレスバーにホバーしてもアウトライン（外枠）が表示されなくなっていた問題を修正しました。
* 新しいタブの検索ボックスも `uc.flex.revert-to-original-flat-corner-style` オプションに対応し、Firefox標準の角丸スタイルに戻せるようになりました。

**v3.4.8**
* アドレスバーにフォーカスした際、候補ポップアップとバー本体の境界がずれて見える問題を修正しました。
* 新しいオプション `uc.flex.revert-to-original-flat-corner-style` を追加しました。これを `true` に設定すると、FlexFox の丸みを帯びたデザインを無効化し、Firefox 標準のフラットな角丸スタイルに戻すことができます。さらに、`uc-variables.css` 内の該当オプション下にある `*-radius` 変数を編集することで、アドレスバー・検索バー・検索パネルの角の丸みを個別に調整できます。

  <img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/firefox-original-flat-corner-style.webp" alt="Firefox標準の角丸スタイルのプレビュー" width="72%" />

**v3.4.7**
* ネイティブの縦型タブを右側に配置した際、画面端にマウスを移動してもスムーズに展開できなかった問題を修正しました。
* 縦型タブを右側に表示した場合にスクロールバーが表示されない不具合を修正しました。
* 左側に縦型タブを展開した際、左端の余白が不十分だった問題を調整しました。

**v3.4.6**
* Firefox v140以降で、タブグループラベルのサイズや位置がずれていた問題を修正しました。
* `uc.flex.show-pin-tabs-separator-in-expanded-state` オプションを有効にしても、ピン留めタブと通常タブの間に区切り線が表示されない問題を修正しました（v140での内部構造の変更に対応）。

**v3.4.5**
* v3.4.3で発生したリグレッションを修正：ネイティブの縦型タブが「折りたたみ」モードのときに、タブパネルの幅が正しく表示されない問題を修正しました。

**v3.4.4**
* Nightly v140でSideberyが展開できなくなる不具合を修正しました。
* テーマとの互換性を強化しました。テーマに背景画像（透明なものを含む）が設定されている場合、FlexFox は自動的にテーマが内蔵カラーパレットを上書きできるようにします。これにより、`uc.flex.allow-addons-to-change-toolbar-color` オプションを手動で設定する必要がなくなります。
* [Firefox Color](https://color.firefox.com/) に対応しました。ユーザーはブラウザー全体の配色を自由にカスタマイズできるようになります。

  * Firefox Color のウェブサイトで「Custom backgrounds」タブを開き、任意の背景画像を選択すると、FlexFox は Firefox Color による配色の上書きを許可します。
  * Firefox Colorの「Preset themes」には一部、背景画像が設定されていないテーマがあります。これらは画像を選ぶか、`uc.flex.allow-addons-to-change-toolbar-color`オプションを有効にすることで完全に適用されます。背景画像がないままだと、文字色は変わってもツールバーの背景色は反映されません。

<p>こちらは、Firefox Color を使って <a href="https://github.com/rose-pine/firefox">Rosé Pine Moon</a> テーマを適用したときの FlexFox の表示例です：</p>
<img src="https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/firefox-color-rose-pine-moon.webp" alt="FlexFox with Rosé Pine Moon theme" width="96%" />

**v3.4.3**
* `uc.flex.add-ui-text-stroke` を有効にした際、Sidebery に意図しないフォントが適用されてしまう問題を修正しました。
* 水平タブ使用時、ナビゲーションバーの先頭要素の後に不要な余白が追加されていた問題を修正しました。
* 新しいサイドバーのみを有効にしてネイティブの垂直タブを無効にした場合に発生する以下の不具合を修正しました：

  * サイドバーのストライプが正しくハイライトされない問題
  * ストライプ展開時に設定ボタンの位置がずれる問題

> [!NOTE]
> 補足：FlexFox はネイティブの垂直タブを前提に設計されているため、新しいサイドバーのみの使用は非推奨です。

**v3.4.2**
- Firefox v138 において、ネイティブの縦型タブを「常時展開モード」で使用した際に発生していたレイアウトの不具合を修正しました。幅の処理が正しく行われず、ホバー時のちらつきやブックマークツールバーのずれが発生していました。

**v3.4.1**
- Sidebery を完全に非表示にした状態で、サイドバーのストライプが正しく展開されない問題を修正しました。
- サイドバーが右側にあり、かつネイティブの縦型タブを完全に非表示にしていると、展開後の幅が正しくない問題を修正しました。
- `uc.flex.disable-native-vertical-tabs-autohide` と `uc.flex.fully-hide-sidebery` の両方を有効にした際に、ネイティブの縦型タブが展開できなくなる不具合を修正しました。
- `uc.flex.disable-native-vertical-tabs-autohide` オプションは廃止され、今後は `uc.flex.disable-sidebery-autohide` を使用して、Sidebery とネイティブ縦型タブの両方を常時展開状態に固定できるようになりました。

**v3.4.0**
- Sidebery を完全に非表示に切り替えた際、マウスカーソルで再表示させるためのトリガー領域の幅が、カスタム設定どおりに反映されない問題を修正しました。
- 重要な更新：FlexFox が Firefox の**ネイティブ縦型タブ**の完全非表示にも対応しました。
  これまでの `uc.flex.fully-hide-sidebery` オプションと `Hide Sidebery` のショートカットは、Sidebery に加えてネイティブの縦型タブも対象になります。さらに、<kbd>F11</kbd>で全画面表示に切り替えた際にも、自動で非表示になります。
  ウィンドウが最大化されていない場合、`--uc-hover-sidebar-trigger-width` の値は、Sidebery だけでなくネイティブ縦型タブの再表示トリガー領域の幅も制御します。これにより、Sidebery に対する動作設定がそのままネイティブ縦型タブにも反映され、統一された挙動が実現されます。

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
| `uc.flex.allow-addons-to-change-toolbar-color` | テーマや拡張機能によるツールバーの背景色や背景画像の上書きを許可します。 |
| `uc.flex.enable-gradient-highlight` | FlexFox のロゴ、サイドバーのストライプ、ブックマークの星アイコンなど、主要な UI 要素に使われるハイライトカラーにグラデーションスタイルを適用します。数値で設定でき、`0` は無効、`1` ～ `X` は異なるグラデーションスタイルを選択します。 |
| `uc.flex.enable-colored-bookmarks-folder-icons` | ブックマークフォルダーのアイコンをカラー表示にします。数値で設定でき、`0` は無効、`1` は第1セットのアイコンを使用、`2` は第2セットのアイコンを使用し、ラベルは自動的に非表示になります。 |
| `uc.flex.remove-bookmarks-folder-icons` | ブックマークフォルダーのアイコンを非表示にします。 |
| `uc.flex.remove-bookmarks-labels` | ブックマークフォルダーのラベル（テキスト）を非表示にします。 |
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
| `uc.flex.findbar-position` | 検索バー（Findbar）の表示位置を設定します。指定可能な値は文字列 `"top-center-left"` または `"0"`（左寄せ上部）、`"top-right"` または `"1"`（右上）、`"bottom-right"` または `"2"`（右下）です。 |

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
