#!/bin/bash
set -C

pip3txt=../doc//pip3.txt

while read line
do
      pip3app=`echo $line | awk '{print $1} '`

      if [[ $pip3app != *Package* ]] && [[ $pip3app != *-----------* ]]; then
              echo "installing $pip3app..."
              pip3 install $pip3app
      fi
done < $pip3txt
