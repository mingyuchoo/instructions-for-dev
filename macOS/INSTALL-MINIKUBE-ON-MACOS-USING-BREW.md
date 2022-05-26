# Install minikube on macos

## References

-<https://itnext.io/goodbye-docker-desktop-hello-minikube-3649f2a1c469>

## Uinstall Docker Desktop

```bash
brew uninstall docker
```

## Install Hyperkit

```bash
brew install kyperkit
```

## Install Docker CLI

```bash
brew install docker
```

## Install Kubectl

```bash
brew install kubectl
```

## Install Minikube (and Docker daemon)

```bash
brew install minikube
```

### Set CPU, Memory limits

```bash
minikube config set cpus 6
minikube config set memory 12g

minikube start --kubernetes-version=v1.19.14 --driver=hyperkit --container-runtime=docker

minikube kubectl get nodes
eval $(minikube docker-env)
```

## Install Docker Compose

```bash
brew install docker-compose
```

## Dealing with Ingress resources

```bash
minikube addons enable ingress
```

