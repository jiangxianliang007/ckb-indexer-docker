FROM nervos/ckb-docker-builder:bionic-rust-1.41.0 as builder
LABEL maintainer="op <op@nervos.org>"

RUN git clone https://github.com/quake/ckb-indexer.git /ckb-indexer
RUN cd /ckb-indexer; \
    cargo build --release

FROM ubuntu:bionic
LABEL maintainer="op <op@nervos.org>"

RUN apt-get update \
   && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends apt-utils \
      openssl \
   && rm -rf /var/lib/apt/lists/*

## indexer port
EXPOSE 8116

COPY --from=builder /ckb-indexer/target/release/ckb-indexer /bin/ckb-indexer

ENV RUST_LOG=info
ENTRYPOINT ["/bin/ckb-indexer"]
#RUST_LOG=info ckb-indexer -s /data/indexer
