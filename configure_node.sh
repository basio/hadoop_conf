#!/bin/bash
#for HOST in graphsys-n00 graphsys-n01 graphsys-n02 graphsys-n03 graphsys-n04 graphsys-n05 graphsys-n06 graphsys-n07 graphsys-n08 graphsys-n09; do

for HOST in "$@"
do
	echo $HOST
	ssh -t mkhalefa@$HOST "
		mkdir /home/mkhalefa/tmp_
		sudo chown mkhalefa:mkhalefa /home/mkhalefa/tmp_ -R 
	"	
	scp hadoop-1.2.1.tar.gz mkhalefa@$HOST:/home/mkhalefa/tmp_
	scp /etc/sysconfig/iptables  mkhalefa@$HOST:/home/mkhalefa/tmp_
	ssh  -t  mkhalefa@$HOST " 
	  tar -xzvf /home/mkhalefa/tmp_/hadoop-1.2.1.tar.gz -C tmp_ &>/dev/null
 	  sudo rm -fr /usr/local/hadoop-1.2.1
	  sudo mv /home/mkhalefa/tmp_/hadoop-1.2.1 /usr/local/
	  sudo chown mkhalefa:mkhalefa /usr/local/hadoop-1.2.1 -R
	  sudo unlink /usr/local/hadoop
	  sudo ln -s /usr/local/hadoop-1.2.1 /usr/local/hadoop
	  sudo chown mkhalefa:mkhalefa /usr/local/hadoop 
	  sudo service iptables restart
	"

done 

