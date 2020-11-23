#!/usr/bin/env bash
set -Ceuo pipefail

function main(){
        install_homebrew
}

function install_homebrew(){
        if type brew > /dev/null 2>&1; then
                echo "brew is Installed."
        else
                /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
        fi
}

main
