FROM ubuntu:18.04

RUN apt-get update && apt-get install -y git wget rsync

# install go-ipfs
RUN wget https://dist.ipfs.io/go-ipfs/v0.4.19/go-ipfs_v0.4.19_linux-amd64.tar.gz
RUN tar xvfz go-ipfs_v0.4.19_linux-amd64.tar.gz
RUN mv go-ipfs/ipfs /usr/local/bin/ipfs

RUN mkdir -p /data/clojars

ENV SRC_DIR /usr/src/app

COPY . $SRC_DIR
WORKDIR $SRC_DIR

ENV IPFS_PATH=/data/.ipfs
ENV IPFS_FD_MAX=4096

RUN ipfs init --profile=badgerds

RUN ipfs config Reprovider.Interval "0"
RUN ipfs config --json Datastore.NoSync true
RUN ipfs config --json Experimental.ShardingEnabled true
RUN ipfs config --json Experimental.FilestoreEnabled true

CMD ["./test.sh"]
