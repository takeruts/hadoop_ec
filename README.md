# Docker Compose for Hadoop Multinode in sigle machine

## Description


## Bring Up all Nodes by Docker Composer (ex. master:1, datanode:9) in docker-compose.yml

```sh
$ docker-compose up -d
$ ./hadoop_conf.sh
```

## Shut Down all Nodes

```sh
$ docker-compose down
```


## Set Erasure Coding and run DFSIO write (ex. RS-6-3-1024k) on master node

```sh
$ docker exec -ti master bash
# hadoop checknative
# hdfs ec -listPolicies
# ./set_ec RS-6-3-1024k
# ./testDFSIO
```

## Disable ISA-L -> Java Codec

```sh
# rm /lib/libisal.so.2.0.30
```

## Enable ISA-L
```sh
# ln -s /lib/libisal.so.2.0.30 /lib/libisal.so.2
```


