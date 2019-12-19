#!/usr/bin/env bash
#
# List selected files

TEMP=/tmp/noice.$PPID
touch "$TEMP"
cat "$TEMP"
read -t3 -n1 -s -p 'Press any key to exit.' anykey
echo -e "\n\n"
