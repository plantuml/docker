<div align="center">
	<br />
	<p>
		<a href="https://discord.js.org">
            <img src="../.github/banner.png" alt="PlantUML Docker" />
        </a>
	</p>
	<br />
	<p>
		<a href="https://discord.gg/sXhzexAQGh"><img src="https://img.shields.io/discord/1083727021328306236?color=5865F2&logo=discord&logoColor=white" alt="Discord server" /></a>
    </p>
</div>

# :construction: PlantUml CLI container :construction: [![Version](https://img.shields.io/badge/version-0.0.1-blue)](https://github.com/plantuml/docker/pkgs/container/docker%2Fjekyll)

## :warning: It is not ready for general use :warning:

Container base on [eclipse-temurin:17-jre-jammy](https://hub.docker.com/_/eclipse-temurin/tags?page=1&name=17-jre-jammy) container.

- PLANTUML_VERSION: [snapshot](https://github.com/plantuml/plantuml/releases/tag/snapshot)

## Usage

### 1. Install docker

### 2. Download the image
```shell
docker pull plantuml/plantuml-cli:latest
```

### 3. Run PlantUML

#### 3.1. Go into the directory where your diagrams are

:warning: Replace MY_DIRECTORY with your working directory.

```shell
cd MY_DIRECTORY
```

#### 3.2. Execute PlantUML

```shell
# replace your_diagram_file.puml with the file name of your diagram.
docker run --rm -it \
           --volume "$PWD":/wd \
           --workdir /wd \
          plantuml/plantuml-cli:latest your_diagram_file.puml
```

> :bulb: Tips: you can use a wrapper like this [Bash script wrapper](./scripts/plantuml-cli-wrapper.sh).

Enjoy :partying_face:

## Contributing

### Clone this repository
```shell 
gh repo clone plantuml/docker
cd docker/plantuml-cli
```

### Testing

1. Build the container
    ```shell
    make build
    ```

2. Run tests to validate that the container is working as expected
    ```shell
    make test
    ```

### Debugging

You can use `make enter` to run a bash shell inside the container.
