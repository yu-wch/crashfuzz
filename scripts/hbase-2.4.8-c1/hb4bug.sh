#sh clearRst.sh
#sh clearDockerRst.sh
#sh clearLogs.sh
#sh clearHB.sh
START_TIME=`date +%s`

#sh ../startNewHB.sh
#start hbase cluster: 2 hm 2 rs
sleep 5s
docker exec -t C1HM1 /bin/bash -ic 'cd /home/gaoyu/evaluation/hbase-2.4.8/ && bin/hbase-daemon.sh start master && jps'
docker exec -t C1HM2 /bin/bash -ic 'cd /home/gaoyu/evaluation/hbase-2.4.8/ && bin/hbase-daemon.sh start master && jps'
docker exec -t C1RS1 /bin/bash -ic 'cd /home/gaoyu/evaluation/hbase-2.4.8/ && bin/hbase-daemon.sh start regionserver && jps'
docker exec -t C1RS2 /bin/bash -ic 'cd /home/gaoyu/evaluation/hbase-2.4.8/ && bin/hbase-daemon.sh start regionserver && jps'
docker exec -t C1RS3 /bin/bash -ic 'cd /home/gaoyu/evaluation/hbase-2.4.8/ && bin/hbase-daemon.sh start regionserver && jps'

sh masterOnline.sh
export PHOS_OPTS="-Xbootclasspath/a:Phosphor-0.0.5-SNAPSHOT.jar -javaagent:Phosphor-0.0.5-SNAPSHOT.jar=useFav=false,hbaseRpc=true"

sleep 300s
#fav-jre-inst/bin/java $PHOS_OPTS -cp hbcases.jar com.iscas.HBaseCases.CrashMetaTest 172.27.0.8 11181 check /data/gaoyu/crashfuzzer/hbase-2.4.8-c3/hb4start.sh /data/gaoyu/crashfuzzer/hbase-2.4.8-c3/hb4stop.sh /data/gaoyu/crashfuzzer/hbase-2.4.8-c3/failTest.sh

#fav-jre-inst/bin/java $PHOS_OPTS -cp hbcases.jar com.iscas.HBaseCases.CrashMetaTest 172.27.0.8 11181 nocheck /data/gaoyu/crashfuzzer/hbase-2.4.8-c3/hb4start.sh /data/gaoyu/crashfuzzer/hbase-2.4.8-c3/hb4stop.sh /data/gaoyu/crashfuzzer/hbase-2.4.8-c3/failTest.sh

#java -cp hbcases.jar com.iscas.HBaseCases.CrashMetaTest 172.27.0.8 11181 check /data/gaoyu/crashfuzzer/hbase-2.4.8-c3/hb4start.sh /data/gaoyu/crashfuzzer/hbase-2.4.8-c3/hb4stop.sh /data/gaoyu/crashfuzzer/hbase-2.4.8-c3/failTest.sh

END_TIME=`date +%s`
EXECUTING_TIME=`expr $END_TIME - $START_TIME`
echo $EXECUTING_TIME
#mkdir bug
#sh monitor.sh bug
#sh collectRst.sh
#sh stopHB.sh
