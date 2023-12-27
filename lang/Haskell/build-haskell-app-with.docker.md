# Build Haskell app with Docker

## Create a Haskell app

```bash
$ stack new hello
```

### Build and run locally

```bash
$ stack build
$ stack run
```

## Create a Dockerfile in the app

```bash
$ cd hello
$ touch Dockerfile
```

### `Dockerfile`

```
FROM haskell:9.0.2

RUN mkdir /app
COPY . /app
RUN cd /app && stack build --system-ghc && stack install

EXPOSE 3000

WORKDIR /app
ARG EXECUTABLE

ENTRYPOINT ["stack", "run"]
```


### Docker build

```bash
$ docker build -tag hello:0.1 --file Dockerfile .
```

### Docker run

```bash
$ docker run --detach --name hello --publish 0.0.0.0:3000:3000 hello:0.1

# or

$ docker run --interactive --tty --rm --name hello hello:0.1 bash
```
