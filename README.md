# texlive-docker

VS Code Remote Development の機能を用いて，LaTeX 環境を構築するサンプルコードです．

Docker イメージは，[ubuntu-texlive-ja-devcontainer](https://hub.docker.com/r/korosuke613/ubuntu-texlive-ja-devcontainer)を利用しています．

(**[Docker](https://www.docker.com/products/docker-desktop/)が必要です**)

## 🛠️ セットアップ

1. VS Code でこのプロジェクトを開く．

1. (初回のみ) 拡張機能[Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)を追加する．
   
1. VSCode 最左下の `><` アイコンを押して，`Reopen in Container`を実行する．
   
1. 待機 (初回は時間がかかる．15~20分ほどかかる場合も．)

   VS Code 左側にファイル群が表示され，それらが`WORKDIR`タブ直下に並んでいれば成功．

1. 任意のTeXファイルを`WORKDIR`直下に配置，選択して開く．

1. 拡張機能 LaTeX Workshop から適したコンパイルレシピを実行
   
   (TeXファイルを開いて保存しても自動でコンパイルが実行されます)

1. 上手くコンパイルできたら，`out`ディレクトリにPDFが生成されているはずです

   texファイルを開いた状態の右上にあるプレビューアイコン🔍をクリックすると，生成したPDFを開くこともできます．

## おすすめの執筆手順

0. Git管理の初期化

   ``` sh
   git init
   git add .
   git commit -m "initial commit"
   ```

1. `WORKDIR` 上に，TeX・スタイルファイル等が入ったディレクトリを配置する

1. 任意のtexファイルを開いて編集．保存する．適宜コミット．

1. コンパイルされたPDFファイルを指導教員に提出．校正してもらう．

   提出した段階でタグ付け．

   ``` sh
   git tag -a v1.0 -m "first submission"
   ```

1. 再提出が必要になった場合は，指摘箇所を修正して保存．

   拡張機能タブ > LaTeX Workshop > Build LaTeX project > Recipe: mkDiffTAG を選択．

   最新のv◯タグとの差分ファイル(XXX-diffv◯.tex)が生成される．

1. 差分ファイルをコンパイルすると，編集箇所が赤字になったPDFがコンパイルされるため，これを再度指導教員に提出する．

   4に戻る．

> .binにlatexdiff-vc関連のスクリプトが入っています．
>
> 任意のコミットとの差分を取ることや，タグの形式を変更することもできますので，適宜変更してください．


## 🏁 作業を終える時

終了するときは，VSCodeの `><` アイコンから「接続を終了」する


## ？ コンパイルが上手く行かない場合

- 拡張機能のLatex Workshopから，異なるビルドレシピを選択する．

  レシピは`.vscode/settings.json`を編集することで追加・修正することもできる．

  レシピが追加されるとLaTeX Workshopの Build LaTeX project の項目に追加されるため，そこから選択するとビルドが走る．