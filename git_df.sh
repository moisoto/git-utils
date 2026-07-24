#!/bin/zsh
if [[ -z "$@" ]]; then
   echo "Must include file(s) parameter"
   exit 1
fi
for FILE in $@; do
  git diff --color --ws-error-highlight=all -U$(wc -l "${FILE}" | awk '{print $1}') "${FILE}" | less -R
done
exit 0
