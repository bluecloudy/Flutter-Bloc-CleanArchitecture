#!/bin/zsh
echo "Checking your commit message"
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
# Check if commit message starts with prefix
commit_regex='^\['$prefix'-[0-9]+\].*'
error_msg="Bad commit message. See example: \"[$prefix-2] some text\""

if ! grep -iqE "$commit_regex" "$1"; then
    echo "$error_msg" >&2
    exit 1
fi
