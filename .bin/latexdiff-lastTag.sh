#!/bin/sh

## 最新のgitタグとの差分を取る
LAST_TAG=$(git tag | sort -V | tail -n 2 | xargs -n 1)
latexdiff-vc -e utf8 -t CFONT -s COLOR --git --flatten --force --append-safecmd -r $LAST_TAG ${1}.tex
## latexdiffで生成した差分ファイル内の文字色の定義を置換する
sed -i '' 's:{{\\protect\\color{blue} \\sf #1}}:{{\\protect\\color{red} #1}}:g' "${1}-diff${LAST_TAG}.tex"
sed -i '' 's:{{\\protect\\color{red} \\scriptsize #1}}:{{}}:g' "${1}-diff${LAST_TAG}.tex"