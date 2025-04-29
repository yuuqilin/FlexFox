# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox（日本語版）

<div>
 <a href='https://www.mozilla.org'><img src="https://img.shields.io/badge/Last%20tested%20Firefox-v140-orange?logo=firefox"></a>
 <a href='https://github.com/yuuqilin/FlexFox/commits/main/'><img src="https://img.shields.io/github/last-commit/yuuqilin/FlexFox/main"></a>
 <a href='https://github.com/yuuqilin/FlexFox/commits/Beta/'><img src="https://img.shields.io/github/last-commit/yuuqilin/FlexFox/Beta?label=last%20Nightly%20commit&color=purple"></a>
 <a href='https://github.com/yuuqilin/FlexFox/stargazers'><img src='https://img.shields.io/github/stars/yuuqilin/FlexFox?style=social'></a>
</div>

<br>

FlexFoxは、[VerticalFox](https://github.com/christorange/VerticalFox)、[EdgyArc-fr](https://github.com/artsyfriedchicken/EdgyArc-fr)、[Edge-Frfox](https://github.com/bmFtZQ/edge-frfox)、[ArcWTF](https://github.com/KiKaraage/ArcWTF)、[shimmer](https://github.com/nuclearcodecat/shimmer)、[firefox-csshacks](https://github.com/MrOtherGuy/firefox-csshacks)からインスピレーションを得て開発された、カスタマイズ性の高いFirefox用テーマです。豊富な機能と柔軟な設定により、より快適なブラウジング体験を実現します。

![FlexFox Dark-Light Theme](./assets/FlexFox-light-dark.webp) 

## 🆕 最新情報

<details>

<summary>💬 <b>過去の更新</b></summary>

**v3.1.6**
- `content`フォルダに `uc-custom-content.css` を作成することで、ウェブページの表示に対する独自スタイルを適用できるようになりました。このファイルは `userContent.css` の末尾で読み込まれるため、前のスタイルを上書きできます。また、FlexFox本体には含まれていないため、今後のアップデートでも内容が上書きされることはありません。
- Gitクローン＋pullによる更新を行うユーザー向けに、プロジェクトのディレクトリ構成を整理しました。将来リリース予定のインストール・アップデートスクリプトにも対応しています。

**v3.1.5**  
- 新しいサイドバーが有効な場合に、不要なスタイルルールの適用を回避するようにしました。 
- クラシックサイドバーで、切り替えメニュー（スイッチャー）にカーソルを合わせた際にサイドバーが折りたたまれてしまう、長年の不具合を修正しました。  
_補足：このバグは長らく存在していましたが、影響が軽微で、修正にはわずかな性能コストが伴うため、これまで放置されていました。FlexFox が新しいサイドバーに完全移行した今、旧バージョンに区切りをつける形で修正を行いました。_

**v3.1.4**  
- Findbarの表示位置を微調整しました。

**v3.1.3**  
- Findbarを右下に配置した際に、一致件数が表示されない問題を修正しました。

**v3.1.2**

- Findbar（検索バー）のデフォルト位置が、*上部中央やや左寄り*から*右上*に変更されました。文字列型の新しい設定オプション `uc.flex.findbar-position` が追加されています：
  - `"top-center-left"` または `"0"` を指定すると、以前のデフォルトである上部中央左寄りに表示されます。
  - `"top-right"` または `"1"` を指定すると、現在のデフォルトである右上に表示されます。
  - `"bottom-right"` または `"2"` を指定すると、Firefox本来の下部右側に表示されます。
- `--uc-findbar-top` 変数は廃止されました。代わりに `--uc-findbar-x-position` と `--uc-findbar-y-position` により、任意の位置への調整が可能になりました。
- サイドバーの最小幅に関するハードコードを撤廃し、`--uc-sidebar-width` 変数によって最小幅を自由に設定できるようになりました。

**v3.1.1**

- Sideberyの折りたたみ・展開アニメーションのデフォルトを`ease-in-out`に変更し、Firefoxのネイティブ縦型タブと動作を統一しました（以前はSideberyが`linear`を使用していました）。アニメーションの種類は`uc-user-settings.css`内の`--uc-autohide-transition-type`変数でカスタマイズ可能です。
- Firefox標準の縦型タブのアニメーションも`--uc-autohide-transition-type`によって変更可能になりました。
- 新しいサイドバーを有効にしていてウィンドウが最大化されていない状態で、`uc.flex.fully-hide-sidebery`オプションを使うと、ウィンドウ端に余白が発生し、Sideberyの高さが正しく表示されない問題を修正しました。

今回のアップデートにより、旧バージョンの水平タブモードで利用可能だった全機能が縦型タブモードでも完全に利用可能となりました。FlexFox v3.1.1で、よりスムーズな移行が可能になります。

**v3.1.0**
- `uc-variables.css`の構成を見直し。ユーザーがよく使うカスタマイズ可能な変数をファイルの先頭にまとめ、分かりやすい説明を追加しました。
- FlexFoxによるツールバー背景色の上書き処理を全面的に再設計。テーマ適用時に発生していた背景画像のずれ、透明度の不具合、非アクティブウィンドウ時の表示崩れなどがすべて解消されたはずです。
- 垂直タブの折りたたみ／展開時のアニメーションがよりスムーズになりました。
- ナビゲーションバーの位置を微調整し、垂直タブとの整合性を改善しました。
- `uc.flex.allow-addons-to-change-toolbar-color`を切り替えても、サイドバーが上下にずれることがなくなりました。

**v3.0.7**
- Firefoxのネイティブタブ（横型・縦型の両方）を使用している場合に、アクティブなタブの背景ハイライトが正しく表示されない問題を修正しました。  
- メニューバーを表示し、ブックマークバーを自動的に隠す設定にしていると、テーマの背景画像がナビゲーションバーとブックマークバーの間でずれて表示される問題を修正しました。  
- Firefoxウィンドウが非アクティブ状態のときに、メニューバーの背景色が正しく切り替わらない問題を修正しました。

**3.0.6**
- インポートしている複数のスタイルを最新版に更新。  
  - 検索バーがフォーカスを失ったときの閉じるアニメーションを追加。  
  - パネルが開いている際にナビゲーションバーが非表示にならないよう挙動を改善。  
- 潜在的な不具合やデバッグの困難を避けるため、非標準の構文を修正しました。

**v3.0.5**  
- `uc.flex.allow-addons-to-change-toolbar-color` を有効にした際に発生する、サイドバーストライプの位置ずれを修正しました。

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
- `uc.flex.disable-bookmarks-autohide` を使用中に、新しいサイドバーのサイドバーストライプの位置がずれる問題を修正しました。  
- `uc.flex.disable-sidebery-autohide` を使用中に、サイドバーストライプの幅が不正になる問題を修正しました。

**v3.0.0**
- Firefoxのネイティブ縦型タブとSideberyを統合しました。  
  - Sideberyが有効な場合、ネイティブの縦型タブは自動的に非表示になり、新しいサイドバーはSidebery上部の細いカラーストライプ（サイドバーストライプ）に折りたたまれます。サイドバーストライプにマウスカーソルを合わせると、サイドバーのツールボタンが表示されます。  
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

<details>
<summary><h4>💻 PowerShellスクリプト《クリックで展開》👇</h4></summary>

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

<details>
<summary><h4>🔃 Git Pull《クリックで展開》👇</h4></summary>

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

### 📜 ユーザー定義スタイル（`uc-user-settings.css`）

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
| `uc.flex.findbar-position` | 検索バーの表示位置を設定します。（文字列, `"top-center-left"` または `"0"` = 上中央やや左, `"top-right"` または `"1"` = 右上, `"bottom-right"` または `"2"` = 右下） |

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
