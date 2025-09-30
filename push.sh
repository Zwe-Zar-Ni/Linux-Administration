#!/bin/bash

# Take the current branch name
branch=$(git branch | grep "*" | cut -d " " -f2)

read -p "Enter commit message : " commit_msg

git add .
git commit -m "$commit_msg"
git push origin "$branch"