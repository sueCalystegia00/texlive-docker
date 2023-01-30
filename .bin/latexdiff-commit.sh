#!/bin/sh

## 任意のコミットIDとの差分を取る($1:コミットID, $2:ファイル名)
latexdiff-vc -e utf8 -t CFONT --git --flatten --force --append-safecmd -r $1 ${2}.tex
## latexdiffで生成した差分ファイル内の文字色の定義を置換する
sed -i '' 's:{{\\protect\\color{blue} \\sf #1}}:{{\\protect\\color{red} #1}}:g' "${2}-diff${1}.tex"
sed -i '' 's:{{\\protect\\color{red} \\scriptsize #1}}:{{}}:g' "${2}-diff${1}.tex"