# Install CLI Tools

```bash
cargo install bandwhich \
  bat \
  cargo-lambda \
  cargo-watch \
  cargo-modules \
  dust \
  exa \
  gitnu \
  grex \
  irust \
  helix-term --locked \
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
