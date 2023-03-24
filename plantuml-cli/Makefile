# Git variables

#GIT_REPOSITORY_NAME := $(shell basename `git rev-parse --show-toplevel`)
GIT_VERSION := $(shell git describe --always --tags --long --dirty | sed -e 's/\-0//' -e 's/\-g.......//')

# Docker variables

DOCKER_IMAGE_NAME := plantuml/plantuml-cli
DOCKER_IMAGE_TAG ?= $(DOCKER_IMAGE_NAME):$(GIT_VERSION)

# -----------------------------------------------------------------------------
# The first "make" target runs as default.
# -----------------------------------------------------------------------------

.PHONY: default
default: help

# -----------------------------------------------------------------------------
# Docker-based builds
# -----------------------------------------------------------------------------

.PHONY: build
build:
	docker build \
		--tag $(DOCKER_IMAGE_NAME) \
		--tag $(DOCKER_IMAGE_NAME):$(GIT_VERSION) \
		.

# -----------------------------------------------------------------------------
# Clean up targets
# -----------------------------------------------------------------------------

.PHONY: clean
clean:
	-docker rmi --force \
		$(DOCKER_IMAGE_NAME):$(GIT_VERSION) \
		$(DOCKER_IMAGE_NAME)

# -----------------------------------------------------------------------------
# Test image
# -----------------------------------------------------------------------------

.PHONY: test
test:
	docker run --rm --entrypoint /bin/bash $(DOCKER_IMAGE_NAME) container-test.sh

# -----------------------------------------------------------------------------
# Enter
# -----------------------------------------------------------------------------

.PHONY: enter
enter:
	docker run --rm -it --volume "$(shell pwd)":/wd --workdir /wd --entrypoint /bin/bash $(DOCKER_IMAGE_NAME)

# -----------------------------------------------------------------------------
# Help
# -----------------------------------------------------------------------------

.PHONY: help
help:
	@echo "List of make targets:"
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$' | xargs
