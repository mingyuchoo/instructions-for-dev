# Install Docker

```bash
sudo pacman -S docker
sudo pacman -S docker-compose
sudo pacman -S docker-buildx

sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker.service
sudo systemctl start docker.service
```
