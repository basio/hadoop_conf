#!/bin/bash

for HOST in graphsys-n00 graphsys-n01 graphsys-n02 graphsys-n03 graphsys-n04 graphsys-n05 graphsys-n06 graphsys-n07 graphsys-n08 graphsys-n09; do
	echo $HOST
	
#	scp hadoop*tar.gz mkhalefa@$HOST:/home/mkhalefa/
#	ssh  -t  mkhalefa@$HOST " 
#	mkdir tmp_
#      mv hadoop*tar.gz tmp_
#	cd tmp_		
#	  tar -xzvf /home/mkhalefa/tmp_/hadoop*tar.gz
#	  sudo mv /home/mkhalefa/tmp_/hadoop /usr/local/hadoop-1.2.1
#	  sudo chown mkhalefa:mkhalefa /usr/local/hadoop* -R
#	"
	ssh -t mkhalefa@$HOST "
	sudo 	rm -fr /usr/local/hadoop*1.2.2*
	sudo unlink /usr/local/hadoop
	sudo ln -s /usr/local/hadoop-1.2.1 /usr/local/hadoop
	sudo chown mkhalefa:mkhalefa /usr/local/hadoop 
	"

done 

