proc=$( netstat -ntpl | grep "9000" | awk '{print $7}' | awk -F/ '{print $1}' )
jps | grep $proc
