#!/bin/bash
set -Cu

casktxt=../doc/cask.txt
# TODO waifu2xがインストールできない
while read line
do
        echo "brew cask install $line"
done < $casktxt 
