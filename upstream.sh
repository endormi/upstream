#!/bin/bash

ACCESS_TOKEN=""

if [[ -z "$ACCESS_TOKEN" ]]; then
  echo "No ACCESS_TOKEN provided."
  exit
fi

# Check if Git is installed (just in case)
if ! command -v git &>/dev/null; then
  echo "You need to install Git and setup Git Configs."
  echo -e "Follow this tutorial: \e]8;;https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup\aFirst-time Git Setup\e]8;;\a."
  exit
fi

# Check if jq is installed
if ! command -v jq &>/dev/null; then echo "You need to install jq."; exit; fi

function list_repo_info() {
  arg1=$1
  arg2=$2

  [[ $arg2 == "local" ]] && arg2="--local" || arg2=""

  if [[ `git config --list $arg2 | grep $arg1 | wc -l` -eq 0 ]]; then
    echo "$arg1 not found!"
    exit
  else
    git config --list $arg2 | grep $arg1
  fi
}

list_repo_info user.name

if [[ -z $1 ]]; then
  url=$(list_repo_info remote.origin.url local)
  filename="tmp_file.txt"
  repo=$(cut -d "/" -f4- <<< "$url" >> $filename && sed -i 's/.git//g' $filename && cat $filename && rm $filename)
  branch=$(git remote show origin | grep "HEAD branch:" | cut -d ":" -f 2 | tr -d "[:space:]")
  list_repo_info branch.$branch.remote local
else
  repo=$1
  branch=$(curl -sL https://api.github.com/repos/$repo | jq -r '.default_branch')
fi

curl \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: token $ACCESS_TOKEN" \
  https://api.github.com/repos/$repo/merge-upstream \
  -d '{"branch":"'"${branch}"'"}' --stderr - \
  | grep message | cut -d '"' -f 4
