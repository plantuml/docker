#!/bin/bash
set -xeuo pipefail

JEKYLL_SITE_NAME="${1?site name missing}"
JEKYLL_SITE_ROOT_DIR=/srv/jekyll
JEKYLL_SITE_DIR="$JEKYLL_SITE_ROOT_DIR/$JEKYLL_SITE_NAME"

cd $JEKYLL_SITE_ROOT_DIR

chown jekyll:jekyll -R $JEKYLL_SITE_ROOT_DIR

if [ ! -d $JEKYLL_SITE_DIR ]; then
  echo "create site $JEKYLL_SITE_NAME..."
  jekyll new $JEKYLL_SITE_NAME
  cd $JEKYLL_SITE_NAME
  echo "add missing bundles..."
  bundle add \
    public_suffix \
    webrick
  echo "site $JEKYLL_SITE_NAME is ready"
fi

echo "starting site $JEKYLL_SITE_NAME..."
cd $JEKYLL_SITE_DIR
jekyll serve
