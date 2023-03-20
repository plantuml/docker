ARG GRAALVM_VERSION=22.3.1

FROM ghcr.io/graalvm/native-image:$GRAALVM_VERSION

# Copy files from repository.
COPY ./rootfs /

# Make non-root container.
RUN groupadd --gid 1001 app && \
    useradd --uid 1001 --gid app --home /app app && \
    chown -R app:app /app

USER 1001

# Runtime execution.
WORKDIR /app
