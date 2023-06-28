#!/bin/zsh
if [[ -z "$@" ]]; then
   echo "Must include file(s) parameter"
   exit 1
fi
for FILE in $@; do
  git diff -U$(wc -l "${FILE}" | awk '{print $1}') "${FILE}"
done
exit 0
