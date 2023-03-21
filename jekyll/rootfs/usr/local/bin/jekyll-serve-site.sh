#!/bin/bash
set -xeuo pipefail

JEKYLL_SITE_NAME="${1?site name missing}"
JEKYLL_SITE_ROOT_DIR=/srv/jekyll
JEKYLL_SITE_DIR="$JEKYLL_SITE_ROOT_DIR/$JEKYLL_SITE_NAME"

cd $JEKYLL_SITE_ROOT_DIR

chown jekyll:jekyll -R $JEKYLL_SITE_ROOT_DIR

if [ ! -d $JEKYLL_SITE_DIR ]; then
  echo "create first the site $JEKYLL_SITE_NAME using jekyll-create-site.sh $JEKYLL_SITE_NAME"
  exit 1
else
  echo "starting site $JEKYLL_SITE_NAME..."
  cd $JEKYLL_SITE_DIR
  jekyll serve --livereload
fi
