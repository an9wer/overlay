#!/usr/bin/env bash
#
# Append current file to selected list

TEMP=/tmp/noice.$PPID
FILE=$(realpath -s "$1")
touch "$TEMP"
if grep -q "^$FILE\$" "$TEMP"; then
  read -t3 -n1 -s -p "'$FILE' already exists, press any key to exit." anykey
else
  echo "$FILE" >> "$TEMP"
  read -t3 -n1 -s -p "Add '$FILE' to selected list, press any key to exit." anykey
fi
echo -e "\n\n"
