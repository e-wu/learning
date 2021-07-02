#!/bin/bash

FILECONT=$(cat /root/text.txt)

if [ "$FILECONT" = "Done" ]; then
  exit 0;
fi
exit 1;
