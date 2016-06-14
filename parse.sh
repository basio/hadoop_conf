#!/bin/bash

echo "$1"

grep startSuperstep -r "$1"|grep Ready|awk  '{ gsub(":"," ",$1); print $1,$2,$11}'|sed 's/.*m_//'|sed 's/_0\/syslog//g'|awk '{ gsub(",",".",$3); print "insert into ss values(",$1,",\"",$2,$3,"\",",$4,");"}'


grep "BASIO start vertex" -r .|awk  '{ gsub(":"," ",$1); gsub("-",";",$8); print $1,$2,$8,$12}'|sed 's/.*m_//'|sed 's/_0\/syslog//g'|
 awk -F'[ ;]' '{gsub(",",".",$3); print "insert into vertex values (",$1,",\"",$2,$3,"\",",$7,",",$8,")";}'

