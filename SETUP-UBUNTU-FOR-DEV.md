# How to setup ubuntu for development

# Install Nix for single user
```
sh <(curl -L https://nixos.org/nix/install) --no-daemon
echo "source \"$HOME/.nix-profile/etc/profile.d/nix.sh\"" >> .bashrc
```
