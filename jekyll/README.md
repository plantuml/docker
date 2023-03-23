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

# Jekyll container [![Version](https://img.shields.io/badge/version-1.1.0-blue)](https://github.com/plantuml/docker/pkgs/container/docker%2Fjekyll)

Container base on [jekyll/jekyll](https://hub.docker.com/r/jekyll/jekyll/) container.

- JEKYLL_VERSION: 4.2.2

## Usage

1. Install docker

2. Create a `compose.yml` file
    ```yml
    version: "3.8"
    services:
      jekyll:
        image: plantuml/jekyll:latest
        container_name: jekyll
        environment:
          JEKYLL_SITE_NAME: myPlantUmlBlog
        ports:
          - "4000:4000"
        volumes:
          - "./site:/srv/jekyll"
        command: "jekyll-build-and-serve.sh"
    ```

3. Run docker compose
  ```shell
  docker compose up
  ```

4. configure the [jekyll-plantuml plugin](https://github.com/yjpark/jekyll-plantuml)
  
  Edit `_config.yml`
  ```yaml
  plugins:
    - jekyll-feed
    - jekyll-plantuml

  plantuml:
    plantuml_jar: _bin/plantuml.jar     # path to plantuml jar
    tmp_folder: _plantuml               # tmp folder to put generated image files
    dot_exe: /usr/bin/dot               # [optional] path to Graphviz dot execution
    background_color: white             # [optional] UML image background color

  ```

  Add some plantuml diagrams in your posts:
  ```ruby
  {% plantuml %}
  @startuml
  Alice -> Bob: Authentication Request
  Bob --> Alice: Authentication Response

  Alice -> Bob: Another authentication Request
  Alice <-- Bob: another authentication Response
  @enduml
  {% endplantuml %}
  ```

Enjoy :partying_face:

## Contributing

### Clone this repository
```shell 
gh repo clone plantuml/docker
cd docker/jekyll
```

### Create the site directory

> Note: We will mount this directory and create jekyll's site under it.

```shell 
mkdir site
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

3. Create a site.
    By default, the site will be named _"myBlog"_.
    You can use the variable `$JEKYLL_SITE_NAME` to create an other site.
    This will create a `myBlog` jekyll site under the `site` directory.

    ```shell
    make site
    #or for a custom site
    #JEKYLL_SITE_NAME=myCustomSite make site
    ```

4. Run the server locally
    ```shell
    make serve
    #or for a custom site
    #JEKYLL_SITE_NAME=myCustomSite make serve
    ```

    open http://localhost:4000/ in your browser

### Debugging

You can use `make enter` to run a bash shell inside the container.
