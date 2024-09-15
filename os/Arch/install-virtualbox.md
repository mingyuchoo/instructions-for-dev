# Install virtualbox

## As Guest

Install `virtualbox-guest-utils` package

```bash
sudo pacman -S virtualbox-guest-utils
```

Activate service 

```bash
sudo systemctl enable vboxservice
sudo systemctl start vboxservice
```
