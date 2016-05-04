#!/bin/bash


sudo rm -fr /disk1/
sudo mkdir -p /disk1/hadoop-tmp 
sudo chown mkhalefa:mkhalefa  /disk1/hadoop-tmp

for HOST in graphsys-n01 graphsys-n02 graphsys-n03 graphsys-n04 graphsys-n05 graphsys-n06 graphsys-n07 graphsys-n08 graphsys-n09; do
	ssh  -t  mkhalefa@$HOST " 
		sudo rm -fr /disk1/	
		sudo mkdir -p /disk1/hadoop-tmp 
		sudo chown mkhalefa:mkhalefa  /disk1/hadoop-tmp /disk1 -R
		sudo rm -f /usr/local/hadoop/conf/slaves /usr/local/hadoop/conf/masters
	 	"
done

cp slaves /usr/local/hadoop/conf
cp masters /usr/local/hadoop/conf



for HOST in graphsys-n00 graphsys-n01 graphsys-n02 graphsys-n03 graphsys-n04 graphsys-n05 graphsys-n06 graphsys-n07 graphsys-n08 graphsys-n09; do
	echo $HOST
	scp hdfs-site.xml mkhalefa@$HOST:/usr/local/hadoop/conf
	scp core-site.xml mkhalefa@$HOST:/usr/local/hadoop/conf
	scp mapred-site.xml mkhalefa@$HOST:/usr/local/hadoop/conf
done 

