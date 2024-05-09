# README

## TUI Docker Manager

- <https://github.com/jesseduffield/lazydocker>

```bash
brew install lazydocker
```

## Install minikube on macos

### References

-<https://itnext.io/goodbye-docker-desktop-hello-minikube-3649f2a1c469>

### Install Hyperkit

```bash
brew install kyperkit
```

### Install Docker CLI

```bash
brew install docker docker-compose docker-buildx
```

And change `credsStore` to `credStore` in `.docker/config.json`

### Install Minikube and Kubectl

```bash
brew install minikube kubeclt
```

#### Set CPU, Memory limits

```bash
minikube config set cpus 6
minikube config set memory 12g
```

#### Start Minikube (instead of docker daemon)

```bash
minikube start --kubernetes-version=v1.19.14 --driver=hyperkit --container-runtime=docker

minikube kubectl get nodes

eval $(minikube docker-env)
```

### Dealing with Ingress resources

```bash
minikube addons enable ingress
```
