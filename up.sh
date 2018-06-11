#!/usr/bin/env bash
set -o errexit
set -o xtrace

docker run -ti --detach --name full-node \
       -v `pwd`:/etc/nodeos -v /tmp/nodeos-data:/data \
       -p 8888:8888 -p 9876:9876 \
       johnnyzhao/eos:1.0.2.2 \
       /opt/eosio/bin/nodeos --data-dir=/data \
                             --config-dir=`pwd` \
                             --genesis-json=`pwd`/genesis.json \
                             --p2p-listen-endpoint=127.0.0.1:65432