#!/usr/bin/env bash
#
# Copy selected files to current directory

TEMP=/tmp/noice.$PPID
CDIR=$(pwd)

touch "$TEMP"
if [[ -s $TEMP ]]; then
  while IFS=$'\n' read -r f; do
    if [[ -e $f ]]; then
      cp -r "$f" "$CDIR"
    else
      echo "ERROR: '$f' does not exist."
    fi
  done < "$TEMP"
  > "$TEMP"
  read -t3 -n1 -s -p 'Press any key to exit.' anykey
else
  read -t3 -n1 -s -p 'Select list is empty, press any key to exit.' anykey
fi
echo -e "\n\n"
