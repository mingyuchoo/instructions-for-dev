#! /bin/bash

rustup update

for i in $(ls -d */); do
    pushd ${i}
    cd ${i} 2>/dev/null
    cargo update
    popd
done

