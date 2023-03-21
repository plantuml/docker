ARG JEKYLL_VERSION=4.2.2

FROM jekyll/jekyll:${JEKYLL_VERSION}

# Copy files from repository. 
# including container-test.sh
COPY ./rootfs /

# Install dot
RUN apk add --update --no-cache \
           graphviz \
           ttf-freefont

RUN chmod a+x /usr/local/bin/plantuml && \
    wget https://github.com/plantuml/plantuml/releases/download/snapshot/plantuml-SNAPSHOT.jar && \
    mkdir -p /usr/local/share/plantuml && \
    mv plantuml-SNAPSHOT.jar /usr/local/share/plantuml/plantuml.jar && \
    gem install jekyll-plantuml

CMD ["jekyll", "--help"]

ENTRYPOINT ["/usr/jekyll/bin/entrypoint"]

WORKDIR /srv/jekyll

VOLUME  /srv/jekyll

EXPOSE 35729

EXPOSE 4000