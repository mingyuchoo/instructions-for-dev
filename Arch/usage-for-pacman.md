# Usage for pacman

## query unnecessary packages

```sh
sudo pacman -Qdtq
```

## remove unnecessary package

```sh
sudo pacman -R $(pacman -Qdtq)
```
