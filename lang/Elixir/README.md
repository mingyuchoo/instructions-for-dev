# README

## How to install `Erlang` and `Elixir`

### Using `asdf` in Ubuntu

Please install ASDF from https://asdf-vm.com/guide/getting-started.html

```bash
sudo apt install -y libssl-dev automake autoconf libncurses-dev
sudo apt install -y dirmngr gpg curl gawk
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin add sbcl https://github.com/smashedtoatoms/asdf-sbcl.git
asdf install erlang latest 
asdf install elixir latest
asdf install sbcl latest
vim $HOME/.tool-versions
```

`$HOME/.tool-versions`

```bash
# $HOME/.tool-versions

erlang 27.2.4
elixir main-otp-27
sbcl 2.5.2
```
Add `$HOME/.asdf/shims` to the front of your `$PATH`.

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
