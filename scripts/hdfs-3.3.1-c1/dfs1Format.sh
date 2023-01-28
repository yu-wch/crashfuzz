sh clearHDFS.sh

echo "Start journal node on C1Slave1:"
docker exec -t C1Slave1 /bin/bash -ic 'cd /home/gaoyu/evaluation/hadoop-3.3.1/ && bin/hdfs --daemon start journalnode && jps'
echo "Start journal node on C1Slave2:"
docker exec -t C1Slave2 /bin/bash -ic 'cd /home/gaoyu/evaluation/hadoop-3.3.1/ && bin/hdfs --daemon start journalnode && jps'
echo "Start journal node on C1Slave3:"
docker exec -t C1Slave3 /bin/bash -ic 'cd /home/gaoyu/evaluation/hadoop-3.3.1/ && bin/hdfs --daemon start journalnode && jps'

docker exec -t C1NN /bin/bash -ic '/home/gaoyu/evaluation/hadoop-3.3.1/bin/hdfs namenode -format mycluster && jps'

docker exec -t C1NN /bin/bash -ic '/home/gaoyu/evaluation/hadoop-3.3.1/bin/hdfs zkfc -formatZK -force && jps'

docker exec -t C1NN /bin/bash -ic 'cd /home/gaoyu/evaluation/hadoop-3.3.1/ && bin/hdfs --daemon start namenode && jps'

docker exec -t C1Master1 /bin/bash -ic 'cd /home/gaoyu/evaluation/hadoop-3.3.1/ && bin/hdfs namenode -bootstrapStandby -force && jps'

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

