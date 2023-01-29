#!/bin/bash

for i in $(ls -d -- */)
    do
        pushd "$i" || exit
        cd "$i" 2>/dev/null || exit
        git add . && git commit -m "updated" && git push
        popd || exit
    done
