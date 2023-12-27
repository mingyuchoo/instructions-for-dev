# Install Docker Engine

## How to install Docker engine

```bash
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

## How to add a user to Docker group

```bash
sudo groupadd docker
sudo usermod -aG docker $USER
```

## How to run Docker

```bash
sudo systemctl start docker
sudo systemctl enable docker
sudo docker run hello-world
```
