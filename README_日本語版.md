# FlexFox（日本語版）

<div>
 <a href='https://www.mozilla.org'><img src="https://img.shields.io/badge/Last%20tested%20Firefox-v138-orange?logo=firefox"></a>
 <a href='https://github.com/yuuqilin/FlexFox/commits/main/'><img src="https://img.shields.io/github/last-commit/yuuqilin/FlexFox/main"></a>
 <a href='https://github.com/yuuqilin/FlexFox/commits/Beta/'><img src="https://img.shields.io/github/last-commit/yuuqilin/FlexFox/Beta?label=last%20Nightly%20commit&color=purple"></a>
 <a href='https://github.com/yuuqilin/FlexFox/stargazers'><img src='https://img.shields.io/github/stars/yuuqilin/FlexFox?style=social'></a>
</div>

<br>

FlexFoxは、[VerticalFox](https://github.com/christorange/VerticalFox)、[EdgyArc-fr](https://github.com/artsyfriedchicken/EdgyArc-fr)、[Edge-Frfox](https://github.com/bmFtZQ/edge-frfox)、[ArcWTF](https://github.com/KiKaraage/ArcWTF)、[shimmer](https://github.com/nuclearcodecat/shimmer)、[firefox-csshacks](https://github.com/MrOtherGuy/firefox-csshacks)からインスピレーションを得て開発された、カスタマイズ性の高いFirefox用テーマです。豊富な機能と柔軟な設定により、より快適なブラウジング体験を実現します。

## 最新情報

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

<details>

<summary>💬 <b>過去の更新</b></summary>

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

</details>

> [!IMPORTANT]
> Firefox v133より前のバージョンでFlexFoxをお使いの方は、アップデート前に`about:config`で`uc.flex.`を検索し、該当する設定をすべて削除してください。

## プレビュー

![FlexFox Light Theme](./assets/FlexFox-light.webp)  
![FlexFox Dark Theme](./assets/FlexFox-dark.webp)  
*上：FlexFoxのライトテーマとダークテーマの表示例*

## 主な機能

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

## インストール方法

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

## カスタマイズ設定

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
| `uc.flex.disable-sidebery-autohide`        | Sideberyの自動折りたたみを無効化                               |
| `uc.flex.remove-bookmarks-folder-icons`    | ブックマークフォルダーのアイコンを非表示                       |
| `uc.flex.remove-bookmarks-labels`          | ブックマークのテキストラベルを非表示                           |
| `uc.flex.switch-to-alternate-condensed-panel` | 別デザインの拡張機能パネルに切り替え                        |
| `uc.flex.revert-to-original-window-controls` | 元のウィンドウコントロール（最小化・最大化・閉じる）に戻す   |
| `uc.flex.sidebery-fast-hover-expand`       | Sideberyの展開/折りたたみを高速化                              |
| `uc.flex.sidebery-slow-hover-expand`       | Sideberyの展開/折りたたみを遅くする                            |

## 既知の問題

- **Floorp使用時の注意点：**  
  Floorpのインターフェース設定で`Firefox Proton UI`を選択すると、互換性の問題が軽減されます。

- **動作環境について：**  
  Windows環境での動作確認を行っています。他のOSでは別途調整が必要な場合があります。