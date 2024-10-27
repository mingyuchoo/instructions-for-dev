# Configure Target Architecture

For WSL2 on Windows 11 on Snapdraon X Elite

```bash
$ rustup update
$ rustup target add aarch64-unknown-linux-gnu
```

Create `$HOME/.cargo/config.toml`

```toml
[build]
target = "aarch64-unknown-linux-gnu"
```

Build your project

```bash
$ cargo build
$ cargo build --release
```
