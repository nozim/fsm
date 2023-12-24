#!/bin/bash 

repo_name=${{ github.repository.full_name }}
repo=$(echo $repo_name | tr "/" "-")
branch=${{ github.ref_name }}
run_id=${{ github.run_id }}

echo $repo
echo $branch 
echo $run_id 

current_repo=${GITHUB_REPOSITORY##/}
current_branch=${GITHUB_REF##*/}
current_run_id=${GITHUB_RUN_ID}

echo $current_repo
echo $current_branch
echo $current_run_id

curl -X POST \
      -H "Content-Type: application/xml" \
      -d "@./test-report.xml" \
      https://d620-2001-818-d998-b00-e5d5-332d-f89-e699.ngrok.io/reports/$(echo $repo)/$(echo $branch)/$(echo $run_id)
