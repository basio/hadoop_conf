#!/bin/bash
		sudo rm -fr /disk1/hadoop/mydata/hdfs/namenode
		sudo rm -fr /disk1/hadoop/mydata/hdfs/datanode
		sudo rm -fr /disk1/hadoop/tmp/
		sudo rm -fr /usr/local/hadoop/logs
		mkdir /usr/local/hadoop/logs
		 mkdir /disk1/hadoop/mydata/hdfs/namenode -p
		#sudo chown mkhalefa:mkhalefa /disk1/hadoop/mydata/hdfs/namenode -R
		 mkdir /disk1/hadoop/mydata/hdfs/datanode/current -p
	#	sudo chown mkhalefa:mkhalefa /disk1/hadoop/mydata/hdfs/datanode/current -R
		mkdir /disk1/hadoop/tmp
		sudo mkdir /disk2/hadoop/1/yarn/local -p
		sudo mkdir /disk2/hadoop/1/yarn/log -p
		sudo mkdir /disk2/hadoop/2/yarn/local -p
		sudo mkdir /disk2/hadoop/2/yarn/log -p
		sudo mkdir /disk2/hadoop/3/yarn/local -p
		sudo mkdir /disk2/hadoop/3/yarn/log -p
		sudo chown mkhalefa:mkhalefa /disk2/hadoop/1/yarn/local -R
		sudo chown mkhalefa:mkhalefa /disk2/hadoop/1/yarn/log -R
		sudo chown mkhalefa:mkhalefa /disk2/hadoop/2/yarn/local -R
		sudo chown mkhalefa:mkhalefa /disk2/hadoop/2/yarn/log -R
		sudo chown mkhalefa:mkhalefa /disk2/hadoop/3/yarn/local -R
		sudo chown mkhalefa:mkhalefa /disk2/hadoop/3/yarn/log -R
		
for HOST in graphsys-n01 graphsys-n02 graphsys-n03 graphsys-n04 graphsys-n05 graphsys-n06 graphsys-n07 graphsys-n08 graphsys-n09; do
	ssh  -t  mkhalefa@$HOST " 
		sudo rm -fr /usr/local/hadoop/etc/hadoop/*
	 	sudo rm -fr /disk1/hadoop/mydata/hdfs/
		 mkdir /disk1/hadoop/mydata/hdfs/datanode/current -p
		sudo chown mkhalefa:mkhalefa /disk1/hadoop/mydata/ -R
	        rm -fr /disk1/hadoop/tmp
		sudo rm -fr /usr/local/hadoop/logs
		mkdir /usr/local/hadoop/logs
		mkdir /disk1/hadoop/tmp
		sudo mkdir /disk2/hadoop/1/yarn/local -p
		sudo mkdir /disk2/hadoop/1/yarn/log -p
		sudo mkdir /disk2/hadoop/2/yarn/local -p
		sudo mkdir /disk2/hadoop/2/yarn/log -p
		sudo mkdir /disk2/hadoop/3/yarn/local -p
		sudo mkdir /disk2/hadoop/3/yarn/log -p
		sudo chown mkhalefa:mkhalefa /disk2/hadoop -R
		sudo chown mkhalefa:mkhalefa /disk2/hadoop/1/yarn/local -R
		sudo chown mkhalefa:mkhalefa /disk2/hadoop/1/yarn/log -R
		sudo chown mkhalefa:mkhalefa /disk2/hadoop/2/yarn/local -R
		sudo chown mkhalefa:mkhalefa /disk2/hadoop/2/yarn/log -R
		sudo chown mkhalefa:mkhalefa /disk2/hadoop/3/yarn/local -R
		sudo chown mkhalefa:mkhalefa /disk2/hadoop/3/yarn/log -R
		"
done



