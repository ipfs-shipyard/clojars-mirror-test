#!/bin/bash
rsync --recursive --times --links --safe-links --hard-links --stats clojars.org::clojars /data/clojars

time ipfs add -r --progress --offline --fscache --quieter --raw-leaves --nocopy /data/clojars

ipfs stats repo --human
