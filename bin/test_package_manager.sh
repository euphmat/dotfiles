#!/bin/bash
resut=0
echo -n "brew"
if [[ `type brew > /dev/null 2>&1; echo $?` = 0 ]]; then
        echo -e " : \033[0;32mSuccessful\033[0;39m"
else
        result=$((result + 1))
        echo -e " : \033[0;31mFailed\033[0;39m"
        if [[ `type ruby > /dev/null 2>&1; echo $?` = 0 ]]; then
                ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        fi
fi

echo -n "cask"
if [[ `type 'brew cask' > /dev/null 2>&1; echo $?` = 0 ]]; then
        echo -e " : \033[0;32mSuccessful\033[0;39m"
else
        result=$((result + 1))
        echo -e " : \033[0;31mFailed\033[0;39m"
fi

echo -n "mas "
if [[ `type mas > /dev/null 2>&1; echo $?` = 0 ]]; then
        echo -e " : \033[0;32mSuccessful\033[0;39m"
else
        result=$((result + 1))
        echo -e " : \033[0;31mFailed\033[0;39m"
fi

echo -n "pip "
if [[ `type pip > /dev/null 2>&1; echo $?` = 0 ]]; then
        echo -e " : \033[0;32mSuccessful\033[0;39m"
else
        result=$((result + 1))
        echo -e " : \033[0;31mFailed\033[0;39m"
fi

echo -n "npm "
if [[ `type npm > /dev/null 2>&1; echo $?` = 0 ]]; then
        echo -e " : \033[0;32mSuccessful\033[0;39m"
else
        result=$((result + 1))
        echo -e " : \033[0;31mFailed\033[0;39m"
fi
exit $result
