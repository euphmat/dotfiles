#!/usr/bin/env bash
set -Ceuo pipefail

function main(){
        sudo pmset -a standbydelay 86400
        sudo nvram SystemAudioVolume=" "
        defaults write com.apple.dock persistent-apps -array
        defaults write com.apple.finder AppleShowAllFiles TRUE
}

main
