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
        data=../doc/$1.txt
        while read line
        do
                if [[ $1 == brew ]]; then
                        brew install $line
                fi
                if [[ $1 == cask ]]; then
                        brew cask install $line 
                fi
                if [[ $1 == mas ]]; then
                        mas install $line
                fi
                if [[ $1 == pip3 ]]; then
                        pip3 install $line
                fi
                if [[ $1 == yarn ]]; then
                       yarn global add $line 
                fi
        done < $data
}


main
