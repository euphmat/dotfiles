#!/bin/bash
set -Ceu

echo "@@@@@@@@@@@@@@@@@@"
echo "@@ Test Program @@"
echo "@@@@@@@@@@@@@@@@@@"

data_source=../doc/npm.txt
echo "==========================================================="
echo "  npm.sh"
echo "==========================================================="
while read line
do
        line_package_name=`echo $line | awk '{sub("@.*$", ""); print $2} '`

        if [[ $line_package_name != */usr/local/lib* ]] && [[ $line_package_name != "" ]]; then
                if [[ `npm show $line_package_name 2>/dev/null; echo $?` != 1 ]]; then
                        echo "$line_package_name : ✅"
                else
                        echo "$line_package_name : ✖"
                fi
        fi
done < $data_source

data_source=../doc/brew.txt
echo "==========================================================="
echo "  brew.sh"
echo "==========================================================="
while read line
do
        line_package_name=`echo $line`
        if [[ `type $line_package_name 2>/dev/null; echo $?` != 1 ]]; then
                echo "$line_package_name : ✅"
        else
                echo "$line_package_name : ✖"
        fi
done < $data_source


data_source=../doc/pip3.txt
echo "==========================================================="
echo "  pip3.sh"
echo "==========================================================="
while read line
do
        line_package_name=`echo $line | awk '{print $1} '`
        if [[ $line_package_name != *Package* ]] && [[ $line_package_name != *-----------* ]]; then

                if [[ `pip3 show $line_package_name 2>/dev/null; echo $?` != 1 ]]; then
                        echo "$line_package_name : ✅"
                else
                        echo "$line_package_name : ✖"
                fi
        fi
done < $data_source
