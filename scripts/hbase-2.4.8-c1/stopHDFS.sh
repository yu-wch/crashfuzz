#docker exec -t C1hb-hdfs /bin/bash -ic '/home/gaoyu/evaluation/hb-hadoop-3.2.2/bin/hdfs namenode -format'
docker exec -t C1hb-hdfs /bin/bash -ic 'cd /home/gaoyu/evaluation/hb-hadoop-3.2.2/ && bin/hdfs --daemon stop namenode && jps'
docker exec -t C1hb-hdfs /bin/bash -ic 'cd /home/gaoyu/evaluation/hb-hadoop-3.2.2/ && bin/hdfs --daemon stop secondarynamenode && jps'
docker exec -t C1hb-hdfs /bin/bash -ic 'cd /home/gaoyu/evaluation/hb-hadoop-3.2.2/ && bin/hdfs --daemon stop datanode && jps'
#docker exec -t NM3 /bin/bash -ic 'cd /home/gaoyu/evaluation/hb-hadoop-3.2.2/ && bin/hdfs --daemon start datanode && jps'
