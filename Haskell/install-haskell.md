# Install Haskell in Ubuntu

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


## Install Ghcup for Haskell

```sh
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

## Install Haskell applications

```sh
stack install \
  dhall \
  dhall-json \
  ghcid \
  hindent \
  hlint \
  hoogle \
  pandoc \
  stylish-haskell \
  ShellCheck
```

## Update `$HOME/.stack/config.yaml` file

```yaml
...

templates:
  params:
    author-email: mingyuchoo@gmail.com
    author-name: Mingyu Choo
    category: PoC
    copyright: mingyuchoo
    github-username: mingyuchoo

...

stack-colors: STYLES
#allow-newer: true
```

## Add some code for `stylish-haskell` to `$HOME/.stack/global-project/stack.yaml` file

```yaml
...

extra-deps:
- ghc-lib-parser-9.2.2.20220307@sha256:384755a514a42fe1615862ff6ef5c995a9ed71904360b4b212f9526f80fb214c,12705
- ghc-lib-parser-ex-9.2.0.3@sha256:a90c3a6aa85f59848d9f8c3928ab7203299a4b560db6f300976d9b1f7da127ee,3655
```

