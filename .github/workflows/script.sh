#!/bin/bash 

current_repo=${GITHUB_REPOSITORY##/}
current_branch=${GITHUB_REF##*/}
current_run_id=${GITHUB_RUN_ID}

repo=$(echo $current_repo | tr "/" "-")

curl -X POST \
      -H "Content-Type: application/xml" \
      -d "@./test-report.xml" \
      https://b57b-2001-818-d998-b00-f0b8-1fa4-f1fd-159a.ngrok-free.app/reports/$repo/$current_branch/$current_run_id
