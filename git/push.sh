#!/bin/bash

# Script for pushing git repository to all it's remotes
# If it's called without arguments it pushes current folder
# else it parses $1 - a file containing list of repositories (for example see ../bash/list_example.txt)

git_push_to_all_remotes() {
    for origin in $(git remote); do
        git push "$origin"
    done
}

if (( $# == 0 )); then
    git_push_to_all_remotes
    exit
fi

LISTFILE="$1"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

export -f git_push_to_all_remotes
bash "$DIR/../bash/parse_filelist.sh" "$LISTFILE" git_push_to_all_remotes "Pushing repository"
