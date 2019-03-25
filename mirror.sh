#!/bin/bash
rsync --recursive --times --links --safe-links --hard-links --stats clojars.org::clojars /data/clojars

export IPFS_PATH=/data/.ipfs

hash="$(ipfs add -r --quieter --raw-leaves --fscache  --nocopy /data/clojars | tail -n1)"

ipfs name publish "$hash"
