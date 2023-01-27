# Usage for pacman

## query installed packages

```bash
sudo pacman -Qi | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | sort -h
```
## query unnecessary packages

```bash
sudo pacman -Qdtq
```

## remove unnecessary package

```bash
sudo pacman -R $(pacman -Qdtq)
```
