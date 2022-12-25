## latexdiffで生成した差分ファイル内の文字色の定義を置換する
sed -i '' 's:{{\\protect\\color{blue} \\sf #1}}:{{\\protect\\color{red} #1}}:g' $1
sed -i '' 's:{{\\protect\\color{red} \\scriptsize #1}}:{{}}:g' $1