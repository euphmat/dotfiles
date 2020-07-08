#!/bin/bash
set -Cu

brewtxt=~/Desktop/Matsumoto/Github/dotfiles/doc/brew.txt
# TODO waifu2xがインストールできない
while read line
        do
                echo "brew install $line"
        done < $brewtxt 
