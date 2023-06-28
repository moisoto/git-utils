#!/bin/zsh

if [[ $# -ne 1 ]]; then
  echo "Please specify a filename" 
  exit 1
fi

if [[ ! -f $1 ]]; then
  echo "File $1 not found."
  exit 2
fi

# Remove trailing whitespaces from each line
gsed -i 's/[[:blank:]]*$//' "$1"
echo "Removed trailing whitespaces for $1"
exit 0
