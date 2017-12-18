# Mongos Docker

A minimal mongos cluster, with two shard server (run at 29001 and 29002) and one config server (at 27000). The mongos progress exposed at 27017.

# Usage


# build the docker
docker build -t noteon/mongos-docker .

```
# run the docker (for example, at 29034)
docker run --name mongos -p 29036:27017 -d noteon/mongos-docker

# add the shards
mongo --port 29034 --eval "printjson(sh.addShard('localhost:29001'));"
mongo --port 29034 --eval "printjson(sh.addShard('localhost:29002'));"
```

enjoy!