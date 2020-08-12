#!/usr/bin/env bash
set -Ceuo pipefail

function main(){
  update_package
  update_document
}

function update_package(){
  brew upgrade 
  pip3 list -o | tail -n +3 | awk '{ print $1 }' | xargs pip3 install -U
  yarn global upgrade
  mas upgrade  
}

function update_document(){
  brew list >| ../doc/brew.txt
  brew cask list >| ../doc/cask.txt
  mas list | awk '{print $1}' >| ../doc/mas.txt
  pip3 list | sed -e '1,2d' | awk '{print $1}' >| ../doc/pip3.txt
  yarn global list | grep @ | sed -e "s/info \"//" | sed -e "s/@.*//" >| ../doc/yarn.txt
}

main
