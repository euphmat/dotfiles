#!/bin/bash
set -Cu

mastxt=../doc//mas.txt

while read line
do
        mas install $line | awk '{print $1}' 
done < $mastxt
