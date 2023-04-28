#! /bin/bash

./clean.sh

find . -name "*.java" -print0 | while read -d $'\0' file
do
  javac -d . "$file"
  echo "Compile: $file"
done

java Main
