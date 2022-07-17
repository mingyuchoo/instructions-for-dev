# Usage for pacman

## query installed packages

```sh
sudo pacman -Qi | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | sort -h
```
## query unnecessary packages

```sh
sudo pacman -Qdtq
```

## remove unnecessary package

```sh
sudo pacman -R $(pacman -Qdtq)
```
