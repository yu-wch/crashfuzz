#sh clearRst.sh
#sh clearDockerRst.sh
#sh clearLogs.sh
#sh clearHB.sh
START_TIME=`date +%s`
docker exec -t C1NN /bin/bash -ic '/home/gaoyu/evaluation/hadoop-3.3.1/bin/hdfs zkfc -formatZK -force'

#add jps command to avoid SIGHUP
echo "Start journal node on C1Slave1:"
docker exec -t C1Slave1 /bin/bash -ic 'cd /home/gaoyu/evaluation/hadoop-3.3.1/ && bin/hdfs --daemon start journalnode && jps'
echo "Start journal node on C1Slave2:"
docker exec -t C1Slave2 /bin/bash -ic 'cd /home/gaoyu/evaluation/hadoop-3.3.1/ && bin/hdfs --daemon start journalnode && jps'
echo "Start journal node on C1Slave3:"
docker exec -t C1Slave3 /bin/bash -ic 'cd /home/gaoyu/evaluation/hadoop-3.3.1/ && bin/hdfs --daemon start journalnode && jps'

echo "Start namenode on C1NN:"
docker exec -t C1NN /bin/bash -ic 'cd /home/gaoyu/evaluation/hadoop-3.3.1/ && bin/hdfs --daemon start namenode && jps'
#docker exec -t C1Master1 /bin/bash -ic 'cd /home/gaoyu/evaluation/hadoop-3.3.1/ && bin/hdfs namenode -bootstrapStandby -force'
echo "Start namenode on C1Master1:"
docker exec -t C1Master1 /bin/bash -ic 'cd /home/gaoyu/evaluation/hadoop-3.3.1/ && bin/hdfs --daemon start namenode && jps'

echo "Start zkfc on C1NN:"
docker exec -t C1NN /bin/bash -ic 'cd /home/gaoyu/evaluation/hadoop-3.3.1/ && bin/hdfs --daemon start zkfc && jps'
echo "Start zkfc on C1Master1:"
docker exec -t C1Master1 /bin/bash -ic 'cd /home/gaoyu/evaluation/hadoop-3.3.1/ && bin/hdfs --daemon start zkfc && jps'

echo "Start datanode on C1Slave1:"
docker exec -t C1Slave1 /bin/bash -ic 'cd /home/gaoyu/evaluation/hadoop-3.3.1/ && bin/hdfs --daemon start datanode && jps'
echo "Start datanode on C1Slave2:"
docker exec -t C1Slave2 /bin/bash -ic 'cd /home/gaoyu/evaluation/hadoop-3.3.1/ && bin/hdfs --daemon start datanode && jps'
echo "Start datanode on C1Slave3:"
docker exec -t C1Slave3 /bin/bash -ic 'cd /home/gaoyu/evaluation/hadoop-3.3.1/ && bin/hdfs --daemon start datanode && jps'

sh activeNN.sh

export PHOS_OPTS="-Xbootclasspath/a:Phosphor-0.0.5-SNAPSHOT.jar -javaagent:Phosphor-0.0.5-SNAPSHOT.jar=useFav=false,hdfsRpc=true"

#fav-jre-inst/bin/java $PHOS_OPTS -cp dfscases.jar edu.iscas.HDFSCasesV3.NormalTest
echo "$(date "+%Y-%m-%d %H:%M:%S"): Start normal test! (test1)"

#docker exec -t C1RM /bin/bash -ic 'cd /home/gaoyu/evaluation/hadoop-3.3.1/ && bin/hadoop fs -ls /'
#rst=$?
#echo "$(date "+%Y-%m-%d %H:%M:%S"): listed files under /: $?"
#if [ $rst == "-1" ]; then
#  sh failTest.sh "ls / failed"
#fi

#<<'COMMENT'

docker exec -t C1RM /bin/bash -ic 'cd /home/gaoyu/evaluation/hadoop-3.3.1/ && bin/hadoop fs -mkdir -p /usr/root/fav1 /usr/root/fav2'
rst=$?
echo "$(date "+%Y-%m-%d %H:%M:%S"): mkdir /usr/root/fav: $?"
if [ $rst == "-1" ]; then
  sh failTest.sh "mkdir /usr/root/fav failed"
fi

#docker exec -t C1RM /bin/bash -ic 'cd /home/gaoyu/evaluation/hadoop-3.3.1/ && bin/hadoop fs -rm -r /usr'
#<<'COMMENT'
docker exec -t C1RM /bin/bash -ic 'cd /home/gaoyu/evaluation/hadoop-3.3.1/ && bin/hadoop fs -put gyInput/file01 /usr/root/fav2'
rst=$?
echo "$(date "+%Y-%m-%d %H:%M:%S"): put gyInput/file01 /usr/root/fav2: $?"
if [ $rst == "-1" ]; then
  sh failTest.sh "put gyInput/file01 /usr/root/fav2 failed!"
fi

#docker exec -t C1RM /bin/bash -ic 'cd /home/gaoyu/evaluation/hadoop-3.3.1/ && bin/hadoop fs -cp /usr/root/fav1/file01 /usr/root/fav2'
#rst=$?
#echo "$(date "+%Y-%m-%d %H:%M:%S"): -cp /usr/root/fav1/file01 /usr/root/fav2: $?"
#if [ $rst == "-1" ]; then
#  sh failTest.sh "-cp /usr/root/fav1/file01 /usr/root/fav2 failed!"
#fi

docker exec -t C1RM /bin/bash -ic 'cd /home/gaoyu/evaluation/hadoop-3.3.1/ && bin/hadoop fs -truncate -w 23 /usr/root/fav2/file01'
rst=$?
echo "$(date "+%Y-%m-%d %H:%M:%S"): -truncate -w 23 /usr/root/fav2/file01: $?"
if [ $rst == "-1" ]; then
  sh failTest.sh "-truncate -w 23 /usr/root/fav2/file01 failed!"
fi

#docker exec -t C1RM /bin/bash -ic 'cd /home/gaoyu/evaluation/hadoop-3.3.1/ && bin/hadoop fs -cat /usr/root/fav2/file01'
#rst=$?
#echo "$(date "+%Y-%m-%d %H:%M:%S"): -cat /usr/root/fav2/file01: $?"
#if [ $rst == "-1" ]; then
#  sh failTest.sh "-cat /usr/root/fav2/file01 failed!"
#fi

#java -cp dfscases.jar edu.iscas.HDFSCasesV3.NormalTest check start.sh stop.sh /data1/gaoyu/crashfuzzer/hdfs-3.3.1-c1-new/failTest.sh
fav-jre-inst/bin/java $PHOS_OPTS -cp dfscases.jar edu.iscas.HDFSCasesV3.NormalTest check start.sh stop.sh /data1/gaoyu/crashfuzzer/hdfs-3.3.1-c1-new/failTest.sh

#docker exec -t C1RM /bin/bash -ic 'cd /home/gaoyu/evaluation/hadoop-3.3.1/ && bin/hadoop fs -rm -r /usr'
#rst=$?
#echo "$(date "+%Y-%m-%d %H:%M:%S"): -rm -r /usr: $?"
#if [ $rst == "-1" ]; then
#  sh failTest.sh "-rm -r /usr failed!"
#fi

#COMMENT

END_TIME=`date +%s`
EXECUTING_TIME=`expr $END_TIME - $START_TIME`
echo $EXECUTING_TIME
#mkdir init-state
#sh monitor.sh init-state
#sh collectRst.sh
