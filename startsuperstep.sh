 grep startSuperstep -r .|grep Ready|awk -F "[: ]" '{print $1}'|sed 's/.*m_/m/'|sed 's/_0\/syslog//g'

