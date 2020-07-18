#!/bin/bash
set -Cu

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