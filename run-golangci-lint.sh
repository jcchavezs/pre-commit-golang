#!/usr/bin/env bash
set -e -u -o pipefail # Fail on error

golangci-lint run $@
