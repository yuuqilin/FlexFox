# FlexFox（日本語版）

<div>
 <a href='https://www.mozilla.org'><img src="https://img.shields.io/badge/Last%20tested%20Firefox-v139-orange?logo=firefox"></a>
 <a href='https://github.com/yuuqilin/FlexFox/commits/main/'><img src="https://img.shields.io/github/last-commit/yuuqilin/FlexFox/main"></a>
 <a href='https://github.com/yuuqilin/FlexFox/commits/Beta/'><img src="https://img.shields.io/github/last-commit/yuuqilin/FlexFox/Beta?label=last%20Nightly%20commit&color=purple"></a>
 <a href='https://github.com/yuuqilin/FlexFox/stargazers'><img src='https://img.shields.io/github/stars/yuuqilin/FlexFox?style=social'></a>
</div>

<br>

FlexFoxは、[VerticalFox](https://github.com/christorange/VerticalFox)、[EdgyArc-fr](https://github.com/artsyfriedchicken/EdgyArc-fr)、[Edge-Frfox](https://github.com/bmFtZQ/edge-frfox)、[ArcWTF](https://github.com/KiKaraage/ArcWTF)、[shimmer](https://github.com/nuclearcodecat/shimmer)、[firefox-csshacks](https://github.com/MrOtherGuy/firefox-csshacks)からインスピレーションを得て開発された、カスタマイズ性の高いFirefox用テーマです。豊富な機能と柔軟な設定により、より快適なブラウジング体験を実現します。

## 🆕 最新情報

**v3.0.4**  
- タイプミスを修正しました。  
- 新しいサイドバーのオプション `タブとサイドバーを隠す` を有効にした際に、ブックマークツールバーの水平方向のずれを修正しました。

**v3.0.3**  
- `uc.flex.fully-hide-sidebery` が有効、または全画面モードの際に、サイドバーストライプが展開できない問題を修正しました。併せて、同条件下で発生していたサイドバーストライプと Sidebery のアニメーションの同期ズレも修正しています。  
- メニューバーの背景色がナビゲーションツールバーと一致しないテーマの表示不具合を修正しました。

**v3.0.2**  
- サイドバーが右側にある場合の展開・折りたたみアニメーションの不具合を修正しました。  
- ネイティブの縦型タブもSideberyと同じ展開／折りたたみ速度になりました。`uc.flex.sidebery-fast-hover-expand` または `uc.flex.sidebery-slow-hover-expand` オプションで速度を調整できます。または `--uc-autohide-*` および `--uc-hover-*` の変数を直接編集して、お好みの速度に変更することもできます。

**v3.0.1**  
- `uc.flex.disable-bookmarks-autohide` を使用中に、新しいサイドバーのヘッダーストライプ（上部の細い帯）の位置がずれる問題を修正しました。  
- `uc.flex.disable-sidebery-autohide` を使用中に、ヘッダーストライプの幅が不正になる問題を修正しました。

**v3.0.0**
- Firefoxのネイティブ縦型タブとSideberyを統合しました。  
  - Sideberyが有効な場合、ネイティブの縦型タブは自動的に非表示になり、サイドバーはSidebery上部の細いカラーストライプに折りたたまれます。ストライプにマウスカーソルを合わせると、サイドバーのツールボタンが表示されます。  
  - Sideberyが無効な場合（たとえば別のサイドバーツールや拡張機能を開いたとき）は、代わりにネイティブの縦型タブが表示されます。  
  - F1キーでSideberyを素早く切り替えると、Sideberyとネイティブの縦型タブは同じ幅とレイアウトを共有しているため、シームレスに切り替わるように見えます。  
  - サイドバーが左側・右側のどちらに配置されていても、自動でレイアウトが調整され、UIに適応します。  
- 数値オプション `uc.flex.max-visible-vertical-pinned-tabs` を新たに追加しました（設定可能範囲：4～6）。このオプションは、ネイティブの縦型タブパネルの各列に縦方向で表示できるピン留めタブの数を制御します。初期値は4です。縦に並ぶピン留めタブの数がこの値を超えると、スクロールバーが表示されます。

> [!IMPORTANT]
> ネイティブの縦型タブが自動的に折りたたまれ、ホバーで展開されます。`サイドバーを展開します`ボタン（Alt+Ctrl+Z）でこの機能を有効にできます。 
> <details>
> <summary>🖼️ <b>ネイティブ垂直タブの自動折りたたみのデモ</b></summary>
> <p><code>uc.flex.show-pin-tabs-separator-in-expanded-state</code> が false の状態でネイティブ垂直タブを展開した例</p>
> <img src="./assets/vertical-tabs-expanded.webp" alt="vertical-tabs-expanded" width="50%" />
> <p><code>uc.flex.show-pin-tabs-separator-in-expanded-state</code> が false の状態でネイティブ垂直タブを折りたたんだ例</p>
> <img src="./assets/vertical-tabs-collapsed.webp" alt="vertical-tabs-collapsed" width="50%" />
> </details> 

> [!TIP]
> **ユーザーは現在、`components` フォルダー内に `uc-user-settings.css` ファイルを作成することで、FlexFox のスタイルをカスタマイズできます。このファイルは FlexFox の後に読み込まれ、そのスタイルを上書きするため、将来的なアップデート後もカスタム変更が保持されます。**  
> **詳細は次のセクションをご覧ください: [User-Customizable Styles (`uc-user-settings.css`)](https://github.com/yuuqilin/FlexFox?tab=readme-ov-file#-user-customizable-styles-uc-user-settingscss)**


<details>

<summary>💬 <b>過去の更新</b></summary>

**v2.1.2**  
- ネイティブの縦型タブと `uc.flex.disable-bookmarks-autohide` が両方有効な場合に、ブックマークバーがずれる問題を修正しました。  
- フルスクリーン時にURLバーの遷移が遅れる問題を修正しました。  

**v2.1.1**  
- Firefox v137でネイティブ縦型タブの背景が透過になる問題を修正しました。  
- `uc.flex.disable-native-vertical-tabs-autohide` オプションを追加しました。trueに設定するとネイティブ縦型タブの自動折りたたみを無効化できます。  

**v2.1.0**  
- ネイティブの縦型タブが自動的に折りたたまれ、ホバーで展開されます。`サイドバーを展開します`ボタン（Alt+Ctrl+Z）でこの機能を有効にできます。  
- 新しいオプション `uc.flex.show-pin-tabs-separator-in-expanded-state` を追加し、ネイティブの垂直タブ使用時にピン留めタブのパネルに区切り線を表示できるようになりました。  
- ネイティブの縦型タブを有効にした際にテーマが適用されない不具合と、ブックマークバーを自動的に非表示にした時に背景画像が崩れる問題を修正。  
- **`components` フォルダに `uc-user-settings.css` を作成することで、FlexFox のスタイルをユーザーが自由に上書きできるようになりました。このファイルは FlexFox より後に読み込まれるため、FlexFox を更新しても設定が上書きされることはありません。**  
- ネイティブの縦型タブとSideberyの統合はまだ未対応で、同時には使用できません。  

サイドバーのツールボタンのデザインは、@Godiesc 氏の [firefox-gx](https://github.com/Godiesc/firefox-gx) を参考にしています。優れた実装に感謝します。  

**v2.0.3**  
- Firefox v138+との互換性を確保するために、`sidebar-positionend`属性を追加し、新しいサイドバーの幅を少し調整しました。  

**v2.0.2**  
- `@media` ルールを Firefox v137+ に対応するよう更新。  

**v2.0.1**  
- ウィンドウが最大化されていない時、上部に1pxの枠線を追加しました。  
- スタイルを整理し、不要なルールやコメントを削除しました。  

**v2.0.0**:  
- コア機能を完全に再設計し、旧バージョンと比べ速度が28倍向上しました。  
   - 起動後、初回の右クリックメニューの表示時間は13msで、Firefoxのネイティブテーマと全く同じ速度です。  
   - タブが205個ある状態で「すべてのタブを一覧表示」を開く時間も26msで、こちらもネイティブテーマと同等です。  
   - つまり、再設計により、v2.0.0がFirefoxのパフォーマンスに与える影響はほぼ皆無と言えます。  
- Nightly (v135)のアドレスバーとネイティブ縦型タブの表示問題を修正しました。  

<details>
<summary>🖼️ <b>新機能の使用例</b></summary>
<p>ダークテーマで<code>uc.flex.disable-sidebery-autohide</code>を有効化したFlexFox：</p>
<img src="./assets/disable-sidebery-autohide.webp" alt="disable-sidebery-autohide" width="98%" />
<p><code>uc.flex.fully-hide-toolbox</code>と組み合わせた表示：</p>
<img src="./assets/disable-sidebery-autohide-with-fully-hide-toolbox.webp" alt="disable-sidebery-autohide-with-fully-hide-toolbox" width="98%" />
</details>

**v1.1.1**:
- テーマ適用時に検索バーの背景色が正しく表示されない問題を修正しました。

**v1.1.0**:
- テーマ背景が有効で、ブックマークツールバーの自動非表示を使用する際に、ホバーで背景画像が途切れる問題を修正しました。
- ズームレベルのテキストの明るさを調整しました。
- Nightly (v135) におけるウィンドウコントロールの位置の問題を修正しました。`tabsintitlebar` 廃止後の `customtitlebar` との互換性を対応済み。
- Sideberyの自動折りたたみを無効化するオプション`uc.flex.disable-sidebery-autohide`を追加しました。

> [!IMPORTANT]
> v1.1.0版の`sidebery-styles.json`をインポートする前に、旧バージョンのスタイルを削除してください。Sideberyの設定（歯車アイコン）> `Styles editor` > `Sidebar` と `Group page` の両セクションでスタイルをすべてクリアしてから、新しいスタイルをインポートしてください。  
> また、`sidebery-settings.json` をインポートすると、パネルデータが失われる場合がありますので、必ず事前にスナップショットでバックアップを作成してください。

**v1.0.4**:
- ウェブページのズームレベルがデフォルトでない場合、ズームレベルアイコンを常に表示するようにしました。
- ウェブページがブックマーク済みの場合、ブックマークの星アイコンを常に表示するようにしました。  
   <img src="./assets/urlbar-star-light.webp" alt="urlbar-star-light" width="380" />  
   <img src="./assets/urlbar-star-dark.webp" alt="urlbar-star-dar" width="380" />

**v1.0.3**:
- `uc.flex.allow-addons-to-change-toolbar-color` オプション有効時のパフォーマンスを最適化し、v1.0.2と比較して速度が1.4倍向上しました。

**v1.0.2**:
- URLバーのスイッチャーとチックレットの表示を改善。
- テーマや拡張機能がツールバー背景を変更可能にするオプション `uc.flex.allow-addons-to-change-toolbar-color` を追加。  
   <img src="./assets/allow-addons-to-change-toolbar-color.webp" alt="allow-addons-to-change-toolbar-color" width="98%" />

**v1.0.1**:  
- URLバーのトラッキング保護アイコンが非表示にならない問題を修正しました。 
- `uc-pdf.js.css` を追加しました。 
- LICENSEファイルを追加しました。

**v1.0.0**:
- パフォーマンスが劇的に向上し、従来版と比べて約100倍の高速化を実現しました。コンテキストメニューの表示にかかる時間は標準UIと比べてわずか**16ms**の差に抑えられています。

> [!IMPORTANT]
> Firefox v133より前のバージョンでFlexFoxをお使いの方は、アップデート前に`about:config`で`uc.flex.`を検索し、該当する設定をすべて削除してください。

</details>

## 🖼️ プレビュー

![FlexFox Light Theme](./assets/FlexFox-light.webp)  
![FlexFox Dark Theme](./assets/FlexFox-dark.webp)  
*上：FlexFoxのライトテーマとダークテーマの表示例*

## ✨ 主な機能

- **シンプル＆軽量なインターフェース**
  - UIを必要最小限に抑え、システムリソースを効率的に使用します

- **ツールバーの自動非表示**
  - タブバー、ブックマークバー、上部ツールバー、Sideberyサイドバーを自動的に隠します
  - マウスを近づけると自然に表示されます

- **表示項目のカスタマイズ**
  - 必要なツールバーやサイドバーを自由に選択できます
  - すべて非表示にすれば、フルスクリーンモードを使わずともWebページだけを表示できます

- **便利な表示トリガー**
  - ウィンドウの端にマウスを移動するだけで、ツールバーやサイドバーが表示されます
  - ウィンドウが最大化されていなくても機能します
  - 反応感度も調整可能です

- **Sideberyとの優れた互換性**
  - Sideberyの有無にかかわらずスムーズに動作
  - Sidebery使用時は自動的にタブバーを非表示に
  - サイドバーは左右どちらにも配置可能

- **タイトルバー・メニューバーへの対応**
  - これらの要素が有効な場合でも、自動的にレイアウトを最適化

- **オーバーレイ方式のツールバー**
  - ツールバーはページコンテンツの上に重なって表示されるため、レイアウトが崩れません
  - フルスクリーンモードでも快適に使用できます

- **検索バーの改善**
  - ブラウザ上部にコンパクトで浮かぶようなデザイン
  - 左右の位置を自由に調整可能
  - フォーカスが外れると自動的に非表示（設定で変更可能）

- **すっきりとした拡張機能パネル**
  - アイコンのみのシンプルな表示
  - 右クリックで設定画面にアクセス
  - 必要に応じてラベル付き表示に切り替え可能

- **Sideberyの折りたたみ機能を強化**
  - ナビゲーションと固定タブセクションを自動的に折りたたみ
  - 展開時も位置を維持し、マウス操作がスムーズ

## 💿 インストール方法

> [!IMPORTANT]
> 1. まずは[Sidebery](https://addons.mozilla.org/firefox/addon/sidebery/)をインストール（推奨）
> 2. お使いのFirefoxに合わせてFlexFoxをダウンロード：
>    - 通常版Firefox → [FlexFox](https://github.com/yuuqilin/FlexFox/archive/refs/heads/main.zip)
>    - Firefox Beta/Nightly → [FlexFox Beta](https://github.com/yuuqilin/FlexFox/archive/refs/heads/Beta.zip)
>    - Firefox ESR → [FlexFox ESR](https://github.com/yuuqilin/FlexFox/archive/refs/heads/ESR.zip)
> 3. `about:support`を開き、「プロファイルフォルダー」の「開く」をクリック
> 4. ダウンロードした`Profiles`フォルダー内の`chrome`フォルダと`user.js`をプロファイルフォルダーにコピー
> 5. *（任意）* `user.js`をテキストエディターで開き、使用したい機能の`//`を削除
>    - `toolkit.legacyUserProfileCustomizations.stylesheets`と`svg.context-properties.content.enabled`は必ず`true`のままにしてください
> 6. Firefoxを再起動し、その後`user.js`を削除（`about:config`での設定は保持されます）
> 7. Sideberyの設定：
>    - サイドバーの歯車アイコンから設定を開き、`Help > Import addon data`で`sidebery-settings.json`と`sidebery-styles.json`をインポート
>    - *注：* 設定が反映されない場合は、再度インポートをお試しください
> 8. *（任意）* `about:config`で`uc.flex.`を検索し、お好みの機能を有効化/無効化

## ⚙️ カスタマイズ設定

### 📁 ユーザー定義スタイル（`uc-user-settings.css`）

> [!TIP]
> デフォルトのスタイル変数やルールを、コアファイルを編集せずに上書きできます。
> 
> カスタマイズ方法：
> 
> 1. `components` フォルダ内に `uc-user-settings.css` という名前のファイルを作成してください。
> 2. 変更したい変数やルール（例：`uc-variables.css` 内のもの）をコピーします。
> 3. `uc-user-settings.css` に貼り付け、必要に応じて編集してください。
> 
> このファイルはすべての組み込みスタイルの後に読み込まれるため、FlexFox の将来的なアップデートでもカスタマイズ内容は保持されます。  

> 💡 特定のセレクター（例：`:root` や `:root:has(...)`）内に定義された変数をコピーする場合は、セレクターごと全体をコピーしてください。正しく上書きされるために必要です。

### 🧩 設定可能なオプション（`about:config`）

| 設定項目                                   | 説明                                                           |
|--------------------------------------------|----------------------------------------------------------------|
| `uc.flex.add-ui-text-stroke`               | UIテキストを縁取りで強調                                       |
| `uc.flex.add-bookmarks-left-margin`        | ブックマークとツールバーアイコンの位置を揃える                 |
| `uc.flex.fully-hide-sidebery`              | Sideberyを完全に非表示                                         |
| `uc.flex.fully-hide-toolbox`               | 上部ツールバーをすべて非表示                                   |
| `uc.flex.increase-sidebery-expanded-width` | Sideberyの展開時の幅を広げる                                   |
| `uc.flex.allow-addons-to-change-toolbar-color` | テーマや拡張機能がツールバーの背景画像と色を変更可能にする |
| `uc.flex.disable-bookmarks-autohide`       | ブックマークバーの自動非表示を無効化                           |
| `uc.flex.disable-tabs-toolbar-autohide`    | Sidebery未使用時のタブバー自動非表示を無効化                   |
| `uc.flex.disable-findbar-autohide`         | 検索バーの自動非表示を無効化                                   |
| `uc.flex.disable-native-vertical-tabs-autohide` | ネイティブ縦型タブの自動折りたたみを無効化                  |
| `uc.flex.disable-sidebery-autohide`        | Sideberyの自動折りたたみを無効化                               |
| `uc.flex.remove-bookmarks-folder-icons`    | ブックマークフォルダーのアイコンを非表示                       |
| `uc.flex.remove-bookmarks-labels`          | ブックマークのテキストラベルを非表示                           |
| `uc.flex.switch-to-alternate-condensed-panel` | 別デザインの拡張機能パネルに切り替え                        |
| `uc.flex.revert-to-original-window-controls` | 元のウィンドウコントロール（最小化・最大化・閉じる）に戻す   |
| `uc.flex.sidebery-fast-hover-expand`       | Sideberyの展開/折りたたみを高速化                              |
| `uc.flex.sidebery-slow-hover-expand`       | Sideberyの展開/折りたたみを遅くする                            |
| `uc.flex.show-pin-tabs-separator-in-expanded-state` | 垂直タブのピン留めタブと通常タブの間に区切り線を表示します |
| `uc.flex.max-visible-vertical-pinned-tabs` | ネイティブ縦型タブの1列あたりのピン留め数を設定（数値、4～6）      |

## 🐞 既知の問題

- **Floorp使用時の注意点：**  
  Floorpのインターフェース設定で`Firefox Proton UI`を選択すると、互換性の問題が軽減されます。

- **動作環境について：**  
  Windows環境での動作確認を行っています。他のOSでは別途調整が必要な場合があります。

<details>
  <summary><h2 style="display: inline;">📄 ライセンス</h2></summary>
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
