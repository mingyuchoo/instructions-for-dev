# README

## How to install `Erlang`, `Elixir`, and `SBCL`

### Using `asdf` in Ubuntu

Please install ASDF from https://asdf-vm.com/guide/getting-started.html

```bash
sudo apt install -y libssl-dev automake autoconf libncurses-dev dirmngr gpg curl gawk libzstd-dev inotify-tools
# Donload and install `asdf` from https://github.com/asdf-vm/asdf/releases
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
sbcl 2.5.4
```
Add `$HOME/.asdf/shims` to the front of your `$PATH`.

## How to use Phoenix Framework

```bash
mix archive.install hex phx_new
mix phx.new {project-name}
```
