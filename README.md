# docker
All dockers files for PlantUML

## Preamble

This is a [monorepo](https://github.com/joelparkerhenderson/monorepo-vs-polyrepo) of containers used by PlantUml CI or hosting PlantUml.

Commits are written following the 
[Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/).

Release are provided using the [release-please-action](https://github.com/google-github-actions/release-please-action) action with the [manifest releaser](https://github.com/googleapis/release-please/blob/main/docs/manifest-releaser.md).

## Adding new container

We are going to add `myRepo` as an example.

```shell
export CONTAINER_DIR=myrepo
export CONTAINER_NAME=myrepo
export CONTAINER_IMAGE_NAME=plantuml/$CONTAINER_NAME
```

### Create the container

```shell
mkdir $CONTAINER_DIR
cd $CONTAINER_DIR
```

Add the definition into the manifest file [release-please-config.json](./release-please-config.json)
```js
{
  "bump-minor-pre-major": true,
  "bump-patch-for-minor-pre-major": true,
  "release-type": "simple",
  "separate-pull-requests": true,

  "packages": {
    "otherrepo": {
      "component": "otherrepo"
    },
    "myrepo": {
      "component": "myrepo"
    }
  }
}
```

### Use a makefile

Use the provided [Makefile template](.github/scripts/Makefile.template) replacing the variable `$CONTAINER_IMAGE_NAME` 

```shell
envsubst '$CONTAINER_IMAGE_NAME' < ../.github/scripts/Makefile.template >Makefile
```

### Add a version

We will use `0.1.0` as our first version

```shell
echo '0.1.0' > version.txt

# create taf myrepo-0.1.0
echo -e "${CONTAINER_NAME}-$(cat version.txt)" | xargs git tag
```

### Let's create our container

#### Add a test script

A script named `container-test.sh` in the working directory of your container (`/app` in the container).

It will be used to test that the container image is working as expected.

```shell
mkdir -p rootfs/app
touch rootfs/app/container-test.sh
chmod +x rootfs/app/container-test.sh

echo <<EOF > rootfs/app/container-test.sh
#!/usr/bin/env bash
set -euxo pipefail

wget --spider https://plantuml.com
EOF
```

#### Create the dockerfile

> Note: Don't forget to copy the `container-test.sh` script.

```shell
cat <<EOF >Dockerfile
FROM debian:bullseye-slim

RUN apt-get update && apt-get -y install wget

# Copy files from repository. 
# including container-test.sh
COPY ./rootfs /

# Make non-root container.
RUN groupadd --gid 1001 app && \
    useradd --uid 1001 --gid app --home /app app && \
    chown -R app:app /app

USER 1001

# Runtime execution.
WORKDIR /app

# Define default entrypoint
ENTRYPOINT ["wget"]

CMD ["--verison"]
EOF
```

### Build the container locally to test it

```shell
make build
```

```shell
make test
```

```shell
make clean
```
