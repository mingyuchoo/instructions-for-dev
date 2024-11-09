# How to install Rust in your machines.
- <https://gist.github.com/sts10/daadbc2f403bdffad1b6d33aff016c0a>
## Install other CLI tools

```bash
sudo apt install cmake
cargo install bandwhich \
  bat \
  checkexec \
  du-dust \
  evcxr_repl \
  evcxr_jupyter \
  eza \
  fd-find \
  fnm \
  gitnu \
  grex \
  hyperfine \
  mdbook \
  nu \
  pijul \
  procs \
  ripgrep \
  rm-improved \
  starship --locked \
  sd \
  taplo-cli \
  tldr \
  tokei \
  tpnote \
  watchexec-cli --locked \
  yazi-fm --locked \
  yazi-cli --locked \
  ytop \
  zellij --locked \
  zoxide
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
cargo install cargo-watch
```

