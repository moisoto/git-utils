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
if which gsed &> /dev/null; then
  gsed -i 's/[[:blank:]]*$//' "$1"
else
  if which perl &> /dev/null; then
    perl -i -pe's/[[:blank:]]*$//' "$1"
  else
    echo "Please install gsed or perl to be able to use this command"
    exit 3
  fi
fi

echo "Removed trailing whitespaces for $1"
exit 0
