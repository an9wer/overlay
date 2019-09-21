#!/usr/bin/env bash
#
# Move selected files to current directory

TEMP=/tmp/noice.$PPID
FILE=$(dirname $(realpath -s "$1"))

touch "$TEMP"
if [[ -s $TEMP ]]; then
  mv $(cat "$TEMP") "$FILE"
  > "$TEMP"
  read -t3 -n1 -s -p 'Press any key to exit.' anykey
else
  read -t3 -n1 -s -p 'Selected list is empty, press any key to exit.' anykey
fi
echo
