#!/bin/sh

# Fail the job if there are any failures below.
set -e

test -f "$2" || (echo "Error! Expected a package-lock.json file but none was found." && exit 1)

VER=`cat "$2" | jq '.lockfileVersion'`

if [ "$1" != "$VER" ]; then
    echo "Error! package-lock.json lockfileVersion is $VER but expected $1" && exit 1
fi
