#!/usr/bin/env bash

# Get the branch name from the argument or the current branch if no argument is provided
BRANCH_NAME=${1:-$(git rev-parse --abbrev-ref HEAD)}

# The regex pattern
PATTERN= '^(feature|bugfix|hotfix|release)/[A-Z]+-\d+/[a-z0-9-]+$' 

if [[ "$BRANCH_NAME" =~ $PATTERN ]]; then
   echo "Branch name '$BRANCH_NAME' is valid."
   exit 0 
else
   echo "Branch name '$BRANCH_NAME' is invalid. It must match the pattern: $PATTERN"
   exit 1 
fi
