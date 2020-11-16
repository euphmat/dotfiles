#!/usr/bin/env bash
set -Ceuo pipefail

function main(){
        setup_fish
}

function setup_fish(){
        sudo -s
        echo /usr/local/bin/fish >> /etc/shells
        exit
        chsh -s /usr/local/bin/fish
}

main
