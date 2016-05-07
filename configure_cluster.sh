#!/bin/bash


cp slaves /usr/local/hadoop/conf
cp masters /usr/local/hadoop/conf


for HOST in graphsys-n00 graphsys-n01 graphsys-n02 graphsys-n03 graphsys-n04 graphsys-n05 graphsys-n06 graphsys-n07 graphsys-n08 graphsys-n09; do
	echo $HOST
	scp hadoop-env.sh mkhalefa@$HOST:/usr/local/hadoop/conf
	scp hdfs-site.xml mkhalefa@$HOST:/usr/local/hadoop/conf
	scp core-site.xml mkhalefa@$HOST:/usr/local/hadoop/conf
	scp mapred-site.xml mkhalefa@$HOST:/usr/local/hadoop/conf
done 

