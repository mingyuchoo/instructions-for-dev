# Install CLI Tools

```sh
cargo install bandwhich \
  bat \
  cargo-lambda \
  cargo-clippy \
  cargo-fmt \
  cargo-miri \
  cargo-watch \
  clippy-driver \
  dust \
  exa \
  gitnu \
  grex \
  irust \
  helix \
  hyperfine \
  mdbook \
  procs \
  rg \
  rls \
  sd \
  starship --locked \
  tldr \
  tokei \
  tpnote \
  nu \
  ytop \
  zellij \
  zoxide
```

## How to change default shell to zellij

addd below to `.bashrc`

```sh
...

if command -v zellij &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ zellij ]] && [ -z "$ZELLIJ" ]; then
  exec zellij
fi
```
