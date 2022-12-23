## 最新のgitタグとの差分を取る
LAST_TAG=$(git tag | sort -V | tail -n 2 | xargs -n 1)
latexdiff-vc -e utf8 -t CFONT --git --flatten --force --append-safecmd -r $LAST_TAG $1