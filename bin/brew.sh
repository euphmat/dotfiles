#!/bin/bash
set -Cu

brewtxt=../doc/brew.txt
while read line
do
        if [[ $line == *waifu2x* ]]; then
                brew install imxieyi/waifu2x/$line
        elif [[ $line == *gphotos* ]]; then
                brew install gphotosuploader/tap/$line
        else
                brew install $line
        fi
done < $brewtxt 
