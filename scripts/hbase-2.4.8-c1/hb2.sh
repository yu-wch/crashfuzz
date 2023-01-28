#sh clearRst.sh
sh clearDockerRst.sh
#sh clearLogs.sh
sh clearHB.sh
START_TIME=`date +%s`
sh startNewHB.sh
sh masterOnline.sh
sh hbtest2.sh
#docker exec -t C1hb-cli /bin/bash -ic 'cd /home/gaoyu/evaluation/hbase-2.4.8 && sh hbtest2.sh'
END_TIME=`date +%s`
EXECUTING_TIME=`expr $END_TIME - $START_TIME`
echo $EXECUTING_TIME
#sh collectRst.sh
#sh stopHB.sh
