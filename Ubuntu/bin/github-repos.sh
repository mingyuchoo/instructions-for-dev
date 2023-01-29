#! /bin/bash

cat <<EOF >> download-repos.sh.sh
#!/bin/bash

cd ~/github/mingyuchoo/

EOF

for i in {1..10}
do
    curl "https://api.github.com/users/mingyuchoo/repos?page=$i" \
    | jq '.[].ssh_url' \
    | awk '{print "git clone " $1}' \
    >> download-repos.sh.sh
done

chmod +x download-repos.sh.sh
