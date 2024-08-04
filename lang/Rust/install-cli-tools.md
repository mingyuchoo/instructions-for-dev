# How to install Rust in your machines.
- <https://gist.github.com/sts10/daadbc2f403bdffad1b6d33aff016c0a>
## For NixOS machine

edit `/etc/nixos/configuration.nix` in root account

```nix
{ config, pkgs, ... }:
{
  users.users.<user_name> = {
  rustup
  }
}
```

run following commands to install stable toolchain in user account

```bash
rustup default stable
rustup component add rls # or `llvm`
rustup component add rust-analysis
rustup component add rust-analyzer
```

run following command to install cargo tools in user account

```bash
cargo install cargo-binstall
cargo install cargo-dist
cargo install cargo-expand
cargo install cargo-lambda
cargo install cargo-modules
cargo install cargo-tauri-app --locked
cargo install cargo-watch
```

## Install other CLI tools

```bash
cargo install bandwhich \
  bat \
  du-dust \
  eza \
  gitnu \
  grex \
  evcxr_repl \
  hyperfine \
  mdbook \
  procs \
  rg \
  sd \
  starship --locked \
  tldr \
  tokei \
  tpnote \
  nu \
  ytop \
  pijul \
  zellij \
  zoxide
```

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
