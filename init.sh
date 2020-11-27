#!/usr/bin/env bash

function main(){
        move_src_directory

        ./bin/01.setup_git.sh
        ./bin/02.setup_homebrew.sh 
        ./bin/03.install_package.sh
        ./bin/04.setup_fish.sh

        rm -rf ~.config/
        ./bin/deploy.sh
}

function move_src_directory() {
        cd "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
}
main
