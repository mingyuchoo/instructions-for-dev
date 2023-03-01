#!/bin/bash

rustup update

for i in $(ls -d -- */)
do
    pushd "${i}"
    cd "${i}" 2>&1 /dev/null
    cargo upgrade
    cargo update
    popd
done
