# README

## Language Servers

Check which language servers are installed.

```bash
hx --health 
```

Install language servers with homebrew.

```bash
brew install zls
brew install markdown-oxide
brew install gopls
brew install cl-lsp
brew install typescript-language-server
brew install taplo
brew install yaml-language-server
brew install lua-language-server
brew install erlang_ls
brew install elixir-ls
```

### Erlang and Elixir

```bash
brew install erlang-ls
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

## References

- [master/languages.toml](https://raw.githubusercontent.com/helix-editor/helix/master/languages.toml)
