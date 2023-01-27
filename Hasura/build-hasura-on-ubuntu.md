# How to build hasura engine on Ubuntu

```bash
sudo apt install -y libghc-pcre-light-dev unixodbc-dev libmysqlclient-dev libpq-dev libpq5
cd graphql-engine
cabal build all
```
