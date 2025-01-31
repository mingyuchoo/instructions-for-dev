# Install Runtimes

## Install Packages for DEV

```bash
sudo apt update
sudo apt upgrade -y
sudo apt install -y \
  software-properties-common \
  build-essential \
  net-tools \
  musl-tools \
  traceroute \
  ca-certificates \
  gnupg \
  lsb-release \
  cmake \
  curl \
  wget \
  nnn \
  vim-nox \
  emacs-nox \
  tmux \
  screenkey \
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
  libvterm-dev \
  zlib1g-dev \
  pkg-config \
  libappindicator1

# for X-window
sudo apt install -y   ipheth-utils \
  gconf2 \
  gconf-service
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
```

## install docker-compose

```bash
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.23.0/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
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

nix-env -i docui
```

## Install NVM for Nodejs

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
nvm install 18

npm install -g yarn typescript spago purescript
```
## Install Deno

```bash
curl -fsSL https://deno.land/x/install/install.sh | sh
```

## Install Bun

```bash
curl -fsSL https://bun.sh/install | bash
```

## Install Zig

```bash
snap install zig --classic --edge
```

## Install Rustup for Rust

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## Install Lua

```bash
sudo apt install -y lua5.4
```

## Install BSD 3-Clause-Scheme

```bash
sudo apt install -y mit-scheme
```

# Install Ghcup for Haskell

Please refer `https://github.com/mingyuchoo/instructions-for-dev/tree/main/Haskell`


## Install Opam for OCaml

```bash
sudo apt install bubblewrap
sudo bash -c "sh <(curl -fsSL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)"
opam init
opam install dune
opam install merlin ocaml-lsp-server odoc ocamlformat utop dune-release
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

## Install Java

```bash
curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | bash && . ~/.jabba/jabba.sh
jabba install openjdk@1.11.0
jabba alias default openjdk@1.11.0
java -version
```

## Install Doom Emacs

```bash
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
~/.emacs.d/bin/doom sync

```

## Add `$HOME/.emacs.d/bin` to `$PATH`

```bash
...
export PATH="$HOME/.emacs.d/bin:$PATH"
```

## Additional settings

-<https://github.com/mingyuchoo/doom-emacs-setting>
