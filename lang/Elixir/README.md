# README

## How to install `Erlang` and `Elixir`

### Using `asdf` in Ubuntu

```bash
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.16.0
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"
sudo apt install -y libssl-dev automake autoconf libncurses-dev
sudo apt install -y dirmngr gpg curl gawk
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin add sbcl https://github.com/smashedtoatoms/asdf-sbcl.git
asdf install erlang latest 
asdf install elixir latest
asdf install sbcl latest
asdf global erlang latest 
asdf global elixir latest
asdf global sbcl latest
vim $HOME/.tool-versions
```

`$HOME/.tool-versions`

```bash
# $HOME/.tool-versions

erlang 27.0
elixir 1.18.2-otp-27
```

## How to use Phoenix Framework

## Prerequsites 

Install `inotify-tools` in your Ubuntu.

```bash
sudo apt install -y inotify-tools
```

## How to install Phoenix

```bash
mix archive.install hex phx_new
```

## How to create a project

```bash
mix phx.new {project-name}
```
