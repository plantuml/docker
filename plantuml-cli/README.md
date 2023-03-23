<div align="center">
	<br />
	<p>	
		<img src="../.github/banner.png" alt="PlantUML Docker" />
	</p>
	<br />
	<p>
		<a href="https://discord.gg/sXhzexAQGh">
			<img src="https://img.shields.io/discord/1083727021328306236?color=5865F2&logo=discord&logoColor=white" alt="Discord server" />
		</a>
	</p>
	<p><a href="https://github.com/plantuml/docker/pkgs/container/docker%2Fplantuml-cli">
			<img src="https://ghcr-badge.egpl.dev/plantuml/docker/plantuml-cli/latest_tag?trim=major&label=latest%20version" alt="latest version" />
			<img src="https://ghcr-badge.egpl.dev/plantuml/docker/plantuml-cli/size?trim=major&label=latest%20size" alt="latest size" />
			<br />
			<img src="https://ghcr-badge.egpl.dev/plantuml/docker/plantuml-cli/tags?trim=major" alt="container tags on github repository" />
	</a></p>
</div>

# :construction: PlantUml CLI container :construction: [![latest version][plantuml-cli-badge-latest-version]][plantuml-cli-package-url] [![image size][plantuml-cli-badge-image-size]][plantuml-cli-package-url]

[plantuml-cli-badge-latest-version]: https://ghcr-badge.egpl.dev/plantuml/docker/plantuml-cli/latest_tag?trim=major&label=version
[plantuml-cli-badge-image-size]: https://ghcr-badge.egpl.dev/plantuml/docker/plantuml-cli/size?trim=major&label=size
[plantuml-cli-package-url]: https://github.com/plantuml/docker/pkgs/container/docker%2Fplantuml-cli

## :warning: It is not ready for general use :warning:

Container base on [eclipse-temurin:17-jre-jammy](https://hub.docker.com/_/eclipse-temurin/tags?page=1&name=17-jre-jammy) container.

- PLANTUML_VERSION: [snapshot](https://github.com/plantuml/plantuml/releases/tag/snapshot) (23 mars 2023)

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
