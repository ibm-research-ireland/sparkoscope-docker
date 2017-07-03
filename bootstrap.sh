#!/usr/bin/env bash

service ssh start
if [ ! -f ~/.ssh/known_hosts ]; then
    ssh-keyscan localhost >> ~/.ssh/known_hosts
    ssh-keyscan 0.0.0.0 >> ~/.ssh/known_hosts
fi
$HADOOP_HOME/bin/hadoop namenode -format
$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/bin/hdfs dfs -mkdir /spark-logs
$HADOOP_HOME/bin/hdfs dfs -mkdir /custom-metrics
$SPARK_HOME/sbin/start-history-server.sh
$SPARK_HOME/sbin/start-all.sh
export IP=`cat /etc/hostname`
echo "spark.master spark://$IP:7077" >> $SPARK_HOME/conf/spark-defaults.conf
/bin/bash