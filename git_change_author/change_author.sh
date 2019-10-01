#!/bin/bash

# Script from https://stackoverflow.com/a/750182 for fixing all wrong author names and emails for all branches and tags
# $1 - wrong email
# $2 - correct name
# $3 - correct email

git filter-branch --env-filter '
OLD_EMAIL="$1"
CORRECT_NAME="$2"
CORRECT_EMAIL="$3"
if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags