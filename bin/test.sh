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
        line_package_command=`echo $line | awk '{sub("@.*$", "");sub("-.*$", ""); print $2} '`

        if [[ $line_package_name != */usr/local/lib* ]] && [[ $line_package_name != "" ]]; then
                if [[ `type $line_package_command 2>/dev/null; echo $?` != 1 ]]; then
                        echo "$line_package_command : ✅"
                else
                        echo "$line_package_command : ✖"
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
