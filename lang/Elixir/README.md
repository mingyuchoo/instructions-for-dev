# README



## How to install `Erlang` and `Elixir`



### Using `asdf` in Ubuntu

```bash
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"
sudo apt install -y libssl-dev automake autoconf libncurses5-dev
sudo apt install -y dirmngr gpg curl gawk
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf list all erlang
asdf install erlang 
asdf plugin add elixir git@github.com:asdf-vm/asdf-elixir.git
asdf list all elixir
asdf install elixir 1.17.0-rc.1-otp-27

vim $HOME/.tool-versions

```

`$HOME/.tool-versions`

```bash
# $HOME/.tool-versions

erlang 27.0
elixir 1.17.0-rc.1-otp-27
```


