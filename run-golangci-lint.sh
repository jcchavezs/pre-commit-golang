#!/usr/bin/env bash
set -e -u -o pipefail # Fail on error

args=""
fns=()

# golangci does not allow to pass more than one file if they don't belong
# to the same directory (see https://github.com/golangci/golangci-lint/issues/391)
# thus we need to run the command file by file.
#
# Also from https://github.com/golangci/golangci-lint/blob/master/README.md#config-file:
# > next dirs are always skipped independently from this option's value:
#   vendor$, third_party$, testdata$, examples$, Godeps$, builtin$

for arg in "$@"; do
	if [[ $arg == --* ]]; then
		args="$args $arg"
  else
    if [[ ! $arg =~ ^(vendor|third_party|testdata|examples|Godeps|builtin) ]]; then
      fns+=("$arg")
    fi
	fi
done

if [ ${#fns[@]} -gt 0 ]; then
  for i in ${!fns[@]}
  do
    golangci-lint run $args ${fns[$i]}
  done
fi
