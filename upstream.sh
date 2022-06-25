#!/bin/bash

function list_repo_info() {
  arg1=$1
  arg2=$2

  if [[ $arg2 == "local" ]]; then
    arg2="--local"
  else
    arg2=""
  fi
  if [[ `git config --list $arg2 | grep $arg1 | wc -l` -eq 0 ]]; then
    echo "$arg1 not found!"
    exit
  else
    git config --list $arg2 | grep $arg1
  fi
}

list_repo_info user.name
url=$(list_repo_info remote.origin.url local)
filename="tmp_file.txt"
repo=$(cut -d "/" -f4- <<< "$url" >> $filename && sed -i 's/.git//g' $filename && cat $filename && rm $filename)
branch=$(git remote show origin | grep "HEAD branch:" | cut -d ":" -f 2)
list_repo_info branch.$branch.remote local

fork=$(curl -sL https://api.github.com/repos/$repo | jq -r '.fork')
if [[ $fork == "false" ]]; then
  echo "Not a fork."
  exit
fi
