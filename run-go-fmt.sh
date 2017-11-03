#!/usr/bin/env bash
set -e

exec 5>&1
for file in "$@"; do
    if [[ $file == "vendor/"* ]]; then
      continue
    fi

    output="$(gofmt -l -w "$file" | tee /dev/fd/5)"
    [[ -z "$output" ]]
done
