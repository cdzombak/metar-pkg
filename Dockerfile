FROM debian:bookworm-slim

ARG TARGETARCH
ARG TARGETVARIANT

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      libcurl4 \
      ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Copy the appropriate pre-built binary based on target architecture
COPY binaries/metar-binary-*/metar-linux-* /tmp/
RUN case "${TARGETARCH}${TARGETVARIANT}" in \
      amd64) cp /tmp/metar-linux-amd64 /usr/local/bin/metar ;; \
      arm64) cp /tmp/metar-linux-arm64 /usr/local/bin/metar ;; \
      armv7) cp /tmp/metar-linux-armv7 /usr/local/bin/metar ;; \
      *) echo "Unsupported architecture: ${TARGETARCH}${TARGETVARIANT}" && exit 1 ;; \
    esac && \
    chmod +x /usr/local/bin/metar && \
    rm -rf /tmp/metar-linux-*

USER nobody
ENTRYPOINT ["metar"]
CMD ["--help"]