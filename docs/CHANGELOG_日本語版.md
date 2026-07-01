# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox 更新履歴

[English](./CHANGELOG.md) | [日本語](./CHANGELOG_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md) | [简体中文](./CHANGELOG_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md)

## 🆕 最新情報

## **🦊 v6.5.6**

### 更新

* Sidebery の動作と表示の一貫性を改善しました。

  * Sidebery の展開・折りたたみアニメーションをより滑らかにし、レイアウト処理の負荷を軽減しました。
  * 検索ボックスの展開・折りたたみ時に発生していた反動のような動きを修正し、幅を下のタブ一覧と揃えました。
  * 分割ビュー使用時の角丸処理を改善しました。Sidebery に隣接するウェブコンテンツのみ隣接側の角を直角にし、もう一方の分割ビューは四隅の角丸を維持するようになりました。
  * `uc.flex.sidebery-allow-resizable-width` を有効にした折りたたみ状態で、閉じるボタンとツリー分岐の展開ボタンの位置を調整し、タブアイコン付近での誤クリックを減らしました。
  * `uc.flex.sidebery-allow-resizable-width` を有効にした折りたたみ状態で、ナビゲーションバーのタブパネルを正しく展開できない問題を修正しました。
  * 角丸ウェブコンテンツの余白を有効にしている場合に、Sidebery のパネル設定ダイアログで上側と側面の余白が消えていた問題を修正しました。

* `uc.flex.enable-rounded-web-content` の動作を改善し、サイドバーパネルの下側余白をウェブコンテンツ領域と揃えるようにしました。これにより、両方の高さが視覚的に揃います。

### 変更

* ネイティブ垂直タブが折りたたまれている間は、リサイズ用の分割線を表示しないようにしました。分割線はサイドバー展開時のみ表示され、折りたたみ時の見た目がよりすっきりします。

### 修正

* v6.5.0 で発生した回帰を修正しました。`uc.flex.sidebery-allow-resizable-width` と `Lock Sidebery` を同時に有効にすると、ピン留めタブが自動的に折り返されない問題がありました。

* v6.5.3 で発生した回帰を修正しました。Sidebery の新しいタブボタンの左右に影がはみ出して表示される問題がありました。

* Firefox Beta v153 の変更により、PDF ツールバーの自動非表示が機能しなくなっていた問題を修正しました。 [Bug 2045670](https://bugzilla.mozilla.org/show_bug.cgi?id=2045670)

* Firefox Beta v153 の変更により、`view-opentabs.svg` アイコンが変形していた問題を修正しました。 [Bug 2032258](https://bugzilla.mozilla.org/show_bug.cgi?id=2032258)

* Firefox Nightly v154 の変更により、Sidebery の展開時にタブが上下に揺れる問題を修正しました。 [Bug 2048146](https://bugzilla.mozilla.org/show_bug.cgi?id=2048146)

* Firefox Nightly v154 で追加された App メニューの「PDF を編集...」項目にアイコンを追加しました。 [Bug 2047915](https://bugzilla.mozilla.org/show_bug.cgi?id=2047915)

<!-- END What's New -->

<a id="updates-top-start"></a>
<details>

<summary>💬 <b>過去の更新</b></summary>

<!-- END Release Note -->

## **v6.5.5**

![プレビュー: about:config の設定項目説明](https://raw.githubusercontent.com/yuuqilin/media-assets/refs/heads/FlexFox/assets/about-config-preference-descriptions.webp)

### 新機能

- `about:config` ページの使いやすさを改善しました。
  - FlexFox のバージョン表示を中央に配置し、バージョン番号を確認しやすくしました。
  - FlexFox 設定項目一覧の右側に、対応する短い説明を表示するようにしました。
  - 設定項目の説明は完全な `uc.flex` 一覧に合わせて配置されます。対応を保つには、`user.js` をインポートするか、すべての FlexFox 設定項目を手動で追加してください。

- PowerShell インストーラーを刷新しました。
  - インストーラーは `scripts/install-flexfox.ps1` に変更されました。
  - インストール済みの FlexFox バージョンを検出し、必要な場合のみ最新リリースをダウンロードします。
  - ダウンロードしたパッケージの SHA-256 検証を追加しました。
  - Firefox プロファイル一覧から選択するか、任意のプロファイルパスを入力できるメニューを追加しました。
  - 非対話式インストール用のコマンドラインオプションを追加しました。`-ProfilePath 'path'` でプロファイルパスを指定し、`-Silent` で確認なしのインストールを実行できます。
  - 詳細は [PowerShell Script](https://github.com/yuuqilin/FlexFox#-powershell-script) をご覧ください。

- Git Pull 自動化スクリプトを更新しました。
  - Firefox プロファイル一覧から選択するか、任意の作業ディレクトリを入力できるメニューを追加しました。
  - 非対話式更新用のコマンドラインオプションを追加しました。`-ProfilePath 'path'` で作業ディレクトリを指定し、`-Silent` で確認なしの更新を実行できます。
  - ユーザーが変更したファイルの保持と、Git 競合発生時の処理を改善しました。
  - 詳細は [Git Pull](https://github.com/yuuqilin/FlexFox#-git-pull) をご覧ください。

### 互換性のない変更

- `uc.flex.show-flexfox-version-info-in-about-config` の設定タイプを真偽値から整数値へ変更しました。
  - `0`: FlexFox のバージョン情報を表示しません。
  - `1`: バージョン情報のみ表示します。
  - `2`: バージョン情報と設定項目の説明を表示します。これがデフォルトです。
  - 既存の設定を削除してから、同じ名前で新しい設定を作成し、種類に「整数値」を選択してください。

### 更新

- インストール手順を簡略化するため、`user.js` を `scripts` フォルダーからルートフォルダーへ移動しました。

### 削除

- ルートフォルダーの `deploy-userchrome.ps1` を削除しました。

**v6.5.4**

* URLバーのテキスト中央揃えを有効にしている場合に、URLバーのズーム表示ボタン周辺の間隔が詰まりすぎる問題を修正しました。
* 現在のセットアップ手順との混同を避けるため、プロジェクト内に残っていた古いSidebery用スタイルファイルを削除しました。
* READMEの内容を整理し、設定オプションを探しやすくし、実用的な使用ガイドを追加する形でドキュメントを見直しました。

以前のバージョンの更新履歴については  
👉 [Wiki のアーカイブページ](https://github.com/yuuqilin/FlexFox/wiki/Earlier-Update-History-(Japanese))をご覧ください。

<a href="#updates-top-start">⏫ アップデート一覧の先頭へ戻る</a>
</details>
