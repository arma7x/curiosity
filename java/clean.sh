#! /bin/bash

find . -name "*.class" -print0 | while read -d $'\0' file
do
  rm "$file"
  echo "Delete: $file"
done
