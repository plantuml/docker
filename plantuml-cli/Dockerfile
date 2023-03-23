FROM alpine:latest AS loader

ARG PLANTUML_TAG=snapshot
ARG PLANTUML_VERSION=SNAPSHOT

RUN apk add --no-cache \
  wget \
  ca-certificates

RUN wget \
  "https://github.com/plantuml/plantuml/releases/download/${PLANTUML_TAG}/plantuml-pdf-${PLANTUML_VERSION}.jar" \
  -O /opt/plantuml.jar

FROM eclipse-temurin:17-jre-jammy

ENV LANG en_US.UTF-8

RUN apt-get update \
  && apt-get install --no-install-recommends -y \
    graphviz \
    fonts-dejavu \
  && apt-get autoremove \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ARG PLANTUML_TAG=SNAPSHOT
ARG PLANTUML_VERSION=SNAPSHOT

ENV PLANTUML_TAG=${PLANTUML_TAG}
ENV PLANTUML_VERSION=${PLANTUML_VERSION}

# Copy files from repository. 
# including container-test.sh
COPY ./rootfs /

COPY --from=loader /opt/plantuml.jar /opt/plantuml.jar

WORKDIR /data

ENTRYPOINT ["java", "-jar", "/opt/plantuml.jar"]
CMD ["-version"]
