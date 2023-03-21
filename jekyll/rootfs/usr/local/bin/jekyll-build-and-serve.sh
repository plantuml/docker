#!/bin/bash
set -euo pipefail

if [[ -z "${JEKYLL_SITE_NAME}" ]]; then
  JEKYLL_SITE_NAME="${1?site name missing}"
fi

JEKYLL_SITE_ROOT_DIR=/srv/jekyll
JEKYLL_SITE_DIR="$JEKYLL_SITE_ROOT_DIR/$JEKYLL_SITE_NAME"

cd $JEKYLL_SITE_ROOT_DIR

chown jekyll:jekyll -R $JEKYLL_SITE_ROOT_DIR


if [ ! -d $JEKYLL_SITE_DIR ]; then
  jekyll-create-site.sh $JEKYLL_SITE_NAME
fi

jekyll-serve-site.sh $JEKYLL_SITE_NAME
