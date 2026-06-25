# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox（日本語版）

<div>
 <a href='https://www.mozilla.org'><img src="https://img.shields.io/badge/Last%20tested%20Firefox-v154-orange?logo=firefox"></a>
 <a href='https://github.com/yuuqilin/FlexFox/commits/main/'><img src="https://img.shields.io/github/last-commit/yuuqilin/FlexFox/main"></a>
 <a href='https://github.com/yuuqilin/FlexFox/commits/Beta/'><img src="https://img.shields.io/github/last-commit/yuuqilin/FlexFox/Beta?label=last%20Nightly%20commit&color=purple"></a>
 <a href='https://github.com/yuuqilin/FlexFox/stargazers'><img src='https://img.shields.io/github/stars/yuuqilin/FlexFox?style=social'></a>
</div>

<br>

[English](./README.md) | [日本語](./README_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md) | [简体中文](./README_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md) | [Wiki](https://github.com/yuuqilin/FlexFox/wiki)

FlexFox は、アクセシビリティを維持しながら画面の有効スペースを最大限に活用するための Firefox userChrome テーマです。ツールバーとサイドバーは不要な時に自動で折りたたまれ、展開時はページの上に重なって表示されるため、レイアウトの偏移を引き起こしません。Sidebery が有効な場合は、インターフェースの重複を避けて単一のタブシステムを維持するため、ネイティブタブが自動的に非表示になります。設定を通じて詳細なカスタマイズが可能であり、様々なブラウジングの習慣に適応する柔軟な基盤として機能します。

![FlexFox v6.5](https://github.com/yuuqilin/media-assets/raw/FlexFox/assets/FlexFox-v6.5.0.webp)  

> [!IMPORTANT]
>
> * **「カーソルを合わせた時にサイドバーを展開する」を有効にしていますか？** 無効にしてください。FlexFox を正しく動作させるには、このオプションをオフのままにする必要があります。（[ガイド](docs/USAGE_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md#️-firefox-サイドバーの設定)）
> * **v6 より前のバージョンからアップデートしますか？** Sidebery のスタイルエディターから古いスタイルをすべて削除してください。（[ガイド](docs/USAGE_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md#-v6-より前のバージョンからアップデートする)）
> * **推奨構成:** Firefox の垂直タブモードを使用し、可能であれば Sidebery を併用してください。最も多くの機能を利用でき、完成度の高い体験が得られます。

## 🎬 機能紹介動画

v6.5 の新機能紹介動画:

https://github.com/user-attachments/assets/64be5a0e-f97e-4257-aac8-63245791d07b

より高画質で視聴する場合:

[YouTube Link](https://www.youtube.com/watch?v=lhf1mpXDIOM)

## 🆕 最新情報

**🦊 最新バージョン: v6.5.5** — 詳細は[更新履歴](./docs/CHANGELOG_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md)をご覧ください。

<!-- END What's New -->

## ✨ 主な機能と特徴

* タブ、ツールバー、サイドバーの自動折りたたみ。
* Webページのレイアウトを押し出さず、オーバーレイとして展開。
* キーボードショートカットやツールバーボタンでタブやツールバーを素早く表示・非表示。
* Sidebery使用時はネイティブタブを自動的に非表示にし、表示領域を最大化。
* メニュー、パネル、アドレスバーのポップアップに半透明ぼかし効果を適用可能。
* Windows Micaおよびカスタムブラウザ壁紙に対応。
* 11種類のアクセントカラーを搭載し、ライトモード・ダークモードの両方に対応。あらゆるFirefoxテーマと組み合わせ可能。
* サイドバーボタン、ブックマークフォルダー、ブックマークスター、ウィンドウコントロールなどのアイコンをカスタマイズ可能。
* ツールバーボタンやウィンドウコントロールの自動非表示に対応し、アクセス性を維持しながらミニマルなUIを実現。
* Firefoxの設定項目から幅広い外観カスタマイズが可能：
  * UI要素の角丸・角形スタイル
  * メニュー項目の間隔
  * Webページ表示エリアの余白と境界線
  * フラットまたは立体的なアドレスバー
  * タブの枠線と背景色
  * アニメーションやトランジション効果
* ピン留めタブの配置レイアウトと表示エリアの高さをカスタマイズ可能。
* フローティング検索ボックス。
* カスタムスタイルによるテーマ設定の上書きに対応。
* その他の便利な機能：
  * ページ読み込み時の白いフラッシュを防止
  * 「すべてのタブを一覧表示」ボタンに現在のタブ数を表示
* ブラウジング体験を向上させる改善：
  * アクティブタブを強調表示し、関連タブ間の移動を容易化
  * スペース効率に優れたグリッド型ピン留めタブにより、多数のピン留めタブを管理しながら、サイドバー展開時のタブ位置の変化を防ぎ、マウス操作をスムーズ化
* パフォーマンスへの影響は最小限。

## ⚙️ オプション

FlexFox はデフォルトで Firefox 本来のインターフェースをできるだけ維持し、インストール直後は基本的なレイアウト機能と必要最小限のスタイルのみを適用します。

プレビュー画像で紹介されているレイアウトやインターフェースのカスタマイズを再現したり、特定のデザイン変更を調整・元に戻したりする場合は、以下の 2 つの独立したシステムを利用できます。

### 🧩 設定オプション (`about:config`)

FlexFox の機能、レイアウト切り替え、および外観の調整項目の大部分は、Firefox の設定システムに直接統合されています。これにより、コードを編集することなく、ブラウザーの動作をカスタマイズしたり、オプションの UI 機能を有効化したり、一部の変更を Firefox 本来の状態へ戻したりできます。

これらの設定へアクセスするには、アドレスバーに `about:config` と入力して Enter キーを押してください。インストール時に付属の `user.js` を読み込んでいる場合は、検索欄に `uc.flex` と入力すると FlexFox の設定項目が一覧表示されます。また、ドキュメントに記載された設定名を使用して手動で追加することもできます。

> [!TIP]
> 利用可能なオプション、設定可能な値、および各機能の詳細な説明については、以下のドキュメントを参照してください。
>
> **📄 [設定オプション一覧](docs/OPTIONS_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md)**

### 📜 ユーザー定義スタイル

組み込みの設定オプションでは対応できないカスタマイズ向けに、FlexFox はインターフェースおよびウェブページ用の専用ユーザーカスタマイズファイルを提供しています。

* **インターフェース（chrome）** のスタイルを変更する場合は、`components` フォルダー内に `uc-user-settings.css` を作成してください
* **ウェブページ（content）** のスタイルを変更する場合は、`content` フォルダー内に `uc-custom-content.css` を作成してください

これらのファイルに追加したスタイルや変数は、FlexFox のデフォルト設定より優先して適用されます。また、これらのファイルはプロジェクト本体には含まれていないため、アップデートによって上書きされることはありません。

既存の FlexFox ファイル（`uc-variables.css` など）からスタイルを再利用する場合は、元のコンテキストや依存関係を維持するため、セレクターまたはルール全体をコピーしてください。

## 📖 使い方ガイド

* [デモ動画と同じインターフェースを再現する方法](docs/USAGE_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md#-デモ動画のインターフェースを再現する)

* [キーボードショートカットやツールバーボタンでツールバーとサイドバーを非表示にする方法](docs/USAGE_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md#-レイアウトの切り替え)

* [Sidebery に Firefox テーマの背景を反映させる方法](docs/USAGE_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md#-firefox-テーマと-sidebery)

* [Sidebery とウェブコンテンツで Mica 背景やカスタム壁紙を表示する方法](docs/USAGE_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md#️-透過表示micaカスタム壁紙)

* [ウェブコンテンツの透過を有効にした後、文字を読みやすくする方法](docs/USAGE_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md#-透過表示時の視認性改善)

## 💿 インストールとアップデート

### 👷 手動インストール

1. [Sidebery](https://addons.mozilla.org/firefox/addon/sidebery/) をインストールします（任意ですが推奨）。

2. プロジェクトの **[Releases](https://github.com/yuuqilin/FlexFox/releases)** ページから最新の FlexFox をダウンロードします。

3. `about:support` を開き、「プロファイルフォルダー」の **「フォルダーを開く」** をクリックして Firefox のプロファイルフォルダーを開きます。

4. ダウンロードしたアーカイブのルートにある `chrome` フォルダーと `user.js` を、Firefox のプロファイルフォルダーへコピーします。

5. （任意）テキストエディターで `user.js` を開きます。

   このファイルには FlexFox の設定項目（`uc.flex.*`）と、任意で変更できる Firefox ネイティブ設定が含まれています。FlexFox の設定項目はそのままインポートされますが、Firefox ネイティブ設定はコメントアウトされた状態で用意されています。変更したい設定がある場合のみ、先頭の `//` を削除してください。また、以下の必須設定が変更されていないことを確認してください。

   ```text
   toolkit.legacyUserProfileCustomizations.stylesheets = true
   svg.context-properties.content.enabled = true
   sidebar.visibility = always-show
   ```

6. Firefox を再起動した後、`user.js` を削除します。

   この手順は省略しないでください。プロファイルフォルダー内に `user.js` が残っていると、起動のたびに設定がリセットされ、`about:config` で行った変更が反映されなくなります。

7. Sidebery を設定します。

   * **設定**（歯車アイコン）を開く
   * **スタイルエディター** 内の既存スタイルをすべて削除する
   * **ヘルプ → アドオンデータのインポート** を開く
   * アーカイブ内の `Sidebery` フォルダーにある `sidebery-settings.json` をインポートする

8. `about:config` を開き、`uc.flex` を検索して FlexFox の設定を調整します。

### 🚀 自動インストールとアップデート

FlexFox は PowerShell スクリプトまたは Git を利用して自動的にインストールおよび更新できます。

初回インストールの場合は、以下のいずれかの方法を実行した後、**手動インストール** の手順 5 から続けてください。

以降のアップデートでは、同じ方法を再実行するだけで更新できます。追加の手動作業は必要ありません。

#### 💻 PowerShell スクリプト

<details>
<summary><i>[クリックして展開]</i> 👇</summary>

PowerShell ウィンドウで以下のいずれかのコマンドを実行してください。

これらのコマンドは、次のコマンドラインオプションに対応しています。

* `-ProfilePath 'path'` / `--profile-path 'path'`
  * インストール先の Firefox プロファイルフォルダーを指定し、パス選択のプロンプトをスキップします。

* `-Silent` / `--silent`
  * 指定したプロファイルを使用してサイレントインストールを実行します。`-ProfilePath` を省略した場合は、最初に検出された Firefox プロファイルが使用されます。このオプションはすべてのプロンプトをスキップし、`user.js` はコピーしません。
  * タスクスケジューラや無人更新に適しています。

**オンラインインストール**

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass; & ([scriptblock]::Create(((New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/yuuqilin/FlexFox/refs/heads/main/scripts/install-flexfox.ps1')) -replace '^\uFEFF', ''))
```

**ローカルインストール**

[`install-flexfox.ps1`](https://raw.githubusercontent.com/yuuqilin/FlexFox/refs/heads/main/scripts/install-flexfox.ps1) をダウンロードし、以下を実行します。

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass; & 'C:\Path\To\install-flexfox.ps1'
```

**ローカルの定期サイレント更新**

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "C:\Path\To\install-flexfox.ps1" -ProfilePath "C:\Path\To\Firefox\Profile" -Silent
```

</details>

#### 🔃 Git Pull

<details>
<summary><i>[クリックして展開]</i> 👇</summary>

お使いの OS に応じて適切なスクリプトを選択してください。スクリプトは Firefox のプロファイルフォルダーを Git の作業ディレクトリとして初期化するか、既存の作業ディレクトリを更新します。また、FlexFox リポジトリを追跡し、他のプロジェクトファイルを無視して `chrome` フォルダーのみを更新します。

* Windows: [`git-pull-chrome-only.ps1`](https://raw.githubusercontent.com/yuuqilin/FlexFox/refs/heads/main/scripts/git-pull-chrome-only.ps1)
* macOS / Linux: [`git-pull-chrome-only.sh`](https://raw.githubusercontent.com/yuuqilin/FlexFox/refs/heads/main/scripts/git-pull-chrome-only.sh)

初回実行時は、Firefox のプロファイルフォルダーを選択または入力するプロンプトが表示されます。2 回目以降は、前回設定した作業ディレクトリが自動的に更新されます。複数の作業ディレクトリが検出された場合は、いずれか 1 つを選択するよう求められます。

スクリプトは次のコマンドラインオプションに対応しています。

* `-ProfilePath 'path'` / `--profile-path 'path'`
  * 対象となる Firefox プロファイルフォルダーを指定し、対話形式のプロンプトをスキップします。

* `-Silent` / `--silent`
  * 指定したプロファイルを使用してサイレント更新を実行します。`-ProfilePath` を省略した場合は、前回設定した作業ディレクトリが使用されます。管理対象の作業ディレクトリが見つからない場合、または複数の管理対象ディレクトリが検出された場合は、エラーメッセージを表示して更新せずに終了します。
  * タスクスケジューラや無人更新に適しています。対象を明確にするため、プロファイルパスのオプションとの併用をおすすめします。

`components/uc-user-settings.css` や `content/uc-custom-content.css` など、未追跡のカスタムファイルは更新時も保持されます。一方、追跡対象の FlexFox ファイルに未コミットの変更がある場合は、それらを変更せずに更新を中止します。

Git のマージ競合が発生した場合、対話モードでは更新を中止して元の状態に戻すか、競合状態を保持したまま手動で解決するかを選択できます。サイレントモードでは、自動的にマージを中止して元の状態へ復元した後、競合を通知して終了します。

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass; & 'C:\Path\To\git-pull-chrome-only.ps1' -ProfilePath 'C:\Path\To\Firefox\Profile' -Silent
```

```bash
bash "/path/to/git-pull-chrome-only.sh" --profile-path "/path/to/firefox/profile" --silent
```

代替案として、標準的な Git コマンドを使用して、手動で作業ディレクトリの初期化および設定を行うことも可能です。

**初回セットアップ**

```bash
git init
git remote add origin https://github.com/yuuqilin/FlexFox.git
git remote set-branches origin main
git config remote.origin.tagOpt --no-tags
git sparse-checkout init --no-cone
git sparse-checkout set /chrome
git fetch --no-tags origin
git checkout -b main origin/main
```

**手動アップデート**

```bash
git fetch --no-tags --prune origin
git checkout main
git sparse-checkout set /chrome
git merge --no-edit origin/main
git sparse-checkout reapply
```

</details>

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

FlexFox で使用している追加アイコン素材:

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

  <p>本プロジェクトには、以下のライセンスで提供される追加のアイコン素材が含まれています:</p>
  
  <ul>
    <li><strong>Custom Brand Icons</strong> — <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/">CC BY-NC-SA 4.0</a> に基づくライセンス </li>
    <li><strong>Newaita</strong> — <a href="https://creativecommons.org/licenses/by-nc-sa/3.0/">CC BY-NC-SA 3.0</a> に基づくライセンス</li>
    <li><strong>Yosemite Buttons</strong> — <a href="https://creativecommons.org/licenses/by/3.0/">CC BY 3.0</a> に基づくライセンス</li>
  </ul>
</details>
