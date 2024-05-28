#!/bin/zsh
# Load env from .env file
set -o allexport
source .lefthook/.env
set +o allexport
echo "LEFTHOOK_PREFIX: $LEFTHOOK_PREFIX"
# Get value from environment variable if not throw error
prefix=$LEFTHOOK_PREFIX
if [ -z "$prefix" ]; then
    echo "LEFTHOOK_PREFIX is not set. Please set it in .lefthook/.env file" >&2
    exit 1
fi
echo "Checking your branch name"

LC_ALL=C
local_branch="$(git rev-parse --abbrev-ref HEAD)"
valid_branch_regex='^(feature|bugfix|improvement|release|hotfix)\/'$prefix'-[0-9]+_.*$'
message="$local_branch is bad branch name. See example: feature/$prefix-2_some_text"

#if [[ $local_branch == "flutter_template" ]]
#then
#    exit 0
#fi

if [[ ! $local_branch =~ $valid_branch_regex ]]
then
    echo "$message"
    exit 1
fi

exit 0