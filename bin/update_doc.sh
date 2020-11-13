#!/usr/bin/env bash
set -Ceuo pipefail

function main(){
        check_os
        if [[ $os == "MacOS" ]]; then
                # Update Package List
                update_package brew
                update_package cask
                update_package mas
                update_package pip3
                update_package yarn

                # Update Document List
                update_doc brew
                update_doc cask
                update_doc mas
                update_doc pip3
                update_doc yarn
        elif [[ $os == "Windows" ]]; then
                # Update Package List
                update_package scoop
                #update_package pip3 # エラーが起こるのでとりあえずコメントアウト
                update_package yarn

                # Update Document List
                update_doc scoop
                update_doc pip3
                update_doc yarn
        else
                echo "$os"
        fi
}

function update_package(){
        if [[ $1 == brew ]]; then
                brew upgrade
        fi
        if [[ $1 == mas ]]; then
                mas upgrade
        fi
        if [[ $1 == pip3 ]]; then
                pip3 list -o | tail -n +3 | awk '{ print $1 }' | xargs pip3 install -U
        fi
        if [[ $1 == yarn ]]; then
                yarn global upgrade
        fi
        if [[ $1 == scoop ]]; then
                scoop update;
        fi
}

function update_doc(){
        if [[ $1 == brew ]]; then
                brew list >| ../doc/brew.txt
        fi
        if [[ $1 == cask ]]; then
                brew cask list >| ../doc/cask.txt
        fi
        if [[ $1 == mas ]]; then
                mas list | awk '{print $1}' >| ../doc/mas.txt
        fi
        if [[ $1 == pip3 ]]; then
                pip3 list | sed -e '1,2d' | awk '{print $1}' >| ../doc/pip3.txt
        fi
        if [[ $1 == yarn ]]; then
                yarn global list | grep @ | sed -e "s/info \"//" | sed -e "s/@.*//" >| ../doc/yarn.txt
        fi
        if [[ $1 == scoop ]]; then
                scoop list | sed -e '1,2d' | sed -e '$d' | awk '{print $1}' >| ../doc/scoop.txt
        fi
}

function check_os(){
        if [[ "$OSTYPE" == "darwin" ]]; then
                os="MacOS"
        elif [[ "$OSTYPE" == "msys" ]]; then
                os="Windows"
        else
                os="Unknown"
        fi
}

main
