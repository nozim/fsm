#!/bin/bash

current_repo=${GITHUB_REPOSITORY##/}
current_branch=${GITHUB_REF##*/}
current_run_id=${GITHUB_RUN_ID}
current_commit=${GITHUB_SHA}

curl -X POST -H "Content-Type: application/xml" -H "RepoName: ${current_repo}" -H "Branch: ${current_branch}" -H "RunID: ${current_run_id}" -H "CommitSHA: ${current_commit}" -d @./test-report.xml \
    https://b8b8-2001-818-d998-b00-a1bf-3475-ddb1-bf4e.ngrok-free.app/reports
