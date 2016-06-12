#!/bin/bash

for HOST in "$@"
do
	echo $HOST
	ssh -t mkhalefa@$HOST "
		sudo rm -fr /disk1
		rm -fr /home/mkhalefa/tmp_
		mkdir /home/mkhalefa/tmp_
		sudo chown mkhalefa:mkhalefa /home/mkhalefa/tmp_ -R 
	"	
	scp hadoop-1.2.1.tar.gz mkhalefa@$HOST:/home/mkhalefa/tmp_
	scp iptables  mkhalefa@$HOST:/home/mkhalefa/tmp_
	ssh  -t  mkhalefa@$HOST " 
	  tar -xzvf /home/mkhalefa/tmp_/hadoop-1.2.1.tar.gz -C tmp_ &>/dev/null
 	  sudo rm -fr /usr/local/hadoop-1.2.1
	  sudo mv /home/mkhalefa/tmp_/hadoop-1.2.1 /usr/local/
	  sudo chown mkhalefa:mkhalefa /usr/local/hadoop-1.2.1 -R
	  sudo unlink /usr/local/hadoop
	  sudo ln -s /usr/local/hadoop-1.2.1 /usr/local/hadoop
	  sudo chown mkhalefa:mkhalefa /usr/local/hadoop 
	  sudo cp tmp_/iptables /etc/sysconfig/iptables
	  sudo service iptables restart

	   sudo rm -fr /disk1/	
	  sudo rm -fr /data/hadoop/
	   sudo mkdir -p /data/hadoop/ 
	   sudo chown mkhalefa:mkhalefa  /data/hadoop/  -R
	   sudo rm -f /usr/local/hadoop/conf/slaves /usr/local/hadoop/conf/masters

	"

done 


