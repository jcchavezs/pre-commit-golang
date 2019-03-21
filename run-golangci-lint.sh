#!/usr/bin/env bash
set -e -u -o pipefail # Fail on error

echo "===$@==="
exit 1
golangci-lint run $@
