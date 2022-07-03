#!/bin/bash

declare -a proj=(
  "repo"
  "repo"
)

for i in "${proj[@]}"
do
  if [ -d "$i" ]; then
    cd $i
    bash ../upstream.sh
    cd ..
  else
    echo "$i doesn't exist!"
  fi
done
