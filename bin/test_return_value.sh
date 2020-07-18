#!/bin/bash
set -Ceu

echo "======================================================"
echo " テスト：インストール済み && 存在するパッケージ"
echo " 期待される結果：0"
echo "======================================================"
echo -n "pip3 show : "; echo `pip3 show instaloader >/dev/null 2>&1; echo $?`
echo -n "npm  fund : "; echo `npm fund ghwd >/dev/null 2>&1; echo $?`
echo -n "brew list : "; echo `brew list exa >/dev/null 2>&1; echo $?`
echo -n "cask list : "; echo `brew cask list Alfred >/dev/null 2>&1; echo $?`
echo -n "mas  search : "; echo `grep "539883307" -rl ../doc/mas.txt >/dev/null 2>&1; echo $?`

echo "======================================================"
echo " テスト：未インストール && 存在するパッケージ"
echo " 期待される結果：1"
echo "======================================================"
echo -n "pip3 show : "; echo `pip3 show jupyterlab >/dev/null 2>&1; echo $?`
echo -n "npm  fund : "; echo `npm -g fund gulp >/dev/null 2>&1; echo $?`
echo -n "brew list : "; echo `brew list tokei >/dev/null 2>&1; echo $?`
echo -n "cask list : "; echo `brew cask list discord >/dev/null 2>&1; echo $?`
echo -n "mas  search : "; echo `grep "747824928" -rl ../doc/mas.txt >/dev/null 2>&1; echo $?`

echo "======================================================"
echo " テスト：存在しないパッケージ"
echo " 期待される結果：1"
echo "======================================================"
echo -n "pip3 show : "; echo `pip3 show jkjkjkjkjk >/dev/null 2>&1 ; echo $?`
echo -n "npm  fund : "; echo `npm fund fdsfsdfa >/dev/null 2>&1; echo $?`
echo -n "brew list : "; echo `brew list xfsdafea >/dev/null 2>&1; echo $?`
echo -n "cask list : "; echo `brew cask list Aweflfed >/dev/null 2>&1; echo $?`
echo -n "mas  search : "; echo `grep "842378487387487" -rl ../doc/mas.txt >/dev/null 2>&1; echo $?`
