<div align="center">
	<br />
	<p>
		<a href="https://discord.js.org"><img src="./.github/banner.png" alt="PlantUML Docker" /></a>
	</p>
	<br />
	<p>
		<a href="https://discord.gg/sXhzexAQGh"><img src="https://img.shields.io/discord/1083727021328306236?color=5865F2&logo=discord&logoColor=white" alt="Discord server" /></a>
    </p>
</div>

# Docker containers for PlantUML
All dockers files for PlantUML

## Preamble

This is a [monorepo](https://github.com/joelparkerhenderson/monorepo-vs-polyrepo) of containers used by PlantUml CI or hosting PlantUml.

Commits are written following the 
[Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/).

Release are provided using the [release-please-action](https://github.com/google-github-actions/release-please-action) action with the [manifest releaser](https://github.com/googleapis/release-please/blob/main/docs/manifest-releaser.md).

## List of containers

- ### [plantuml-cli](plantuml-cli/README.md) [![latest version][plantuml-cli-badge-latest-version]][plantuml-cli-package-url] [![image size][plantuml-cli-badge-image-size]][plantuml-cli-package-url]

[plantuml-cli-badge-latest-version]: https://ghcr-badge.egpl.dev/plantuml/docker/plantuml-cli/latest_tag?trim=major&label=version
[plantuml-cli-badge-image-size]: https://ghcr-badge.egpl.dev/plantuml/docker/plantuml-cli/size?trim=major&label=size
[plantuml-cli-package-url]: https://github.com/plantuml/docker/pkgs/container/docker%2Fplantuml-cli

- ### [jekyll](jekyll/README.md) [![latest version][jekyll-badge-latest-version]][jekyll-package-url] [![image size][jekyll-badge-image-size]][jekyll-package-url]

[jekyll-badge-latest-version]: https://ghcr-badge.egpl.dev/plantuml/docker/jekyll/latest_tag?trim=major&label=version
[jekyll-badge-image-size]: https://ghcr-badge.egpl.dev/plantuml/docker/jekyll/size?trim=major&label=size
[jekyll-package-url]: https://github.com/plantuml/docker/pkgs/container/docker%2Fjekyll

- ### [graalvm](graalvm/README.md) [![latest version][graalvm-badge-latest-version]][graalvm-package-url] [![image size][graalvm-badge-image-size]][graalvm-package-url]

[graalvm-badge-latest-version]: https://ghcr-badge.egpl.dev/plantuml/docker/graalvm/latest_tag?trim=major&label=version
[graalvm-badge-image-size]: https://ghcr-badge.egpl.dev/plantuml/docker/graalvm/size?trim=major&label=size
[graalvm-package-url]: https://github.com/plantuml/docker/pkgs/container/docker%2Fgraalvm

## Adding new container

Details are in [Adding new container document](docs/adding-new-container.md).

## Howto create a pull request

Details are in [Howto create a pull request](docs/howto-create-a-pull-request.md).
