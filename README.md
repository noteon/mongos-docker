# Mongos Docker

A minimal mongos cluster, with two shard server (run at 29001 and 29002) and one config server (at 27000). The mongos progress exposed at 27017.

# Usage

```
# run the docker (for example, at 29030)
docker run --name mongos -p 29030:27017 -d karloku/mongos-docker

# add the shards
mongo --port 29030 --eval "printjson(sh.addShard('localhost:29001'));"
mongo --port 29030 --eval "printjson(sh.addShard('localhost:29002'));"
```

enjoy!