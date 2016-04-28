#!/bin/bash

for HOST in graphsys-n01 graphsys-n02 graphsys-n03 graphsys-n04 graphsys-n05 graphsys-n06 graphsys-n07 graphsys-n08 graphsys-n09; do
for FF in capacity-scheduler.xml configuration.xsl container-executor.cfg hadoop-env.cmd hadoop-env.sh hadoop-metrics2.properties hadoop-metrics.properties hadoop-policy.xml httpfs-env.sh httpfs-log4j.propertiestpfs-signature.secret httpfs-site.xml kms-acls.xml kms-env.sh kms-log4j.properties kms-site.xml log4j.properties mapred-env.cmd mapred-env.sh mapred-queues.xml.template mapred-site.xml mapred-site.xml.template ssl-client.xml.example ssl-server.xml.example yarn-env.cmd yarn-env.sh yarn-site.xml; do
	scp $FF mkhalefa@$HOST:/usr/local/hadoop/etc/hadoop/
done


done 


for HOST in graphsys-n01 graphsys-n02 graphsys-n03 graphsys-n04 graphsys-n05 graphsys-n06 graphsys-n07 graphsys-n08 graphsys-n09; do
	echo $HOST
	scp hdfs-slave.xml mkhalefa@$HOST:/usr/local/hadoop/etc/hadoop/hdfs-site.xml
	scp core-site.xml mkhalefa@$HOST:/usr/local/hadoop/etc/hadoop/

done 
