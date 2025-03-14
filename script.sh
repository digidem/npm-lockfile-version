#!/bin/sh

# Fail the job if there are any failures below.
set -e

# Check if the file exists
if [ ! -f "$2" ]; then
    echo "Error! Expected a package-lock.json file at '$2' but none was found."
    exit 1
fi

VER=$(jq '.lockfileVersion' "$2")

if [ "$1" != "$VER" ]; then
    echo "Error! package-lock.json lockfileVersion is $VER but expected $1" && exit 1
fi
