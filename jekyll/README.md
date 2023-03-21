# Jekyll container

Container base on [jekyll/jekyll](https://hub.docker.com/r/jekyll/jekyll/) container.

- JEKYLL_VERSION: 4.2.2

## Usage

### For testing

```shell 
gh repo clone plantuml/docker
cd docker/jekyll
mkdir site

make build test serve
```
This will create a `myBlog` jekyll site under the `site` directory
