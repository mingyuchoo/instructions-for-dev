# README

## Language Servers

### elixir-ls for Elixir

```bash
brew install elixir-ls
hx $HOME/.config/helix/language.toml
```

```toml
[[language]]
name = "elixir"
scope = "source.elixir"
file-types = ["ex", "exs", "heex"]
roots = ["mix.exs"]
auto-format = true
diagnostic-severity = "Hint"
comment-token = "#"
indent = {tab-width = 2, unit = " "}
```
