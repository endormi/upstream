#!/bin/bash

declare -a proj=(
  "owner/repo"
  "owner/repo"
)

for i in "${proj[@]}"
do
  bash ./upstream.sh $i
done
