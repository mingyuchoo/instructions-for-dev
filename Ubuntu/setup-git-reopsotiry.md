# Set up Git repository in Ubunutu

## Prerequisite

* Install `git`
* Install `openssh-server`

```sh
# mgch
MY_HOME=/home/mingyuchoo
MY_USER=mingyuchoo

GIT_HOME=/home/git
GIT_USER=git
```

## Add `git` user for using git repository

```sh
sudo useradd -mrUd $GIT_HOME $GIT_USER
sudo su - $GIT_USER
```

## Set up initial environment for Git repository

```sh
# git
mkdir -p $GIT_HOME/.ssh
chmod 700 $GIT_HOME/.ssh
touch $GIT_HOME/.ssh/authorized_keys
chmod 600 $GIT_HOME/.ssh/authorized_keys
git init --bare $GIT_HOME/demo-project.git
exit
```

## Generate credential for git repository

```sh
cd $MY_HOME
ssh-keygen -t rsa
```
copy `$MY_HOME/.ssh/id_rsa.pub` to `$GIT_HOME/.ssh/authorized_keys` file.

## Clone git repository to my account

```sh
git clone git@localhost:demo-project.git
Cloning into 'demo'...
...
warning: You appear to have cloned an empty repository.
```

## Use the cloned repository

```sh
cd demo-project
touch README.md
cat "# demo-project" > README.md
echo "# demo-project" > README.md
cat README.md
git status
git add .
git commit -m "Added README"
git push
```

