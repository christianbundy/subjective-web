#!/bin/sh

cd build || exit 1
python -m http.server 8000
