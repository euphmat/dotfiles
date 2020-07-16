#!/bin/bash
set -C

npmtxt=../doc//npm.txt

while read line
do
        npmapp=`echo $line | awk '{sub("@.*$", ""); print $2} '`

      if [[ $npmapp != */usr/local/lib* ]] && [[ $npmapp != "" ]]; then
              echo "installing $npmapp"
              npm install -g $npmapp
      fi
done < $npmtxt
