#!/usr/bin/env bash
set -Ceuo pipefail

function main(){
        check_os
        move_src_directory

        case $OS in
                Mac ) 
                        ./bin/01.setup_git.sh
                        ./bin/02.setup_homebrew.sh 
                        ./bin/03.install_package.sh
                        ./bin/04.setup_fish.sh
                        ./bin/deploy.sh
                        ;;
                Windows ) echo "$OS is not Supported." ;;
                Linux ) echo "$OS is not Supported." ;;
                Unknown ) echo "$OS is not Supported." ;;
        esac
}

function check_os() {
        if [[ "$(expr substr $(uname -s) 1 6)" == "Darwin" ]]; then
                OS=Mac
        elif [[ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]]; then
                OS=Windows
        elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
                OS=Linux
        else
                OS=Unknown
        fi
}

function move_src_directory() {
        cd "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
}
main
