#!/bin/bash
		sudo rm -fr /disk1/
		sudo rm -fr /usr/local/hadoop/logs
		mkdir /usr/local/hadoop/logs
		mkdir -p /disk1/hadoop-tmp /disk1/hdfs/namenode 
		#mkdir -p /disk2/hadoop-yarn/staging_temp /disk2/hadoop-yarn/staging /disk2/hadoop-yarn/apps 
		for i in 1 2 3 
		do
			mkdir /disk2/hadoop/$i/yarn/local /disk2/hadoop/$i/log -p
			sudo chown mkhalefa:mkhalefa /disk2/hadoop/$i/yarn/local /disk2/hadoop/$i/yarn/log -R
		done	
for HOST in graphsys-n01 graphsys-n02 graphsys-n03 graphsys-n04 graphsys-n05 graphsys-n06 graphsys-n07 graphsys-n08 graphsys-n09; do
	ssh  -t  mkhalefa@$HOST " 
		sudo rm -fr /usr/local/hadoop/etc/hadoop/*
		sudo rm -fr /disk1/
		sudo rm -fr /usr/local/hadoop/logs
		mkdir /usr/local/hadoop/logs
		mkdir -p /disk1/hadoop-tmp /disk1/hdfs/namenode
		#mkdir -p /disk2/hadoop-yarn/staging_temp /disk2/hadoop-yarn/staging /disk2/hadoop-yarn/apps -p
		#chmod 1777 /disk2/hadoop-yarn/staging_temp
		#chmod 750 /disk2/hadoop-yarn/staging

		for i in 1 2 3 
		do
			mkdir -p /disk2/hadoop/$i/yarn/local /disk2/hadoop/$i/log 
			sudo chown mkhalefa:mkhalefa /disk2/hadoop/$i/yarn/local /disk2/hadoop/$i/yarn/log -R
		done	
	 	"
done

hadoop namenode -format

HADOOP_USER_NAME=mkhalefa hadoop fs -mkdir -p /user/history
HADOOP_USER_NAME=mkhalefa hadoop fs -chmod -R 1777 /user/history
HADOOP_USER_NAME=mkhalefa hadoop fs -chown mkhalefa:mkhalefa /user/history

HADOOP_USER_NAME=mkhalefa hadoop fs -mkdir -p /var/log/hadoop-yarn
HADOOP_USER_NAME=mkhalefa hadoop fs -chown mkhalefa:mkhalefa/var/log/hadoop-yarn

