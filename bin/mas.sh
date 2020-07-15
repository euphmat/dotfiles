#!/bin/bash
set -C

mastxt=../doc//mas.txt

while read line
do
        masapp=$line | `awk '{print $1}'`
        echo $masapp
done < $mastxt
