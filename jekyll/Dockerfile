ARG JEKYLL_VERSION=4.2.2

FROM jekyll/jekyll:${JEKYLL_VERSION}

# Copy files from repository. 
# including container-test.sh
COPY ./rootfs /

# Install dot
RUN apk add --update --no-cache \
           graphviz \
           ttf-freefont

ARG PLANTUML_VERSION=1.2023.4
ARG PLANTUML_TAG=v1.2023.4

RUN chmod a+x /usr/local/bin/plantuml && \
    wget https://github.com/plantuml/plantuml/releases/download/${PLANTUML_TAG}/plantuml-pdf-${PLANTUML_VERSION}.jar && \
    mkdir -p /usr/local/share/plantuml && \
    mv plantuml-pdf-${PLANTUML_VERSION}.jar /usr/local/share/plantuml/plantuml.jar && \
    gem install jekyll-plantuml

CMD ["jekyll", "--help"]

ENTRYPOINT ["/usr/jekyll/bin/entrypoint"]

WORKDIR /srv/jekyll

VOLUME  /srv/jekyll

EXPOSE 35729

EXPOSE 4000