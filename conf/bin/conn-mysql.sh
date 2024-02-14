#!/usr/bin/env bash

# Please install mysql client before to use
#   sudo apt install -y mysql-client
#   HACK: `host` should be IP address

mysql --host=127.0.0.1 --port=3306 --user=root --password=root --database=test
