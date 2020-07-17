#!/bin/bash
set -Ceu

echo "======================================================"
echo " テスト：インストール済み && 存在するパッケージ"
echo " 期待される結果：0"
echo "======================================================"
echo -n "pip3 show : "
echo `pip3 show instaloader >/dev/null 2>&1; echo $?`

echo -n "npm  info : "
echo `npm ls ghwd >/dev/null 2>&1; echo $?`

echo -n "brew info : "
echo `brew info exa >/dev/null 2>&1; echo $?`

echo -n "cask info : "
echo `brew cask info Alfred >/dev/null 2>&1; echo $?`

echo -n "mas  info : "
echo `mas info 539883307 >/dev/null 2>&1; echo $?`

echo "======================================================"
echo " テスト：未インストール && 存在するパッケージ"
echo " 期待される結果：1"
echo "======================================================"
echo -n "pip3 show : "
echo `pip3 show jupyterlab >/dev/null 2>&1; echo $?`

echo -n "npm  info : "
echo `npm ls gulp >/dev/null 2>&1; echo $?`

echo -n "brew info : "
echo `brew info tokei >/dev/null 2>&1; echo $?`

echo -n "cask info : "
echo `brew cask info discord >/dev/null 2>&1; echo $?`

echo -n "mas  info : "
echo `mas info 539883307 >/dev/null 2>&1; echo $?`

echo "======================================================"
echo " テスト：存在しないパッケージ"
echo " 期待される結果：1"
echo "======================================================"
echo -n "pip3 show : "
echo `pip3 show jkjkjkjkjk >/dev/null 2>&1 ; echo $?`

echo -n "npm  ls   : "
echo `npm ls fdsfsdfa >/dev/null 2>&1; echo $?`

echo -n "brew info : "
echo `brew info xfsdafea >/dev/null 2>&1; echo $?`

echo -n "cask info : "
echo `brew cask info Aweflfed >/dev/null 2>&1; echo $?`

echo -n "mas info  : "
echo `mas  info 53954543534534 >/dev/null 2>&1; echo $?`
