FROM ubuntu:18.04
LABEL maintainer="op <op@nervos.org>"

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends wget apt-utils unzip ca-certificates openssl \
    && rm -rf /var/lib/apt/lists/*

ENV CKB_INDEXER_VERSION 0.4.0
RUN wget https://github.com/nervosnetwork/ckb-indexer/releases/download/v${CKB_INDEXER_VERSION}/ckb-indexer-${CKB_INDEXER_VERSION}-linux.zip -O /tmp/ckb-indexer-${CKB_INDEXER_VERSION}-linux.zip
RUN cd /tmp && unzip ckb-indexer-${CKB_INDEXER_VERSION}-linux.zip && tar zxf ckb-indexer-linux-x86_64.tar.gz
RUN cp /tmp/ckb-indexer /bin/ckb-indexer
RUN rm -rf /tmp/ckb-indexer-${CKB_INDEXER_VERSION}-linux.zip /tmp/ckb-indexer-linux-x86_64.tar.gz

RUN mkdir /data

EXPOSE 8116

ENV RUST_LOG=info
ENTRYPOINT ["/bin/ckb-indexer"]
