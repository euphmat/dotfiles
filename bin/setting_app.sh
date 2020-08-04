#!/bin/bash
set -Cu

echo "=========================================================="
echo " iTerm2"
echo "=========================================================="
if [[ `type imgcat > /dev/null 2>&1; echo $?` = 0 ]]; then
        echo "Already Installed imgcat on iTerm2"
else
        echo "Installing imgcat on iTerm2..."
        curl https://iterm2.com/utilities/imgcat > /usr/local/bin/imgcat && chmod +x /usr/local/bin/imgcat;
fi

