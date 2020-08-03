#!/bin/bash
set -eu

# =====================================================================
# Update Package
# =====================================================================
brew upgrade
pip3 list -o | tail -n +3 | awk '{ print $1 }' | xargs pip3 install -U
npm install -g npm
ncu -gu && npm update
mas upgrade

# =====================================================================
# Update Document
# =====================================================================
mas list > ../doc/mas.txt
brew list > ../doc/brew.txt
brew cask list > ../doc/cask.txt
npm ls --depth=0 -g > ../doc/npm.txt
pip3 list > ../doc/pip3.txt
