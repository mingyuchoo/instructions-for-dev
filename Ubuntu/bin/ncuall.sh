#! /bin/bash

for i in $(ls -d */); do
    pushd ${i}
    cd ${i} 2>/dev/null
    ncu -u
    popd
done

