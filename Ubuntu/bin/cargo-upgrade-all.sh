#!/bin/bash

rustup update

for i in $(ls -d -- */)
do
    pushd "$i" || exit
    cd "$i" 2>/dev/null || exit
    cargo upgrade
    cargo update
    popd || exit
done

