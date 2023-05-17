#! /bin/bash

rm -R ./classes/* 2> /dev/null
cd ./src
find . -name "*.java" -print0 | while read -d $'\0' file
do
  javac -d ../classes "$file"
  echo "Compile: $file"
done
cd ../ && cd ./classes
jar cvf ../Main.jar * && cd ../
clear
java -cp Main.jar Main
