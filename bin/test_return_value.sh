#!/bin/bash
set -Ceu

echo "======================================================"
echo " テスト：インストール済み && 存在するパッケージ"
echo " 期待される結果：0"
echo "======================================================"
echo -n "brew : "; echo `brew list exa >/dev/null 2>&1; echo $?`
echo -n "cask : "; echo `brew cask list Alfred >/dev/null 2>&1; echo $?`
if [[ `grep 539883307 -rl ../doc/mas.txt >/dev/null 2>&1; echo $?` = 0 ]] && [[ `mas search 539883307 >/dev/null 2>&1; echo $?` = 0 ]]; then
    echo "mas  : 0"
else
    echo "mas  : 1"
fi
echo -n "pip3 : "; echo `pip3 show pip >/dev/null 2>&1; echo $?`
if [[ `grep npm -rl ../doc/npm.txt >/dev/null 2>&1; echo $?` = 0 ]] && [[ `npm info npm >/dev/null 2>&1; echo $?` = 0 ]]; then
    echo "npm  : 0"
else
    echo "npm  : 1"
fi

echo "======================================================"
echo " テスト：未インストール && 存在するパッケージ"
echo " 期待される結果：1"
echo "======================================================"
echo -n "brew : "; echo `brew list shared-mime-info >/dev/null 2>&1; echo $?`
echo -n "cask : "; echo `brew cask list mediainfo >/dev/null 2>&1; echo $?`
if [[ `grep "747824928" -rl ../doc/mas.txt >/dev/null 2>&1; echo $?` = 0 ]] && [[ `mas search "747824928" >/dev/null 2>&1; echo $?` = 0 ]]; then
    echo "mas  : 0"
else
    echo "mas  : 1"
fi
echo -n "pip3 : "; echo `pip3 show subscription-parser >/dev/null 2>&1; echo $?`
if [[ `grep gulp -rl ../doc/npm.txt >/dev/null 2>&1; echo $?` = 0 ]] && [[ `npm info gulp >/dev/null 2>&1; echo $?` = 0 ]]; then
    echo "npm  : 0"
else
    echo "npm  : 1"
fi

echo "======================================================"
echo " テスト：存在しないパッケージ"
echo " 期待される結果：1"
echo "======================================================"
echo -n "brew : "; echo `brew list xfsdafea >/dev/null 2>&1; echo $?`
echo -n "cask : "; echo `brew cask list Aweflfed >/dev/null 2>&1; echo $?`
if [[ `grep "842378487387487" -rl ../doc/mas.txt >/dev/null 2>&1; echo $?` = 0 ]] && [[ `mas search "842378487387487" >/dev/null 2>&1; echo $?` = 0 ]]; then
    echo "mas  : 0"
else
    echo "mas  : 1"
fi
echo -n "pip3 : "; echo `pip3 show jkjkjkjkjk >/dev/null 2>&1 ; echo $?`
if [[ `grep fsdfsdfdf -rl ../doc/npm.txt >/dev/null 2>&1; echo $?` = 0 ]] && [[ `npm info fsdfsdfdf >/dev/null 2>&1; echo $?` = 0 ]]; then
    echo "npm  : 0"
else
    echo "npm  : 1"
fi
