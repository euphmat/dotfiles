#!/usr/bin/env bash
set -Ceuo pipefail

function main(){
        install brew
        install cask
        install mas
        install pip3
        install yarn
}

function install(){
        while read line
        do
                case $1 in
                        brew ) brew install $line ;;
                        cask ) brew cask install $line ;;
                        mas ) mas install $line ;;
                        pip3 ) pip3 install $line ;;
                        yarn ) yarn global add $line ;;
                esac
        done < ../doc/$1.txt
}

main
