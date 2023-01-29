#!/bin/bash

for i in $(ls -d -- */)
do
    pushd "$i" || exit
    cd "$i" 2>/dev/null || exit
    git pull
    popd || exit
done