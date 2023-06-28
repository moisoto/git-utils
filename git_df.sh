#!/bin/zsh
if [[ -z "$@" ]]; then
   echo "Must include file(s) parameter"
   exit 1
fi
for FILE in $@; do
  #LINECNT=$(wc -l "${FILE}")
  #echo "Result    :${LINECNT}"
  #echo "Result CUT:" $(wc -l "${FILE}" | cut -d ' ' -f 7)
  #echo "Result TRC:" $(wc -l "${FILE}" | tr -s ' ' | cut -d ' ' -f 2)
  #echo "Result XCT:" $(wc -l "${FILE}" | xargs | cut -d ' ' -f 1)
  #echo "Result AWK:" $(wc -l "${FILE}" | awk '{print $1}')

  # On MacOS cut command is not working as expected.
  # It is inserting 6 spaces in the front.
  # Above are a few ways to handle this. Only the last
  # two commands will work on both MacOS and Linux
  #git diff -U$(wc -l "${FILE}" | xargs | cut -d ' ' -f 1) "${FILE}"
  git diff -U$(wc -l "${FILE}" | awk '{print $1}') "${FILE}"
done
exit 0
