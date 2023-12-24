#!/bin/bash 

current_repo=${GITHUB_REPOSITORY##/}
current_branch=${GITHUB_REF##*/}
current_run_id=${GITHUB_RUN_ID}

repo=$(echo $current_repo | tr "/" "-")
echo $repo
echo $current_branch
echo $current_run_id

curl -X POST \
      -H "Content-Type: application/xml" \
      -d "@./test-report.xml" \
      https://d620-2001-818-d998-b00-e5d5-332d-f89-e699.ngrok.io/reports/$repo/$current_branch/$current_run_id
