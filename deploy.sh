#!/bin/sh

git push origin main
cd build || exit 1
git push -f origin/build
