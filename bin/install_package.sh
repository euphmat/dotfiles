#!/usr/bin/env bash
set -Ceuo pipefail

function main(){
        check_os
        if [[ $os == "MacOS" ]]; then
                install brew
                install cask
                install mas
                install pip3
                install yarn
        elif [[ $os == "Windows" ]]; then
                install scoop
                install pip3
                install yarn
        else
                echo "$os"
        fi
}

function install(){
        data=../doc/$1.txt
        while read line
        do
                if [[ $1 == brew ]]; then brew install $line; fi
                if [[ $1 == cask ]]; then brew cask install $line; fi
                if [[ $1 == mas ]];  then mas install $line; fi
                if [[ $1 == pip3 ]]; then pip3 install $line; fi
                if [[ $1 == yarn ]]; then yarn global add $line; fi
                if [[ $1 == scoop ]]; then scoop install $line; fi
        done < $data
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
