# Clojars IPFS mirror test

A repeatable performance test for rsyncing a mirror of the https://clojars.org/repo maven repository and adding to IPFS as a handy docker image.

## Installation

```
docker build -t clojars-mirror-test github.com/andrew/clojars-mirror-test
```

## Running it

Note: This will take up to 24 hours and require at least 60GB of spare disk space.

```
docker run clojars-mirror-test
```
