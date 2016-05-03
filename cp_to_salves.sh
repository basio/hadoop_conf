#!/bin/bash

for HOST in graphsys-n01 graphsys-n02 graphsys-n03 graphsys-n04 graphsys-n05 graphsys-n06 graphsys-n07 graphsys-n08 graphsys-n09; do
for FF in capacity-scheduler.xml configuration.xsl container-executor.cfg hadoop-env.sh hadoop-metrics2.properties hadoop-metrics.properties hadoop-policy.xml httpfs-env.sh httpfs-log4j.properties tpfs-signature.secret httpfs-site.xml kms-acls.xml kms-env.sh kms-log4j.properties kms-site.xml log4j.properties mapred-env.sh  yarn-env.sh ; do
	scp $FF mkhalefa@$HOST:/usr/local/hadoop/etc/hadoop/
done

done 


for HOST in graphsys-n01 graphsys-n02 graphsys-n03 graphsys-n04 graphsys-n05 graphsys-n06 graphsys-n07 graphsys-n08 graphsys-n09; do
	echo $HOST
	scp hdfs-slave.xml mkhalefa@$HOST:/usr/local/hadoop/etc/hadoop/hdfs-site.xml
	scp core-site.xml mkhalefa@$HOST:/usr/local/hadoop/etc/hadoop/
	scp mapred-site.xml mkhalefa@HOST:/usr/local/hadoop/etc/hadoop/
	scp yarn-slave.xml mkhalefa@HOST:/usr/local/hadoop/etc/hadoop/yarn-site.xml
done 
