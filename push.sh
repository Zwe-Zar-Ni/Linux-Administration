#!/bin/bash

today=$(date +%Y-%m-%d)

read -p "Enter commit message : " commit_msg

git add .
git commit -m "$commit_msg"
git push origin main