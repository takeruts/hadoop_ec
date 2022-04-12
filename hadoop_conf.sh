#!/bin/bash
NAMENODE='master'
echo $NAMENODE > conf/masters
docker cp conf/masters $NAMENODE:/usr/local/hadoop/etc/hadoop/

docker ps --format {{.Names}} | grep datanode > conf/workers
docker cp conf/workers $NAMENODE:/usr/local/hadoop/etc/hadoop/

docker cp namenode_script $NAMENODE:/

docker exec -ti $NAMENODE bash -c "cp /tmp/libisal.so.2.0.30 /lib/ && ln -s /lib/libisal.so.2.0.30 /lib/libisal.so.2"

docker exec -ti $NAMENODE bash -c "hadoop namenode -format"
docker exec -ti $NAMENODE bash -c "/usr/local/hadoop/sbin/start-dfs.sh"
docker exec -ti $NAMENODE bash -c "/usr/local/hadoop/sbin/start-yarn.sh"
docker exec -ti $NAMENODE bash -c "hadoop dfsadmin -printTopology"
docker exec -ti $NAMENODE bash
