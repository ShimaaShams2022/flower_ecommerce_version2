#!/usr/bin/env bash

# Get the branch name from the argument or the current branch if no argument is provided
BRANCH_NAME=${1:-$(git rev-parse --abbrev-ref HEAD)}

# Define the regex pattern for valid branch names
PATTERN="^(master|main|develop)$|^(feature|fix|hotfix|release|enhancement)\/.+$"

# Validate the branch name against the pattern
if [[ "$BRANCH_NAME" =~ $PATTERN ]]; then
   echo "Branch name '$BRANCH_NAME' is valid."
   exit 0
else
   echo "Branch name '$BRANCH_NAME' is invalid. It must match the pattern: $PATTERN"
   exit 1
fi
