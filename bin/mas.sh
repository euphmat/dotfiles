#!/bin/bash
set -Cu

data_source=../doc//mas.txt

while read line
do
      line_package_name=`echo $line | awk '{print $1} '`
      mas install $line_package_name
done < $data_source
