#!/bin/bash
set -C

mastxt=../doc//mas.txt

while read line
do
      masapp=`echo $line | awk '{print $1} '`
      mas install $masapp
done < $mastxt
