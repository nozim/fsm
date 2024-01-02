#!/bin/bash

current_repo=${GITHUB_REPOSITORY##/}
current_branch=${GITHUB_REF##*/}
current_run_id=${GITHUB_RUN_ID}

curl -X POST -H "Content-Type: application/xml" -H "RepoName: ${current_repo}" -H "Branch: ${current_branch}" -H "RunID: ${current_run_id}" -d @./test-report.xml \
    https://419d-2001-818-d998-b00-746e-9cc2-1797-2219.ngrok-free.app/reports
