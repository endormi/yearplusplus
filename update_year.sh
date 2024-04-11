#!/bin/bash

# Update year in specified files
if [ -n "$FILES" ]; then
  if [ -z "$CUSTOM_FROM_YEAR" ]; then
    FROM_YEAR=$(date --date="1 year ago" +%Y)
  else
    FROM_YEAR="$CUSTOM_FROM_YEAR"
  fi

  if [ -z "$CUSTOM_TO_YEAR" ]; then
    TO_YEAR=$(date +%Y)
  else
    TO_YEAR="$CUSTOM_TO_YEAR"
  fi

  find $FILES -exec sed -i "s/${FROM_YEAR}/${TO_YEAR}/g" {} \;
fi

# Setup Git configuration
if [ -z "$GIT_USER" ]; then
  GIT_USER="Year++"
fi

if [ -z "$GIT_EMAIL" ]; then
  GIT_EMAIL="<>"
fi

GIT_USER="${GIT_USER:-Year++}"
GIT_EMAIL="${GIT_EMAIL:-<>}"

git config user.name "$GIT_USER"
git config user.email "$GIT_EMAIL"

# Commit changes
COMMIT_MESSAGE="${COMMIT_MESSAGE:-Update copyright year}"
git commit -am "$COMMIT_MESSAGE"
git push origin "$GITHUB_REF"
