#!/bin/bash

current_repo=${GITHUB_REPOSITORY##/}
current_branch=${GITHUB_REF##*/}
current_run_id=${GITHUB_RUN_ID}
current_commit=${GITHUB_SHA}

curl -X POST -H "Content-Type: application/xml" -H "RepoName: ${current_repo}" -H "Branch: ${current_branch}" -H "RunID: ${current_run_id}" -H "CommitSHA: ${current_commit}" -d @./test-report.xml \
   http://136.244.78.45:4000/reports
