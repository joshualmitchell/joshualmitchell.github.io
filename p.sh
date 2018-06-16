#!/bin/sh
git add --all
git commit -m "$1"
git push
echo "Committed and pushed with this commit message: $1"
