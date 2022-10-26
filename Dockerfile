FROM ubuntu:20.04
LABEL maintainer="op <op@nervos.org>"

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends wget apt-utils unzip ca-certificates openssl \
    && rm -rf /var/lib/apt/lists/*

ENV CKB_INDEXER_VERSION 0.4.2
RUN wget https://github.com/nervosnetwork/ckb-indexer/releases/download/v${CKB_INDEXER_VERSION}/ckb-indexer-${CKB_INDEXER_VERSION}-linux-x86_64.tar.gz -O /tmp/ckb-indexer-${CKB_INDEXER_VERSION}-linux-x86_64.tar.gz
RUN cd /tmp && tar zxf ckb-indexer-${CKB_INDEXER_VERSION}-linux-x86_64.tar.gz
RUN cp /tmp/ckb-indexer /bin/ckb-indexer
RUN rm -rf /tmp/ckb-indexer-${CKB_INDEXER_VERSION}-linux-x86_64.tar.gz

RUN mkdir /data

EXPOSE 8116

ENV RUST_LOG=info
ENTRYPOINT ["/bin/ckb-indexer"]
