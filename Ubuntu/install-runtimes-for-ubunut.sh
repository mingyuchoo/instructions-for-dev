#! /bin/bash

# Install Packages for DEV
sudo apt update
sudo apt upgrade -y
sudo apt install -y \
  software-properties-common \
  build-essential \
  net-tools \
  traceroute \
  ca-certificates \
  gnupg \
  lsb-release \
  curl \
  wget \
  nnn \
  vim-nox \
  emacs-nox \
  tmux \
  tree \
  unzip \
  htop \
  nmon \
  jq \
  libbz2-dev \
  libffi-dev \
  libgdbm-dev \
  libgmp3-dev \
  libncurses5-dev \
  libnss3-dev \
  libreadline-dev \
  libsqlite3-dev \
  libssl-dev \
  libtinfo-dev \
  zlib1g-dev \
  gconf2 \
  gconf-service \
  libappindicator1

# Install Terraform
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt update && sudo apt install terraform

# Install Docker
sudo apt update
sudo apt upgrade -y
sudo apt install -y docker.io
sudo groupadd docker
sudo usermod -aG docker $USER

# install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install Git
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install -y git

# Install Nix for multi-user
sh <(curl -L https://nixos.org/nix/install) --daemon
echo "source \"$HOME/.nix-profile/etc/profile.d/nix.sh\"" >> .bashrc

# Install NVM for Nodejs
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install 16

# Install Rustup for Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install Ghcup for Haskell
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

# # Install Haskell applications
# ```bash
# stack install \
#   ghcid \
#   hindent \
#   hlint \
#   hoogle \
#   stylish-haskell
# ```
# 
# # Update `$HOME/.stack/config.yaml` file
# 
# ```yaml
# ...
# 
# templates:
#   params:
#     author-email: mingyuchoo@gmail.com
#     author-name: Mingyu Choo
#     category: PoC
#     copyright: mingyuchoo
#     github-username: mingyuchoo
# 
# ...
# 
# stack-colors: STYLES
# #allow-newer: true
# ```
# 
# # Add some code for `stylish-haskell` to `$HOME/.stack/global-project/stack.yaml` file
# 
# ```yaml
# ...
# 
# extra-deps:
# - ghc-lib-parser-9.2.2.20220307@sha256:384755a514a42fe1615862ff6ef5c995a9ed71904360b4b212f9526f80fb214c,12705
# - ghc-lib-parser-ex-9.2.0.3@sha256:a90c3a6aa85f59848d9f8c3928ab7203299a4b560db6f300976d9b1f7da127ee,3655
# ```

# Install Opam for OCaml
sudo apt install bubblewrap
sudo bash -c "sh <(curl -fsSL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)"
opam init
opam install dune

# Install Elm
cd ~/Downloads/
curl -L -o elm.gz https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz
gunzip elm.gz
chmod +x elm
sudo cp elm /usr/local/bin/
rm elm

# # Install Python3.10
# 
# ```bash
# sudo apt install -y python3.10
# sudo apt install -y python3.10-venv
# python3.10 -m venv $HOME/venv
# echo "source \"$HOME/venv/bin/activate\" # for Python3.10" >> .bashrc
# source $HOME/.bashrc
# 
# # for Ansible configuration management
# pip install ansible
# pip install paramiko
# ```

# Install Java
curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | bash && . ~/.jabba/jabba.sh
jabba install openjdk@1.11.0
jabba default openjdk@1.11.0
java --version

# Install Doom Emacs
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
~/.emacs.d/bin/doom sync

# # Add `$HOME/.emacs.d/bin` to `$PATH`
# 
# ```bash
# ...
# export $PATH="$HOME/.emacs.d/bin":$PATH"
# ```
# 
# # Additional settings
# 
# -<https://github.com/mingyuchoo/doom-emacs-setting>

