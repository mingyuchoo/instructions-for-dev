# Install minikube on macos

## References

-<https://itnext.io/goodbye-docker-desktop-hello-minikube-3649f2a1c469>

## Install Hyperkit

```sh
brew install kyperkit
```

## Install Docker CLI

```sh
brew install docker docker-compose
```

And change `credsStore` to `credStore` in `.docker/config.json`

## Install Minikube and Kubectl

```sh
brew install minikube kubeclt
```

### Set CPU, Memory limits

```sh
minikube config set cpus 6
minikube config set memory 12g
```

### Start Minikube (instead of docker daemon)

```sh
minikube start --kubernetes-version=v1.19.14 --driver=hyperkit --container-runtime=docker

minikube kubectl get nodes

eval $(minikube docker-env)
```

## Dealing with Ingress resources

```sh
minikube addons enable ingress
```

