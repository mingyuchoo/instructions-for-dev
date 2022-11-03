# Install Runtimes

## Install Packages for DEV

```sh
sudo apt update
sudo apt upgrade -y
sudo apt install -y \
  software-properties-common \
  build-essential \
  ipheth-utils \
  net-tools \
  musl-tools \
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
```

## Install Terraform

```sh
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt update && sudo apt install terraform
```

## Install Docker

```sh
sudo apt update
sudo apt upgrade -y
sudo apt install -y docker.io
sudo groupadd docker
sudo usermod -aG docker $USER
```

## install docker-compose

```sh
sudo curl -L "https://github.com/docker/compose/releases/download/v2.12.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

## Install Git

```sh
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install -y git
```

## Install Nix for multi-user

```sh
sh <(curl -L https://nixos.org/nix/install) --daemon

nix-env -i docui
```

## Install NVM for Nodejs

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install 16

npm install -g purescript
npm install -g spago
npm install -g typescript
```

## Install Rustup for Rust

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

# Install Ghcup for Haskell

Please refer `https://github.com/mingyuchoo/instructions-for-dev/tree/main/Haskell`


## Install Opam for OCaml

```sh
sudo apt install bubblewrap
sudo bash -c "sh <(curl -fsSL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)"
opam init
opam install dune
opam install dune merlin ocaml-lsp-server odoc ocamlformat utop dune-release
```

## Install Elm

```sh
cd ~/Downloads/
curl -L -o elm.gz https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz
gunzip elm.gz
chmod +x elm
sudo cp elm /usr/local/bin/
rm elm
```

## Install Java

```sh
curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | bash && . ~/.jabba/jabba.sh
jabba install openjdk@1.11.0
jabba alias default openjdk@1.11.0
java --version
```

## Install Doom Emacs

```sh
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
~/.emacs.d/bin/doom sync

```

## Add `$HOME/.emacs.d/bin` to `$PATH`

```sh
...
export $PATH="$HOME/.emacs.d/bin":$PATH"
```

## Additional settings

-<https://github.com/mingyuchoo/doom-emacs-setting>

