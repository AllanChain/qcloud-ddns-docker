#! /bin/bash
set -e

source "$(dirname "$0")/check.sh"

crond -f -d 8
