#!/bin/bash

echo "Building application"

i=1

mkdir -p output

while [ $i -lt 5 ]
do
  touch output/$i.txt
  i=$[$i+1]
done
