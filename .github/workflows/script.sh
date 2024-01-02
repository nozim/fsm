#!/bin/bash

current_repo=${GITHUB_REPOSITORY##/}
current_branch=${GITHUB_REF##*/}
current_run_id=${GITHUB_RUN_ID}

data=$(cat ./test-report.xml | base64)

payload="{\"repo_name\":\"$current_repo\", \"branch\": \"$current_branch\", \"run_id\": \"$current_run_id\", \"report_body\": \"$data\"}"
echo $payload

curl -X POST \
  -H "Content-Type: application/json" \
  -d $payload \
  https://419d-2001-818-d998-b00-746e-9cc2-1797-2219.ngrok-free.app/reports
