#!/bin/sh

git worktree add build
cd build || exit 1
git reset --hard main
git submodule update --init --recursive --depth=1
pandoc -s --metadata title="" -i README.md -o index.html
rm -f README.md build.sh
git add -A
git commit --allow-empty-message -m ''
