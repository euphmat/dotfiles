#!/bin/bash
set -Cu

echo "=============================================================================="
echo " brew"
echo "=============================================================================="
if [[ `type brew > /dev/null 2>&1; echo $?` = 0 ]]; then
        data_source=../doc/brew.txt
        while read line
        do
                line_package_name=`echo $line`

                if [[ `brew info $line_package_name >/dev/null 2>&1; echo $?` = 0 ]]; then
                        echo "✅ Already Installed $line_package_name"
                else
                        #todo:tap package
                        echo "⤵ installing $line_package_name"
                        brew install $line_package_name
                fi
        done < $data_source 
else
        echo "installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi


echo "=============================================================================="
echo " brew cask"
echo "=============================================================================="
if [[ `type brew cask > /dev/null 2>&1; echo $?` = 0 ]]; then
        data_source=../doc/cask.txt
        while read line
        do
                line_package_name=`echo $line`

                if [[ `brew cask info $line_package_name >/dev/null 2>&1; echo $?` = 0 ]]; then
                        echo "✅ Already Installed $line_package_name"
                else
                        echo "⤵ installing $line_package_name"
                        brew cask install $line_package_name
                fi
        done < $data_source 
else
        echo "installing Homebrew cask..."
        brew install cask
fi

echo "=============================================================================="
echo " mas-cli"
echo "=============================================================================="
if [[ `type mas > /dev/null 2>&1; echo $?` = 0 ]]; then
        data_source=../doc//mas.txt

        while read line
        do
                line_package_name=`echo $line | awk '{print $1} '`
                line_package_appname=`echo $line | awk '{print $2} '`
                if [[ `grep $line_package_name -rl ../doc/mas.txt >/dev/null 2>&1; echo $?` = 0 ]] && [[ `mas search $line_package_name >/dev/null 2>&1; echo $?` = 0 ]]; then
                        echo "✅ Already Installed $line_package_appname"
                else
                        echo "⤵ installing $line_package_appname"
                        mas install $line_package_name
                fi
        done < $data_source
else
        echo "installing mas-cli..."
        brew install mas
fi

echo "=============================================================================="
echo " pip3"
echo "=============================================================================="
if [[ `type pip3 > /dev/null 2>&1; echo $?` = 0 ]]; then
        data_source=../doc//pip3.txt
        while read line
        do
                line_package_name=`echo $line | awk '{print $1} '`

                if [[ $line_package_name != *Package* ]] && [[ $line_package_name != *-----------* ]]; then
                        if [[ `pip3 show $line_package_name >/dev/null 2>&1; echo $?` = 0 ]]; then
                                echo "✅ Already Installed $line_package_name"
                        else
                                echo "⤵ Installing $line_package_name"
                                pip3 install $line_package_name
                        fi 
                fi
        done < $data_source
else
        echo "installing python..."
        brew install python@3.8
fi

echo "=============================================================================="
echo " npm"
echo "=============================================================================="
if [[ `type npm > /dev/null 2>&1; echo $?` = 0 ]]; then
        data_source=../doc//npm.txt
        while read line
        do
                line_package_name=`echo $line | awk '{sub("@.*$", ""); print $2} '`

                if [[ $line_package_name != */usr/local/lib* ]] && [[ $line_package_name != "" ]]; then
                        if [[ `grep $line_package_name -rl ../doc/npm.txt >/dev/null 2>&1; echo $?` = 0 ]] && [[ `npm info $line_package_name >/dev/null 2>&1; echo $?` = 0 ]]; then
                                echo "✅ Already Installed $line_package_name"
                        else
                                echo "⤵ installing $line_package_name"
                                npm install $line_package_name
                        fi
                fi
        done < $data_source
else
        echo "installing npm..."
        brew install nodejs
fi

