#!/bin/bash
set -Ceu

echo "==========================================================="
echo "  npm.sh"
echo "==========================================================="
data_source=../doc/npm.txt
while read line
do
        line_package_name=`echo $line | awk '{sub("@.*$", ""); print $2} '`

        if [[ $line_package_name != */usr/local/lib* ]] && [[ $line_package_name != "" ]]; then
                if [[ `npm show $line_package_name >/dev/null 2>&1; echo $?` = 0 ]]; then
                        echo "$line_package_name : ✅"
                else
                        echo "$line_package_name : ✖"
                fi
        fi
done < $data_source

echo "==========================================================="
echo "  brew.sh"
echo "==========================================================="
data_source=../doc/brew.txt
while read line
do
        line_package_name=`echo $line`
        if [[ `brew list $line_package_name >/dev/null 2>&1; echo $?` = 0 ]]; then
                echo "$line_package_name : ✅"
        else
                echo "$line_package_name : ✖"
        fi
done < $data_source

echo "==========================================================="
echo "  cask.sh"
echo "==========================================================="
data_source=../doc/cask.txt
while read line
do
        line_package_name=`echo $line`
        if [[ `brew cask list $line_package_name >/dev/null 2>&1; echo $?` = 0 ]]; then
                echo "$line_package_name : ✅"
        else
                echo "$line_package_name : ✖"
        fi
done < $data_source

echo "==========================================================="
echo "  pip3.sh"
echo "==========================================================="
data_source=../doc/pip3.txt
while read line
do
        line_package_name=`echo $line | awk '{print $1} '`
        if [[ $line_package_name != *Package* ]] && [[ $line_package_name != *-----------* ]]; then

                if [[ `pip3 show $line_package_name >/dev/null 2>&1; echo $?` = 0 ]]; then
                        echo "$line_package_name : ✅"
                else
                        echo "$line_package_name : ✖"
                fi
        fi
done < $data_source
