# README

## Installation

```bash
git clone https://github.com/helix-editor/helix
cd helix
cargo install --path helix-term --locked
hx --grammar fetch
hx --grammar build
```


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

## Tools for Language Servers

### TOML

Install `taplo-cli`

```bash
cargo install taplo-cli --locked
```

Create configuration `.taplo.toml` file in you $HOME

```toml
[formatting]
  align_comments        = true
  align_entries         = true
  array_auto_collapse   = false
  column_width          = 80
  compact_arrays        = true
  compact_inline_tables = true
  indent_entries        = true
  indent_tables         = true
  inline_table_expand   = false
  reorder_arrays        = false
  reorder_inline_tables = true
  reorder_keys          = true
```

Run `taplo` in command line

```bash
taplo fmt {your_file}.toml
```

## Keybindings

in `config.toml`

```toml
# Emacs mode
[keys.insert]
C-p = "move_line_up"
C-n = "move_line_down"
C-f = "move_char_right"
C-b = "move_char_left"
C-e = "goto_line_end_newline"
C-a = "goto_line_start"
C-k = "kill_to_line_end"
C-h = "delete_char_backward"
```

## References

- [master/languages.toml](https://raw.githubusercontent.com/helix-editor/helix/master/languages.toml)
