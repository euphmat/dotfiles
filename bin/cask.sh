#!/bin/bash
set -Cu

data_source=../doc/brew.txt

while read line
do
        line_package_name=`echo $line`

        if [[ `brew cask info $line_package_name 2>/dev/null; echo $?` != 1 ]]; then
                echo "✅ Already Installed $line_package_name"
        else
                echo "⤵ installing $line_package_name"
                brew cask install $line_package_name
        fi
done < $data_source 

## iTerm2
echo "Installing imgcat on iTerm2..."
curl https://iterm2.com/utilities/imgcat > /usr/local/bin/imgcat && chmod +x /usr/local/bin/imgcat;