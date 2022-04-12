FROM ubuntu:20.04

MAINTAINER Takeru Tsuchiya (takeru.tsuchiya@intel.com)

ENV  JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/jre/
ENV  PATH $PATH:$JAVA_HOME/bin
ENV  HADOOP_HOME /usr/local/hadoop
ENV  PATH $PATH:$HADOOP_HOME/bin:$JAVA_HOME/bin
ENV  HADOOP_CONF_DIR /usr/local/hadoop/etc/hadoop
ENV  HDFS_NAMENODE_USER root
ENV  HDFS_DATANODE_USER root
ENV  HDFS_SECONDARYNAMENODE_USER root
ENV  YARN_NODEMANAGER_USER root
ENV  YARN_RESOURCEMANAGER_USER root

RUN  apt-get update
RUN  apt-get install -y openjdk-8-jdk wget openssh-server vim iproute2 iputils-ping
RUN  wget https://archive.apache.org/dist/hadoop/core/hadoop-3.3.2/hadoop-3.3.2.tar.gz -P ~/Downloads && \
     tar zxvf ~/Downloads/hadoop-3.3.2.tar.gz  -C /usr/local
RUN  mkdir /var/hadoop && mv /usr/local/hadoop-* /usr/local/hadoop
RUN  ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
     cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

COPY conf/* /tmp/

RUN  mv /tmp/ssh_config ~/.ssh/config
RUN  mv /tmp/core-site.xml /usr/local/hadoop/etc/hadoop/core-site.xml
RUN  mv /tmp/mapred-site.xml /usr/local/hadoop/etc/hadoop/mapred-site.xml
RUN  mv /tmp/hdfs-site.xml /usr/local/hadoop/etc/hadoop/hdfs-site.xml
RUN  mv /tmp/masters /usr/local/hadoop/etc/hadoop/masters

CMD [ "sh", "-c", "service ssh start; bash"]
