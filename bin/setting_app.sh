#!/bin/bash
set -Cu

## iTerm2
echo "Installing imgcat on iTerm2..."
curl https://iterm2.com/utilities/imgcat > /usr/local/bin/imgcat && chmod +x /usr/local/bin/imgcat;
