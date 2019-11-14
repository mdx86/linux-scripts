#!/usr/bin/env bash

targetDir="$1"

if [ ! -d "$targetDir" ]; then
  echo "The target folder is not exists,folder=$1";
  exit
fi

uuid=$(uuidgen)
tmp="/tmp/rm-dir-${uuid}/"

mkdir -p $tmp
rsync -av --delete "$tmp" "$targetDir"
rm -fr $tmp