#!/bin/bash
set -C

pip3txt=../doc//pip3.txt

while read line
do
      pip3app=`echo $line | awk '{print $1} '`
done < $pip3txt
