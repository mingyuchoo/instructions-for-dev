# Install Docker

```bash
sudo pacman -Syyu docker
sudo groupadd docker
sudo usermod -aG docker $usermod
sudo systemctl enable docker.service
sudo systemctl start docker.service
```
