#!/bin/bash

# config svr
mongod  --configsvr                                 \
        --replSet rss                               \
        --dbpath  /data/configdb                    \
        --logpath /data/configdb/log/configsvr.log  \
        --port 27000 --fork

mongod  --shardsvr                                  \
        --storageEngine=wiredTiger                  \
        --dbpath  /data/db1                         \
        --logpath /data/db1/log/shard1.log          \
        --port 29001 --fork

mongod  --shardsvr                                  \
        --storageEngine=wiredTiger                  \
        --dbpath  /data/db2                         \
        --logpath /data/db2/log/shard1.log          \
        --port 29002 --fork

mongos  --configdb localhost:27000                  \
        --port 27017