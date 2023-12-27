#!/bin/bash

current_repo=${GITHUB_REPOSITORY##/}
current_branch=${GITHUB_REF##*/}
current_run_id=${GITHUB_RUN_ID}

data=$(cat ./test-report.xml | base64)
curl -X POST \
  -H "Content-Type: application/json" \
  -d "{\"repo_name\":\"$current_repo\", \"branch\": \"$current_branch\", \"run_id\": \"$run_id\", \"report_body\": \"$data\"}" \
  https://113d-89-114-64-217.ngrok-free.app/reports
