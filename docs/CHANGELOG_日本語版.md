# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox 更新履歴

[English](./CHANGELOG.md) | [日本語](./CHANGELOG_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md) | [简体中文](./CHANGELOG_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md)

## 🆕 最新情報

## **🦊 v6.5.5**

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

<!-- END What's New -->

<a id="updates-top-start"></a>
<details>

<summary>💬 <b>過去の更新</b></summary>

<!-- END Release Note -->

**v6.5.4**

* URLバーのテキスト中央揃えを有効にしている場合に、URLバーのズーム表示ボタン周辺の間隔が詰まりすぎる問題を修正しました。
* 現在のセットアップ手順との混同を避けるため、プロジェクト内に残っていた古いSidebery用スタイルファイルを削除しました。
* READMEの内容を整理し、設定オプションを探しやすくし、実用的な使用ガイドを追加する形でドキュメントを見直しました。

以前のバージョンの更新履歴については  
👉 [Wiki のアーカイブページ](https://github.com/yuuqilin/FlexFox/wiki/Earlier-Update-History-(Japanese))をご覧ください。

<a href="#updates-top-start">⏫ アップデート一覧の先頭へ戻る</a>
</details>
