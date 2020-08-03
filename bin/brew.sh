#!/bin/bash
set -Cu

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
