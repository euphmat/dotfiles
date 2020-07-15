#!/bin/bash
set -C

mastxt=../doc//mas.txt

while read line
do
      #echo $line | awk '{print $1}'
      masapp=$(awk -v '{print $1}' <<< ${line}) 
      echo $masapp
done < $mastxt
