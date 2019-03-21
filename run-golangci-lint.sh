#!/usr/bin/env bash
set -e -u -o pipefail # Fail on error

echo "===golangci-lint run $@==="
exit 1
golangci-lint run $@
