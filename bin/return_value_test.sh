#!/bin/bash
set -Ceu

echo "======================================================"
echo " True Test"
echo "======================================================"
echo -n "pip3 : "
echo `pip3 show instaloader >/dev/null 2>&1; echo $?`

echo -n "npm  : "
echo `npm info ghwd >/dev/null 2>&1; echo $?`

echo -n "brew : "
echo `brew info exa >/dev/null 2>&1; echo $?`

echo -n "cask : "
echo `brew cask info Alfred >/dev/null 2>&1; echo $?`

echo -n "mas : "
echo `mas info 539883307 >/dev/null 2>&1; echo $?`

echo ""
echo "======================================================"
echo " False Test"
echo "======================================================"
echo -n "pip3 : "
echo `pip3 show insoader >/dev/null 2>&1 ; echo $?`

echo -n "npm  : "
echo `npm info gwd >/dev/null 2>&1; echo $?`

echo -n "brew : "
echo `brew info xa >/dev/null 2>&1; echo $?`

echo -n "cask : "
echo `brew cask info Alfed >/dev/null 2>&1; echo $?`

echo -n "mas : "
echo `mas  info 53954543534534 >/dev/null 2>&1; echo $?`