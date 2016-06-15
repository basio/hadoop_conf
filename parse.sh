#!/bin/bash

echo "$1"

grep startSuperstep -r "$1"|grep Ready|awk  '{ gsub(":"," ",$1); print $1,$2,$11}'|sed -e 's/\(.*\)job_\(.*\)_\(.*\)\/\(.*\)m_\(.*\)_0\/syslog/job \2_\3 attempt \5/'|
awk '{ gsub(",",".",$6); print "insert into ss values(\"",$2,"\",",$4,",\"",$5,$6,"\",",$7,");"}'

grep finishSuperStep -r "../logs"|grep BASIO|awk  '{ gsub(":"," ",$1); print $1,$2,$8}'|sed -e 's/\(.*\)job_\(.*\)_\(.*\)\/\(.*\)m_\(.*\)_0\/syslog/job \2_\3 attempt \5/'|awk '{ gsub(",",".",$6); print "insert into ss values(\"",$2,"\",",$4,",\"",$5,$6,"\",",$7,");"}'


grep "BASIO start vertex" -r "$1"|awk  '{ gsub(":"," ",$1); gsub("-",";",$8); print $1,$2,$8,$12}'|sed 's/.*m_//'|sed 's/_0\/syslog//g' |  awk -F'[ ;]' '{gsub(",",".",$3); print "insert into start_vertex values (",$1,",\"",$2,$3,"\",",$5,",",$6,")";}' 


grep "BASIO end vertex" -r "$1"|awk  '{ gsub(":"," ",$1); gsub("-",";",$8); print $1,$2,$8,$12}'|sed 's/.*m_//'|sed 's/_0\/syslog//g' |  awk -F'[ ;]' '{gsub(",",".",$3); print "insert into end_vertex values (",$1,",\"",$2,$3,"\",",$5,",",$6,")";}' 


grep "BASIO halt vertex" -r "$1"|awk  '{ gsub(":"," ",$1); gsub("-",";",$8); print $1,$2,$8,$12}'|sed 's/.*m_//'|sed 's/_0\/syslog//g' |  awk -F'[ ;]' '{gsub(",",".",$3); print "insert into halt_vertex values (",$1,",\"",$2,$3,"\",",$5,",",$6,")";}' 




#sed -e 's/\(.*\)job_\(.*\)_\(.*\)\/\(.*\)m_\(.*\)_0\/syslog/job \2_\3 attempt \5/'






