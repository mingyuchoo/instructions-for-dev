# How to install Rust in your machines.
- <https://gist.github.com/sts10/daadbc2f403bdffad1b6d33aff016c0a>
## Install other CLI tools

```bash
sudo apt install cmake
cargo install bandwhich 
cargo install bat
cargo install checkexec
cargo install du-dust
cargo install evcxr_repl
cargo install evcxr_jupyter
cargo install eza
cargo install fd-find
cargo install fnm
cargo install gitnu
cargo install grex
cargo install hyperfine
cargo install mdbook
cargo install nu
cargo install pijul
cargo install procs
cargo install ripgrep
cargo install rm-improved
cargo install starship --locked
cargo install sd
cargo install taplo-cli
cargo install tldr
cargo install tokei
cargo install tpnote
cargo install watchexec-cli --locked
cargo install yazi-fm --locked
cargo install yazi-cli --locked
cargo install ytop
cargo install zellij --locked
cargo install zoxide
cargo install --git https://github.com/astral-sh/uv uv
```

## How to add configure `taplo`

- https://taplo.tamasfe.dev/
 
## How to change default shell to zellij

addd below to `.bashrc`

```bash
...

if command -v zellij &> /dev/null &&
  [ -n "$PS1" ] &&
  [[ ! "$TERM" =~ screen ]] &&
  [[ ! "$TERM" =~ zellij ]] &&
  [ -z "$ZELLIJ" ]; then
  exec zellij
fi
```
## For NixOS machine

edit `/etc/nixos/configuration.nix` in root account

```nix
{ config, pkgs, ... }:
{
  users.users.{username} = {
  rustup
  }
}
```

run following commands to install stable toolchain in user account

```bash
rustup default stable

# list all components
rustup component list

# add components
rustup component add clippy
rustup component add lldb-preview
rustup component add llvm-tools-preview
rustup component add miri
rustup component add rls
rustup component add rustfmt
rustup component add rust-analysis
rustup component add rust-analyzer
rustup component add rust-demangler-preview
rustup component add rust-src
rustup component add rustc-dev

# remove a component
rustup component remove [component-name]
```

run following command to install cargo tools in user account

```bash
cargo install cargo-audit
cargo install cargo-binstall
cargo install cargo-dist
cargo install cargo-expand
cargo install cargo-lambda
cargo install cargo-make --force
cargo install cargo-modules
cargo install cargo-udeps
cargo install cargo-deps
cargo install cargo-tree
cargo install cargo-watch

```
