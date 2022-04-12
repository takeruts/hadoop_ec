echo "
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre/
export HADOOP_HOME=/usr/local/hadoop
export HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop/
export http_proxy=http://proxy-chain.intel.com:911
export HADOOP_OPTS=-Djava.library.path=$HADOOP_HOME/lib/native
export https_proxy=http://proxy-chain.intel.com:912
" >> /usr/local/hadoop/etc/hadoop/hadoop-env.sh
