#!/usr/bin/env bash

# Please install below before to use
#   sudo apt install -y postgresql-client-common
#   sudo apt install -y postgresql-client

psql -h localhost -p 5432 -d postgres -U postgres -W
