#!/usr/bin/env bash
set -e

exec 5>&1
for file in "$@"; do
    output="$(golint "$file" 2>&1 | tee /dev/fd/5)"
    [[ -z "$output" ]]
done
