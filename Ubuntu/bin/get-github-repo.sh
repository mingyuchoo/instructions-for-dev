#!/bin/bash

touch github-repos.sh

echo "!/bin/bash" >> github-repos.sh
echo "cd ~/github/mingyuchoo" >> github-repos.sh

for i in {1..10}
do
    curl https://api.github.com/users/mingyuchoo/repos?page="$i" \
        | jq '.[].ssh_url' \
        | awk '{print "git clone " $1}' \
        >> github-repos.sh
done

