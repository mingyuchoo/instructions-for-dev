# How to setup ubuntu for development

## Install Packages for DEV
```
sudo apt install -y \
  software-properties-common \
  build-essential \
  net-tools \
  traceroute \
  curl \
  wget \
  nnn \
  vim-nox \
  emacs-nox \
  tmux \ 
  tree \
  unzip \
  htop \
  nmon
  
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
```
## Install Git
```
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install -y git
```

## Install Nix for single user
```
sh <(curl -L https://nixos.org/nix/install) --no-daemon
echo "source \"$HOME/.nix-profile/etc/profile.d/nix.sh\"" >> .bashrc
```

## Install NVM for Nodejs
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install 16
```

## Install Rustup for Rust
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## Install Ghcup for Haskell
```
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```
### Install Haskell applications
```
stack install \
  ghcid \
  hindent \
  hlint \
  hoogle \
  stylish-haskell
```

## Install Opam for OCaml
```
bash -c "sh <(curl -fsSL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)"
```

## Install Elm
```
cd ~/Downloads/
curl -L -o elm.gz https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz
gunzip elm.gz
chmod +x elm
sudo cp elm /usr/local/bin/
rm elm
```

## Install Python3.10
```
sudo apt install -y python3.10 python3.10-venv
python3.10 -m venv $HOME/venv
echo "source \"$HOME/venv/bin/activate\" # for Python3.10" >> .bashrc
source $HOME/.bashrc
```
