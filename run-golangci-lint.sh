#!/usr/bin/env bash
set -e -u -o pipefail # Fail on error

args=""
fns=()

# golangci does not allow to pass more than one file if they don't belong
# to the same directory (see https://github.com/golangci/golangci-lint/issues/391)
# thus we need to run the command file by file.

for arg in "$@"; do
	if [[ $arg == --* ]]; then
		args="$args $arg"
  else
    fns+=("$arg")
	fi
done

for file in ${fns[*]}
do
  golangci-lint run $args $file
done
