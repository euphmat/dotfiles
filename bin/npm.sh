#!/bin/bash
set -Cu

data_source=../doc//npm.txt

while read line
do
      line_package_name=`echo $line | awk '{sub("@.*$", ""); print $2} '`

      if [[ $line_package_name != */usr/local/lib* ]] && [[ $line_package_name != "" ]]; then
              if [[ `npm info $line_package_name 2>/dev/null; echo $?` != 1 ]]; then
                      echo "✅ Already Installed $line_package_name"
              else
                      echo "⤵ installing $line_package_name"
                      npm install $line_package_name
              fi
      fi
done < $data_source