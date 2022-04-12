#!/bin/bash
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-client-jobclient-3.3.2-tests.jar TestDFSIO -clean
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-client-jobclient-3.3.2-tests.jar TestDFSIO -write -nrFiles 32 -fileSize 1000

