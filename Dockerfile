FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      build-essential \
      libcurl4-openssl-dev \
      ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /build
COPY . .
RUN make && \
    cp bin/metar /usr/local/bin/ && \
    rm -rf /build

RUN apt-get update && \
    apt-get remove -y build-essential libcurl4-openssl-dev && \
    apt-get autoremove -y && \
    apt-get install -y --no-install-recommends libcurl4 && \
    rm -rf /var/lib/apt/lists/*

USER nobody
ENTRYPOINT ["metar"]
CMD ["--help"]