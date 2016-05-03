#!/bin/bash
		sudo rm -fr /disk1/
		sudo rm -fr /usr/local/hadoop/logs
		mkdir /usr/local/hadoop/logs
		sudo mkdir -p /disk1/hadoop-tmp /disk1/hdfs/namenode 
		sudo chown mkhalefa:mkhalefa  /disk1/hadoop-tmp /disk1/hdfs/namenode 

		for i in 1 2 3 
		do
			mkdir /disk2/hadoop/$i/yarn/local /disk2/hadoop/$i/yarn/log -p
			sudo chown mkhalefa:mkhalefa /disk2/hadoop/$i/yarn/local /disk2/hadoop/$i/yarn/log -R
		done	
for HOST in graphsys-n01 graphsys-n02 graphsys-n03 graphsys-n04 graphsys-n05 graphsys-n06 graphsys-n07 graphsys-n08 graphsys-n09; do
	ssh  -t  mkhalefa@$HOST " 
		sudo rm -fr /usr/local/hadoop/etc/hadoop/*
		sudo rm -fr /disk1/
		sudo rm -fr /usr/local/hadoop/logs

		mkdir /usr/local/hadoop/logs  
		sudo mkdir -p /disk1/hadoop-tmp /disk1/hdfs/datanode
		sudo chown mkhalefa:mkhalefa  /disk1/hadoop-tmp /disk1/hdfs/datanode -R


		for i in 1 2 3 
		do
			mkdir -p /disk2/hadoop/$i/yarn/local /disk2/hadoop/$i/yarn/log 
			sudo chown mkhalefa:mkhalefa /disk2/hadoop/$i/yarn/local /disk2/hadoop/$i/yarn/log -R
		done	
	 	"
done


for HOST in graphsys-n01 graphsys-n02 graphsys-n03 graphsys-n04 graphsys-n05 graphsys-n06 graphsys-n07 graphsys-n08 graphsys-n09; do
for FF in capacity-scheduler.xml configuration.xsl container-executor.cfg hadoop-env.sh hadoop-metrics2.properties hadoop-metrics.properties hadoop-policy.xml httpfs-env.sh httpfs-log4j.properties httpfs-site.xml kms-acls.xml kms-env.sh kms-log4j.properties kms-site.xml log4j.properties mapred-env.sh  yarn-env.sh ; do
	scp $FF mkhalefa@$HOST:/usr/local/hadoop/etc/hadoop/
done

done 


for HOST in graphsys-n01 graphsys-n02 graphsys-n03 graphsys-n04 graphsys-n05 graphsys-n06 graphsys-n07 graphsys-n08 graphsys-n09; do
	echo $HOST
	scp hdfs-slave.xml mkhalefa@$HOST:/usr/local/hadoop/etc/hadoop/hdfs-site.xml
	scp core-site.xml mkhalefa@$HOST:/usr/local/hadoop/etc/hadoop/
	scp mapred-site.xml mkhalefa@$HOST:/usr/local/hadoop/etc/hadoop/
	scp yarn-slave.xml mkhalefa@$HOST:/usr/local/hadoop/etc/hadoop/yarn-site.xml
done 

hadoop namenode -format
start-dfs.sh

HADOOP_USER_NAME=mkhalefa hadoop fs -mkdir -p /user/history
HADOOP_USER_NAME=mkhalefa hadoop fs -chmod -R 1777 /user/history
HADOOP_USER_NAME=mkhalefa hadoop fs -chown mkhalefa:mkhalefa /user/history

HADOOP_USER_NAME=mkhalefa hadoop fs -mkdir -p /var/log/hadoop-yarn
HADOOP_USER_NAME=mkhalefa hadoop fs -chown mkhalefa:mkhalefa /var/log/hadoop-yarn


head -n8000000 /data/twitter_rv.net >/data/twitter_rv.8m
head -n80000000 /data/twitter_rv.net >/data/twitter_rv.80m


hadoop fs -mkdir /twitter
hadoop fs -mkdir /user
hadoop fs -mkdir /output

#hadoop fs -copyFromLocal /data/twitter_rv.80m /twitter/sample10
hadoop fs -copyFromLocal /data/twitter_rv.8m /twitter/sample1
#hadoop fs -copyFromLocal /data/twitter_rv.net /twitter/data 
#stop-dfs.sh


