#!/bin/bash
set -Cu

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