#!/usr/bin/env bash
set -Ceuo pipefail

function main(){
                # Update Package List
                update_package brew
                update_package mas
                update_package pip3
                update_package yarn

                # Update Document List
                update_doc brew
                update_doc cask
                update_doc mas
                update_doc pip3
                update_doc yarn
}

function update_package(){
        case $1 in
                brew ) brew upgrade ;;
                mas ) mas upgrade ;;
                pip3 ) pip3 list -o | tail -n +3 | awk '{ print $1 }' | xargs pip3 install -U ;;
                yarn ) yarn global upgrade ;;
        esac
}

function update_doc(){
        case $1 in
                brew ) brew list >| ../doc/brew.txt ;;
                cask ) brew cask list >| ../doc/cask.txt ;;
                mas ) mas list | awk '{print $1}' >| ../doc/mas.txt ;;
                pip3 ) pip3 list | sed -e '1,2d' | awk '{print $1}' >| ../doc/pip3.txt ;;
                yarn ) yarn global list | grep @ | sed -e "s/info \"//" | sed -e "s/@.*//" >| ../doc/yarn.txt ;;
        esac
}

main
