#!/bin/bash

for i in $(ls -d */)
do
    pushd "${i}"
    cd "${i}" 2>&1 /dev/null
    git pull
    popd
done