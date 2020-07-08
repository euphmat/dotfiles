#!/bin/bash
set -Cu

brewtxt=../doc/brew.txt
# TODO waifu2xがインストールできない
while read line
        do
                echo "brew install $line"
        done < $brewtxt 
