#!/usr/bin/env bash
set -Ceuo pipefail

function main(){
        check_os
        if [[ $os == "MacOS" ]]; then
                install_homebrew
        else
                echo "Cannot run on $os"
        fi
}

function install_homebrew(){
        if type brew > /dev/null 2>&1; then
                echo "brew is Installed."
        else
                /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
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
