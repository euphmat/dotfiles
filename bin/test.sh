#!/bin/bash
set -Ce

npmtxt=../doc//npm.txt

while read line
do
      npmapp=`echo $line | awk '{sub("@.*$", ""); print $2} '`

      if [[ $npmapp != */usr/local/lib* ]] && [[ $npmapp != "" ]]; then
              if [[ `type $npmapp; echo $?` = 0 ]]; then
                      echo "Already Installed $npmapp"
              else
                      echo "installing $npmapp"
              fi
      fi
done < $npmtxt
