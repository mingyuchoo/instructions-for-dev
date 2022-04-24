# How to setup ubuntu for development

## Install Packages for DEV

```bash
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
  jq

sudo apt install -y \
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
  zlib1g-dev

sudo apt install -y \
  gconf2 \
  gconf-service \
  libappindicator1
```

## Install Terraform

```bash
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt update && sudo apt install terraform
```

## Install Docker

```bash
sudo apt update
sudo apt upgrade -y
sudo apt install -y docker.io
sudo groupadd docker
sudo usermod -aG docker $USER

# install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

## Install Git

```bash
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install -y git
```

## Install Nix for multi-user

```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
echo "source \"$HOME/.nix-profile/etc/profile.d/nix.sh\"" >> .bashrc
```

## Install NVM for Nodejs

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install 16
```

## Install Rustup for Rust

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## Install Ghcup for Haskell

```bash
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

### Install Haskell applications

```bash
stack install \
  ghcid \
  hindent \
  hlint \
  hoogle \
  stylish-haskell
```

## Install Opam for OCaml

```bash
bash -c "sh <(curl -fsSL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)"
opam init
opam install dune
```

## Install Elm

```bash
cd ~/Downloads/
curl -L -o elm.gz https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz
gunzip elm.gz
chmod +x elm
sudo cp elm /usr/local/bin/
rm elm
```

## Install Python3.10

```bash
sudo apt install -y python3.10
sudo apt install -y python3.10-venv
python3.10 -m venv $HOME/venv
echo "source \"$HOME/venv/bin/activate\" # for Python3.10" >> .bashrc
source $HOME/.bashrc

# for Ansible configuration management
pip install ansible
pip install paramiko
```

## Install Dockstation 1.5.1

```bash
wget https://github.com/DockStation/dockstation/releases/download/v1.5.1/dockstation_1.5.1_amd64.deb
sudo dpkg -i dockstation_1.5.1_amd64.deb
```

