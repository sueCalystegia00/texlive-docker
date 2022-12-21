# texlive-docker

VS Code Remote Development の機能を用いて，LaTeX 環境を構築するサンプルコードです．

Docker イメージは，[ubuntu-texlive-ja-devcontainer](https://hub.docker.com/r/korosuke613/ubuntu-texlive-ja-devcontainer)を利用しています．

(**[Docker](https://www.docker.com/products/docker-desktop/)が必要です**)

## 🛠️ セットアップ

1. VS Code でこのプロジェクトを開く．

   直下に`.devcontainer`などが配置されていることを確認してください．

   特にWindowsの人は，入れ子(`texlive-docker/texlive-docker`など)になっていないか，

2. (初回のみ) 拡張機能[Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)を追加する．
   
4. VSCode 最左下の `><` アイコンを押して、`Reopen in Container`を実行する．
   
5. 待機 (初回は時間がかかる．15~20分ほどかかる場合も．)

   VS Code 左側にファイル群が表示され，それらが`WORKDIR`タブ直下に並んでいれば成功．

6. 任意のTeXファイルを`WORKDIR`に配置，選択して開く．

7. 拡張機能 LaTeX Workshop から適したコンパイルレシピを実行
   
   (TeXファイルを開いて保存しても自動でコンパイルが実行されます)

8. 上手くコンパイルできたら，`out`ディレクトリにPDFが生成されているはずです

   texファイルを開いた状態の右上にある虫眼鏡マークをクリックすると，生成したPDFを開くこともできます．

## おすすめの執筆手順

0. 初めてコンテナを立ち上げたときは，拡張機能タブのGit Graphから，`Initialize Repository`をクリックし，Git管理を有効化する．

   メッセージ欄に "init" などを入力し，コミット．

   GitHub などに残す場合は，そのまま Publish Branch をクリック．使わない場合は放置．

1. `WORKDIR` 上に，TeX・スタイルファイル等が入ったディレクトリを配置する

2. 任意のtexファイルを開いて編集．保存する．

   保存時にはpLaTeXのコンパイルが自動で走る．

3. texファイルを開いた状態で右上に表示される虫眼鏡のアイコンをクリックすると，コンパイルされたPDFファイルがプレビューされる．

4. コンパイルされたPDFファイルを指導教員に提出．校正してもらう．

   この段階で，Git Graphから任意のメッセージを残してコミット．

5. 再提出が必要になった場合は，指摘箇所を修正して保存．

   拡張機能タブ > LaTeX Workshop > Build LaTeX project > Recipe: mmkDiffHEAD-pt2p-pt2p を選択．

   直前のコミット時との差分ファイル(XXX-diffHEAD.tex)が生成される．

   > `.bin/latexdiff-vc.sh` に差分ファイルを生成するためのスクリプトが入っている． \
   > 引数として，コミットIDとファイル名を指定すると，そのコミット時のファイルとの差分ファイルを生成するため，HEAD以外と比較したいときに利用されたい． 

6. XXX-diffHEAD.tex を若干編集．

   ``` tex
   # ↓この2行を
   \providecommand{\DIFadd}[1]{{\protect\color{blue} \sf #1}} %DIF PREAMBLE
   \providecommand{\DIFdel}[1]{{\protect\color{red} \scriptsize #1}} %DIF PREAMBLE
   # ↓こうする
   \providecommand{\DIFadd}[1]{{\protect\color{red} #1}} %DIF PREAMBLE
   \providecommand{\DIFdel}[1]{{}} %DIF PREAMBLE
   ```
   
   編集後，保存すると，編集箇所が赤字になったPDFがコンパイルされるため，これを再度指導教員に提出する．

   4に戻る．


## 🏁 作業を終える時

終了するときは，VSCodeの `><` アイコンから「接続を終了」する


## ？ コンパイルが上手く行かない場合

- 拡張機能のLatex Workshopから，異なるビルドレシピを選択する．

  レシピは`.vscode/settings.json`を編集することで追加・修正することもできる．

  レシピが追加されるとLaTeX Workshopの Build LaTeX project の項目に追加されるため，そこから選択するとビルドが走る．