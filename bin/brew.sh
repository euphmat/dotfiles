#!/bin/bash
set -Cu

brewtxt=../doc/brew.txt
# TODO waifu2xがインストールできない
while read line
do
        if [[ $line == *waifu2x* ]]; then
                echo "brew install imxieyi/waifu2x/$line"
        elif [[ $line == *gphotos* ]]; then
                echo "brew install gphotosuploader/tap/$line"
        else
                echo "brew install $line"
        fi
done < $brewtxt 
