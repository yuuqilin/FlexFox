# <img src="https://static.cdnlogo.com/logos/f/26/firefox-preview.svg" width="32" height="32" style="vertical-align: middle;"> FlexFox 更新履歴

[English](./CHANGELOG.md) | [日本語](./CHANGELOG_%E6%97%A5%E6%9C%AC%E8%AA%9E%E7%89%88.md) | [简体中文](./CHANGELOG_%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87.md)

## 🆕 最新情報

**🦊 v6.5.3**

* アドレスバーのボタンサイズと間隔を調整し、より整った配置になるよう改善しました。
* Nightly v153 の変更により、アドレスバーのボタン位置がずれる問題を修正しました。([Bug 2039721](https://bugzilla.mozilla.org/show_bug.cgi?id=2039721))
* Nightly v153 の変更により、ネイティブ垂直タブ使用時に FlexFox のスタイルが完全に機能しなくなる問題を修正しました。([Bug 1904860](https://bugzilla.mozilla.org/show_bug.cgi?id=1904860))
* 水平タブモードで「Sidebar Stripe」を展開した際に背景が消失して透明になる、v6.0.7 で発生したデグレードを修正しました。
* 水平タブモードで `uc.flex.style-sidebar-button = 3` を使用した際、アイコンがグレースケール表示になる、v6.5.0 で発生したデグレードを修正しました。
* Sidebery でツリーガイドラインが重複して表示される問題、およびガイドラインが途切れる問題を修正しました。
* Sidebery の「スタイルエディター」内に古いスタイルが残っている場合、`uc.flex.sidebery-disable-icon-scaling` オプションが正常に動作しなくなる問題を修正しました。
FlexFox v6 は引き続き旧バージョンのスタイルとの互換性を維持していますが、将来的な競合を防ぎ、重複したスタイル処理を減らしてパフォーマンスを向上させるため、旧スタイルの削除を強く推奨します。
Sidebery のナビゲーションバー → 設定（歯車アイコン）→ スタイルエディター に進み、「サイドバー」および「グループページ」のタブ内に残っている旧スタイルをすべて削除してください。
v6 における互換性変更の詳細については、v6.0.0 のリリースノートをご参照ください。
https://github.com/yuuqilin/FlexFox/releases/tag/v6.0.0

<!-- END What's New -->

<a id="updates-top-start"></a>
<details>

<summary>💬 <b>過去の更新</b></summary>

以前のバージョンの更新履歴については  
👉 [Wiki のアーカイブページ](https://github.com/yuuqilin/FlexFox/wiki/Earlier-Update-History-(Japanese))をご覧ください。

<a href="#updates-top-start">⏫ アップデート一覧の先頭へ戻る</a>
</details>
