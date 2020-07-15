#!/bin/bash
set -Cu

echo "Installing Cask Formulas..."

casktxt=../doc/cask.txt

while read line
do
        brew cask install $line
done < $casktxt 

## iTerm2
echo "Installing imgcat on iTerm2..."
curl https://iterm2.com/utilities/imgcat > /usr/local/bin/imgcat && chmod +x /usr/local/bin/imgcat;

echo "Finished"
