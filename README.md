# Docker Compose for Hadoop Multinode in sigle machine

## Description


## Run (ex. master:1, datanode:9)

```sh
$ docker-compose up -d
$ ./hadoop_conf.sh
```

### in master (namenode) to set Erasure Coding and run DFSIO write (ex. RS-6-3-1024k)

```sh
# hadoop checknative
# hdfs ec -listPolicies
# ./set_ec RS-6-3-1024k
# ./testDFSIO
```

### disable ISA-L -> Java Codec

```sh
# rm /lib/libisal.so.2.0.30
```

### enable ISA-L
```sh
# ln -s /lib/libisal.so.2.0.30 /lib/libisal.so.2
```


