#!/bin/sh

# plantuml-cli
# A wrapper script for invoking PlantUml with docker
# Put this script in $PATH as `plantuml-cli

PROGNAME="$(basename $0)"

VERSION="latest"
PLANTUML_VERSION="snapshot"

# Helper functions for guards
error(){
  error_code=$1
  echo "ERROR: $2" >&2
  echo "($PROGNAME wrapper version: $VERSION, error code: $error_code )" &>2
  exit $1
}

check_cmd_in_path(){
  cmd=$1
  which $cmd > /dev/null 2>&1 || error 1 "$cmd not found!"
}

# Guards (checks for dependencies)
check_cmd_in_path docker

# Set up mounted volumes, environment, and run our containerized command
exec docker run \
  --interactive --tty --rm \
  --volume "$PWD":/wd \
  --workdir /wd \
  "plantuml/plantuml-cli:$VERSION" "$@"