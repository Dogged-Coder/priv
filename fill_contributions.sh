#!/bin/bash

for i in $(seq 169 -1 0)
do
  DATE=$(date -d "$i days ago" +"%Y-%m-%dT12:00:00")
  
  # Create a file change
  echo "contribution $i" >> contributions.txt
  
  git add .
  
  GIT_AUTHOR_DATE="$DATE" GIT_COMMITTER_DATE="$DATE" \
    git commit -m "contribution: day $i"
  
done

git push origin main
