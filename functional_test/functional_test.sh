#!/bin/bash
set -e

echo "Running functional tests $GO_JOB_RUN_INDEX of $GO_JOB_RUN_COUNT"

npm install --prefix functional_test; gauge install -d functional_test; gauge run specs -d functional_test

mkdir -p testoutput
cp -r functional_test/reports testoutput
echo "This is the output from $GO_JOB_RUN_INDEX of $GO_JOB_RUN_COUNT" >> testoutput/output.txt
