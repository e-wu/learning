#!/bin/bash

FILECONT=$(cat /root/text.txt)

if [ "$FILECONT" = "WORLD" ]; then
  exit 0;
fi
exit 1;
