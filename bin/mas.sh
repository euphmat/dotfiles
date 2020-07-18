#!/bin/bash
set -C

data_source=../doc//mas.txt

while read line
do
      line_package_name=`echo $line | awk '{print $1} '`
      if [[ `grep $line_package_name -rl ../doc/mas.txt >/dev/null 2>&1; echo $?` = 0 ]] && [[ `mas search $line_package_name >/dev/null 2>&1; echo $?` = 0 ]]; then
                echo "✅ Already Installed $line_package_name"
      else
                echo "⤵ installing $line_package_name"
                mas install $line_package_name
      fi
done < $data_source
