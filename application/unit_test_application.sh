#!/bin/bash
set -e

touch "report.xml"
echo "Unit Testing the Application"
cd application/hello-world
npm install
npm test
cd -
