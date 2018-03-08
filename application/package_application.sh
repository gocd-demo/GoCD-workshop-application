#!/bin/bash
set -e

mkdir -p installer
tar cfvz installer/output.tgz application/hello-world
