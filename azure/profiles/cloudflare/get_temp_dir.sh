#!/bin/sh

if [ "$OS" = "Windows_NT" ]; then
  echo "{\"temp_dir\": \"$(echo $TEMP | sed 's/\\\/\//g')\"}"
else
  echo "{\"temp_dir\": \"${TMPDIR:-/tmp}\"}"
fi
